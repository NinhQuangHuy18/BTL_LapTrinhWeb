using BTL_LapTrinhWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BTL_LapTrinhWeb.Controllers
{
    public class ProductController : Controller
    {
        private readonly DienLanhHuySonContext _context;

        public ProductController(DienLanhHuySonContext context)
        {
            _context = context;
        }

        public IActionResult AirConditioner(int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Where(sp => sp.TrangThai == true && (sp.DanhMucId == 1 || sp.MaSanPham.StartsWith("DH-")))
                .AsQueryable();

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);
            return View(viewModel);
        }

        public IActionResult Refrigerator(int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Where(sp => sp.TrangThai == true && (sp.DanhMucId == 2 || sp.TenSanPham.Contains("Tủ lạnh")))
                .AsQueryable();

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);
            return View(viewModel);
        }

        public IActionResult WashingMachine(int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Where(sp => sp.TrangThai == true && (sp.DanhMucId == 3 || sp.TenSanPham.Contains("Máy giặt")))
                .AsQueryable();

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);
            return View(viewModel);
        }

        public IActionResult WaterHeater(int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Where(sp => sp.TrangThai == true && (sp.DanhMucId == 4 || sp.TenSanPham.Contains("Bình nóng lạnh")))
                .AsQueryable();

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);
            return View(viewModel);
        }

        [HttpGet]
        [Route("Product/FeaturedProducts")]
        [Route("San-pham-noi-bat")]
        public IActionResult FeaturedProducts(int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Where(sp => sp.TrangThai == true && sp.NoiBat == true)
                .AsQueryable();

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);
            return View(viewModel);
        }

        [HttpGet]
        [Route("Product/NewProducts")]
        [Route("San-pham-moi")]
        public IActionResult NewProducts(int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Where(sp => sp.TrangThai == true && sp.Moi == true)
                .AsQueryable();

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);
            return View(viewModel);
        }

        private ProductListViewModel LayDanhSachSanPham(IQueryable<SanPham> query, int page, string sortOrder)
        {
            int pageSize = 12;
            if (page < 1) page = 1;

            query = query.Include(sp => sp.HinhAnhSanPhams);

            switch (sortOrder)
            {
                case "price-asc":
                    query = query.OrderBy(sp => sp.GiaBan);
                    break;
                case "price-desc":
                    query = query.OrderByDescending(sp => sp.GiaBan);
                    break;
                case "newest":
                    query = query.OrderByDescending(sp => sp.NgayTao);
                    break;
                default:
                    query = query.OrderBy(sp => sp.SanPhamId);
                    break;
            }

            var totalItems = query.Count();
            var totalPages = (int)System.Math.Ceiling(totalItems / (double)pageSize);

            int skipAmount = (page - 1) * pageSize;
            var products = query
                .Skip(skipAmount)
                .Take(pageSize)
                .ToList();

            return new ProductListViewModel
            {
                Products = products,
                CurrentPage = page,
                TotalPages = totalPages,
                TotalItems = totalItems,
                SortOrder = sortOrder
            };
        }

        [Route("Product/ProductDetail/{id:int?}")]
        [Route("Product/ProductDetails/{id:int?}")]
        [Route("product-detail/{slug}")]
        [Route("San-pham/{slug}")]
        public async Task<IActionResult> ProductDetail(int? id, string? slug)
        {
            if (id == null && string.IsNullOrEmpty(slug))
            {
                return NotFound();
            }

            var query = _context.SanPhams
                .Include(p => p.ThuongHieu)
                .Include(p => p.DanhMuc)
                .Include(p => p.ThongSoKyThuats)
                .Include(p => p.HinhAnhSanPhams)
                .AsQueryable();

            SanPham? sanPham = null;

            if (id.HasValue)
            {
                sanPham = await query.FirstOrDefaultAsync(p => p.SanPhamId == id.Value);
            }
            else if (!string.IsNullOrEmpty(slug))
            {
                sanPham = await query.FirstOrDefaultAsync(p => p.Slug == slug);
            }

            if (sanPham == null)
            {
                return NotFound();
            }

            sanPham.HinhAnhSanPhams = sanPham.HinhAnhSanPhams
                .OrderByDescending(img => img.LaAnhChinh)
                .ThenBy(img => img.ThuTu)
                .ToList();

            sanPham.ThongSoKyThuats = sanPham.ThongSoKyThuats
                .OrderBy(ts => ts.ThuTu)
                .ToList();

            return View("ProductDetail", sanPham);
        }

        [HttpGet]
        [Route("Product/Search")]
        [Route("tim-kiem")]
        public IActionResult Search(string? keyword, int page = 1, string sortOrder = "default")
        {
            var query = _context.SanPhams
                .Include(sp => sp.ThuongHieu)
                .Include(sp => sp.DanhMuc)
                .Where(sp => sp.TrangThai == true)
                .AsQueryable();

            if (!string.IsNullOrWhiteSpace(keyword))
            {
                string kw = keyword.Trim();
                query = query.Where(sp =>
                    sp.TenSanPham.Contains(kw) ||
                    sp.MaSanPham.Contains(kw) ||
                    (sp.Model != null && sp.Model.Contains(kw)) ||
                    (sp.CongSuat != null && sp.CongSuat.Contains(kw)) ||
                    (sp.ThuongHieu != null && sp.ThuongHieu.TenThuongHieu.Contains(kw)) ||
                    (sp.DanhMuc != null && sp.DanhMuc.TenDanhMuc.Contains(kw))
                );
            }

            var viewModel = LayDanhSachSanPham(query, page, sortOrder);

            ViewBag.Keyword = keyword?.Trim() ?? "";

            return View(viewModel);
        }
    }
}