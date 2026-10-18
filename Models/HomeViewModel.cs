namespace BTL_LapTrinhWeb.Models
{
    public class HomeViewModel
    {
        public List<Banner> MainBanners { get; set; }

        public List<BaiViet> TinTucMoi { get; set; }

        public List<SanPham> SanPhamNoiBat { get; set; }
        public List<SanPham> SanPhamMoi { get; set; }
    }
}
