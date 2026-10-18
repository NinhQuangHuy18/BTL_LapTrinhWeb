using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class DiaChiNguoiDung
{
    public int DiaChiId { get; set; }

    public int NguoiDungId { get; set; }

    public string NguoiNhan { get; set; } = null!;

    public string SoDienThoai { get; set; } = null!;

    public string TinhThanh { get; set; } = null!;

    public string QuanHuyen { get; set; } = null!;

    public string? PhuongXa { get; set; }

    public string DiaChiChiTiet { get; set; } = null!;

    public bool MacDinh { get; set; }

    public virtual NguoiDung NguoiDung { get; set; } = null!;
}
