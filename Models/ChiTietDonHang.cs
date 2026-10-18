using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class ChiTietDonHang
{
    public int ChiTietDonHangId { get; set; }

    public int DonHangId { get; set; }

    public int SanPhamId { get; set; }

    public string TenSanPham { get; set; } = null!;

    public string MaSanPham { get; set; } = null!;

    public decimal DonGia { get; set; }

    public int SoLuong { get; set; }

    public decimal ThanhTien { get; set; }

    public virtual DonHang DonHang { get; set; } = null!;

    public virtual SanPham SanPham { get; set; } = null!;
}
