using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BTL_LapTrinhWeb.Models;

public partial class DienLanhHuySonContext : DbContext
{
    public DienLanhHuySonContext()
    {
    }

    public DienLanhHuySonContext(DbContextOptions<DienLanhHuySonContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BaiViet> BaiViets { get; set; }

    public virtual DbSet<Banner> Banners { get; set; }

    public virtual DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }

    public virtual DbSet<ChiTietGioHang> ChiTietGioHangs { get; set; }

    public virtual DbSet<DanhMuc> DanhMucs { get; set; }

    public virtual DbSet<DanhMucBaiViet> DanhMucBaiViets { get; set; }

    public virtual DbSet<DiaChiNguoiDung> DiaChiNguoiDungs { get; set; }

    public virtual DbSet<DonHang> DonHangs { get; set; }

    public virtual DbSet<GioHang> GioHangs { get; set; }

    public virtual DbSet<HinhAnhSanPham> HinhAnhSanPhams { get; set; }

    public virtual DbSet<KhuyenMai> KhuyenMais { get; set; }

    public virtual DbSet<LichSuDonHang> LichSuDonHangs { get; set; }

    public virtual DbSet<NguoiDung> NguoiDungs { get; set; }

    public virtual DbSet<SanPham> SanPhams { get; set; }

    public virtual DbSet<ThongSoKyThuat> ThongSoKyThuats { get; set; }

    public virtual DbSet<ThuongHieu> ThuongHieus { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<BaiViet>(entity =>
        {
            entity.ToTable("BaiViet");

            entity.HasIndex(e => e.Slug, "UQ_BaiViet_Slug").IsUnique();

            entity.Property(e => e.BaiVietId).HasColumnName("BaiVietID");
            entity.Property(e => e.AnhDaiDien).HasMaxLength(500);
            entity.Property(e => e.DanhMucBaiVietId).HasColumnName("DanhMucBaiVietID");
            entity.Property(e => e.NgayDang).HasPrecision(0);
            entity.Property(e => e.NgayTao)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_BaiViet_NgayTao");
            entity.Property(e => e.NguoiTaoId).HasColumnName("NguoiTaoID");
            entity.Property(e => e.Slug)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.TieuDe).HasMaxLength(250);
            entity.Property(e => e.TomTat).HasMaxLength(1000);
            entity.Property(e => e.TrangThai)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasDefaultValue("Draft", "DF_BaiViet_TrangThai");

            entity.HasOne(d => d.DanhMucBaiViet).WithMany(p => p.BaiViets)
                .HasForeignKey(d => d.DanhMucBaiVietId)
                .HasConstraintName("FK_BaiViet_DanhMuc");

            entity.HasOne(d => d.NguoiTao).WithMany(p => p.BaiViets)
                .HasForeignKey(d => d.NguoiTaoId)
                .HasConstraintName("FK_BaiViet_NguoiTao");
        });

        modelBuilder.Entity<Banner>(entity =>
        {
            entity.ToTable("Banner");

            entity.Property(e => e.BannerId).HasColumnName("BannerID");
            entity.Property(e => e.HinhAnh).HasMaxLength(500);
            entity.Property(e => e.LienKet).HasMaxLength(500);
            entity.Property(e => e.NgayBatDau).HasPrecision(0);
            entity.Property(e => e.NgayKetThuc).HasPrecision(0);
            entity.Property(e => e.TieuDe).HasMaxLength(200);
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_Banner_TrangThai");
            entity.Property(e => e.ViTri)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasDefaultValue("HomeMain", "DF_Banner_ViTri");
        });

        modelBuilder.Entity<ChiTietDonHang>(entity =>
        {
            entity.ToTable("ChiTietDonHang");

            entity.Property(e => e.ChiTietDonHangId).HasColumnName("ChiTietDonHangID");
            entity.Property(e => e.DonGia).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.DonHangId).HasColumnName("DonHangID");
            entity.Property(e => e.MaSanPham)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.SanPhamId).HasColumnName("SanPhamID");
            entity.Property(e => e.TenSanPham).HasMaxLength(250);
            entity.Property(e => e.ThanhTien).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.DonHang).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.DonHangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietDonHang_DonHang");

            entity.HasOne(d => d.SanPham).WithMany(p => p.ChiTietDonHangs)
                .HasForeignKey(d => d.SanPhamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietDonHang_SanPham");
        });

        modelBuilder.Entity<ChiTietGioHang>(entity =>
        {
            entity.ToTable("ChiTietGioHang");

            entity.HasIndex(e => new { e.GioHangId, e.SanPhamId }, "UQ_ChiTietGioHang_GioHang_SanPham").IsUnique();

            entity.Property(e => e.ChiTietGioHangId).HasColumnName("ChiTietGioHangID");
            entity.Property(e => e.GioHangId).HasColumnName("GioHangID");
            entity.Property(e => e.NgayThem)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_ChiTietGioHang_NgayThem");
            entity.Property(e => e.SanPhamId).HasColumnName("SanPhamID");

            entity.HasOne(d => d.GioHang).WithMany(p => p.ChiTietGioHangs)
                .HasForeignKey(d => d.GioHangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietGioHang_GioHang");

            entity.HasOne(d => d.SanPham).WithMany(p => p.ChiTietGioHangs)
                .HasForeignKey(d => d.SanPhamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ChiTietGioHang_SanPham");
        });

        modelBuilder.Entity<DanhMuc>(entity =>
        {
            entity.ToTable("DanhMuc");

            entity.HasIndex(e => e.Slug, "UQ_DanhMuc_Slug").IsUnique();

            entity.Property(e => e.DanhMucId).HasColumnName("DanhMucID");
            entity.Property(e => e.AnhDaiDien).HasMaxLength(500);
            entity.Property(e => e.DanhMucChaId).HasColumnName("DanhMucChaID");
            entity.Property(e => e.Slug)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.TenDanhMuc).HasMaxLength(150);
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_DanhMuc_TrangThai");

            entity.HasOne(d => d.DanhMucCha).WithMany(p => p.InverseDanhMucCha)
                .HasForeignKey(d => d.DanhMucChaId)
                .HasConstraintName("FK_DanhMuc_DanhMucCha");
        });

        modelBuilder.Entity<DanhMucBaiViet>(entity =>
        {
            entity.ToTable("DanhMucBaiViet");

            entity.HasIndex(e => e.Slug, "UQ_DanhMucBaiViet_Slug").IsUnique();

            entity.Property(e => e.DanhMucBaiVietId).HasColumnName("DanhMucBaiVietID");
            entity.Property(e => e.MoTa).HasMaxLength(500);
            entity.Property(e => e.Slug)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.TenDanhMuc).HasMaxLength(150);
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_DanhMucBaiViet_TrangThai");
        });

        modelBuilder.Entity<DiaChiNguoiDung>(entity =>
        {
            entity.HasKey(e => e.DiaChiId);

            entity.ToTable("DiaChiNguoiDung");

            entity.Property(e => e.DiaChiId).HasColumnName("DiaChiID");
            entity.Property(e => e.DiaChiChiTiet).HasMaxLength(300);
            entity.Property(e => e.NguoiDungId).HasColumnName("NguoiDungID");
            entity.Property(e => e.NguoiNhan).HasMaxLength(150);
            entity.Property(e => e.PhuongXa).HasMaxLength(100);
            entity.Property(e => e.QuanHuyen).HasMaxLength(100);
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.TinhThanh).HasMaxLength(100);

            entity.HasOne(d => d.NguoiDung).WithMany(p => p.DiaChiNguoiDungs)
                .HasForeignKey(d => d.NguoiDungId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DiaChiNguoiDung_NguoiDung");
        });

        modelBuilder.Entity<DonHang>(entity =>
        {
            entity.ToTable("DonHang");

            entity.HasIndex(e => e.MaDonHang, "UQ_DonHang_MaDonHang").IsUnique();

            entity.Property(e => e.DonHangId).HasColumnName("DonHangID");
            entity.Property(e => e.DiaChiNhan).HasMaxLength(500);
            entity.Property(e => e.EmailNhan)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.GhiChu).HasMaxLength(1000);
            entity.Property(e => e.KhuyenMaiId).HasColumnName("KhuyenMaiID");
            entity.Property(e => e.MaDonHang)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.NgayCapNhat).HasPrecision(0);
            entity.Property(e => e.NgayDat)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_DonHang_NgayDat");
            entity.Property(e => e.NguoiDungId).HasColumnName("NguoiDungID");
            entity.Property(e => e.PhiVanChuyen).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.PhuongThucThanhToan)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasDefaultValue("COD", "DF_DonHang_PhuongThucThanhToan");
            entity.Property(e => e.SoDienThoaiNhan)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.TenNguoiNhan).HasMaxLength(150);
            entity.Property(e => e.TienGiamGia).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TongThanhToan).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TongTienHang).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.TrangThaiDonHang)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasDefaultValue("Pending", "DF_DonHang_TrangThaiDonHang");
            entity.Property(e => e.TrangThaiThanhToan)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasDefaultValue("Unpaid", "DF_DonHang_TrangThaiThanhToan");

            entity.HasOne(d => d.KhuyenMai).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.KhuyenMaiId)
                .HasConstraintName("FK_DonHang_KhuyenMai");

            entity.HasOne(d => d.NguoiDung).WithMany(p => p.DonHangs)
                .HasForeignKey(d => d.NguoiDungId)
                .HasConstraintName("FK_DonHang_NguoiDung");
        });

        modelBuilder.Entity<GioHang>(entity =>
        {
            entity.ToTable("GioHang");

            entity.Property(e => e.GioHangId).HasColumnName("GioHangID");
            entity.Property(e => e.NgayCapNhat).HasPrecision(0);
            entity.Property(e => e.NgayTao)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_GioHang_NgayTao");
            entity.Property(e => e.NguoiDungId).HasColumnName("NguoiDungID");

            entity.HasOne(d => d.NguoiDung).WithMany(p => p.GioHangs)
                .HasForeignKey(d => d.NguoiDungId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_GioHang_NguoiDung");
        });

        modelBuilder.Entity<HinhAnhSanPham>(entity =>
        {
            entity.HasKey(e => e.HinhAnhId);

            entity.ToTable("HinhAnhSanPham");

            entity.Property(e => e.HinhAnhId).HasColumnName("HinhAnhID");
            entity.Property(e => e.DuongDanAnh).HasMaxLength(500);
            entity.Property(e => e.MoTaAnh).HasMaxLength(250);
            entity.Property(e => e.SanPhamId).HasColumnName("SanPhamID");

            entity.HasOne(d => d.SanPham).WithMany(p => p.HinhAnhSanPhams)
                .HasForeignKey(d => d.SanPhamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HinhAnhSanPham_SanPham");
        });

        modelBuilder.Entity<KhuyenMai>(entity =>
        {
            entity.ToTable("KhuyenMai");

            entity.HasIndex(e => e.MaKhuyenMai, "UQ_KhuyenMai_MaKhuyenMai").IsUnique();

            entity.Property(e => e.KhuyenMaiId).HasColumnName("KhuyenMaiID");
            entity.Property(e => e.DonHangToiThieu).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.GiaTriGiam).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.GiamToiDa).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.LoaiGiamGia)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.MaKhuyenMai)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.NgayBatDau).HasPrecision(0);
            entity.Property(e => e.NgayKetThuc).HasPrecision(0);
            entity.Property(e => e.TenKhuyenMai).HasMaxLength(200);
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_KhuyenMai_TrangThai");
        });

        modelBuilder.Entity<LichSuDonHang>(entity =>
        {
            entity.HasKey(e => e.LichSuId);

            entity.ToTable("LichSuDonHang");

            entity.Property(e => e.LichSuId).HasColumnName("LichSuID");
            entity.Property(e => e.DonHangId).HasColumnName("DonHangID");
            entity.Property(e => e.GhiChu).HasMaxLength(500);
            entity.Property(e => e.NgayThayDoi)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_LichSuDonHang_NgayThayDoi");
            entity.Property(e => e.NguoiThucHienId).HasColumnName("NguoiThucHienID");
            entity.Property(e => e.TrangThaiCu)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.TrangThaiMoi)
                .HasMaxLength(30)
                .IsUnicode(false);

            entity.HasOne(d => d.DonHang).WithMany(p => p.LichSuDonHangs)
                .HasForeignKey(d => d.DonHangId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_LichSuDonHang_DonHang");

            entity.HasOne(d => d.NguoiThucHien).WithMany(p => p.LichSuDonHangs)
                .HasForeignKey(d => d.NguoiThucHienId)
                .HasConstraintName("FK_LichSuDonHang_NguoiThucHien");
        });

        modelBuilder.Entity<NguoiDung>(entity =>
        {
            entity.ToTable("NguoiDung");

            entity.HasIndex(e => e.Email, "UQ_NguoiDung_Email").IsUnique();

            entity.Property(e => e.NguoiDungId).HasColumnName("NguoiDungID");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .IsUnicode(false);
            entity.Property(e => e.HoTen).HasMaxLength(150);
            entity.Property(e => e.MatKhauHash)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.NgayTao)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_NguoiDung_NgayTao");
            entity.Property(e => e.SoDienThoai)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_NguoiDung_TrangThai");
            entity.Property(e => e.VaiTro)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasDefaultValue("Customer", "DF_NguoiDung_VaiTro");
        });

        modelBuilder.Entity<SanPham>(entity =>
        {
            entity.ToTable("SanPham");

            entity.HasIndex(e => e.MaSanPham, "UQ_SanPham_MaSanPham").IsUnique();

            entity.HasIndex(e => e.Slug, "UQ_SanPham_Slug").IsUnique();

            entity.Property(e => e.SanPhamId).HasColumnName("SanPhamID");
            entity.Property(e => e.CongSuat).HasMaxLength(100);
            entity.Property(e => e.DanhMucId).HasColumnName("DanhMucID");
            entity.Property(e => e.GiaBan).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.GiaNiemYet).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.MaSanPham)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.MoTaNgan).HasMaxLength(1000);
            entity.Property(e => e.Model).HasMaxLength(100);
            entity.Property(e => e.NgayCapNhat).HasPrecision(0);
            entity.Property(e => e.NgayTao)
                .HasPrecision(0)
                .HasDefaultValueSql("(sysdatetime())", "DF_SanPham_NgayTao");
            entity.Property(e => e.Slug)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.TenSanPham).HasMaxLength(250);
            entity.Property(e => e.ThuongHieuId).HasColumnName("ThuongHieuID");
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_SanPham_TrangThai");
            entity.Property(e => e.XuatXu).HasMaxLength(100);

            entity.HasOne(d => d.DanhMuc).WithMany(p => p.SanPhams)
                .HasForeignKey(d => d.DanhMucId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SanPham_DanhMuc");

            entity.HasOne(d => d.ThuongHieu).WithMany(p => p.SanPhams)
                .HasForeignKey(d => d.ThuongHieuId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_SanPham_ThuongHieu");
        });

        modelBuilder.Entity<ThongSoKyThuat>(entity =>
        {
            entity.HasKey(e => e.ThongSoId);

            entity.ToTable("ThongSoKyThuat");

            entity.Property(e => e.ThongSoId).HasColumnName("ThongSoID");
            entity.Property(e => e.DonVi).HasMaxLength(50);
            entity.Property(e => e.GiaTri).HasMaxLength(500);
            entity.Property(e => e.NhomThongSo).HasMaxLength(100);
            entity.Property(e => e.SanPhamId).HasColumnName("SanPhamID");
            entity.Property(e => e.TenThongSo).HasMaxLength(150);

            entity.HasOne(d => d.SanPham).WithMany(p => p.ThongSoKyThuats)
                .HasForeignKey(d => d.SanPhamId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ThongSoKyThuat_SanPham");
        });

        modelBuilder.Entity<ThuongHieu>(entity =>
        {
            entity.ToTable("ThuongHieu");

            entity.HasIndex(e => e.Slug, "UQ_ThuongHieu_Slug").IsUnique();

            entity.Property(e => e.ThuongHieuId).HasColumnName("ThuongHieuID");
            entity.Property(e => e.Logo).HasMaxLength(500);
            entity.Property(e => e.Slug)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.TenThuongHieu).HasMaxLength(150);
            entity.Property(e => e.TrangThai).HasDefaultValue(true, "DF_ThuongHieu_TrangThai");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
