using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class ThongSoKyThuat
{
    public int ThongSoId { get; set; }

    public int SanPhamId { get; set; }

    public string TenThongSo { get; set; } = null!;

    public string GiaTri { get; set; } = null!;

    public string? DonVi { get; set; }

    public string? NhomThongSo { get; set; }

    public int ThuTu { get; set; }

    public virtual SanPham SanPham { get; set; } = null!;
}
