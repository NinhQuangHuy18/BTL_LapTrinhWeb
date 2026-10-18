using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models
{
    public class AdminDashboardViewModel
    {
        public decimal TongDoanhThu { get; set; }
        public int TongDonHang { get; set; }
        public int DonChoXuLy { get; set; }
        public int TongKhachHang { get; set; }
        public int TongNhanVien { get; set; }
        public int TongSanPham { get; set; }

        public List<string> NhanThang { get; set; } = new List<string>();
        public List<decimal> DoanhThuTheoThang { get; set; } = new List<decimal>();
        public int SoDonHoanThanh { get; set; }
        public int SoDonDangGiao { get; set; }
        public int SoDonDaHuy { get; set; }

        public List<DonHang> DonHangMoiNhat { get; set; } = new List<DonHang>();
        public List<SanPham> SanPhamSapHetHang { get; set; } = new List<SanPham>();
    }
}