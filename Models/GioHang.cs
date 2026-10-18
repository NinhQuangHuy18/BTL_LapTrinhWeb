using System;
using System.Collections.Generic;

namespace BTL_LapTrinhWeb.Models;

public partial class GioHang
{
    public int GioHangId { get; set; }

    public int NguoiDungId { get; set; }

    public DateTime NgayTao { get; set; }

    public DateTime? NgayCapNhat { get; set; }

    public virtual ICollection<ChiTietGioHang> ChiTietGioHangs { get; set; } = new List<ChiTietGioHang>();

    public virtual NguoiDung NguoiDung { get; set; } = null!;
}
