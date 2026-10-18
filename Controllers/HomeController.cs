using BTL_LapTrinhWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;

namespace BTL_LapTrinhWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly DienLanhHuySonContext _context;

        public HomeController(DienLanhHuySonContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var viewModel = new HomeViewModel();

            viewModel.MainBanners = _context.Banners
                .Where(b => b.TrangThai == true && b.ViTri == "HomeMain")
                .OrderBy(b => b.ThuTu)
                .ToList();

            viewModel.TinTucMoi = _context.BaiViets
                .Where(b => b.TrangThai == "Published")
                .OrderByDescending(b => b.NgayTao)
                .Take(5)
                .ToList();

            viewModel.SanPhamNoiBat = _context.SanPhams
                .Include(sp => sp.HinhAnhSanPhams)
                .Where(sp => sp.TrangThai == true && sp.NoiBat == true)
                .OrderByDescending(sp => sp.NgayTao)
                .Take(5)
                .ToList();

            viewModel.SanPhamMoi = _context.SanPhams
                .Include(sp => sp.HinhAnhSanPhams)
                .Where(sp => sp.TrangThai == true && sp.Moi == true)
                .OrderByDescending(sp => sp.NgayTao)
                .Take(5)
                .ToList();

            return View(viewModel);
        }

        public IActionResult PriceList()
        {
            ViewData["Title"] = "Bảng giá vật tư & Lắp đặt";
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpGet]
        [Route("Home/TechnicalAdvice")]
        [Route("tu-van-ky-thuat")]
        public async Task<IActionResult> TechnicalAdvice(
            int danhMucId = 1,
            string? quyMoSuDung = null,
            string? mucGia = "all",
            int? thuongHieuId = null,
            string? uuTien = "inverter",
            bool submitted = false)
        {
            var model = new TechnicalAdviceViewModel
            {
                DanhMucId = danhMucId,
                QuyMoSuDung = quyMoSuDung ?? "nho",
                MucGia = mucGia ?? "all",
                ThuongHieuId = thuongHieuId,
                UuTien = uuTien ?? "inverter",
                DaTuVan = submitted,
                DanhSachThuongHieu = await _context.ThuongHieus.Where(t => t.TrangThai).ToListAsync()
            };

            if (submitted)
            {
                string tuKhoaCongSuat = "";

                switch (danhMucId)
                {
                    case 1:
                        model.TieuDeKetQua = "Giải pháp Điều hòa không khí theo diện tích phòng";
                        if (model.QuyMoSuDung == "nho")
                        {
                            model.CongSuatKhuyenNghi = "9.000 BTU (1.0 HP)";
                            tuKhoaCongSuat = "9000";
                            model.LoiKhuyenChuyenGia = "Với phòng dưới 15m² (phòng ngủ nhỏ, phòng làm việc cá nhân), máy 9.000 BTU Inverter là lựa chọn tối ưu nhất, giúp làm lạnh sâu chỉ sau 5-7 phút mà không gây lãng phí điện năng.";
                            model.LuuYLapDat = "Sử dụng ống đồng dày tối thiểu 0.71mm, chiều dài ống từ dàn lạnh tới dàn nóng nên từ 3m - 15m để máy nén bền nhất.";
                        }
                        else if (model.QuyMoSuDung == "vua")
                        {
                            model.CongSuatKhuyenNghi = "12.000 BTU (1.5 HP)";
                            tuKhoaCongSuat = "12000";
                            model.LoiKhuyenChuyenGia = "Với diện tích từ 15m² - 20m² (phòng ngủ lớn hoặc phòng khách vừa), bạn bắt buộc nên chọn công suất 12.000 BTU để máy đủ tải tự ngắt nghỉ, tránh chạy quá tải liên tục.";
                            model.LuuYLapDat = "Nên lắp thêm Aptomat 20A-30A riêng biệt và bố trí dàn lạnh tránh thổi trực tiếp vào giường ngủ.";
                        }
                        else if (model.QuyMoSuDung == "lon")
                        {
                            model.CongSuatKhuyenNghi = "18.000 BTU (2.0 HP)";
                            tuKhoaCongSuat = "18000";
                            model.LoiKhuyenChuyenGia = "Phòng từ 20m² - 30m² (phòng khách, văn phòng) có lượng nhiệt tỏa ra lớn và hay mở cửa, cần máy 18.000 BTU luồng gió thổi xa để làm mát đồng đều.";
                            model.LuuYLapDat = "Sử dụng dây nguồn 2x2.5mm² trở lên và giá đỡ cục nóng loại dày chịu lực cao.";
                        }
                        else
                        {
                            model.CongSuatKhuyenNghi = "24.000 BTU (2.5 HP)";
                            tuKhoaCongSuat = "24000";
                            model.LoiKhuyenChuyenGia = "Không gian lớn trên 30m² cần dòng điều hòa công suất lớn 24.000 BTU để đảm bảo lưu lượng gió tuần hoàn khắp phòng.";
                            model.LuuYLapDat = "Kiểm tra kỹ nguồn điện ổn định và đường thoát nước ngưng có độ dốc tốt.";
                        }
                        break;

                    case 2:
                        model.TieuDeKetQua = "Giải pháp Tủ lạnh theo số lượng thành viên gia đình";
                        if (model.QuyMoSuDung == "nho")
                        {
                            model.CongSuatKhuyenNghi = "Dung tích 200 - 260 Lít";
                            model.LoiKhuyenChuyenGia = "Gia đình từ 1 - 3 người phù hợp với dòng tủ lạnh 2 cánh Inverter từ 230L - 260L có ngăn đông mềm giữ thịt cá tươi không cần rã đông.";
                        }
                        else if (model.QuyMoSuDung == "vua")
                        {
                            model.CongSuatKhuyenNghi = "Dung tích 300 - 400 Lít";
                            model.LoiKhuyenChuyenGia = "Gia đình 3 - 5 người nên chọn dòng tủ lạnh ngăn đá dưới hoặc dung tích trên 300 Lít để thoải mái trữ thực phẩm từ 5 - 7 ngày.";
                        }
                        else
                        {
                            model.CongSuatKhuyenNghi = "Side by Side trên 450 Lít";
                            model.LoiKhuyenChuyenGia = "Gia đình đông người (trên 5 thành viên) hoặc có thói quen trữ đồ cả tuần rất hợp với dòng Side by Side 2 dàn lạnh độc lập.";
                        }
                        model.LuuYLapDat = "Đặt tủ nơi khô ráo, cách tường phía sau và hai bên tối thiểu 10cm để tản nhiệt tốt nhất. Sau khi vận chuyển nên để ổn định khí gas 2-4 tiếng mới cắm điện.";
                        break;

                    case 3:
                        model.TieuDeKetQua = "Giải pháp Máy giặt tối ưu theo nhu cầu giặt giũ";
                        if (model.QuyMoSuDung == "nho")
                        {
                            model.CongSuatKhuyenNghi = "Khối lượng giặt 8.5 - 9 Kg";
                            model.LoiKhuyenChuyenGia = "Gia đình 2 - 4 người nên ưu tiên máy giặt cửa ngang 9 Kg Inverter truyền động trực tiếp, vừa êm ái vừa tiết kiệm 50% lượng nước.";
                        }
                        else if (model.QuyMoSuDung == "vua")
                        {
                            model.CongSuatKhuyenNghi = "Khối lượng giặt 9.5 - 10.5 Kg";
                            model.LoiKhuyenChuyenGia = "Gia đình 4 - 6 người phù hợp với máy giặt 9.5Kg - 10.5Kg tích hợp giặt hơi nước diệt khuẩn, giặt được cả chăn mỏng.";
                        }
                        else
                        {
                            model.CongSuatKhuyenNghi = "Khối lượng giặt trên 11 Kg";
                            model.LoiKhuyenChuyenGia = "Gia đình đông người hoặc thường xuyên giặt chăn mền dày nên chọn máy từ 11.5 Kg trở lên để lồng giặt rộng rãi, quần áo sạch hơn.";
                        }
                        model.LuuYLapDat = "Kê máy trên chân đế cân bằng tuyệt đối để chống rung lắc khi vắt tốc độ cao; nối dây tiếp địa để an toàn điện.";
                        break;

                    case 4:
                        model.TieuDeKetQua = "Giải pháp Bình nóng lạnh an toàn & tiết kiệm điện";
                        if (model.QuyMoSuDung == "nho")
                        {
                            model.CongSuatKhuyenNghi = "Bình 15 Lít - 20 Lít (Gián tiếp hoặc Trực tiếp)";
                            tuKhoaCongSuat = "20";
                            model.LoiKhuyenChuyenGia = "Với 1 - 3 người sử dụng, bình dung tích 15L - 20L làm nóng nhanh chỉ trong 15 phút, giữ nhiệt lâu và rất tiết kiệm điện.";
                        }
                        else
                        {
                            model.CongSuatKhuyenNghi = "Bình gián tiếp 30 Lít";
                            tuKhoaCongSuat = "30";
                            model.LoiKhuyenChuyenGia = "Gia đình từ 4 người trở lên hoặc phòng tắm có bồn tắm/vòi sen lớn nên dùng bình 30 Lít để chỉ cần bật 1 lần là đủ nước ấm cho cả nhà.";
                        }
                        model.LuuYLapDat = "Bắt buộc kiểm tra cầu dao chống giật ELCB và lắp dây tiếp địa chống rò điện. Nên bật bình trước khi tắm 15-20 phút rồi ngắt điện.";
                        break;
                }

                var query = _context.SanPhams
                    .Include(p => p.ThuongHieu)
                    .Include(p => p.HinhAnhSanPhams)
                    .Where(p => p.TrangThai && p.DanhMucId == danhMucId)
                    .AsQueryable();

                if (thuongHieuId.HasValue && thuongHieuId.Value > 0)
                {
                    query = query.Where(p => p.ThuongHieuId == thuongHieuId.Value);
                }

                switch (mucGia)
                {
                    case "duoi-6tr":
                        query = query.Where(p => p.GiaBan < 6000000);
                        break;
                    case "6tr-10tr":
                        query = query.Where(p => p.GiaBan >= 6000000 && p.GiaBan <= 10000000);
                        break;
                    case "10tr-15tr":
                        query = query.Where(p => p.GiaBan > 10000000 && p.GiaBan <= 15000000);
                        break;
                    case "tren-15tr":
                        query = query.Where(p => p.GiaBan > 15000000);
                        break;
                }

                var ketQua = await query.ToListAsync();

                if (!string.IsNullOrEmpty(tuKhoaCongSuat))
                {
                    var locTheoCongSuat = ketQua
                        .Where(p => (p.CongSuat != null && p.CongSuat.Contains(tuKhoaCongSuat)) || p.TenSanPham.Contains(tuKhoaCongSuat))
                        .ToList();

                    if (locTheoCongSuat.Any())
                    {
                        ketQua = locTheoCongSuat;
                    }
                }

                if (!ketQua.Any())
                {
                    ketQua = await _context.SanPhams
                        .Include(p => p.ThuongHieu)
                        .Include(p => p.HinhAnhSanPhams)
                        .Where(p => p.TrangThai && p.DanhMucId == danhMucId)
                        .OrderBy(p => p.GiaBan)
                        .Take(4)
                        .ToListAsync();
                }

                model.SanPhamGoiY = uuTien switch
                {
                    "gia-re" => ketQua.OrderBy(p => p.GiaBan).Take(4).ToList(),
                    "cao-cap" => ketQua.OrderByDescending(p => p.GiaBan).Take(4).ToList(),
                    _ => ketQua.OrderByDescending(p => p.NoiBat).ThenBy(p => p.GiaBan).Take(4).ToList()
                };
            }

            return View(model);
        }

        public IActionResult NewsDetails(string slug)
        {
            if (string.IsNullOrEmpty(slug))
                return RedirectToAction("Index");

            var baiViet = _context.BaiViets
                .Include(b => b.DanhMucBaiViet)
                .Include(b => b.NguoiTao)
                .FirstOrDefault(b => b.Slug == slug && b.TrangThai == "Published");

            if (baiViet == null)
                return NotFound();

            var baiVietLienQuan = _context.BaiViets
                .Where(b => b.BaiVietId != baiViet.BaiVietId && b.TrangThai == "Published")
                .Take(5)
                .ToList();

            ViewBag.BaiVietLienQuan = baiVietLienQuan;

            return View(baiViet);
        }
    }
}