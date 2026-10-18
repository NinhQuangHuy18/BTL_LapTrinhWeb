using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class ThuongHieu
{
    public int ThuongHieuId { get; set; }

    public string TenThuongHieu { get; set; } = null!;

    public string Slug { get; set; } = null!;

    public string? Logo { get; set; }

    public string? MoTa { get; set; }

    public bool TrangThai { get; set; }

    public virtual ICollection<SanPham> SanPhams { get; set; } = new List<SanPham>();
}
