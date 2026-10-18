using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class DonHang
{
    public int DonHangId { get; set; }

    public string MaDonHang { get; set; } = null!;

    public int? NguoiDungId { get; set; }

    public int? KhuyenMaiId { get; set; }

    public string TenNguoiNhan { get; set; } = null!;

    public string SoDienThoaiNhan { get; set; } = null!;

    public string? EmailNhan { get; set; }

    public string DiaChiNhan { get; set; } = null!;

    public decimal TongTienHang { get; set; }

    public decimal TienGiamGia { get; set; }

    public decimal PhiVanChuyen { get; set; }

    public decimal TongThanhToan { get; set; }

    public string PhuongThucThanhToan { get; set; } = null!;

    public string TrangThaiDonHang { get; set; } = null!;

    public string TrangThaiThanhToan { get; set; } = null!;

    public string? GhiChu { get; set; }

    public DateTime NgayDat { get; set; }

    public DateTime? NgayCapNhat { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual KhuyenMai? KhuyenMai { get; set; }

    public virtual ICollection<LichSuDonHang> LichSuDonHangs { get; set; } = new List<LichSuDonHang>();

    public virtual NguoiDung? NguoiDung { get; set; }
}
