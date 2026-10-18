using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class HinhAnhSanPham
{
    public int HinhAnhId { get; set; }

    public int SanPhamId { get; set; }

    public string DuongDanAnh { get; set; } = null!;

    public string? MoTaAnh { get; set; }

    public bool LaAnhChinh { get; set; }

    public int ThuTu { get; set; }

    public virtual SanPham SanPham { get; set; } = null!;
}
