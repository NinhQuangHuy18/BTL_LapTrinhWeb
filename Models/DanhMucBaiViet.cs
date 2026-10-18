using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class DanhMucBaiViet
{
    public int DanhMucBaiVietId { get; set; }

    public string TenDanhMuc { get; set; } = null!;

    public string Slug { get; set; } = null!;

    public string? MoTa { get; set; }

    public bool TrangThai { get; set; }

    public virtual ICollection<BaiViet> BaiViets { get; set; } = new List<BaiViet>();
}
