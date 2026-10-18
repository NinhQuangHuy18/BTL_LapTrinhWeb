using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class DanhMuc
{
    public int DanhMucId { get; set; }

    public string TenDanhMuc { get; set; } = null!;

    public string Slug { get; set; } = null!;

    public int? DanhMucChaId { get; set; }

    public string? MoTa { get; set; }

    public string? AnhDaiDien { get; set; }

    public int ThuTu { get; set; }

    public bool TrangThai { get; set; }

    public virtual DanhMuc? DanhMucCha { get; set; }

    public virtual ICollection<DanhMuc> InverseDanhMucCha { get; set; } = new List<DanhMuc>();

    public virtual ICollection<SanPham> SanPhams { get; set; } = new List<SanPham>();
}
