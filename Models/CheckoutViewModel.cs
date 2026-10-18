using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models
{
    public class CheckoutViewModel
    {
        public string NguoiNhan { get; set; } = string.Empty;
        public string SoDienThoai { get; set; } = string.Empty;
        public string TinhThanh { get; set; } = string.Empty;
        public string QuanHuyen { get; set; } = string.Empty;
        public string PhuongXa { get; set; } = string.Empty;
        public string DiaChiChiTiet { get; set; } = string.Empty;
        public string? GhiChu { get; set; }

        public string PhuongThucThanhToan { get; set; } = "COD";

        public string? MaKhuyenMai { get; set; }

        public List<ChiTietGioHang> CartItems { get; set; } = new List<ChiTietGioHang>();
        public decimal TamTinh { get; set; }
        public decimal PhiVanChuyen { get; set; } = 0;
        public decimal GiamGia { get; set; } = 0;
        public decimal TongThanhToan { get; set; }
    }
}