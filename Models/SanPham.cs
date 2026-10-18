using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class SanPham
{
    public int SanPhamId { get; set; }

    public int DanhMucId { get; set; }

    public int ThuongHieuId { get; set; }

    public string MaSanPham { get; set; } = null!;

    public string TenSanPham { get; set; } = null!;

    public string Slug { get; set; } = null!;

    public string? MoTaNgan { get; set; }

    public string? MoTaChiTiet { get; set; }

    public decimal GiaBan { get; set; }

    public decimal? GiaNiemYet { get; set; }

    public int SoLuongTon { get; set; }

    public string? CongSuat { get; set; }

    public int? BaoHanhThang { get; set; }

    public string? XuatXu { get; set; }

    public string? Model { get; set; }

    public bool NoiBat { get; set; }

    public bool Moi { get; set; }

    public bool TrangThai { get; set; }

    public DateTime NgayTao { get; set; }

    public DateTime? NgayCapNhat { get; set; }

    public virtual ICollection<ChiTietDonHang> ChiTietDonHangs { get; set; } = new List<ChiTietDonHang>();

    public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; } = new List<ChiTietGioHang>();

    public virtual DanhMuc DanhMuc { get; set; } = null!;

    public virtual ICollection<HinhAnhSanPham> HinhAnhSanPhams { get; set; } = new List<HinhAnhSanPham>();

    public virtual ICollection<ThongSoKyThuat> ThongSoKyThuats { get; set; } = new List<ThongSoKyThuat>();

    public virtual ThuongHieu ThuongHieu { get; set; } = null!;
}
