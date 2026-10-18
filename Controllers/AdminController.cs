using BTL_LapTrinhWeb.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;

namespace BTL_LapTrinhWeb.Controllers
{
    [Authorize(Roles = "Admin,Staff")]
    public class AdminController : Controller
    {
        private readonly DienLanhHuySonContext _context;

        public AdminController(DienLanhHuySonContext context)
        {
            _context = context;
        }

        private int? GetCurrentUserId()
        {
            var userIdStr = User.FindFirstValue("UserId");
            if (int.TryParse(userIdStr, out int userId))
                return userId;
            return null;
        }

        [Route("Admin")]
        [Route("Admin/Index")]
        public async Task<IActionResult> Index()
        {
            var allOrders = await _context.DonHangs
                .OrderByDescending(d => d.NgayDat)
                .ToListAsync();

            var model = new AdminDashboardViewModel
            {
                TongDoanhThu = allOrders
                    .Where(d => d.TrangThaiDonHang != "Cancelled" && (d.TrangThaiDonHang == "Completed" || d.TrangThaiThanhToan == "Paid"))
                    .Sum(d => d.TongThanhToan),
                TongDonHang = allOrders.Count,
                DonChoXuLy = allOrders.Count(d => d.TrangThaiDonHang == "Pending"),
                TongKhachHang = await _context.NguoiDungs.CountAsync(u => u.VaiTro == "Customer"),
                TongNhanVien = await _context.NguoiDungs.CountAsync(u => u.VaiTro == "Staff"),
                TongSanPham = await _context.SanPhams.CountAsync(),

                SoDonHoanThanh = allOrders.Count(d => d.TrangThaiDonHang == "Completed"),
                SoDonDangGiao = allOrders.Count(d => d.TrangThaiDonHang == "Confirmed" || d.TrangThaiDonHang == "Packing" || d.TrangThaiDonHang == "Shipping"),
                SoDonDaHuy = allOrders.Count(d => d.TrangThaiDonHang == "Cancelled"),

                DonHangMoiNhat = allOrders.Take(6).ToList(),
                SanPhamSapHetHang = await _context.SanPhams
                    .Where(p => p.SoLuongTon <= 15)
                    .OrderBy(p => p.SoLuongTon)
                    .Take(5)
                    .ToListAsync()
            };

            var today = DateTime.Now;
            for (int i = 5; i >= 0; i--)
            {
                var targetMonth = today.AddMonths(-i);
                model.NhanThang.Add($"Tháng {targetMonth.Month}/{targetMonth.Year}");

                decimal rev = allOrders
                    .Where(d => d.NgayDat.Month == targetMonth.Month &&
                                d.NgayDat.Year == targetMonth.Year &&
                                d.TrangThaiDonHang != "Cancelled" &&
                                (d.TrangThaiDonHang == "Completed" || d.TrangThaiThanhToan == "Paid"))
                    .Sum(d => d.TongThanhToan);

                model.DoanhThuTheoThang.Add(rev);
            }

            return View(model);
        }

        [Route("Admin/Orders")]
        public async Task<IActionResult> Orders(string? status)
        {
            var query = _context.DonHangs
                .Include(d => d.ChiTietDonHangs)
                .AsQueryable();

            if (!string.IsNullOrEmpty(status) && status != "All")
            {
                query = query.Where(d => d.TrangThaiDonHang == status);
            }

            ViewBag.CurrentStatus = status ?? "All";
            var orders = await query.OrderByDescending(d => d.NgayDat).ToListAsync();
            return View(orders);
        }

        [HttpPost]
        [Route("Admin/UpdateOrderStatus")]
        public async Task<IActionResult> UpdateOrderStatus(int donHangId, string trangThaiDonHang, string trangThaiThanhToan, string? ghiChu)
        {
            var donHang = await _context.DonHangs
                .Include(d => d.ChiTietDonHangs)
                    .ThenInclude(ct => ct.SanPham)
                .Include(d => d.KhuyenMai)
                .FirstOrDefaultAsync(d => d.DonHangId == donHangId);

            if (donHang == null) return NotFound();

            string trangThaiCu = donHang.TrangThaiDonHang;

            if (trangThaiCu != "Cancelled" && trangThaiDonHang == "Cancelled")
            {
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
            }
            else if (trangThaiCu == "Cancelled" && trangThaiDonHang != "Cancelled")
            {
                foreach (var ct in donHang.ChiTietDonHangs)
                {
                    if (ct.SanPham != null && ct.SanPham.SoLuongTon >= ct.SoLuong)
                    {
                        ct.SanPham.SoLuongTon -= ct.SoLuong;
                    }
                }
            }

            donHang.TrangThaiDonHang = trangThaiDonHang;
            donHang.TrangThaiThanhToan = trangThaiThanhToan;
            donHang.NgayCapNhat = DateTime.Now;

            var lichSu = new LichSuDonHang
            {
                DonHangId = donHangId,
                TrangThaiCu = trangThaiCu,
                TrangThaiMoi = trangThaiDonHang,
                GhiChu = string.IsNullOrEmpty(ghiChu) ? $"Cập nhật trạng thái đơn sang {trangThaiDonHang} ({trangThaiThanhToan})" : ghiChu,
                NguoiThucHienId = GetCurrentUserId(),
                NgayThayDoi = DateTime.Now
            };
            _context.LichSuDonHangs.Add(lichSu);

            await _context.SaveChangesAsync();
            TempData["SuccessMessage"] = $"Đã cập nhật đơn hàng #{donHang.MaDonHang} thành công!";
            return RedirectToAction("Orders");
        }

        [Route("Admin/Customers")]
        public async Task<IActionResult> Customers(string? keyword)
        {
            var query = _context.NguoiDungs
                .Include(u => u.DonHangs)
                .Where(u => u.VaiTro == "Customer");

            if (!string.IsNullOrEmpty(keyword))
            {
                query = query.Where(u => u.HoTen.Contains(keyword) || u.Email.Contains(keyword) || (u.SoDienThoai != null && u.SoDienThoai.Contains(keyword)));
            }

            ViewBag.Keyword = keyword;
            var customers = await query.OrderByDescending(u => u.NgayTao).ToListAsync();
            return View(customers);
        }

        [HttpPost]
        [Route("Admin/ToggleUserStatus")]
        public async Task<IActionResult> ToggleUserStatus(int nguoiDungId, string returnUrl = "Customers")
        {
            var user = await _context.NguoiDungs.FindAsync(nguoiDungId);
            if (user == null) return NotFound();

            if (User.IsInRole("Staff") && user.VaiTro != "Customer")
            {
                TempData["ErrorMessage"] = "Nhân viên chỉ có quyền thay đổi trạng thái tài khoản Khách hàng!";
                return RedirectToAction(returnUrl);
            }

            if (user.NguoiDungId == GetCurrentUserId())
            {
                TempData["ErrorMessage"] = "Bạn không thể tự khóa tài khoản của chính mình!";
                return RedirectToAction(returnUrl);
            }

            user.TrangThai = !user.TrangThai;
            await _context.SaveChangesAsync();

            string stateText = user.TrangThai ? "MỞ KHÓA" : "KHÓA";
            TempData["SuccessMessage"] = $"Đã {stateText} tài khoản [{user.Email}] thành công!";
            return RedirectToAction(returnUrl);
        }

        [Authorize(Roles = "Admin")]
        [Route("Admin/Staffs")]
        public async Task<IActionResult> Staffs()
        {
            var staffs = await _context.NguoiDungs
                .Where(u => u.VaiTro == "Staff" || u.VaiTro == "Admin")
                .OrderBy(u => u.VaiTro)
                .ThenByDescending(u => u.NgayTao)
                .ToListAsync();

            return View(staffs);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        [Route("Admin/CreateStaff")]
        public async Task<IActionResult> CreateStaff(string hoTen, string email, string soDienThoai, string matKhau, string vaiTro = "Staff")
        {
            email = email.Trim().ToLower();
            if (await _context.NguoiDungs.AnyAsync(u => u.Email == email))
            {
                TempData["ErrorMessage"] = "Email này đã tồn tại trong hệ thống!";
                return RedirectToAction("Staffs");
            }

            var newStaff = new NguoiDung
            {
                HoTen = hoTen.Trim(),
                Email = email,
                SoDienThoai = soDienThoai?.Trim(),
                MatKhauHash = matKhau,
                VaiTro = (vaiTro == "Admin" || vaiTro == "Staff") ? vaiTro : "Staff",
                TrangThai = true,
                NgayTao = DateTime.Now
            };

            _context.NguoiDungs.Add(newStaff);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = $"Đã thêm nhân sự [{newStaff.HoTen}] ({newStaff.VaiTro}) thành công!";
            return RedirectToAction("Staffs");
        }

        [Route("Admin/Posts")]
        public async Task<IActionResult> Posts()
        {
            ViewBag.Categories = await _context.DanhMucBaiViets.Where(c => c.TrangThai).ToListAsync();

            var posts = await _context.BaiViets
                .Include(b => b.DanhMucBaiViet)
                .Include(b => b.NguoiTao)
                .OrderByDescending(b => b.NgayTao)
                .ToListAsync();

            return View(posts);
        }

        [HttpPost]
        [Route("Admin/CreatePost")]
        public async Task<IActionResult> CreatePost(string tieuDe, int? danhMucBaiVietId, string? tomTat, string? noiDung, string? anhDaiDien, string trangThai = "Published")
        {
            string slug = "bai-viet-" + DateTime.Now.ToString("yyMMddHHmmss");

            var post = new BaiViet
            {
                TieuDe = tieuDe.Trim(),
                Slug = slug,
                DanhMucBaiVietId = danhMucBaiVietId,
                TomTat = tomTat,
                NoiDung = noiDung,
                AnhDaiDien = string.IsNullOrWhiteSpace(anhDaiDien)
                    ? "https://dienlanhthinhphat.com.vn/wp-content/uploads/2026/10/thinh-phat-Thiet-ke-chua-co-ten-3.jpg"
                    : anhDaiDien.Trim(),
                NguoiTaoId = GetCurrentUserId(),
                NgayTao = DateTime.Now,
                NgayDang = trangThai == "Published" ? DateTime.Now : null,
                TrangThai = trangThai
            };

            _context.BaiViets.Add(post);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = "Đã đăng bài viết mới thành công!";
            return RedirectToAction("Posts");
        }

        [HttpPost]
        [Route("Admin/DeletePost")]
        public async Task<IActionResult> DeletePost(int baiVietId)
        {
            var post = await _context.BaiViets.FindAsync(baiVietId);
            if (post != null)
            {
                _context.BaiViets.Remove(post);
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = "Đã xóa bài viết!";
            }
            return RedirectToAction("Posts");
        }

        [Route("Admin/Products")]
        public async Task<IActionResult> Products(string? keyword, int? danhMucId)
        {
            ViewBag.DanhMucs = await _context.DanhMucs.Where(d => d.TrangThai).ToListAsync();
            ViewBag.ThuongHieus = await _context.ThuongHieus.Where(t => t.TrangThai).ToListAsync();
            ViewBag.SelectedDanhMuc = danhMucId;
            ViewBag.Keyword = keyword;

            var query = _context.SanPhams
                .Include(p => p.DanhMuc)
                .Include(p => p.ThuongHieu)
                .Include(p => p.HinhAnhSanPhams)
                .AsQueryable();

            if (danhMucId.HasValue && danhMucId.Value > 0)
            {
                query = query.Where(p => p.DanhMucId == danhMucId.Value);
            }

            if (!string.IsNullOrWhiteSpace(keyword))
            {
                string kw = keyword.Trim();
                query = query.Where(p => p.TenSanPham.Contains(kw) || p.MaSanPham.Contains(kw));
            }

            var products = await query.OrderBy(p => p.SoLuongTon).ThenByDescending(p => p.SanPhamId).ToListAsync();
            return View(products);
        }

        [HttpPost]
        [Route("Admin/ImportStock")]
        public async Task<IActionResult> ImportStock(int sanPhamId, int soLuongNhap, decimal giaBanMoi)
        {
            var sp = await _context.SanPhams.FindAsync(sanPhamId);
            if (sp == null) return NotFound();

            if (soLuongNhap > 0)
            {
                sp.SoLuongTon += soLuongNhap;
            }

            if (giaBanMoi > 0)
            {
                sp.GiaBan = giaBanMoi;
            }

            sp.NgayCapNhat = DateTime.Now;
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = $"Đã nhập thêm +{soLuongNhap} sản phẩm vào kho cho [{sp.TenSanPham}] (Tồn kho mới: {sp.SoLuongTon})!";
            return RedirectToAction("Products");
        }

        [HttpPost]
        [Route("Admin/CreateProduct")]
        public async Task<IActionResult> CreateProduct(
            string maSanPham,
            string tenSanPham,
            int danhMucId,
            int thuongHieuId,
            decimal giaBan,
            decimal? giaNiemYet,
            int soLuongTon,
            string? congSuat,
            string? xuatXu,
            string? duongDanAnh,
            bool noiBat = false,
            bool moi = true)
        {
            maSanPham = maSanPham.Trim().ToUpper();
            if (await _context.SanPhams.AnyAsync(p => p.MaSanPham == maSanPham))
            {
                TempData["ErrorMessage"] = $"Mã sản phẩm [{maSanPham}] đã tồn tại trong kho!";
                return RedirectToAction("Products");
            }

            string slug = "sp-" + maSanPham.ToLower() + "-" + DateTime.Now.ToString("HHmmss");

            var sp = new SanPham
            {
                MaSanPham = maSanPham,
                TenSanPham = tenSanPham.Trim(),
                Slug = slug,
                DanhMucId = danhMucId,
                ThuongHieuId = thuongHieuId,
                GiaBan = giaBan,
                GiaNiemYet = giaNiemYet ?? (giaBan + 1200000),
                SoLuongTon = soLuongTon >= 0 ? soLuongTon : 0,
                CongSuat = congSuat ?? "Tiêu chuẩn hãng",
                BaoHanhThang = 24,
                XuatXu = xuatXu ?? "Thái Lan / Việt Nam",
                Model = maSanPham,
                MoTaNgan = "<ul><li>Sản phẩm chính hãng nguyên đai nguyên kiện</li><li>Công nghệ Inverter tiết kiệm điện</li></ul>",
                MoTaChiTiet = $"<p>{tenSanPham} phân phối chính hãng tại Điện Lạnh Huy Sơn.</p>",
                NoiBat = noiBat,
                Moi = moi,
                TrangThai = true,
                NgayTao = DateTime.Now
            };

            _context.SanPhams.Add(sp);
            await _context.SaveChangesAsync();

            string imgUrl = string.IsNullOrWhiteSpace(duongDanAnh)
                ? "https://dienlanhthinhphat.com.vn/wp-content/uploads/2026/10/thinh-phat-Thiet-ke-chua-co-ten-3.jpg"
                : duongDanAnh.Trim();

            _context.HinhAnhSanPhams.Add(new HinhAnhSanPham
            {
                SanPhamId = sp.SanPhamId,
                DuongDanAnh = imgUrl,
                MoTaAnh = sp.TenSanPham,
                LaAnhChinh = true,
                ThuTu = 1
            });
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = $"Đã thêm sản phẩm mới [{sp.TenSanPham}] với số lượng {sp.SoLuongTon} vào kho!";
            return RedirectToAction("Products");
        }

        [HttpPost]
        [Route("Admin/ToggleProductStatus")]
        public async Task<IActionResult> ToggleProductStatus(int sanPhamId)
        {
            var sp = await _context.SanPhams.FindAsync(sanPhamId);
            if (sp != null)
            {
                sp.TrangThai = !sp.TrangThai;
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã cập nhật trạng thái kinh doanh của [{sp.TenSanPham}]!";
            }
            return RedirectToAction("Products");
        }

        [Authorize(Roles = "Admin")]
        [Route("Admin/Coupons")]
        public async Task<IActionResult> Coupons()
        {
            var coupons = await _context.KhuyenMais
                .OrderByDescending(k => k.KhuyenMaiId)
                .ToListAsync();
            return View(coupons);
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        [Route("Admin/CreateCoupon")]
        public async Task<IActionResult> CreateCoupon(
            string maKhuyenMai,
            string tenKhuyenMai,
            string loaiGiamGia,
            decimal giaTriGiam,
            decimal donHangToiThieu,
            decimal? giamToiDa,
            DateTime ngayKetThuc,
            int soLuongSuDung = 50)
        {
            maKhuyenMai = maKhuyenMai.Trim().ToUpper();
            if (await _context.KhuyenMais.AnyAsync(k => k.MaKhuyenMai == maKhuyenMai))
            {
                TempData["ErrorMessage"] = $"Mã khuyến mãi [{maKhuyenMai}] đã tồn tại!";
                return RedirectToAction("Coupons");
            }

            var km = new KhuyenMai
            {
                MaKhuyenMai = maKhuyenMai,
                TenKhuyenMai = tenKhuyenMai.Trim(),
                LoaiGiamGia = (loaiGiamGia == "Percent" || loaiGiamGia == "Amount") ? loaiGiamGia : "Amount",
                GiaTriGiam = giaTriGiam > 0 ? giaTriGiam : 100000,
                DonHangToiThieu = donHangToiThieu >= 0 ? donHangToiThieu : 0,
                GiamToiDa = giamToiDa,
                NgayBatDau = DateTime.Now.Date,
                NgayKetThuc = ngayKetThuc >= DateTime.Now.Date ? ngayKetThuc : DateTime.Now.AddMonths(3),
                SoLuongSuDung = soLuongSuDung >= 0 ? soLuongSuDung : 50,
                TrangThai = true
            };

            _context.KhuyenMais.Add(km);
            await _context.SaveChangesAsync();

            TempData["SuccessMessage"] = $"Đã tạo mã khuyến mãi [{km.MaKhuyenMai}] thành công!";
            return RedirectToAction("Coupons");
        }

        [Authorize(Roles = "Admin")]
        [HttpPost]
        [Route("Admin/ToggleCouponStatus")]
        public async Task<IActionResult> ToggleCouponStatus(int khuyenMaiId)
        {
            var km = await _context.KhuyenMais.FindAsync(khuyenMaiId);
            if (km != null)
            {
                km.TrangThai = !km.TrangThai;
                await _context.SaveChangesAsync();
                TempData["SuccessMessage"] = $"Đã cập nhật trạng thái mã [{km.MaKhuyenMai}]!";
            }
            return RedirectToAction("Coupons");
        }
    }
}