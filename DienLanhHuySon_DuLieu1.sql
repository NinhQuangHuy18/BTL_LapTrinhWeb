USE DienLanhHuySon;
GO

DECLARE @ImgUrl NVARCHAR(500) = N'https://dienlanhthinhphat.com.vn/wp-content/uploads/2026/10/thinh-phat-Thiet-ke-chua-co-ten-3.jpg';

SET IDENTITY_INSERT dbo.DanhMuc ON;
INSERT INTO dbo.DanhMuc (DanhMucID, TenDanhMuc, Slug, DanhMucChaID, MoTa, AnhDaiDien, ThuTu, TrangThai) VALUES
(1, N'Điều hòa không khí', 'dieu-hoa-khong-khi', NULL, N'Các dòng điều hòa treo tường, âm trần chính hãng giá tại kho', @ImgUrl, 1, 1),
(2, N'Tủ lạnh', 'tu-lanh', NULL, N'Tủ lạnh Inverter tiết kiệm điện, Side by Side cao cấp', @ImgUrl, 2, 1),
(3, N'Máy giặt', 'may-giat', NULL, N'Máy giặt cửa ngang, cửa trên đa dạng khối lượng giặt', @ImgUrl, 3, 1),
(4, N'Bình nóng lạnh', 'binh-nong-lanh', NULL, N'Bình nóng lạnh gián tiếp, trực tiếp an toàn chống giật', @ImgUrl, 4, 1),
(5, N'Điều hòa Inverter', 'dieu-hoa-inverter', 1, N'Dòng điều hòa tiết kiệm điện năng vượt trội', @ImgUrl, 5, 1);
SET IDENTITY_INSERT dbo.DanhMuc OFF;

SET IDENTITY_INSERT dbo.ThuongHieu ON;
INSERT INTO dbo.ThuongHieu (ThuongHieuID, TenThuongHieu, Slug, Logo, MoTa, TrangThai) VALUES
(1, N'Daikin', 'daikin', @ImgUrl, N'Thương hiệu điều hòa hàng đầu Nhật Bản', 1),
(2, N'Panasonic', 'panasonic', @ImgUrl, N'Thương hiệu điện tử điện lạnh uy tín Nhật Bản', 1),
(3, N'LG', 'lg', @ImgUrl, N'Tập đoàn điện tử gia dụng hàng đầu Hàn Quốc', 1),
(4, N'Casper', 'casper', @ImgUrl, N'Thương hiệu điện lạnh Thái Lan giá tốt', 1),
(5, N'Samsung', 'samsung', @ImgUrl, N'Công nghệ gia dụng thông minh Hàn Quốc', 1),
(6, N'Ariston', 'ariston', @ImgUrl, N'Chuyên gia bình nước nóng hàng đầu từ Ý', 1);
SET IDENTITY_INSERT dbo.ThuongHieu OFF;

SET IDENTITY_INSERT dbo.SanPham ON;
INSERT INTO dbo.SanPham (SanPhamID, DanhMucID, ThuongHieuID, MaSanPham, TenSanPham, Slug, MoTaNgan, MoTaChiTiet, GiaBan, GiaNiemYet, SoLuongTon, CongSuat, BaoHanhThang, XuatXu, Model, NoiBat, Moi, TrangThai) 
VALUES
(1, 1, 1, 'DH-DK01', N'Điều hòa Daikin Inverter 1 chiều 9000 BTU FTKY25WAVMV', 'dieu-hoa-daikin-ftky25wavmv', N'<ul><li>Công nghệ Inverter tiết kiệm điện</li><li>Phin lọc Enzyme Blue khử mùi</li></ul>', N'<p>Điều hòa Daikin FTKY25WAVMV làm lạnh nhanh, vận hành êm ái, bảo vệ sức khỏe gia đình.</p>', 9350000, 10500000, 25, N'9000 BTU (1 HP)', 24, N'Việt Nam', 'FTKY25WAVMV', 1, 1, 1),
(2, 1, 1, 'DH-DK02', N'Điều hòa Daikin Inverter 1 chiều 12000 BTU FTKY35WAVMV', 'dieu-hoa-daikin-ftky35wavmv', N'<ul><li>Luồng gió Coanda dễ chịu</li><li>Mắt thần thông minh</li></ul>', N'<p>Phù hợp cho phòng từ 15 - 20m2 với khả năng tiết kiệm điện vượt trội.</p>', 11450000, 12900000, 20, N'12000 BTU (1.5 HP)', 24, N'Việt Nam', 'FTKY35WAVMV', 1, 1, 1),
(3, 1, 2, 'DH-PN01', N'Điều hòa Panasonic Inverter 1 chiều 9000 BTU CU/CS-PU9ZKH-8M', 'dieu-hoa-panasonic-pu9zkh-8m', N'<ul><li>Công nghệ Nanoe-G lọc bụi mịn PM2.5</li><li>Chế độ Eco tích hợp AI</li></ul>', N'<p>Thiết kế sang trọng, làm lạnh nhanh Powerful chỉ trong vài phút khởi động.</p>', 9650000, 10800000, 30, N'9000 BTU (1 HP)', 24, N'Malaysia', 'CU/CS-PU9ZKH-8M', 1, 0, 1),
(4, 1, 2, 'DH-PN02', N'Điều hòa Panasonic Inverter 1 chiều 12000 BTU CU/CS-PU12ZKH-8M', 'dieu-hoa-panasonic-pu12zkh-8m', N'<ul><li>Dàn tản nhiệt BlueFin bền bỉ</li><li>Khử ẩm nhẹ bảo vệ da</li></ul>', N'<p>Sản phẩm bán chạy hàng đầu phân khúc điều hòa 12000 BTU cao cấp.</p>', 11800000, 13200000, 18, N'12000 BTU (1.5 HP)', 24, N'Malaysia', 'CU/CS-PU12ZKH-8M', 1, 1, 1),
(5, 1, 4, 'DH-CP01', N'Điều hòa Casper Inverter 1 chiều 9000 BTU TC-09IS35', 'dieu-hoa-casper-tc-09is35', N'<ul><li>Cơ chế tự làm sạch iClean</li><li>Dàn đồng mạ vàng bền bỉ</li></ul>', N'<p>Giải pháp làm mát tiết kiệm chi phí đầu tư và tiền điện hàng tháng.</p>', 5450000, 6500000, 50, N'9000 BTU (1 HP)', 36, N'Thái Lan', 'TC-09IS35', 1, 1, 1),
(6, 1, 4, 'DH-CP02', N'Điều hòa Casper Inverter 1 chiều 12000 BTU GC-12IS35', 'dieu-hoa-casper-gc-12is35', N'<ul><li>Làm lạnh nhanh Turbo trong 30 giây</li><li>Cảm biến nhiệt độ iFeel</li></ul>', N'<p>Nhập khẩu nguyên chiếc Thái Lan, bảo hành máy nén lên tới 12 năm.</p>', 6390000, 7500000, 40, N'12000 BTU (1.5 HP)', 36, N'Thái Lan', 'GC-12IS35', 0, 1, 1),
(7, 1, 3, 'DH-LG01', N'Điều hòa LG Inverter 1 chiều 9000 BTU V10WIN1', 'dieu-hoa-lg-v10win1', N'<ul><li>Máy nén Dual Inverter tiết kiệm 70% điện</li><li>Lọc bụi sơ cấp</li></ul>', N'<p>Vận hành siêu êm, độ bền cao với dàn tản nhiệt mạ vàng Gold Fin.</p>', 6850000, 7900000, 22, N'9000 BTU (1 HP)', 24, N'Thái Lan', 'V10WIN1', 0, 0, 1),
(8, 1, 3, 'DH-LG02', N'Điều hòa LG Inverter 1 chiều 12000 BTU V13WIN1', 'dieu-hoa-lg-v13win1', N'<ul><li>Làm lạnh nhanh Jet Cool</li><li>Chế độ kiểm soát năng lượng chủ động</li></ul>', N'<p>Lựa chọn hoàn hảo cho phòng ngủ và phòng khách diện tích vừa.</p>', 7950000, 9100000, 15, N'12000 BTU (1.5 HP)', 24, N'Thái Lan', 'V13WIN1', 0, 0, 1),
(9, 1, 1, 'DH-DK03', N'Điều hòa Daikin Inverter 2 chiều 9000 BTU FTHF25VAVMV', 'dieu-hoa-daikin-fthf25vavmv', N'<ul><li>Vừa làm lạnh mùa hè, vừa sưởi ấm mùa đông</li><li>Chống ẩm mốc</li></ul>', N'<p>Rất phù hợp với khí hậu miền Bắc Việt Nam có mùa đông lạnh.</p>', 10650000, 11900000, 12, N'9000 BTU (1 HP)', 24, N'Việt Nam', 'FTHF25VAVMV', 0, 0, 1),
(10, 1, 2, 'DH-PN03', N'Điều hòa Panasonic Inverter 2 chiều 12000 BTU CU/CS-YZ12WKH-8', 'dieu-hoa-panasonic-yz12wkh-8', N'<ul><li>2 chiều lạnh sưởi tiện lợi</li><li>Kết nối Wifi thông minh</li></ul>', N'<p>Điều khiển dễ dàng qua điện thoại, duy trì nhiệt độ ổn định suốt đêm.</p>', 13900000, 15200000, 10, N'12000 BTU (1.5 HP)', 24, N'Malaysia', 'CU/CS-YZ12WKH-8', 0, 0, 1),
(11, 1, 4, 'DH-CP03', N'Điều hòa Casper Inverter 1 chiều 18000 BTU GC-18IS35', 'dieu-hoa-casper-gc-18is35', N'<ul><li>Công suất lớn cho phòng 20-30m2</li><li>Môi chất lạnh R32 thân thiện</li></ul>', N'<p>Lưu lượng gió mạnh mẽ, làm mát đều khắp không gian phòng khách lớn.</p>', 9450000, 10900000, 16, N'18000 BTU (2 HP)', 36, N'Thái Lan', 'GC-18IS35', 0, 0, 1),
(12, 1, 5, 'DH-SS01', N'Điều hòa Samsung Inverter 1 chiều 9000 BTU AR10CYHAAWKNSV', 'dieu-hoa-samsung-ar10cyhaawknsv', N'<ul><li>Công nghệ làm lạnh WindFree không gió buốt</li><li>Tiết kiệm điện 73%</li></ul>', N'<p>Hàng chục ngàn lỗ nhỏ khuếch tán khí lạnh dịu nhẹ, bảo vệ giấc ngủ.</p>', 7150000, 8200000, 28, N'9000 BTU (1 HP)', 24, N'Thái Lan', 'AR10CYHAAWKNSV', 0, 1, 1),
(13, 1, 1, 'DH-DK04', N'Điều hòa Daikin Inverter 1 chiều 18000 BTU FTKY50WAVMV', 'dieu-hoa-daikin-ftky50wavmv', N'<ul><li>Luồng gió 3D đảo gió tự động</li><li>Lọc khí Streamer độc quyền</li></ul>', N'<p>Dòng máy công suất lớn cao cấp nhất của Daikin dành cho phòng khách.</p>', 18200000, 19900000, 8, N'18000 BTU (2 HP)', 24, N'Thái Lan', 'FTKY50WAVMV', 0, 0, 1),
(14, 1, 3, 'DH-LG03', N'Điều hòa LG Inverter 1 chiều 24000 BTU V24WIN1', 'dieu-hoa-lg-v24win1', N'<ul><li>Công suất 2.5 HP mạnh mẽ</li><li>Tự động làm sạch dàn lạnh</li></ul>', N'<p>Thích hợp lắp đặt cho văn phòng, cửa hàng hoặc phòng khách 30-40m2.</p>', 14500000, 16200000, 9, N'24000 BTU (2.5 HP)', 24, N'Thái Lan', 'V24WIN1', 0, 0, 1),

(15, 2, 2, 'TL-PN01', N'Tủ lạnh Panasonic Inverter 255 lít NR-BV280QSVN ngăn đá dưới', 'tu-lanh-panasonic-nr-bv280qsvn', N'<ul><li>Ngăn đông mềm chuẩn -3 độ C Prime Fresh+</li><li>Cảm biến Econavi</li></ul>', N'<p>Chế biến thực phẩm tươi sống ngay mà không cần rã đông, giữ trọn dinh dưỡng.</p>', 8450000, 9600000, 15, N'255 Lít', 24, N'Việt Nam', 'NR-BV280QSVN', 1, 1, 1),
(16, 2, 5, 'TL-SS01', N'Tủ lạnh Samsung Inverter 236 lít RT22M4032BY/SV', 'tu-lanh-samsung-rt22m4032by', N'<ul><li>Ngăn đông mềm Optimal Fresh Zone</li><li>Làm lạnh vòm All-around Cooling</li></ul>', N'<p>Thiết kế giả gương màu nâu thời thượng, vận hành bền bỉ êm ái.</p>', 5890000, 6900000, 25, N'236 Lít', 24, N'Thái Lan', 'RT22M4032BY/SV', 1, 0, 1),
(17, 2, 3, 'TL-LG01', N'Tủ lạnh LG Inverter Side by Side 519 lít GR-B256JDS', 'tu-lanh-lg-gr-b256jds', N'<ul><li>Thiết kế 2 cánh lớn sang trọng</li><li>Linear Inverter tiết kiệm điện</li></ul>', N'<p>Dung tích cực lớn 519 lít đáp ứng nhu cầu lưu trữ thực phẩm cho cả tuần.</p>', 12490000, 14900000, 10, N'519 Lít', 24, N'Trung Quốc', 'GR-B256JDS', 1, 1, 1),
(18, 2, 4, 'TL-CP01', N'Tủ lạnh Casper Inverter 458 lít Side by Side RS-460PG', 'tu-lanh-casper-rs-460pg', N'<ul><li>2 dàn lạnh độc lập</li><li>Làm đông nhanh Super Freeze</li></ul>', N'<p>Tủ lạnh Side by Side giá tốt nhất phân khúc với đầy đủ tính năng cao cấp.</p>', 9950000, 11800000, 14, N'458 Lít', 24, N'Thái Lan', 'RS-460PG', 0, 1, 1),
(19, 2, 2, 'TL-PN02', N'Tủ lạnh Panasonic Inverter 325 lít NR-BC360QKVN', 'tu-lanh-panasonic-nr-bc360qkvn', N'<ul><li>Kháng khuẩn Ag Clean tinh thể bạc</li><li>Khay kính chịu lực 150kg</li></ul>', N'<p>Ngăn mát ngang tầm mắt tiện lợi lấy thực phẩm mà không cần cúi lưng.</p>', 10800000, 12100000, 12, N'325 Lít', 24, N'Việt Nam', 'NR-BC360QKVN', 0, 0, 1),
(20, 2, 5, 'TL-SS02', N'Tủ lạnh Samsung Inverter 382 lít RT38CG6584B1SV', 'tu-lanh-samsung-rt38cg6584b1sv', N'<ul><li>Viền siêu mỏng SpaceMax tăng dung tích</li><li>Làm đá tự động</li></ul>', N'<p>Mở rộng không gian lưu trữ bên trong mà không làm tăng kích thước bên ngoài.</p>', 10250000, 11500000, 18, N'382 Lít', 24, N'Thái Lan', 'RT38CG6584B1SV', 0, 0, 1),
(21, 2, 3, 'TL-LG02', N'Tủ lạnh LG Inverter 315 lít GN-M312PS', 'tu-lanh-lg-gn-m312ps', N'<ul><li>Làm lạnh từ cánh tủ DoorCooling+</li><li>Khử mùi Nano Carbon</li></ul>', N'<p>Làm lạnh nhanh và đều hơn tới các khay chứa nước ở cánh cửa tủ.</p>', 7490000, 8600000, 20, N'315 Lít', 24, N'Indonesia', 'GN-M312PS', 0, 0, 1),
(22, 2, 4, 'TL-CP02', N'Tủ lạnh Casper Inverter 258 lít RT-270VD', 'tu-lanh-casper-rt-270vd', N'<ul><li>Ngăn chuyển đổi nhiệt độ linh hoạt</li><li>Vận hành êm ái</li></ul>', N'<p>Kiểu dáng nhỏ gọn, tiết kiệm điện năng cho gia đình từ 2 - 4 thành viên.</p>', 4990000, 5800000, 30, N'258 Lít', 24, N'Thái Lan', 'RT-270VD', 0, 0, 1),

(23, 3, 3, 'MG-LG01', N'Máy giặt LG AI DD Inverter 9 kg FV1409S4W cửa ngang', 'may-giat-lg-fv1409s4w', N'<ul><li>Động cơ truyền động trực tiếp êm ái</li><li>Giặt hơi nước Steam diệt khuẩn 99.9%</li></ul>', N'<p>Trí tuệ nhân tạo AI DD tự động cảm biến chất liệu vải để bảo vệ quần áo tốt hơn 18%.</p>', 7890000, 9200000, 20, N'9 Kg', 24, N'Việt Nam', 'FV1409S4W', 1, 1, 1),
(24, 3, 5, 'MG-SS01', N'Máy giặt Samsung Inverter 9.5 kg WW95TA046AX/SV bong bóng siêu mịn', 'may-giat-samsung-ww95ta046ax', N'<ul><li>Công nghệ EcoBubble đánh bay vết bẩn</li><li>Giặt hơi nước Hygiene Steam</li></ul>', N'<p>Hòa tan bột giặt thành bong bóng siêu mịn thẩm thấu nhanh gấp 40 lần.</p>', 7350000, 8900000, 16, N'9.5 Kg', 24, N'Việt Nam', 'WW95TA046AX/SV', 1, 0, 1),
(25, 3, 2, 'MG-PN01', N'Máy giặt Panasonic Inverter 10.5 kg NA-FD10AR1BV cửa trên', 'may-giat-panasonic-na-fd10ar1bv', N'<ul><li>Xoáy nước siêu mạnh Water Bazooka</li><li>Tạo bọt siêu mịn ActiveFoam</li></ul>', N'<p>Lồng giặt lớn, bảng điều khiển phía sau dễ quan sát và thao tác lấy đồ.</p>', 7650000, 8800000, 14, N'10.5 Kg', 24, N'Việt Nam', 'NA-FD10AR1BV', 0, 1, 1),
(26, 3, 4, 'MG-CP01', N'Máy giặt Casper Inverter 9.5 kg WF-95I140BGB lồng ngang', 'may-giat-casper-wf-95i140bgb', N'<ul><li>Động cơ BLDC không chổi than</li><li>Giặt nước nóng 60 độ C</li></ul>', N'<p>Mức giá cực kỳ hợp lý cho một chiếc máy giặt lồng ngang Inverter đầy đủ tính năng.</p>', 5290000, 6500000, 25, N'9.5 Kg', 24, N'Thái Lan', 'WF-95I140BGB', 0, 1, 1),
(27, 3, 3, 'MG-LG02', N'Máy giặt LG TurboDrum Inverter 11.5 kg T2551VSAB', 'may-giat-lg-t2551vsab', N'<ul><li>Công nghệ đấm nước Punch+3</li><li>Khối lượng giặt lớn 11.5 kg</li></ul>', N'<p>Giặt sạch chăn mền và lượng quần áo lớn của gia đình đông người.</p>', 6450000, 7500000, 18, N'11.5 Kg', 24, N'Việt Nam', 'T2551VSAB', 0, 0, 1),
(28, 3, 5, 'MG-SS02', N'Máy giặt Samsung AI Inverter 10 kg WW10T634DLX/SV ngăn nước giặt tự động', 'may-giat-samsung-ww10t634dlx', N'<ul><li>Ngăn AI Dispenser tự phân bổ nước giặt</li><li>Bảng điều khiển thông minh AI Control</li></ul>', N'<p>Chỉ cần đổ đầy nước giặt 1 lần, máy tự động cân chỉnh cho cả tháng sử dụng.</p>', 8950000, 10500000, 12, N'10 Kg', 24, N'Việt Nam', 'WW10T634DLX/SV', 0, 0, 1),
(29, 3, 2, 'MG-PN02', N'Máy giặt Panasonic Inverter 9 kg NA-V90FX2BVT cửa ngang', 'may-giat-panasonic-na-v90fx2bvt', N'<ul><li>Diệt khuẩn bằng tia UV và tinh thể bạc Blue Ag+</li><li>Cảm biến 3Di Inverter</li></ul>', N'<p>Diệt khuẩn hiệu quả ngay cả khi giặt bằng nước lạnh, giữ quần áo bền màu.</p>', 9400000, 10800000, 10, N'9 Kg', 24, N'Việt Nam', 'NA-V90FX2BVT', 0, 0, 1),
(30, 3, 4, 'MG-CP02', N'Máy giặt Casper 8.5 kg WT-85NG1 cửa trên giá rẻ', 'may-giat-casper-wt-85ng1', N'<ul><li>Lồng giặt tinh thể pha lê</li><li>Tự động vệ sinh lồng giặt</li></ul>', N'<p>Bền bỉ, dễ sử dụng, tiết kiệm nước với suy luận ảo Fuzzy Logic.</p>', 3590000, 4300000, 35, N'8.5 Kg', 24, N'Thái Lan', 'WT-85NG1', 0, 0, 1),

(31, 4, 6, 'BNL-AR01', N'Bình nóng lạnh Ariston 20 lít Slim2 20RS gián tiếp', 'binh-nong-lanh-ariston-slim2-20rs', N'<ul><li>Thanh đốt 100% đồng bền bỉ</li><li>Cầu dao chống giật ELCB an toàn tuyệt đối</li></ul>', N'<p>Thiết kế ngang Slim gọn gàng, phù hợp cho trần phòng tắm thấp tại chung cư.</p>', 2850000, 3350000, 40, N'20 Lít - 2500W', 84, N'Việt Nam', 'Slim2 20RS', 1, 1, 1),
(32, 4, 6, 'BNL-AR02', N'Bình nóng lạnh Ariston 30 lít Andris2 30RS vuông', 'binh-nong-lanh-ariston-andris2-30rs', N'<ul><li>Lòng bình tráng men Titan siêu bền</li><li>Đèn báo nước nóng sẵn sàng</li></ul>', N'<p>Dung tích 30 lít đáp ứng thoải mái cho gia đình từ 3 - 5 thành viên.</p>', 3150000, 3700000, 35, N'30 Lít - 2500W', 84, N'Việt Nam', 'Andris2 30RS', 1, 0, 1),
(33, 4, 2, 'BNL-PN01', N'Bình nóng lạnh Panasonic 20 lít DH-20HBMVW', 'binh-nong-lanh-panasonic-dh-20hbmvw', N'<ul><li>Ruột bình bằng thép không gỉ Nhật Bản</li><li>Không cần bảo trì cực dương</li></ul>', N'<p>Chống ăn mòn vượt trội, cách nhiệt bằng xốp Styrofoam giữ nhiệt lâu.</p>', 3450000, 3950000, 20, N'20 Lít - 2500W', 24, N'Malaysia', 'DH-20HBMVW', 0, 1, 1),
(34, 4, 4, 'BNL-CP01', N'Bình nóng lạnh Casper 20 lít EH-20TH11 gián tiếp', 'binh-nong-lanh-casper-eh-20th11', N'<ul><li>Cảm biến nhiệt tự ngắt chính xác</li><li>Lớp cách nhiệt mật độ cao</li></ul>', N'<p>Làm nóng nhanh, giữ nhiệt lên đến 48 giờ giúp tiết kiệm điện tối đa.</p>', 1790000, 2200000, 50, N'20 Lít - 2500W', 24, N'Thái Lan', 'EH-20TH11', 0, 1, 1),
(35, 4, 6, 'BNL-AR03', N'Bình nóng lạnh Ariston 15 lít Andris2 15RS nhỏ gọn', 'binh-nong-lanh-ariston-andris2-15rs', N'<ul><li>Làm nóng siêu tốc cho 1-2 người dùng</li><li>Vi mạch kiểm soát an toàn</li></ul>', N'<p>Giải pháp tiết kiệm diện tích và điện năng cho phòng tắm nhỏ hoặc nhà trọ cao cấp.</p>', 2590000, 3050000, 30, N'15 Lít - 2500W', 84, N'Việt Nam', 'Andris2 15RS', 0, 0, 1),
(36, 4, 4, 'BNL-CP02', N'Bình nóng lạnh Casper 30 lít EH-30TH11 ngang', 'binh-nong-lanh-casper-eh-30th11', N'<ul><li>Thanh đốt hiệu suất cao</li><li>Chống rò điện kép</li></ul>', N'<p>Thiết kế hiện đại kèm màn hình hiển thị nhiệt độ nước trực quan.</p>', 2090000, 2550000, 28, N'30 Lít - 2500W', 24, N'Thái Lan', 'EH-30TH11', 0, 0, 1),
(37, 4, 2, 'BNL-PN02', N'Bình nóng lạnh Panasonic 30 lít DH-30HBMVW cao cấp', 'binh-nong-lanh-panasonic-dh-30hbmvw', N'<ul><li>Tiêu chuẩn chống nước IPX4</li><li>An toàn tuyệt đối với ELB tích hợp</li></ul>', N'<p>Độ bền chuẩn Nhật Bản, thiết kế mỏng tinh tế tô điểm không gian phòng tắm.</p>', 3890000, 4400000, 15, N'30 Lít - 2500W', 24, N'Malaysia', 'DH-30HBMVW', 0, 0, 1),
(38, 4, 6, 'BNL-AR04', N'Bình nóng lạnh trực tiếp Ariston Aures Premium 4.5P kèm vòi sen', 'binh-nong-lanh-ariston-aures-premium-45p', N'<ul><li>Làm nóng tức thì không cần chờ đợi</li><li>Tích hợp bơm trợ lực siêu êm</li></ul>', N'<p>Có sẵn vòi sen 5 chế độ phun massage, phù hợp nơi áp lực nước yếu.</p>', 3290000, 3800000, 22, N'4500W (Trực tiếp)', 24, N'Việt Nam', 'Aures Premium 4.5P', 0, 0, 1);
SET IDENTITY_INSERT dbo.SanPham OFF;

INSERT INTO dbo.HinhAnhSanPham (SanPhamID, DuongDanAnh, MoTaAnh, LaAnhChinh, ThuTu)
SELECT SanPhamID, @ImgUrl, TenSanPham + N' - Ảnh chính', 1, 1 
FROM dbo.SanPham;

INSERT INTO dbo.HinhAnhSanPham (SanPhamID, DuongDanAnh, MoTaAnh, LaAnhChinh, ThuTu)
SELECT SanPhamID, @ImgUrl, TenSanPham + N' - Góc nghiêng', 0, 2 
FROM dbo.SanPham;

INSERT INTO dbo.HinhAnhSanPham (SanPhamID, DuongDanAnh, MoTaAnh, LaAnhChinh, ThuTu)
SELECT SanPhamID, @ImgUrl, TenSanPham + N' - Thực tế lắp đặt', 0, 3 
FROM dbo.SanPham;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Công nghệ tiết kiệm điện', N'Inverter thông minh', N'', N'Tổng quan', 1 FROM dbo.SanPham;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Tiêu thụ điện trung bình', N'0.75', N'kW/h', N'Năng lượng', 2 FROM dbo.SanPham;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Độ ồn tối đa', N'28', N'dB', N'Vận hành', 3 FROM dbo.SanPham;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Chất liệu dàn tản nhiệt', N'Ống đồng - Lá nhôm phủ BlueFin', N'', N'Thiết kế', 4 FROM dbo.SanPham;

SET IDENTITY_INSERT dbo.NguoiDung ON;
INSERT INTO dbo.NguoiDung (NguoiDungID, HoTen, Email, SoDienThoai, MatKhauHash, VaiTro, TrangThai) VALUES
(1, N'Quản Trị Viên Huy Sơn', 'admin@dienlanhhuyson.vn', '0918925288', '123456', 'Admin', 1),
(2, N'Nguyễn Minh Anh', 'minhanh@example.com', '0987654321', '123456', 'Customer', 1),
(3, N'Trần Quốc Tuấn', 'staff@dienlanhhuyson.vn', '0912345678', '123456', 'Staff', 1),
(4, N'Lê Thị Hương', 'lehuong@example.com', '0934567890', '123456', 'Customer', 1),
(5, N'Phạm Hoàng Nam', 'hoangnam@example.com', '0978123456', '123456', 'Customer', 1);
SET IDENTITY_INSERT dbo.NguoiDung OFF;

INSERT INTO dbo.DiaChiNguoiDung (NguoiDungID, NguoiNhan, SoDienThoai, TinhThanh, QuanHuyen, PhuongXa, DiaChiChiTiet, MacDinh) VALUES
(1, N'Quản Trị Viên Huy Sơn', '0918925288', N'Hà Nội', N'Cầu Giấy', N'Dịch Vọng', N'Số 120 đường Cầu Giấy', 1),
(2, N'Nguyễn Minh Anh', '0987654321', N'Hà Nội', N'Đống Đa', N'Láng Hạ', N'Số 45 ngõ 12 Láng Hạ', 1),
(3, N'Trần Quốc Tuấn', '0912345678', N'Hà Nội', N'Thanh Xuân', N'Nhân Chính', N'Tòa nhà Imperia Garden, 203 Nguyễn Huy Tưởng', 1),
(4, N'Lê Thị Hương', '0934567890', N'Nam Định', N'Ý Yên', N'Yên Chính', N'Thôn Minh Sơn, xã Yên Chính', 1),
(5, N'Phạm Hoàng Nam', '0978123456', N'TP. Hồ Chí Minh', N'Quận 7', N'Tân Phong', N'Số 88 Nguyễn Thị Thập', 1);

SET IDENTITY_INSERT dbo.GioHang ON;
INSERT INTO dbo.GioHang (GioHangID, NguoiDungID) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);
SET IDENTITY_INSERT dbo.GioHang OFF;


INSERT INTO dbo.ChiTietGioHang (GioHangID, SanPhamID, SoLuong) VALUES
(1, 1, 1),
(2, 2, 1),
(2, 15, 1),
(3, 23, 2),
(4, 31, 1);


SET IDENTITY_INSERT dbo.KhuyenMai ON;
INSERT INTO dbo.KhuyenMai (KhuyenMaiID, MaKhuyenMai, TenKhuyenMai, LoaiGiamGia, GiaTriGiam, DonHangToiThieu, GiamToiDa, NgayBatDau, NgayKetThuc, SoLuongSuDung, TrangThai) VALUES
(1, 'WELCOME5', N'Giảm 5% cho khách hàng mới', 'Percent', 5, 3000000, 500000, '2026-01-01', '2026-12-31', 100, 1),
(2, 'HUYSON200K', N'Giảm trực tiếp 200.000đ đơn từ 5 triệu', 'Amount', 200000, 5000000, 200000, '2026-01-01', '2026-12-31', 50, 1),
(3, 'MUAHE500K', N'Ưu đãi mùa hè giảm 500.000đ cho điều hòa', 'Amount', 500000, 10000000, 500000, '2026-01-01', '2026-12-31', 30, 1),
(4, 'FREESHIP100', N'Hỗ trợ 100.000đ chi phí vật tư lắp đặt', 'Amount', 100000, 2000000, 100000, '2026-01-01', '2026-12-31', 200, 1),
(5, 'VIP10', N'Giảm 10% tối đa 1 triệu cho đơn hàng lớn', 'Percent', 10, 15000000, 1000000, '2026-01-01', '2026-12-31', 20, 1);
SET IDENTITY_INSERT dbo.KhuyenMai OFF;


SET IDENTITY_INSERT dbo.DonHang ON;
INSERT INTO dbo.DonHang (DonHangID, MaDonHang, NguoiDungID, KhuyenMaiID, TenNguoiNhan, SoDienThoaiNhan, EmailNhan, DiaChiNhan, TongTienHang, TienGiamGia, PhiVanChuyen, TongThanhToan, PhuongThucThanhToan, TrangThaiDonHang, TrangThaiThanhToan, GhiChu, NgayDat) VALUES
(1, 'DH2610010830', 2, 2, N'Nguyễn Minh Anh', '0987654321', 'minhanh@example.com', N'Số 45 ngõ 12 Láng Hạ, Đống Đa, Hà Nội', 9350000, 200000, 0, 9150000, 'COD', 'Completed', 'Paid', N'Giao giờ hành chính', DATEADD(DAY, -5, SYSDATETIME())),
(2, 'DH2610020915', 3, NULL, N'Trần Quốc Tuấn', '0912345678', 'quoctuan@example.com', N'203 Nguyễn Huy Tưởng, Thanh Xuân, Hà Nội', 8450000, 0, 0, 8450000, 'VNPAY', 'Shipping', 'Paid', N'Gọi trước khi giao 30 phút', DATEADD(DAY, -3, SYSDATETIME())),
(3, 'DH2610031420', 4, NULL, N'Lê Thị Hương', '0934567890', 'lehuong@example.com', N'Thôn Minh Sơn, Ý Yên, Nam Định', 7890000, 0, 0, 7890000, 'COD', 'Confirmed', 'Unpaid', N'Lắp đặt trọn gói', DATEADD(DAY, -2, SYSDATETIME())),
(4, 'DH2610041645', 5, 4, N'Phạm Hoàng Nam', '0978123456', 'hoangnam@example.com', N'Số 88 Nguyễn Thị Thập, Quận 7, TP.HCM', 2850000, 100000, 0, 2750000, 'VNPAY', 'Pending', 'Paid', N'Mang theo thang lắp bình nóng lạnh', DATEADD(DAY, -1, SYSDATETIME())),
(5, 'DH2610051010', 2, NULL, N'Nguyễn Minh Anh', '0987654321', 'minhanh@example.com', N'Số 45 ngõ 12 Láng Hạ, Đống Đa, Hà Nội', 5450000, 0, 0, 5450000, 'COD', 'Pending', 'Unpaid', N'Lắp ở phòng ngủ tầng 2', SYSDATETIME());
SET IDENTITY_INSERT dbo.DonHang OFF;


INSERT INTO dbo.ChiTietDonHang (DonHangID, SanPhamID, TenSanPham, MaSanPham, DonGia, SoLuong, ThanhTien) VALUES
(1, 1, N'Điều hòa Daikin Inverter 1 chiều 9000 BTU FTKY25WAVMV', 'DH-DK01', 9350000, 1, 9350000),
(2, 15, N'Tủ lạnh Panasonic Inverter 255 lít NR-BV280QSVN ngăn đá dưới', 'TL-PN01', 8450000, 1, 8450000),
(3, 23, N'Máy giặt LG AI DD Inverter 9 kg FV1409S4W cửa ngang', 'MG-LG01', 7890000, 1, 7890000),
(4, 31, N'Bình nóng lạnh Ariston 20 lít Slim2 20RS gián tiếp', 'BNL-AR01', 2850000, 1, 2850000),
(5, 5, N'Điều hòa Casper Inverter 1 chiều 9000 BTU TC-09IS35', 'DH-CP01', 5450000, 1, 5450000);


INSERT INTO dbo.GiaoDichThanhToan (DonHangID, MaGiaoDich, CongThanhToan, NganHang, SoTien, NoiDung, TrangThai) VALUES
(1, 'COD-0001', 'COD', NULL, 9150000, N'Thu tiền mặt khi bàn giao lắp đặt', 'Success'),
(2, 'VNP14253689', 'VNPAY', 'MB', 8450000, N'THANH TOAN DH2610020915', 'Success'),
(3, 'COD-0003', 'COD', NULL, 7890000, N'Chờ thu tiền mặt COD', 'Pending'),
(4, 'VNP14259912', 'VNPAY', 'VCB', 2750000, N'THANH TOAN DH2610041645', 'Success'),
(5, 'COD-0005', 'COD', NULL, 5450000, N'Chờ thu tiền mặt COD', 'Pending');


INSERT INTO dbo.LichSuDonHang (DonHangID, TrangThaiCu, TrangThaiMoi, GhiChu, NguoiThucHienID) VALUES
(1, 'Shipping', 'Completed', N'Kỹ thuật viên đã lắp đặt và nghiệm thu hoàn tất', 1),
(2, 'Confirmed', 'Shipping', N'Đang vận chuyển từ kho Cầu Giấy đến khách hàng', 1),
(3, 'Pending', 'Confirmed', N'Đã gọi điện xác nhận lịch lắp đặt với khách', 1),
(4, NULL, 'Pending', N'Khách đặt hàng và thanh toán QR thành công', 5),
(5, NULL, 'Pending', N'Khách hàng tạo đơn mới trên website', 2);


INSERT INTO dbo.Banner (TieuDe, HinhAnh, LienKet, ViTri, ThuTu, TrangThai) VALUES
(N'Siêu khuyến mãi Điều hòa chính hãng - Giá gốc tại kho', @ImgUrl, '/Product/AirConditioner', 'HomeMain', 1, 1),
(N'Tủ lạnh Side by Side Inverter - Giảm tới 3 triệu đồng', @ImgUrl, '/Product/Refrigerator', 'HomeMain', 2, 1),
(N'Máy giặt cửa ngang AI thông minh - Giao lắp miễn phí trong ngày', @ImgUrl, '/Product/WashingMachine', 'HomeMain', 3, 1),
(N'Bình nóng lạnh Ariston & Casper - Bảo hành chính hãng 7 năm', @ImgUrl, '/Product/WaterHeater', 'HomeMain', 4, 1),
(N'Tổng kho Điện Lạnh Huy Sơn - Cam kết chính hãng 100%', @ImgUrl, '/Home', 'HomeMain', 5, 1);


SET IDENTITY_INSERT dbo.DanhMucBaiViet ON;
INSERT INTO dbo.DanhMucBaiViet (DanhMucBaiVietID, TenDanhMuc, Slug, MoTa, TrangThai) VALUES
(1, N'Tư vấn chọn mua', 'tu-van-chon-mua', N'Kinh nghiệm chọn mua điều hòa, tủ lạnh phù hợp diện tích', 1),
(2, N'Mẹo sử dụng tiết kiệm điện', 'meo-tiet-kiem-dien', N'Hướng dẫn sử dụng thiết bị điện lạnh bền bỉ, ít tốn điện', 1),
(3, N'Hướng dẫn kỹ thuật & Lắp đặt', 'huong-dan-ky-thuat', N'Tiêu chuẩn vật tư và quy trình lắp đặt chuẩn hãng', 1),
(4, N'Tin tức khuyến mãi', 'tin-tuc-khuyen-mai', N'Cập nhật các chương trình ưu đãi mới nhất tại Huy Sơn', 1),
(5, N'Chính sách & Bảo hành', 'chinh-sach-bao-hanh', N'Thông tin bảo hành chính hãng Daikin, Panasonic, LG, Casper', 1);
SET IDENTITY_INSERT dbo.DanhMucBaiViet OFF;


INSERT INTO dbo.BaiViet (DanhMucBaiVietID, TieuDe, Slug, TomTat, NoiDung, AnhDaiDien, NguoiTaoID, NgayDang, TrangThai) VALUES
(1, N'Cách chọn công suất điều hòa chuẩn xác theo diện tích phòng', 'cach-chon-cong-suat-dieu-hoa-theo-dien-tich', N'Hướng dẫn tính BTU điều hòa cho phòng ngủ, phòng khách giúp làm mát nhanh và tiết kiệm điện.', N'<p>Phòng dưới 15m2 nên chọn máy 9000 BTU, từ 15-20m2 chọn 12000 BTU, từ 20-30m2 chọn 18000 BTU...</p>', @ImgUrl, 1, SYSDATETIME(), 'Published'),
(2, N'Bí quyết bật điều hòa 26-27 độ C kết hợp quạt gió siêu tiết kiệm điện', 'bi-quyet-bat-dieu-hoa-tiet-kiem-dien', N'Không cần hạ nhiệt độ xuống 18 độ C, cách dùng này giúp giảm tới 40% hóa đơn tiền điện mỗi tháng.', N'<p>Kết hợp quạt trần hoặc quạt cây giúp luân chuyển khí lạnh đều khắp phòng nhanh chóng...</p>', @ImgUrl, 1, SYSDATETIME(), 'Published'),
(3, N'Bảng giá vật tư và nhân công lắp đặt điều hòa chuẩn tại Điện Lạnh Huy Sơn', 'bang-gia-vat-tu-lap-dat-dieu-hoa', N'Cam kết sử dụng ống đồng chuẩn độ dày, bảo ôn chống cháy và báo giá minh bạch trước khi lắp.', N'<p>Chi tiết đơn giá ống đồng Thái Lan, dây điện Trần Phú, giá đỡ cục nóng sơn tĩnh điện...</p>', @ImgUrl, 1, SYSDATETIME(), 'Published'),
(1, N'Nên mua máy giặt cửa ngang hay cửa trên cho gia đình 4-6 người?', 'nen-mua-may-giat-cua-ngang-hay-cua-tren', N'So sánh ưu nhược điểm về độ êm, khả năng tiết kiệm nước và bảo vệ sợi vải của 2 dòng máy giặt.', N'<p>Máy giặt cửa ngang Inverter tiết kiệm nước gấp 3 lần và giảm xoắn rối quần áo vượt trội...</p>', @ImgUrl, 1, SYSDATETIME(), 'Published'),
(2, N'Bao lâu nên vệ sinh bảo dưỡng điều hòa và xả cặn bình nóng lạnh 1 lần?', 'bao-lau-nen-ve-sinh-bao-duong-dieu-hoa', N'Vệ sinh lưới lọc định kỳ 3-6 tháng/lần giúp máy lạnh sâu hơn và ngăn ngừa vi khuẩn nấm mốc.', N'<p>Hướng dẫn tự tháo lưới lọc bụi điều hòa rửa sạch tại nhà chỉ trong 10 phút...</p>', @ImgUrl, 1, SYSDATETIME(), 'Published');
GO