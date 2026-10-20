USE master;
GO

IF DB_ID(N'DienLanhHuySon') IS NOT NULL
BEGIN
    ALTER DATABASE DienLanhHuySon SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DienLanhHuySon;
END
GO

CREATE DATABASE DienLanhHuySon;
GO

USE DienLanhHuySon;
GO

CREATE TABLE dbo.DanhMuc (
    DanhMucID       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DanhMuc PRIMARY KEY,
    TenDanhMuc      NVARCHAR(150) NOT NULL,
    Slug            VARCHAR(200) NOT NULL,
    DanhMucChaID    INT NULL,
    MoTa            NVARCHAR(MAX) NULL,
    AnhDaiDien      NVARCHAR(500) NULL,
    ThuTu           INT NOT NULL CONSTRAINT DF_DanhMuc_ThuTu DEFAULT (0),
    TrangThai       BIT NOT NULL CONSTRAINT DF_DanhMuc_TrangThai DEFAULT (1),
    CONSTRAINT UQ_DanhMuc_Slug UNIQUE (Slug),
    CONSTRAINT FK_DanhMuc_DanhMucCha FOREIGN KEY (DanhMucChaID) REFERENCES dbo.DanhMuc(DanhMucID)
);

CREATE TABLE dbo.ThuongHieu (
    ThuongHieuID    INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ThuongHieu PRIMARY KEY,
    TenThuongHieu   NVARCHAR(150) NOT NULL,
    Slug            VARCHAR(200) NOT NULL,
    Logo            NVARCHAR(500) NULL,
    MoTa            NVARCHAR(MAX) NULL,
    TrangThai       BIT NOT NULL CONSTRAINT DF_ThuongHieu_TrangThai DEFAULT (1),
    CONSTRAINT UQ_ThuongHieu_Slug UNIQUE (Slug)
);

CREATE TABLE dbo.SanPham (
    SanPhamID       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_SanPham PRIMARY KEY,
    DanhMucID       INT NOT NULL,
    ThuongHieuID    INT NOT NULL,
    MaSanPham       VARCHAR(50) NOT NULL,
    TenSanPham      NVARCHAR(250) NOT NULL,
    Slug            VARCHAR(300) NOT NULL,
    MoTaNgan        NVARCHAR(1000) NULL,
    MoTaChiTiet     NVARCHAR(MAX) NULL,
    GiaBan          DECIMAL(18,2) NOT NULL,
    GiaNiemYet      DECIMAL(18,2) NULL,
    SoLuongTon      INT NOT NULL CONSTRAINT DF_SanPham_SoLuongTon DEFAULT (0),
    CongSuat        NVARCHAR(100) NULL,
    BaoHanhThang    INT NULL,
    XuatXu          NVARCHAR(100) NULL,
    Model           NVARCHAR(100) NULL,
    NoiBat          BIT NOT NULL CONSTRAINT DF_SanPham_NoiBat DEFAULT (0),
    Moi             BIT NOT NULL CONSTRAINT DF_SanPham_Moi DEFAULT (0),
    TrangThai       BIT NOT NULL CONSTRAINT DF_SanPham_TrangThai DEFAULT (1),
    NgayTao         DATETIME2(0) NOT NULL CONSTRAINT DF_SanPham_NgayTao DEFAULT (SYSDATETIME()),
    NgayCapNhat     DATETIME2(0) NULL,
    CONSTRAINT UQ_SanPham_MaSanPham UNIQUE (MaSanPham),
    CONSTRAINT UQ_SanPham_Slug UNIQUE (Slug),
    CONSTRAINT CK_SanPham_GiaBan CHECK (GiaBan >= 0),
    CONSTRAINT CK_SanPham_GiaNiemYet CHECK (GiaNiemYet IS NULL OR GiaNiemYet >= 0),
    CONSTRAINT CK_SanPham_SoLuongTon CHECK (SoLuongTon >= 0),
    CONSTRAINT CK_SanPham_BaoHanh CHECK (BaoHanhThang IS NULL OR BaoHanhThang >= 0),
    CONSTRAINT FK_SanPham_DanhMuc FOREIGN KEY (DanhMucID) REFERENCES dbo.DanhMuc(DanhMucID),
    CONSTRAINT FK_SanPham_ThuongHieu FOREIGN KEY (ThuongHieuID) REFERENCES dbo.ThuongHieu(ThuongHieuID)
);

CREATE TABLE dbo.HinhAnhSanPham (
    HinhAnhID       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_HinhAnhSanPham PRIMARY KEY,
    SanPhamID       INT NOT NULL,
    DuongDanAnh     NVARCHAR(500) NOT NULL,
    MoTaAnh         NVARCHAR(250) NULL,
    LaAnhChinh      BIT NOT NULL CONSTRAINT DF_HinhAnhSanPham_LaAnhChinh DEFAULT (0),
    ThuTu           INT NOT NULL CONSTRAINT DF_HinhAnhSanPham_ThuTu DEFAULT (0),
    CONSTRAINT FK_HinhAnhSanPham_SanPham FOREIGN KEY (SanPhamID) REFERENCES dbo.SanPham(SanPhamID) ON DELETE CASCADE
);

CREATE TABLE dbo.ThongSoKyThuat (
    ThongSoID       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ThongSoKyThuat PRIMARY KEY,
    SanPhamID       INT NOT NULL,
    TenThongSo      NVARCHAR(150) NOT NULL,
    GiaTri          NVARCHAR(500) NOT NULL,
    DonVi           NVARCHAR(50) NULL,
    NhomThongSo     NVARCHAR(100) NULL,
    ThuTu           INT NOT NULL CONSTRAINT DF_ThongSoKyThuat_ThuTu DEFAULT (0),
    CONSTRAINT FK_ThongSoKyThuat_SanPham FOREIGN KEY (SanPhamID) REFERENCES dbo.SanPham(SanPhamID) ON DELETE CASCADE
);

CREATE TABLE dbo.NguoiDung (
    NguoiDungID     INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_NguoiDung PRIMARY KEY,
    HoTen           NVARCHAR(150) NOT NULL,
    Email           VARCHAR(255) NOT NULL,
    SoDienThoai     VARCHAR(15) NULL,
    MatKhauHash     VARCHAR(500) NOT NULL,
    VaiTro          VARCHAR(20) NOT NULL CONSTRAINT DF_NguoiDung_VaiTro DEFAULT ('Customer'),
    TrangThai       BIT NOT NULL CONSTRAINT DF_NguoiDung_TrangThai DEFAULT (1),
    NgayTao         DATETIME2(0) NOT NULL CONSTRAINT DF_NguoiDung_NgayTao DEFAULT (SYSDATETIME()),
    CONSTRAINT UQ_NguoiDung_Email UNIQUE (Email),
    CONSTRAINT CK_NguoiDung_VaiTro CHECK (VaiTro IN ('Admin', 'Staff', 'Customer'))
);

CREATE TABLE dbo.DiaChiNguoiDung (
    DiaChiID        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DiaChiNguoiDung PRIMARY KEY,
    NguoiDungID     INT NOT NULL,
    NguoiNhan       NVARCHAR(150) NOT NULL,
    SoDienThoai     VARCHAR(15) NOT NULL,
    TinhThanh       NVARCHAR(100) NOT NULL,
    QuanHuyen       NVARCHAR(100) NOT NULL,
    PhuongXa        NVARCHAR(100) NULL,
    DiaChiChiTiet   NVARCHAR(300) NOT NULL,
    MacDinh         BIT NOT NULL CONSTRAINT DF_DiaChiNguoiDung_MacDinh DEFAULT (0),
    CONSTRAINT FK_DiaChiNguoiDung_NguoiDung FOREIGN KEY (NguoiDungID) REFERENCES dbo.NguoiDung(NguoiDungID) ON DELETE CASCADE
);

CREATE TABLE dbo.GioHang (
    GioHangID       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_GioHang PRIMARY KEY,
    NguoiDungID     INT NOT NULL,
    NgayTao         DATETIME2(0) NOT NULL CONSTRAINT DF_GioHang_NgayTao DEFAULT (SYSDATETIME()),
    NgayCapNhat     DATETIME2(0) NULL,
    CONSTRAINT FK_GioHang_NguoiDung FOREIGN KEY (NguoiDungID) REFERENCES dbo.NguoiDung(NguoiDungID) ON DELETE CASCADE
);

CREATE TABLE dbo.ChiTietGioHang (
    ChiTietGioHangID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ChiTietGioHang PRIMARY KEY,
    GioHangID        INT NOT NULL,
    SanPhamID        INT NOT NULL,
    SoLuong          INT NOT NULL,
    NgayThem         DATETIME2(0) NOT NULL CONSTRAINT DF_ChiTietGioHang_NgayThem DEFAULT (SYSDATETIME()),
    CONSTRAINT UQ_ChiTietGioHang_GioHang_SanPham UNIQUE (GioHangID, SanPhamID),
    CONSTRAINT CK_ChiTietGioHang_SoLuong CHECK (SoLuong > 0),
    CONSTRAINT FK_ChiTietGioHang_GioHang FOREIGN KEY (GioHangID) REFERENCES dbo.GioHang(GioHangID) ON DELETE CASCADE,
    CONSTRAINT FK_ChiTietGioHang_SanPham FOREIGN KEY (SanPhamID) REFERENCES dbo.SanPham(SanPhamID)
);

CREATE TABLE dbo.KhuyenMai (
    KhuyenMaiID      INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_KhuyenMai PRIMARY KEY,
    MaKhuyenMai      VARCHAR(50) NOT NULL,
    TenKhuyenMai     NVARCHAR(200) NOT NULL,
    LoaiGiamGia      VARCHAR(20) NOT NULL,
    GiaTriGiam       DECIMAL(18,2) NOT NULL,
    DonHangToiThieu  DECIMAL(18,2) NOT NULL CONSTRAINT DF_KhuyenMai_DonHangToiThieu DEFAULT (0),
    GiamToiDa        DECIMAL(18,2) NULL,
    NgayBatDau       DATETIME2(0) NOT NULL,
    NgayKetThuc      DATETIME2(0) NOT NULL,
    SoLuongSuDung    INT NOT NULL CONSTRAINT DF_KhuyenMai_SoLuongSuDung DEFAULT (0),
    TrangThai        BIT NOT NULL CONSTRAINT DF_KhuyenMai_TrangThai DEFAULT (1),
    CONSTRAINT UQ_KhuyenMai_MaKhuyenMai UNIQUE (MaKhuyenMai),
    CONSTRAINT CK_KhuyenMai_LoaiGiamGia CHECK (LoaiGiamGia IN ('Percent', 'Amount')),
    CONSTRAINT CK_KhuyenMai_GiaTriGiam CHECK (GiaTriGiam > 0),
    CONSTRAINT CK_KhuyenMai_Ngay CHECK (NgayKetThuc >= NgayBatDau),
    CONSTRAINT CK_KhuyenMai_SoLuong CHECK (SoLuongSuDung >= 0)
);

CREATE TABLE dbo.DonHang (
    DonHangID            INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DonHang PRIMARY KEY,
    MaDonHang            VARCHAR(30) NOT NULL,
    NguoiDungID          INT NULL,
    KhuyenMaiID          INT NULL,
    TenNguoiNhan         NVARCHAR(150) NOT NULL,
    SoDienThoaiNhan      VARCHAR(15) NOT NULL,
    EmailNhan            VARCHAR(255) NULL,
    DiaChiNhan           NVARCHAR(500) NOT NULL,
    TongTienHang         DECIMAL(18,2) NOT NULL,
    TienGiamGia          DECIMAL(18,2) NOT NULL CONSTRAINT DF_DonHang_TienGiamGia DEFAULT (0),
    PhiVanChuyen         DECIMAL(18,2) NOT NULL CONSTRAINT DF_DonHang_PhiVanChuyen DEFAULT (0),
    TongThanhToan        DECIMAL(18,2) NOT NULL,
    PhuongThucThanhToan  VARCHAR(30) NOT NULL CONSTRAINT DF_DonHang_PhuongThucThanhToan DEFAULT ('COD'),
    TrangThaiDonHang     VARCHAR(30) NOT NULL CONSTRAINT DF_DonHang_TrangThaiDonHang DEFAULT ('Pending'),
    TrangThaiThanhToan   VARCHAR(30) NOT NULL CONSTRAINT DF_DonHang_TrangThaiThanhToan DEFAULT ('Unpaid'),
    GhiChu               NVARCHAR(1000) NULL,
    NgayDat              DATETIME2(0) NOT NULL CONSTRAINT DF_DonHang_NgayDat DEFAULT (SYSDATETIME()),
    NgayCapNhat          DATETIME2(0) NULL,
    CONSTRAINT UQ_DonHang_MaDonHang UNIQUE (MaDonHang),
    CONSTRAINT CK_DonHang_Tien CHECK (TongTienHang >= 0 AND TienGiamGia >= 0 AND PhiVanChuyen >= 0 AND TongThanhToan >= 0),
    CONSTRAINT CK_DonHang_PhuongThuc CHECK (PhuongThucThanhToan IN ('COD', 'VNPAY', 'VietQR', 'BankTransfer', 'EWallet', 'Card')),
    CONSTRAINT CK_DonHang_TrangThai CHECK (TrangThaiDonHang IN ('Pending', 'Confirmed', 'Packing', 'Shipping', 'Completed', 'Cancelled')),
    CONSTRAINT CK_DonHang_ThanhToan CHECK (TrangThaiThanhToan IN ('Unpaid', 'Pending', 'Paid', 'Failed', 'Refunded')),
    CONSTRAINT FK_DonHang_NguoiDung FOREIGN KEY (NguoiDungID) REFERENCES dbo.NguoiDung(NguoiDungID),
    CONSTRAINT FK_DonHang_KhuyenMai FOREIGN KEY (KhuyenMaiID) REFERENCES dbo.KhuyenMai(KhuyenMaiID)
);

CREATE TABLE dbo.ChiTietDonHang (
    ChiTietDonHangID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ChiTietDonHang PRIMARY KEY,
    DonHangID        INT NOT NULL,
    SanPhamID        INT NOT NULL,
    TenSanPham       NVARCHAR(250) NOT NULL,
    MaSanPham        VARCHAR(50) NULL,
    DonGia           DECIMAL(18,2) NOT NULL,
    SoLuong          INT NOT NULL,
    ThanhTien        DECIMAL(18,2) NOT NULL,
    CONSTRAINT CK_ChiTietDonHang_DonGia CHECK (DonGia >= 0),
    CONSTRAINT CK_ChiTietDonHang_SoLuong CHECK (SoLuong > 0),
    CONSTRAINT CK_ChiTietDonHang_ThanhTien CHECK (ThanhTien >= 0),
    CONSTRAINT FK_ChiTietDonHang_DonHang FOREIGN KEY (DonHangID) REFERENCES dbo.DonHang(DonHangID) ON DELETE CASCADE,
    CONSTRAINT FK_ChiTietDonHang_SanPham FOREIGN KEY (SanPhamID) REFERENCES dbo.SanPham(SanPhamID)
);

CREATE TABLE dbo.GiaoDichThanhToan (
    GiaoDichID       INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_GiaoDichThanhToan PRIMARY KEY,
    DonHangID        INT NOT NULL,
    MaGiaoDich       VARCHAR(100) NULL,
    CongThanhToan    VARCHAR(50) NOT NULL CONSTRAINT DF_GiaoDich_Cong DEFAULT ('VNPAY'), -- VNPAY, VietQR, COD
    NganHang         VARCHAR(50) NULL,  -- VD: MB, VCB, NCB
    SoTien           DECIMAL(18,2) NOT NULL,
    NoiDung          NVARCHAR(250) NULL,
    TrangThai        VARCHAR(30) NOT NULL CONSTRAINT DF_GiaoDich_TrangThai DEFAULT ('Pending'), -- Pending, Success, Failed
    NgayGiaoDich     DATETIME2(0) NOT NULL CONSTRAINT DF_GiaoDich_Ngay DEFAULT (SYSDATETIME()),
    CONSTRAINT FK_GiaoDichThanhToan_DonHang FOREIGN KEY (DonHangID) REFERENCES dbo.DonHang(DonHangID) ON DELETE CASCADE
);

CREATE TABLE dbo.LichSuDonHang (
    LichSuID         INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_LichSuDonHang PRIMARY KEY,
    DonHangID        INT NOT NULL,
    TrangThaiCu      VARCHAR(30) NULL,
    TrangThaiMoi     VARCHAR(30) NOT NULL,
    GhiChu           NVARCHAR(500) NULL,
    NguoiThucHienID  INT NULL,
    NgayThayDoi      DATETIME2(0) NOT NULL CONSTRAINT DF_LichSuDonHang_NgayThayDoi DEFAULT (SYSDATETIME()),
    CONSTRAINT FK_LichSuDonHang_DonHang FOREIGN KEY (DonHangID) REFERENCES dbo.DonHang(DonHangID) ON DELETE CASCADE,
    CONSTRAINT FK_LichSuDonHang_NguoiThucHien FOREIGN KEY (NguoiThucHienID) REFERENCES dbo.NguoiDung(NguoiDungID)
);

CREATE TABLE dbo.Banner (
    BannerID        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Banner PRIMARY KEY,
    TieuDe          NVARCHAR(200) NOT NULL,
    HinhAnh         NVARCHAR(500) NOT NULL,
    LienKet         NVARCHAR(500) NULL,
    ViTri           VARCHAR(50) NOT NULL CONSTRAINT DF_Banner_ViTri DEFAULT ('HomeMain'),
    ThuTu           INT NOT NULL CONSTRAINT DF_Banner_ThuTu DEFAULT (0),
    NgayBatDau      DATETIME2(0) NULL,
    NgayKetThuc     DATETIME2(0) NULL,
    TrangThai       BIT NOT NULL CONSTRAINT DF_Banner_TrangThai DEFAULT (1),
    CONSTRAINT CK_Banner_Ngay CHECK (NgayBatDau IS NULL OR NgayKetThuc IS NULL OR NgayKetThuc >= NgayBatDau)
);

CREATE TABLE dbo.DanhMucBaiViet (
    DanhMucBaiVietID INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_DanhMucBaiViet PRIMARY KEY,
    TenDanhMuc       NVARCHAR(150) NOT NULL,
    Slug             VARCHAR(200) NOT NULL,
    MoTa             NVARCHAR(500) NULL,
    TrangThai        BIT NOT NULL CONSTRAINT DF_DanhMucBaiViet_TrangThai DEFAULT (1),
    CONSTRAINT UQ_DanhMucBaiViet_Slug UNIQUE (Slug)
);

CREATE TABLE dbo.BaiViet (
    BaiVietID        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_BaiViet PRIMARY KEY,
    DanhMucBaiVietID INT NULL,
    TieuDe           NVARCHAR(250) NOT NULL,
    Slug             VARCHAR(300) NOT NULL,
    TomTat           NVARCHAR(1000) NULL,
    NoiDung          NVARCHAR(MAX) NULL,
    AnhDaiDien       NVARCHAR(500) NULL,
    NguoiTaoID       INT NULL,
    NgayTao          DATETIME2(0) NOT NULL CONSTRAINT DF_BaiViet_NgayTao DEFAULT (SYSDATETIME()),
    NgayDang         DATETIME2(0) NULL,
    TrangThai        VARCHAR(20) NOT NULL CONSTRAINT DF_BaiViet_TrangThai DEFAULT ('Draft'),
    CONSTRAINT UQ_BaiViet_Slug UNIQUE (Slug),
    CONSTRAINT CK_BaiViet_TrangThai CHECK (TrangThai IN ('Draft', 'Published', 'Hidden')),
    CONSTRAINT FK_BaiViet_DanhMuc FOREIGN KEY (DanhMucBaiVietID) REFERENCES dbo.DanhMucBaiViet(DanhMucBaiVietID),
    CONSTRAINT FK_BaiViet_NguoiTao FOREIGN KEY (NguoiTaoID) REFERENCES dbo.NguoiDung(NguoiDungID)
);