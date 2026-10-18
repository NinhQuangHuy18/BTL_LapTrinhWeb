namespace BTL_LapTrinhWeb.Models
{
    public class TechnicalAdviceViewModel
    {
        public int DanhMucId { get; set; } = 1;
        public string QuyMoSuDung { get; set; } = "nho";
        public string MucGia { get; set; } = "all";
        public int? ThuongHieuId { get; set; }
        public string UuTien { get; set; } = "inverter";

        public bool DaTuVan { get; set; } = false;
        public string TieuDeKetQua { get; set; } = string.Empty;
        public string CongSuatKhuyenNghi { get; set; } = string.Empty;
        public string LoiKhuyenChuyenGia { get; set; } = string.Empty;
        public string LuuYLapDat { get; set; } = string.Empty;

        public List<SanPham> SanPhamGoiY { get; set; } = new List<SanPham>();
        public List<ThuongHieu> DanhSachThuongHieu { get; set; } = new List<ThuongHieu>();
    }
}
