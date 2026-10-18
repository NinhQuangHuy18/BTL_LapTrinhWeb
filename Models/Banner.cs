using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class Banner
{
    public int BannerId { get; set; }

    public string TieuDe { get; set; } = null!;

    public string HinhAnh { get; set; } = null!;

    public string? LienKet { get; set; }

    public string ViTri { get; set; } = null!;

    public int ThuTu { get; set; }

    public DateTime? NgayBatDau { get; set; }

    public DateTime? NgayKetThuc { get; set; }

    public bool TrangThai { get; set; }
}
