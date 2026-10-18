using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class KhuyenMai
{
    public int KhuyenMaiId { get; set; }

    public string MaKhuyenMai { get; set; } = null!;

    public string TenKhuyenMai { get; set; } = null!;

    public string LoaiGiamGia { get; set; } = null!;

    public decimal GiaTriGiam { get; set; }

    public decimal DonHangToiThieu { get; set; }

    public decimal? GiamToiDa { get; set; }

    public DateTime NgayBatDau { get; set; }

    public DateTime NgayKetThuc { get; set; }

    public int SoLuongSuDung { get; set; }

    public bool TrangThai { get; set; }

    public virtual ICollection<DonHang> DonHangs { get; set; } = new List<DonHang>();
}
