using BTL_LapTrinhWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace BTL_LapTrinhWeb.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly DienLanhHuySonContext _context;

        public CheckoutController(DienLanhHuySonContext context)
        {
            _context = context;
        }

        private int? GetCurrentUserId()
        {
            if (User.Identity != null && User.Identity.IsAuthenticated)
            {
                var userIdStr = User.FindFirstValue("UserId");
                if (int.TryParse(userIdStr, out int userId))
                    return userId;
            }
            return null;
        }

        private async Task<(bool IsValid, string Message, decimal DiscountAmount, KhuyenMai? Coupon)> TinhToanKhuyenMaiAsync(string? code, decimal tamTinh)
        {
            if (string.IsNullOrWhiteSpace(code))
            {
                return (false, "Vui lòng nhập mã giảm giá!", 0, null);
            }

            string cleanCode = code.Trim().ToUpper();
            var now = DateTime.Now;

            var km = await _context.KhuyenMais
                .FirstOrDefaultAsync(k => k.MaKhuyenMai.ToUpper() == cleanCode);

            if (km == null || !km.TrangThai)
            {
                return (false, "Mã giảm giá không tồn tại hoặc đã ngừng áp dụng!", 0, null);
            }

            if (now < km.NgayBatDau || now > km.NgayKetThuc)
            {
                return (false, $"Mã giảm giá đã hết hạn (Áp dụng đến {km.NgayKetThuc:dd/MM/yyyy})!", 0, null);
            }

            if (km.SoLuongSuDung <= 0)
            {
                return (false, "Mã giảm giá này đã hết lượt sử dụng!", 0, null);
            }

            if (tamTinh < km.DonHangToiThieu)
            {
                return (false, $"Mã [{km.MaKhuyenMai}] chỉ áp dụng cho đơn hàng từ {km.DonHangToiThieu:N0}₫ trở lên!", 0, null);
            }

            decimal tienGiam = 0;
            if (km.LoaiGiamGia == "Percent")
            {
                tienGiam = Math.Round(tamTinh * (km.GiaTriGiam / 100m), 0);
                if (km.GiamToiDa.HasValue && km.GiamToiDa.Value > 0 && tienGiam > km.GiamToiDa.Value)
                {
                    tienGiam = km.GiamToiDa.Value;
                }
            }
            else
            {
                tienGiam = km.GiaTriGiam;
            }

            if (tienGiam > tamTinh)
            {
                tienGiam = tamTinh;
            }

            return (true, $"Áp dụng mã {km.MaKhuyenMai} ({km.TenKhuyenMai}) thành công! Giảm {tienGiam:N0}₫.", tienGiam, km);
        }

        [HttpPost]
        [Route("Checkout/ApplyCoupon")]
        public async Task<IActionResult> ApplyCoupon(string? code)
        {
            var userId = GetCurrentUserId();
            if (userId == null)
            {
                return Json(new { success = false, message = "Vui lòng đăng nhập để áp dụng mã giảm giá!" });
            }

            var gioHang = await _context.GioHangs
                .Include(g => g.ChiTietGioHangs)
                    .ThenInclude(ct => ct.SanPham)
                .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

            if (gioHang == null || !gioHang.ChiTietGioHangs.Any())
            {
                return Json(new { success = false, message = "Giỏ hàng của bạn đang trống!" });
            }

            decimal tamTinh = gioHang.ChiTietGioHangs.Sum(c => c.SanPham.GiaBan * c.SoLuong);
            var result = await TinhToanKhuyenMaiAsync(code, tamTinh);

            if (!result.IsValid)
            {
                return Json(new
                {
                    success = false,
                    message = result.Message,
                    tamTinh = tamTinh,
                    giamGia = 0,
                    tongThanhToan = tamTinh
                });
            }

            decimal tongThanhToan = tamTinh - result.DiscountAmount;
            return Json(new
            {
                success = true,
                code = result.Coupon!.MaKhuyenMai,
                message = result.Message,
                tamTinh = tamTinh,
                giamGia = result.DiscountAmount,
                tongThanhToan = tongThanhToan
            });
        }

        [Route("mua-ngay")]
        public async Task<IActionResult> BuyNow(int productId, int quantity = 1)
        {
            if (User.IsInRole("Admin") || User.IsInRole("Staff"))
            {
                TempData["ErrorMessage"] = "Tài khoản Quản trị / Nhân viên không thể đặt mua hàng!";
                return RedirectToAction("Index", "Admin");
            }

            var userId = GetCurrentUserId();
            if (userId == null)
            {
                TempData["Error"] = "Vui lòng đăng nhập để đặt mua sản phẩm!";
                return RedirectToAction("Login", "Account");
            }

            if (!await _context.NguoiDungs.AnyAsync(u => u.NguoiDungId == userId.Value))
            {
                return RedirectToAction("Logout", "Account");
            }

            var sanPham = await _context.SanPhams.FindAsync(productId);
            if (sanPham == null || !sanPham.TrangThai || sanPham.SoLuongTon <= 0)
            {
                TempData["Error"] = "Sản phẩm này hiện đã hết hàng trong kho!";
                return RedirectToAction("Index", "Home");
            }

            var gioHang = await _context.GioHangs.FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);
            if (gioHang == null)
            {
                gioHang = new GioHang { NguoiDungId = userId.Value };
                _context.GioHangs.Add(gioHang);
                await _context.SaveChangesAsync();
            }

            var chiTiet = await _context.ChiTietGioHangs
                .FirstOrDefaultAsync(c => c.GioHangId == gioHang.GioHangId && c.SanPhamId == productId);

            if (chiTiet != null)
            {
                chiTiet.SoLuong = Math.Min(chiTiet.SoLuong + quantity, sanPham.SoLuongTon);
            }
            else
            {
                _context.ChiTietGioHangs.Add(new ChiTietGioHang
                {
                    GioHangId = gioHang.GioHangId,
                    SanPhamId = productId,
                    SoLuong = Math.Min(Math.Max(1, quantity), sanPham.SoLuongTon)
                });
            }

            await _context.SaveChangesAsync();

            return RedirectToAction("Checkout");
        }

        [HttpGet]
        [Route("Checkout")]
        [Route("Checkout/Index")]
        public async Task<IActionResult> Checkout(string? coupon = null)
        {
            if (User.IsInRole("Admin") || User.IsInRole("Staff"))
            {
                TempData["ErrorMessage"] = "Tài khoản Quản trị / Nhân viên không thể đặt mua hàng!";
                return RedirectToAction("Index", "Admin");
            }

            var userId = GetCurrentUserId();
            if (userId == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var gioHang = await _context.GioHangs
                .Include(g => g.ChiTietGioHangs)
                    .ThenInclude(ct => ct.SanPham)
                        .ThenInclude(sp => sp.HinhAnhSanPhams)
                .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

            if (gioHang == null || !gioHang.ChiTietGioHangs.Any())
            {
                return RedirectToAction("Index", "Cart");
            }

            var user = await _context.NguoiDungs.FindAsync(userId.Value);
            var diaChi = await _context.DiaChiNguoiDungs
                .OrderByDescending(d => d.MacDinh)
                .FirstOrDefaultAsync(d => d.NguoiDungId == userId.Value);

            decimal tamTinh = gioHang.ChiTietGioHangs.Sum(c => c.SanPham.GiaBan * c.SoLuong);
            decimal giamGia = 0;
            string? maHopLe = null;

            if (!string.IsNullOrWhiteSpace(coupon))
            {
                var check = await TinhToanKhuyenMaiAsync(coupon, tamTinh);
                if (check.IsValid)
                {
                    giamGia = check.DiscountAmount;
                    maHopLe = check.Coupon!.MaKhuyenMai;
                    ViewBag.CouponMessage = check.Message;
                }
            }

            ViewBag.ActiveCoupons = await _context.KhuyenMais
                .Where(k => k.TrangThai && k.SoLuongSuDung > 0 && k.NgayKetThuc >= DateTime.Now)
                .OrderBy(k => k.DonHangToiThieu)
                .ToListAsync();

            var viewModel = new CheckoutViewModel
            {
                NguoiNhan = diaChi?.NguoiNhan ?? user?.HoTen ?? "",
                SoDienThoai = diaChi?.SoDienThoai ?? user?.SoDienThoai ?? "",
                TinhThanh = diaChi?.TinhThanh ?? "",
                QuanHuyen = diaChi?.QuanHuyen ?? "",
                PhuongXa = diaChi?.PhuongXa ?? "",
                DiaChiChiTiet = diaChi?.DiaChiChiTiet ?? "",
                MaKhuyenMai = maHopLe,
                CartItems = gioHang.ChiTietGioHangs.ToList(),
                TamTinh = tamTinh,
                PhiVanChuyen = 0,
                GiamGia = giamGia,
                TongThanhToan = tamTinh - giamGia
            };

            return View("Checkout", viewModel);
        }

        [HttpPost]
        [Route("Checkout/xac-nhan-dat-hang")]
        [Route("Checkout/PlaceOrder")]
        public async Task<IActionResult> XacNhanDatHang(CheckoutViewModel model)
        {
            if (User.IsInRole("Admin") || User.IsInRole("Staff"))
            {
                return RedirectToAction("Index", "Admin");
            }

            var userId = GetCurrentUserId();
            if (userId == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var gioHang = await _context.GioHangs
                .Include(g => g.ChiTietGioHangs)
                    .ThenInclude(ct => ct.SanPham)
                .FirstOrDefaultAsync(g => g.NguoiDungId == userId.Value);

            if (gioHang == null || !gioHang.ChiTietGioHangs.Any())
            {
                return RedirectToAction("Index", "Cart");
            }

            foreach (var item in gioHang.ChiTietGioHangs.ToList())
            {
                if (item.SanPham.SoLuongTon <= 0)
                {
                    _context.ChiTietGioHangs.Remove(item);
                    await _context.SaveChangesAsync();
                    return RedirectToAction("Index", "Cart");
                }
                if (item.SoLuong > item.SanPham.SoLuongTon)
                {
                    item.SoLuong = item.SanPham.SoLuongTon;
                    await _context.SaveChangesAsync();
                    return RedirectToAction("Index", "Cart");
                }
            }

            decimal tamTinh = gioHang.ChiTietGioHangs.Sum(c => c.SanPham.GiaBan * c.SoLuong);
            decimal phiVanChuyen = 0;
            decimal giamGia = 0;
            int? khuyenMaiId = null;

            if (!string.IsNullOrWhiteSpace(model.MaKhuyenMai))
            {
                var checkCoupon = await TinhToanKhuyenMaiAsync(model.MaKhuyenMai, tamTinh);
                if (checkCoupon.IsValid && checkCoupon.Coupon != null)
                {
                    giamGia = checkCoupon.DiscountAmount;
                    khuyenMaiId = checkCoupon.Coupon.KhuyenMaiId;
                    checkCoupon.Coupon.SoLuongSuDung -= 1;
                }
            }

            decimal tongThanhToan = tamTinh + phiVanChuyen - giamGia;
            string maDonHang = "DH" + DateTime.Now.ToString("yyMMddHHmmss");
            string diaChiDayDu = $"{model.DiaChiChiTiet}, {model.PhuongXa}, {model.QuanHuyen}, {model.TinhThanh}".Trim(' ', ',');

            var donHang = new DonHang
            {
                MaDonHang = maDonHang,
                NguoiDungId = userId.Value,
                KhuyenMaiId = khuyenMaiId,
                TenNguoiNhan = model.NguoiNhan,
                SoDienThoaiNhan = model.SoDienThoai,
                DiaChiNhan = diaChiDayDu,
                GhiChu = model.GhiChu,
                TongTienHang = tamTinh,
                PhiVanChuyen = phiVanChuyen,
                TienGiamGia = giamGia,
                TongThanhToan = tongThanhToan,
                PhuongThucThanhToan = string.IsNullOrEmpty(model.PhuongThucThanhToan) ? "COD" : model.PhuongThucThanhToan,
                TrangThaiThanhToan = "Unpaid",
                TrangThaiDonHang = "Pending",
                NgayDat = DateTime.Now
            };

            _context.DonHangs.Add(donHang);
            await _context.SaveChangesAsync();

            foreach (var item in gioHang.ChiTietGioHangs)
            {
                var chiTietDon = new ChiTietDonHang
                {
                    DonHangId = donHang.DonHangId,
                    SanPhamId = item.SanPhamId,
                    TenSanPham = item.SanPham.TenSanPham,
                    MaSanPham = item.SanPham.MaSanPham,
                    DonGia = item.SanPham.GiaBan,
                    SoLuong = item.SoLuong,
                    ThanhTien = item.SanPham.GiaBan * item.SoLuong
                };
                _context.ChiTietDonHangs.Add(chiTietDon);

                if (item.SanPham.SoLuongTon >= item.SoLuong)
                {
                    item.SanPham.SoLuongTon -= item.SoLuong;
                }
            }

            _context.LichSuDonHangs.Add(new LichSuDonHang
            {
                DonHangId = donHang.DonHangId,
                TrangThaiCu = null,
                TrangThaiMoi = "Pending",
                GhiChu = $"Khách hàng đặt đơn mới ({donHang.PhuongThucThanhToan})",
                NguoiThucHienId = userId.Value,
                NgayThayDoi = DateTime.Now
            });

            _context.ChiTietGioHangs.RemoveRange(gioHang.ChiTietGioHangs);
            await _context.SaveChangesAsync();

            if (model.PhuongThucThanhToan == "VNPAY")
            {
                return RedirectToAction("ThanhToanQR", new { maDonHang = donHang.MaDonHang });
            }

            return RedirectToAction("DatHangThanhCong", new { maDonHang = donHang.MaDonHang });
        }

        [HttpGet]
        [Route("Checkout/quet-ma-qr/{maDonHang}")]
        public async Task<IActionResult> ThanhToanQR(string maDonHang)
        {
            var userId = GetCurrentUserId();
            if (userId == null) return RedirectToAction("Login", "Account");

            var donHang = await _context.DonHangs
                .FirstOrDefaultAsync(d => d.MaDonHang == maDonHang && d.NguoiDungId == userId.Value);

            if (donHang == null) return NotFound();

            return View("ThanhToanQR", donHang);
        }

        [HttpPost]
        [Route("Checkout/xac-nhan-chuyen-khoan")]
        [Route("thanh-toan/xac-nhan-chuyen-khoan")]
        public async Task<IActionResult> XacNhanDaChuyenKhoan(string maDonHang)
        {
            var userId = GetCurrentUserId();
            if (userId == null) return RedirectToAction("Login", "Account");

            var donHang = await _context.DonHangs
                .FirstOrDefaultAsync(d => d.MaDonHang == maDonHang && d.NguoiDungId == userId.Value);

            if (donHang == null) return NotFound();

            string trangThaiCu = donHang.TrangThaiDonHang;
            donHang.TrangThaiThanhToan = "Paid";
            donHang.TrangThaiDonHang = "Confirmed";
            donHang.NgayCapNhat = DateTime.Now;

            _context.LichSuDonHangs.Add(new LichSuDonHang
            {
                DonHangId = donHang.DonHangId,
                TrangThaiCu = trangThaiCu,
                TrangThaiMoi = "Confirmed",
                GhiChu = "Khách hàng đã hoàn tất thanh toán chuyển khoản QR",
                NguoiThucHienId = userId.Value,
                NgayThayDoi = DateTime.Now
            });

            await _context.SaveChangesAsync();

            return RedirectToAction("DatHangThanhCong", new { maDonHang = donHang.MaDonHang });
        }

        [HttpGet]
        [Route("dat-hang-thanh-cong/{maDonHang}")]
        public async Task<IActionResult> DatHangThanhCong(string maDonHang)
        {
            var userId = GetCurrentUserId();
            if (userId == null) return RedirectToAction("Login", "Account");

            var donHang = await _context.DonHangs
                .Include(d => d.ChiTietDonHangs)
                .FirstOrDefaultAsync(d => d.MaDonHang == maDonHang && d.NguoiDungId == userId.Value);

            if (donHang == null) return NotFound();

            return View("DatHangThanhCong", donHang);
        }
    }
}