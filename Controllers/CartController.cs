using BTL_LapTrinhWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace BTL_LapTrinhWeb.Controllers
{
    public class CartController : Controller
    {
        private readonly DienLanhHuySonContext _context;

        public CartController(DienLanhHuySonContext context)
        {
            _context = context;
        }

        private int? GetCurrentUserId()
        {
            if (User.Identity != null && User.Identity.IsAuthenticated)
            {
                var userIdStr = User.FindFirstValue("UserId");
                if (int.TryParse(userIdStr, out int userId))
                {
                    return userId;
                }
            }
            return null;
        }

        [Route("Cart")]
        [Route("Cart/Index")]
        public async Task<IActionResult> Index()
        {
            var userId = GetCurrentUserId();

            if (User.IsInRole("Admin") || User.IsInRole("Staff"))
            {
                TempData["ErrorMessage"] = "Tài khoản Quản trị / Nhân viên không sử dụng chức năng Giỏ hàng!";
                return RedirectToAction("Index", "Admin");
            }
            if (userId == null)
            {
                TempData["Error"] = "Vui lòng đăng nhập để xem giỏ hàng!";
                return RedirectToAction("Login", "Account");
            }

            var gioHang = await _context.GioHangs
                .Include(g => g.ChiTietGioHangs)
                    .ThenInclude(ct => ct.SanPham)
                        .ThenInclude(sp => sp.HinhAnhSanPhams)
                .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

            ViewBag.ActiveCoupons = await _context.KhuyenMais
                .Where(k => k.TrangThai && k.SoLuongSuDung > 0 && k.NgayKetThuc >= DateTime.Now)
                .OrderBy(k => k.DonHangToiThieu)
                .ToListAsync();

            var items = gioHang?.ChiTietGioHangs.ToList() ?? new List<ChiTietGioHang>();
            return View(items);
        }

        [HttpGet]
        public async Task<IActionResult> GetCartCount()
        {
            var userId = GetCurrentUserId();
            if (userId == null) return Json(new { count = 0 });

            var gioHang = await _context.GioHangs
                .Include(g => g.ChiTietGioHangs)
                .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

            int totalDistinctItems = gioHang?.ChiTietGioHangs.Count ?? 0;
            return Json(new { count = totalDistinctItems });
        }

        [HttpPost]
        public async Task<IActionResult> AddToCart(int sanPhamId, int quantity = 1)
        {
            var userId = GetCurrentUserId();

            if (User.IsInRole("Admin") || User.IsInRole("Staff"))
            {
                return Json(new { success = false, message = "Tài khoản Quản trị / Nhân viên không được phép mua hàng!" });
            }

            if (userId == null)
            {
                return Json(new { success = false, requireLogin = true, message = "Vui lòng đăng nhập để mua hàng!" });
            }

            bool userExists = await _context.NguoiDungs.AnyAsync(u => u.NguoiDungId == userId.Value);
            if (!userExists)
            {
                return Json(new { success = false, requireLogin = true, message = "Phiên đăng nhập đã hết hạn, vui lòng đăng nhập lại!" });
            }

            var sanPham = await _context.SanPhams.FindAsync(sanPhamId);
            if (sanPham == null || !sanPham.TrangThai)
            {
                return Json(new { success = false, message = "Sản phẩm không tồn tại hoặc đã ngừng kinh doanh!" });
            }

            if (sanPham.SoLuongTon <= 0)
            {
                return Json(new { success = false, message = $"Sản phẩm [{sanPham.TenSanPham}] hiện đang tạm hết hàng!" });
            }

            var gioHang = await _context.GioHangs
                .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

            if (gioHang == null)
            {
                gioHang = new GioHang { NguoiDungId = userId.Value };
                _context.GioHangs.Add(gioHang);
                await _context.SaveChangesAsync();
            }

            var chiTiet = await _context.ChiTietGioHangs
                .FirstOrDefaultAsync(c => c.GioHangId == gioHang.GioHangId && c.SanPhamId == sanPhamId);

            int soLuongHienTaiTrongGio = chiTiet?.SoLuong ?? 0;
            int tongSoLuongMoi = soLuongHienTaiTrongGio + quantity;

            if (tongSoLuongMoi > sanPham.SoLuongTon)
            {
                return Json(new
                {
                    success = false,
                    message = $"Kho chỉ còn {sanPham.SoLuongTon} sản phẩm! (Trong giỏ của bạn đã có {soLuongHienTaiTrongGio} sản phẩm)."
                });
            }

            string msg = "";
            if (chiTiet != null)
            {
                chiTiet.SoLuong = tongSoLuongMoi;
                msg = $"Sản phẩm đã có trong giỏ! Đã tăng số lượng lên {chiTiet.SoLuong}.";
            }
            else
            {
                chiTiet = new ChiTietGioHang
                {
                    GioHangId = gioHang.GioHangId,
                    SanPhamId = sanPhamId,
                    SoLuong = quantity
                };
                _context.ChiTietGioHangs.Add(chiTiet);
                msg = "Đã thêm sản phẩm mới vào giỏ hàng!";
            }

            await _context.SaveChangesAsync();

            int cartCount = await _context.ChiTietGioHangs
                .Where(c => c.GioHangId == gioHang.GioHangId)
                .CountAsync();

            return Json(new { success = true, cartCount = cartCount, message = msg });
        }

        [HttpPost]
        public async Task<IActionResult> UpdateQuantity(int sanPhamId, int quantity)
        {
            var userId = GetCurrentUserId();
            if (userId == null) return Json(new { success = false });

            var gioHang = await _context.GioHangs.FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);
            if (gioHang == null) return Json(new { success = false });

            var chiTiet = await _context.ChiTietGioHangs
                .Include(c => c.SanPham)
                .FirstOrDefaultAsync(c => c.GioHangId == gioHang.GioHangId && c.SanPhamId == sanPhamId);

            if (chiTiet == null) return Json(new { success = false });

            if (quantity > chiTiet.SanPham.SoLuongTon)
            {
                return Json(new
                {
                    success = false,
                    maxStock = chiTiet.SanPham.SoLuongTon,
                    message = $"Rất tiếc! Trong kho hiện chỉ còn tối đa {chiTiet.SanPham.SoLuongTon} sản phẩm [{chiTiet.SanPham.TenSanPham}]."
                });
            }

            if (quantity <= 0)
            {
                _context.ChiTietGioHangs.Remove(chiTiet);
            }
            else
            {
                chiTiet.SoLuong = quantity;
            }

            await _context.SaveChangesAsync();

            var allItems = await _context.ChiTietGioHangs
                .Include(c => c.SanPham)
                .Where(c => c.GioHangId == gioHang.GioHangId)
                .ToListAsync();

            decimal itemSubtotal = quantity > 0 ? (chiTiet.SanPham.GiaBan * quantity) : 0;
            decimal cartTotal = allItems.Sum(c => c.SanPham.GiaBan * c.SoLuong);

            int cartCount = allItems.Count;
            int totalQuantity = allItems.Sum(c => c.SoLuong);

            return Json(new
            {
                success = true,
                itemSubtotal = itemSubtotal.ToString("N0") + "₫",
                cartTotal = cartTotal.ToString("N0") + "₫",
                cartCount = cartCount,
                totalQuantity = totalQuantity
            });
        }

        [HttpPost]
        public async Task<IActionResult> RemoveItem(int sanPhamId)
        {
            return await UpdateQuantity(sanPhamId, 0);
        }

        [HttpPost]
        public async Task<IActionResult> ClearCart()
        {
            var userId = GetCurrentUserId();
            if (userId != null)
            {
                var gioHang = await _context.GioHangs
                    .Include(g => g.ChiTietGioHangs)
                    .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

                if (gioHang != null && gioHang.ChiTietGioHangs.Any())
                {
                    _context.ChiTietGioHangs.RemoveRange(gioHang.ChiTietGioHangs);
                    await _context.SaveChangesAsync();
                }
            }
            return RedirectToAction("Index");
        }
    }
}
