using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class BaiViet
{
    public int BaiVietId { get; set; }

    public int? DanhMucBaiVietId { get; set; }

    public string TieuDe { get; set; } = null!;

    public string Slug { get; set; } = null!;

    public string? TomTat { get; set; }

    public string? NoiDung { get; set; }

    public string? AnhDaiDien { get; set; }

    public int? NguoiTaoId { get; set; }

    public DateTime NgayTao { get; set; }

    public DateTime? NgayDang { get; set; }

    public string TrangThai { get; set; } = null!;

    public virtual DanhMucBaiViet? DanhMucBaiViet { get; set; }

    public virtual NguoiDung? NguoiTao { get; set; }
}
