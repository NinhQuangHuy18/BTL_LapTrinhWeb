using BTL_LapTrinhWeb.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace BTL_LapTrinhWeb.Controllers
{
    public class AccountController : Controller
    {
        private readonly DienLanhHuySonContext _context;

        public AccountController(DienLanhHuySonContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
            if (User.Identity != null && User.Identity.IsAuthenticated)
            {
                if (User.IsInRole("Admin") || User.IsInRole("Staff"))
                {
                    return RedirectToAction("Index", "Admin");
                }
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await _context.NguoiDungs.SingleOrDefaultAsync(u => u.Email == model.Email);

                if (user != null && user.MatKhauHash == model.Password)
                {
                    if (!user.TrangThai)
                    {
                        string lockMsg = "Tài khoản của bạn đã bị khóa do vi phạm chính sách! Vui lòng liên hệ Hotline 0325.532.335.";
                        TempData["Error"] = lockMsg;
                        ViewBag.Error = lockMsg;
                        return View(model);
                    }

                    var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.HoTen),
                        new Claim(ClaimTypes.Email, user.Email),
                        new Claim("UserId", user.NguoiDungId.ToString()),
                        new Claim(ClaimTypes.Role, user.VaiTro)
                    };

                    var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    var authProperties = new AuthenticationProperties { IsPersistent = true };

                    await HttpContext.SignInAsync(
                        CookieAuthenticationDefaults.AuthenticationScheme,
                        new ClaimsPrincipal(claimsIdentity),
                        authProperties);

                    if (user.VaiTro == "Admin" || user.VaiTro == "Staff")
                    {
                        return RedirectToAction("Index", "Admin");
                    }

                    return RedirectToAction("Index", "Home");
                }

                TempData["Error"] = "Email hoặc mật khẩu không chính xác!";
            }
            return View(model);
        }

        [HttpGet]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public IActionResult Register()
        {
            if (User.Identity != null && User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        public IActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var checkEmail = _context.NguoiDungs.Any(u => u.Email == model.Email);
                if (checkEmail)
                {
                    ModelState.AddModelError("Email", "Email này đã được sử dụng!");
                    return View(model);
                }

                var newUser = new NguoiDung
                {
                    HoTen = model.FullName,
                    Email = model.Email,
                    MatKhauHash = model.Password,
                    VaiTro = "Customer",
                    TrangThai = true,
                    NgayTao = DateTime.Now
                };

                _context.NguoiDungs.Add(newUser);
                _context.SaveChanges();

                TempData["Success"] = "Đăng ký tài khoản thành công! Vui lòng đăng nhập.";
                return RedirectToAction("Login");
            }

            return View(model);
        }

        [HttpGet]
        [Authorize]
        public async Task<IActionResult> Profile()
        {
            var userIdStr = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdStr) || !int.TryParse(userIdStr, out int userId))
            {
                return RedirectToAction("Login");
            }

            var user = await _context.NguoiDungs.FindAsync(userId);
            if (user == null) return RedirectToAction("Logout");

            var danhSachDonHang = await _context.DonHangs
                .Include(d => d.ChiTietDonHangs)
                .Where(d => d.NguoiDungId == userId)
                .OrderByDescending(d => d.NgayDat)
                .ToListAsync();

            var diaChi = await _context.DiaChiNguoiDungs
                .OrderByDescending(d => d.MacDinh)
                .FirstOrDefaultAsync(d => d.NguoiDungId == userId);

            ViewBag.DanhSachDonHang = danhSachDonHang;
            ViewBag.DiaChiNguoiDung = diaChi;

            return View(user);
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> UpdateProfile(string hoTen, string soDienThoai)
        {
            var userIdStr = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdStr) || !int.TryParse(userIdStr, out int userId)) return RedirectToAction("Login");

            var user = await _context.NguoiDungs.FindAsync(userId);
            if (user != null)
            {
                user.HoTen = hoTen;
                user.SoDienThoai = soDienThoai;
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Cập nhật hồ sơ thành công!";
            }
            return RedirectToAction("Profile");
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> UpdateAddress(string nguoiNhan, string soDienThoai, string tinhThanh, string quanHuyen, string phuongXa, string diaChiChiTiet)
        {
            var userIdStr = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdStr) || !int.TryParse(userIdStr, out int userId)) return RedirectToAction("Login");

            var diaChi = await _context.DiaChiNguoiDungs.FirstOrDefaultAsync(d => d.NguoiDungId == userId);

            if (diaChi == null)
            {
                diaChi = new DiaChiNguoiDung
                {
                    NguoiDungId = userId,
                    NguoiNhan = nguoiNhan,
                    SoDienThoai = soDienThoai,
                    TinhThanh = tinhThanh ?? "",
                    QuanHuyen = quanHuyen ?? "",
                    PhuongXa = phuongXa ?? "",
                    DiaChiChiTiet = diaChiChiTiet,
                    MacDinh = true
                };
                _context.DiaChiNguoiDungs.Add(diaChi);
            }
            else
            {
                diaChi.NguoiNhan = nguoiNhan;
                diaChi.SoDienThoai = soDienThoai;
                diaChi.TinhThanh = tinhThanh ?? "";
                diaChi.QuanHuyen = quanHuyen ?? "";
                diaChi.PhuongXa = phuongXa ?? "";
                diaChi.DiaChiChiTiet = diaChiChiTiet;
            }

            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Cập nhật sổ địa chỉ thành công!";
            return RedirectToAction("Profile");
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> ChangePassword(string matKhauCu, string matKhauMoi, string xacNhanMatKhauMoi)
        {
            var userIdStr = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdStr) || !int.TryParse(userIdStr, out int userId)) return RedirectToAction("Login");

            if (matKhauMoi != xacNhanMatKhauMoi)
            {
                TempData["ErrorMessage"] = "Mật khẩu mới và xác nhận mật khẩu không khớp!";
                return RedirectToAction("Profile");
            }

            var user = await _context.NguoiDungs.FindAsync(userId);
            if (user == null || user.MatKhauHash != matKhauCu)
            {
                TempData["ErrorMessage"] = "Mật khẩu hiện tại không chính xác!";
                return RedirectToAction("Profile");
            }

            user.MatKhauHash = matKhauMoi;
            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = "Đổi mật khẩu thành công!";
            return RedirectToAction("Profile");
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> CancelOrder(int donHangId)
        {
            var userIdStr = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdStr) || !int.TryParse(userIdStr, out int userId))
            {
                return RedirectToAction("Login");
            }

            var donHang = await _context.DonHangs
                .Include(d => d.ChiTietDonHangs)
                    .ThenInclude(ct => ct.SanPham)
                .Include(d => d.KhuyenMai)
                .FirstOrDefaultAsync(d => d.DonHangId == donHangId && d.NguoiDungId == userId);

            if (donHang != null && donHang.TrangThaiDonHang == "Pending")
            {
                donHang.TrangThaiDonHang = "Cancelled";
                donHang.NgayCapNhat = DateTime.Now;

                foreach (var ct in donHang.ChiTietDonHangs)
                {
                    if (ct.SanPham != null)
                    {
                        ct.SanPham.SoLuongTon += ct.SoLuong;
                    }
                }

                if (donHang.KhuyenMai != null)
                {
                    donHang.KhuyenMai.SoLuongSuDung += 1;
                }

                _context.LichSuDonHangs.Add(new LichSuDonHang
                {
                    DonHangId = donHang.DonHangId,
                    TrangThaiCu = "Pending",
                    TrangThaiMoi = "Cancelled",
                    GhiChu = "Khách hàng tự hủy đơn khi đang chờ xác nhận",
                    NguoiThucHienId = userId,
                    NgayThayDoi = DateTime.Now
                });

                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã hủy đơn hàng #{donHang.MaDonHang} và hoàn lại tồn kho thành công!";
            }
            else
            {
                TempData["ErrorMessage"] = "Chỉ có thể hủy đơn hàng khi đang ở trạng thái Chờ xác nhận!";
            }

            return RedirectToAction("Profile");
        }

        [HttpGet]
        public IActionResult AccessDenied()
        {
            if (User.IsInRole("Staff"))
            {
                TempData["ErrorMessage"] = "Chức năng này chỉ dành riêng cho Quản trị viên cấp cao (Admin)!";
                return RedirectToAction("Index", "Admin");
            }
            return RedirectToAction("Index", "Home");
        }
    }
}