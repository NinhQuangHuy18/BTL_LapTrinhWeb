using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class LichSuDonHang
{
    public int LichSuId { get; set; }

    public int DonHangId { get; set; }

    public string? TrangThaiCu { get; set; }

    public string TrangThaiMoi { get; set; } = null!;

    public string? GhiChu { get; set; }

    public int? NguoiThucHienId { get; set; }

    public DateTime NgayThayDoi { get; set; }

    public virtual DonHang DonHang { get; set; } = null!;

    public virtual NguoiDung? NguoiThucHien { get; set; }
}
