USE DienLanhHuySon;
GO

SET IDENTITY_INSERT dbo.SanPham ON;


INSERT INTO dbo.SanPham (SanPhamID, DanhMucID, ThuongHieuID, MaSanPham, TenSanPham, Slug, MoTaNgan, MoTaChiTiet, GiaBan, GiaNiemYet, SoLuongTon, CongSuat, BaoHanhThang, XuatXu, Model, NoiBat, Moi, TrangThai) VALUES
(39, 1, 1, 'DH-DK05', N'Điều hòa Daikin Inverter 1 chiều 9000 BTU FTKF25XVMV', 'dieu-hoa-daikin-ftkf25xvmv', N'<ul><li>Inverter tiết kiệm điện</li><li>Phin lọc Enzyme Blue + PM2.5</li></ul>', N'<p>Làm lạnh nhanh, vận hành siêu êm ái, lọc sạch không khí.</p>', 8990000, 10200000, 30, N'9000 BTU (1 HP)', 24, N'Việt Nam', 'FTKF25XVMV', 1, 1, 1),
(40, 1, 1, 'DH-DK06', N'Điều hòa Daikin Inverter 1 chiều 12000 BTU FTKF35XVMV', 'dieu-hoa-daikin-ftkf35xvmv', N'<ul><li>Công nghệ Streamer diệt khuẩn</li><li>Luồng gió Coanda</li></ul>', N'<p>Thiết kế sang trọng, tiết kiệm điện năng vượt trội cho phòng 15-20m2.</p>', 11190000, 12600000, 25, N'12000 BTU (1.5 HP)', 24, N'Việt Nam', 'FTKF35XVMV', 0, 1, 1),
(41, 1, 1, 'DH-DK07', N'Điều hòa Daikin 1 chiều 9000 BTU ATF25UV1V', 'dieu-hoa-daikin-atf25uv1v', N'<ul><li>Dàn tản nhiệt microchannel</li><li>Phủ nhựa acrylic chống ăn mòn</li></ul>', N'<p>Dòng tiêu chuẩn độ bền cao, giá thành cực kỳ hấp dẫn.</p>', 6990000, 7800000, 40, N'9000 BTU (1 HP)', 24, N'Việt Nam', 'ATF25UV1V', 0, 0, 1),
(42, 1, 1, 'DH-DK08', N'Điều hòa Daikin Inverter 2 chiều 12000 BTU FTHF35VAVMV', 'dieu-hoa-daikin-fthf35vavmv', N'<ul><li>Làm lạnh và sưởi ấm 2 chiều</li><li>Mắt thần thông minh</li></ul>', N'<p>Giải pháp nhiệt độ hoàn hảo cho cả mùa hè và mùa đông.</p>', 12890000, 14200000, 15, N'12000 BTU (1.5 HP)', 24, N'Việt Nam', 'FTHF35VAVMV', 1, 0, 1),
(43, 1, 2, 'DH-PN04', N'Điều hòa Panasonic Inverter 1 chiều 9000 BTU CU/CS-XU9ZKH-8', 'dieu-hoa-panasonic-xu9zkh-8', N'<ul><li>Nanoe-X thế hệ 3 diệt khuẩn 99.9%</li><li>Tích hợp Wifi kết nối smartphone</li></ul>', N'<p>Dòng điều hòa cao cấp nhất của Panasonic lọc không khí 24/7.</p>', 11590000, 12900000, 20, N'9000 BTU (1 HP)', 24, N'Malaysia', 'CU/CS-XU9ZKH-8', 1, 1, 1),
(44, 1, 2, 'DH-PN05', N'Điều hòa Panasonic Inverter 1 chiều 12000 BTU CU/CS-XU12ZKH-8', 'dieu-hoa-panasonic-xu12zkh-8', N'<ul><li>Cánh đảo gió Aerowings cải tiến</li><li>Tiết kiệm điện Eco AI</li></ul>', N'<p>Làm lạnh cực nhanh và duy trì độ ẩm tối ưu cho làn da.</p>', 13890000, 15300000, 18, N'12000 BTU (1.5 HP)', 24, N'Malaysia', 'CU/CS-XU12ZKH-8', 0, 1, 1),
(45, 1, 2, 'DH-PN06', N'Điều hòa Panasonic Inverter 1 chiều 18000 BTU CU/CS-PU18AKH-8', 'dieu-hoa-panasonic-pu18akh-8', N'<ul><li>Công suất lớn 2 HP</li><li>Dàn tản nhiệt BlueFin siêu bền</li></ul>', N'<p>Phù hợp cho phòng khách rộng từ 20 đến 30 mét vuông.</p>', 17490000, 19200000, 12, N'18000 BTU (2 HP)', 24, N'Malaysia', 'CU/CS-PU18AKH-8', 0, 0, 1),
(46, 1, 3, 'DH-LG04', N'Điều hòa LG Inverter 1 chiều 9000 BTU V10API1', 'dieu-hoa-lg-v10api1', N'<ul><li>Bộ phát ion Plasmaster diệt khuẩn</li><li>Điều khiển bằng giọng nói qua Wifi</li></ul>', N'<p>Thiết kế bo tròn hiện đại, lọc bụi siêu vi PM1.0 chuẩn xác.</p>', 8290000, 9400000, 22, N'9000 BTU (1 HP)', 24, N'Thái Lan', 'V10API1', 1, 0, 1),
(47, 1, 3, 'DH-LG05', N'Điều hòa LG Inverter 1 chiều 12000 BTU V13API1', 'dieu-hoa-lg-v13api1', N'<ul><li>Động cơ Dual Inverter tiết kiệm 70%</li><li>Đón gió dịu nhẹ AirCare</li></ul>', N'<p>Vận hành siêu êm thích hợp cho phòng ngủ trẻ nhỏ và người già.</p>', 9890000, 11100000, 19, N'12000 BTU (1.5 HP)', 24, N'Thái Lan', 'V13API1', 0, 1, 1),
(48, 1, 4, 'DH-CP04', N'Điều hòa Casper Inverter 1 chiều 9000 BTU QC-09IS36', 'dieu-hoa-casper-qc-09is36', N'<ul><li>Công nghệ SilkAir thổi gió mềm mại</li><li>Tiết kiệm điện i-Saving</li></ul>', N'<p>Thiết kế hàng ngàn lỗ micropores giúp luồng khí dịu nhẹ không buốt giá.</p>', 5790000, 6800000, 45, N'9000 BTU (1 HP)', 36, N'Thái Lan', 'QC-09IS36', 1, 1, 1),
(49, 1, 5, 'DH-SS02', N'Điều hòa Samsung Inverter 1 chiều 12000 BTU AR12CYHAAWKNSV', 'dieu-hoa-samsung-ar12cyhaawknsv', N'<ul><li>Làm lạnh dịu nhẹ WindFree</li><li>Bộ lọc Copper Anti-bacteria Filter</li></ul>', N'<p>Không còn lo luồng gió lạnh thổi trực tiếp gây cảm lạnh cho bé.</p>', 8390000, 9500000, 25, N'12000 BTU (1.5 HP)', 24, N'Thái Lan', 'AR12CYHAAWKNSV', 1, 1, 1),


(50, 2, 2, 'TL-PN03', N'Tủ lạnh Panasonic Inverter 300 lít NR-BV331BPKV ngăn đá dưới', 'tu-lanh-panasonic-nr-bv331bpkv', N'<ul><li>Ngăn đông mềm Prime Fresh -3 độ C</li><li>Công nghệ kháng khuẩn Blue Ag+</li></ul>', N'<p>Bảo quản thịt cá tươi ngon suốt 7 ngày không cần rã đông.</p>', 11490000, 12900000, 20, N'300 Lít', 24, N'Việt Nam', 'NR-BV331BPKV', 1, 1, 1),
(51, 2, 2, 'TL-PN04', N'Tủ lạnh Panasonic Inverter 417 lít NR-BX471GPKV', 'tu-lanh-panasonic-nr-bx471gpkv', N'<ul><li>Lấy nước ngoài kháng khuẩn</li><li>Cảm biến Econavi thông minh</li></ul>', N'<p>Dung tích lớn, thiết kế mặt thép đen ánh kim cực kỳ đẳng cấp.</p>', 15990000, 17800000, 12, N'417 Lít', 24, N'Việt Nam', 'NR-BX471GPKV', 0, 1, 1),
(52, 2, 2, 'TL-PN05', N'Tủ lạnh Panasonic Inverter 188 lít NR-BA221PKV1', 'tu-lanh-panasonic-nr-ba221pkv1', N'<ul><li>Kháng khuẩn Ag Clean</li><li>Công nghệ Inverter kết hợp Econavi</li></ul>', N'<p>Mẫu tủ lạnh 2 cánh truyền thống nhỏ gọn phù hợp gia đình 2-3 người.</p>', 6190000, 7100000, 30, N'188 Lít', 24, N'Việt Nam', 'NR-BA221PKV1', 0, 0, 1),
(53, 2, 2, 'TL-PN06', N'Tủ lạnh 4 cánh Panasonic Inverter 540 lít NR-YW590YMMV', 'tu-lanh-panasonic-nr-yw590ymmv', N'<ul><li>Thiết kế MultiDoor mặt gương xám</li><li>Công nghệ Nanoe-X vô trùng</li></ul>', N'<p>Dòng tủ lạnh Flagship đỉnh cao nhất của Panasonic với tính năng tự làm đá.</p>', 42990000, 46000000, 5, N'540 Lít', 24, N'Nhật Bản', 'NR-YW590YMMV', 1, 1, 1),
(54, 2, 5, 'TL-SS03', N'Tủ lạnh Samsung Inverter 488 lít 4 cửa RF48A4010B4/SV', 'tu-lanh-samsung-rf48a4010b4', N'<ul><li>2 dàn lạnh độc lập Twin Cooling Plus</li><li>Lấy nước bên ngoài tiện lợi</li></ul>', N'<p>Tủ 4 cửa sang trọng, giữ ẩm tối ưu giúp rau củ luôn tươi mọng nước.</p>', 15490000, 17900000, 15, N'488 Lít', 24, N'Trung Quốc', 'RF48A4010B4/SV', 1, 1, 1),
(55, 2, 5, 'TL-SS04', N'Tủ lạnh Samsung Inverter 305 lít RT30N4110S8/SV', 'tu-lanh-samsung-rt30n4110s8', N'<ul><li>Ngăn đông mềm Optimal Fresh Zone</li><li>Bộ lọc than hoạt tính Deodorizer</li></ul>', N'<p>Khử mùi hôi hiệu quả, giữ nguyên hương vị thơm ngon của thực phẩm.</p>', 7290000, 8500000, 22, N'305 Lít', 24, N'Thái Lan', 'RT30N4110S8/SV', 0, 0, 1),
(56, 2, 5, 'TL-SS05', N'Tủ lạnh Side by Side Samsung Inverter 647 lít RS62R5001M9/SV', 'tu-lanh-samsung-rs62r5001m9', N'<ul><li>Công nghệ SpaceMax viền siêu mỏng</li><li>Làm lạnh vòm All-Around Cooling</li></ul>', N'<p>Không gian lưu trữ siêu rộng rãi cho đại gia đình từ 5-7 thành viên.</p>', 14990000, 17500000, 10, N'647 Lít', 24, N'Trung Quốc', 'RS62R5001M9/SV', 0, 1, 1),
(57, 2, 5, 'TL-SS06', N'Tủ lạnh Samsung Inverter 280 lít RT25M4031S8/SV', 'tu-lanh-samsung-rt25m4031s8', N'<ul><li>Khay kính chịu lực 150kg</li><li>Đông mềm -1 độ C chuẩn tươi</li></ul>', N'<p>Thiết kế màu bạc xám hiện đại, dễ dàng lau chùi vệ sinh.</p>', 6390000, 7400000, 28, N'280 Lít', 24, N'Thái Lan', 'RT25M4031S8/SV', 0, 0, 1),
(58, 2, 3, 'TL-LG03', N'Tủ lạnh LG Inverter 394 lít GN-D392PSA', 'tu-lanh-lg-gn-d392psa', N'<ul><li>Lấy nước ngoài khay chứa kháng khuẩn</li><li>Khay làm đá di động Spaceplus</li></ul>', N'<p>Tiết kiệm điện năng vượt trội với máy nén Smart Inverter bảo hành 10 năm.</p>', 9990000, 11500000, 18, N'394 Lít', 24, N'Indonesia', 'GN-D392PSA', 1, 0, 1),
(59, 2, 3, 'TL-LG04', N'Tủ lạnh LG Side by Side Inverter 635 lít GR-D257MC', 'tu-lanh-lg-gr-d257mc', N'<ul><li>Door-in-Door Cửa phụ thông minh</li><li>Lấy đá ngoài & Nước tự động</li></ul>', N'<p>Mặt tủ màu đen nhám chống bám vân tay, lọc khí Hygiene Fresh+.</p>', 25990000, 29000000, 8, N'635 Lít', 24, N'Trung Quốc', 'GR-D257MC', 1, 1, 1),
(60, 2, 3, 'TL-LG05', N'Tủ lạnh LG Inverter 217 lít GN-L205S', 'tu-lanh-lg-gn-l205s', N'<ul><li>Hệ thống khí lạnh đa chiều</li><li>Ngăn cân bằng độ ẩm MOIST BALANCE CRISPER</li></ul>', N'<p>Tủ lạnh phân khúc bình dân bán chạy nhất cho gia đình nhỏ.</p>', 5190000, 6000000, 35, N'217 Lít', 24, N'Indonesia', 'GN-L205S', 0, 0, 1),
(61, 2, 3, 'TL-LG06', N'Tủ lạnh LG Inverter 374 lít GN-D372BL', 'tu-lanh-lg-gn-d372bl', N'<ul><li>Làm lạnh DoorCooling+ từ cánh cửa</li><li>Ngăn Fresh 0 Zone bảo quản thịt cá</li></ul>', N'<p>Giúp thực phẩm nhận luồng khí lạnh nhanh hơn 35% so với tủ thông thường.</p>', 9290000, 10800000, 16, N'374 Lít', 24, N'Indonesia', 'GN-D372BL', 0, 0, 1),
(62, 2, 4, 'TL-CP03', N'Tủ lạnh Casper Inverter 325 lít RB-320VT', 'tu-lanh-casper-rb-320vt', N'<ul><li>Tủ ngăn đá dưới tiện dụng</li><li>Cảnh báo cửa mở thông minh</li></ul>', N'<p>Tủ lạnh ngăn đá dưới giá rẻ nhất thị trường chất lượng Thái Lan.</p>', 6290000, 7300000, 25, N'325 Lít', 24, N'Thái Lan', 'RB-320VT', 0, 1, 1),
(63, 2, 4, 'TL-CP04', N'Tủ lạnh Casper 218 lít RT-230PB', 'tu-lanh-casper-rt-230pb', N'<ul><li>Lọc mùi than hoạt tính</li><li>Dàn lạnh bằng đồng truyền nhiệt nhanh</li></ul>', N'<p>Kiểu dáng vuông vắn cứng cáp, phù hợp mọi không gian căn bếp.</p>', 4290000, 5100000, 40, N'218 Lít', 24, N'Thái Lan', 'RT-230PB', 0, 0, 1),
(64, 2, 4, 'TL-CP05', N'Tủ lạnh Multidoor Casper Inverter 462 lít RM-520VT', 'tu-lanh-casper-rm-520vt', N'<ul><li>Thiết kế 4 cửa độc lập</li><li>Chế độ chuyển đổi nhiệt độ linh hoạt</li></ul>', N'<p>Dòng tủ nhiều cửa cao cấp giúp phân loại thực phẩm không bị lẫn mùi.</p>', 11290000, 13200000, 14, N'462 Lít', 24, N'Thái Lan', 'RM-520VT', 1, 0, 1),
(65, 2, 4, 'TL-CP06', N'Tủ lạnh Casper 185 lít RT-200VS', 'tu-lanh-casper-rt-200vs', N'<ul><li>Tiết kiệm điện năng tiêu chuẩn 5 sao</li><li>Đèn LED chiếu sáng rộng</li></ul>', N'<p>Lựa chọn tối ưu kinh phí cho sinh viên và hộ gia đình mới cưới.</p>', 3790000, 4500000, 45, N'185 Lít', 24, N'Thái Lan', 'RT-200VS', 0, 0, 1),
(66, 2, 1, 'TL-DK01', N'Tủ lạnh Daikin Inverter 350 lít VR-350DK (Model Thử Nghiệm)', 'tu-lanh-daikin-vr-350dk', N'<ul><li>Công nghệ cấp đông mềm đột phá</li><li>Tiết kiệm điện vượt trội</li></ul>', N'<p>Sản phẩm gia dụng thông minh thử nghiệm độc quyền từ Daikin.</p>', 12990000, 14500000, 10, N'350 Lít', 24, N'Nhật Bản', 'VR-350DK', 0, 1, 1),


(67, 3, 3, 'MG-LG03', N'Máy giặt LG AI DD Inverter 10 kg FV1410S4P cửa ngang', 'may-giat-lg-fv1410s4p', N'<ul><li>Công nghệ giặt nhanh TurboWash 59 phút</li><li>Mặt giặt kính cường lực bền bỉ</li></ul>', N'<p>Màu xám xước sang trọng, giặt sạch quần áo siêu tốc bảo vệ sợi vải.</p>', 8990000, 10500000, 22, N'10 Kg', 24, N'Việt Nam', 'FV1410S4P', 1, 1, 1),
(68, 3, 3, 'MG-LG04', N'Máy giặt LG AI DD Inverter 12 kg FV1412S4W cửa ngang', 'may-giat-lg-fv1412s4w', N'<ul><li>Khối lượng giặt khủng 12 kg</li><li>Giặt hơi nước Steam diệt khuẩn</li></ul>', N'<p>Giải pháp lý tưởng cho gia đình đông người hoặc nhà có trẻ sơ sinh.</p>', 11290000, 12900000, 15, N'12 Kg', 24, N'Việt Nam', 'FV1412S4W', 0, 1, 1),
(69, 3, 3, 'MG-LG05', N'Máy giặt sấy LG AI DD Inverter giặt 10.5 kg sấy 7 kg FV1410D4P', 'may-giat-say-lg-fv1410d4p', N'<ul><li>Tích hợp 2 trong 1 Giặt & Sấy tiện lợi</li><li>Thêm đồ khi đang giặt Add Item</li></ul>', N'<p>Quần áo khô ráo thơm tho ngay sau khi giặt không lo mưa bão.</p>', 13990000, 15800000, 12, N'Giặt 10.5kg - Sấy 7kg', 24, N'Việt Nam', 'FV1410D4P', 1, 1, 1),
(70, 3, 3, 'MG-LG06', N'Máy giặt LG Smart Inverter 9 kg T2109VSAB cửa trên', 'may-giat-lg-t2109vsab', N'<ul><li>Chuyển động Smart Motion 3</li><li>Thác nước Smart Inverter giặt sạch hơn</li></ul>', N'<p>Tiết kiệm điện năng tối đa cho dòng máy giặt lồng đứng.</p>', 4890000, 5700000, 30, N'9 Kg', 24, N'Việt Nam', 'T2109VSAB', 0, 0, 1),
(71, 3, 5, 'MG-SS03', N'Máy giặt Samsung AI Inverter 9 kg WW90TP44DSB/SV', 'may-giat-samsung-ww90tp44dsb', N'<ul><li>Phân bổ nước giặt xả tự động AI Dispenser</li><li>Cảm biến giặt thông minh AI Wash</li></ul>', N'<p>Bảng điều khiển thông minh tự ghi nhớ thói quen giặt của gia đình.</p>', 8690000, 10200000, 18, N'9 Kg', 24, N'Việt Nam', 'WW90TP44DSB/SV', 1, 0, 1),
(72, 3, 5, 'MG-SS04', N'Máy giặt sấy Samsung AI Inverter giặt 9.5 kg sấy 6 kg WD95T4046CE/SV', 'may-giat-say-samsung-wd95t4046ce', N'<ul><li>Công nghệ sấy ngưng tụ an toàn</li><li>Bong bóng siêu mịn EcoBubble</li></ul>', N'<p>Giặt sạch vết bẩn cứng đầu ngay ở nhiệt độ nước thường.</p>', 11890000, 13900000, 14, N'Giặt 9.5kg - Sấy 6kg', 24, N'Việt Nam', 'WD95T4046CE/SV', 0, 1, 1),
(73, 3, 5, 'MG-SS05', N'Máy giặt Samsung Inverter 12 kg WA12CG5745BV/SV cửa trên', 'may-giat-samsung-wa12cg5745bv', N'<ul><li>Công nghệ Ecobubble lồng đứng</li><li>Mâm giặt Dual Storm xoáy nước mạnh</li></ul>', N'<p>Giặt sạch chăn mền dày dễ dàng mà không làm sờn vãi.</p>', 7190000, 8400000, 20, N'12 Kg', 24, N'Thái Lan', 'WA12CG5745BV/SV', 0, 1, 1),
(74, 3, 5, 'MG-SS06', N'Máy giặt Samsung Inverter 8.5 kg WW85T4040CE/SV', 'may-giat-samsung-ww85t4040ce', N'<ul><li>Động cơ Digital Inverter vận hành êm</li><li>Chế độ Drum Clean tự vệ sinh lồng giặt</li></ul>', N'<p>Máy giặt cửa ngang giá cực tốt dành cho căn hộ nhỏ.</p>', 5890000, 6900000, 28, N'8.5 Kg', 24, N'Việt Nam', 'WW85T4040CE/SV', 0, 0, 1),
(75, 3, 2, 'MG-PN03', N'Máy giặt Panasonic Inverter 9.5 kg NA-FD95X1LRV cửa trên', 'may-giat-panasonic-na-fd95x1lrv', N'<ul><li>Xoáy nước Bazooka kết hợp StainMaster</li><li>Bảng điều khiển nắp sau sang trọng</li></ul>', N'<p>Chuyên gia đánh bay các vết bẩn dầu mỡ, bùn đất trên quần áo.</p>', 7290000, 8500000, 20, N'9.5 Kg', 24, N'Việt Nam', 'NA-FD95X1LRV', 1, 0, 1),
(76, 3, 2, 'MG-PN04', N'Máy giặt Panasonic Inverter 10 kg NA-V10FC1LVT cửa ngang', 'may-giat-panasonic-na-v10fc1lvt', N'<ul><li>Chế độ giặt nước nóng StainMaster+</li><li>Cảm biến Econavi tiết kiệm điện nước</li></ul>', N'<p>Loại bỏ 99.99% vi khuẩn và các tác nhân gây dị ứng da.</p>', 10490000, 12100000, 16, N'10 Kg', 24, N'Việt Nam', 'NA-V10FC1LVT', 0, 1, 1),
(77, 3, 2, 'MG-PN05', N'Máy giặt Panasonic 8.5 kg NA-F85A4GRV cửa trên', 'may-giat-panasonic-na-f85a4grv', N'<ul><li>Lồng giặt Sazanami bảo vệ sợi vải</li><li>Lưới lọc xơ vải Big Ag Filter</li></ul>', N'<p>Bền bỉ truyền thống, cực kỳ dễ thao tác cho người lớn tuổi.</p>', 4990000, 5800000, 32, N'8.5 Kg', 24, N'Việt Nam', 'NA-F85A4GRV', 0, 0, 1),
(78, 3, 2, 'MG-PN06', N'Máy giặt sấy Panasonic Inverter giặt 10.5 kg sấy 6 kg NA-V10FC1WVT', 'may-giat-say-panasonic-na-v10fc1wvt', N'<ul><li>Hệ thống giặt sấy tiện ích Hybrid Dry</li><li>Khóa trẻ em an toàn</li></ul>', N'<p>Chăm sóc toàn diện trang phục cao cấp cho cả gia đình.</p>', 14890000, 16900000, 10, N'Giặt 10.5kg - Sấy 6kg', 24, N'Việt Nam', 'NA-V10FC1WVT', 0, 1, 1),
(79, 3, 4, 'MG-CP03', N'Máy giặt Casper Inverter 10.5 kg WF-105I140BWC lồng ngang', 'may-giat-casper-wf-105i140bwc', N'<ul><li>Lồng giặt Crystal hình gối linh hoạt</li><li>Tự động suy luận Fuzzy Logic</li></ul>', N'<p>Màu trắng tinh tế, khả năng tự cân chỉnh lượng nước giặt thông minh.</p>', 5990000, 7200000, 25, N'10.5 Kg', 24, N'Thái Lan', 'WF-105I140BWC', 0, 1, 1),
(80, 3, 4, 'MG-CP04', N'Máy giặt Casper 7.5 kg WT-75N70BGA cửa trên', 'may-giat-casper-wt-75n70bga', N'<ul><li>Hệ thống 3 luồng nước xoáy mạnh</li><li>Mâm giặt 6 cánh đánh tan xà phòng</li></ul>', N'<p>Giá rẻ bất ngờ chỉ hơn 3 triệu đồng cho chiếc máy giặt chính hãng.</p>', 3190000, 3900000, 40, N'7.5 Kg', 24, N'Thái Lan', 'WT-75N70BGA', 0, 0, 1),
(81, 3, 4, 'MG-CP05', N'Máy giặt Casper Inverter 8.5 kg WF-85I140BGB lồng ngang', 'may-giat-casper-wf-85i140bgb', N'<ul><li>Cánh đảo gió S-Shape giặt sạch hơn</li><li>Tốc độ vắt 1400 vòng/phút</li></ul>', N'<p>Vắt cực khô giúp quần áo rút ngắn thời gian phơi ráo nước.</p>', 4890000, 5900000, 30, N'8.5 Kg', 24, N'Thái Lan', 'WF-85I140BGB', 0, 0, 1),
(82, 3, 4, 'MG-CP06', N'Máy giặt sấy Casper Inverter giặt 10 kg sấy 7 kg WD-103I140BWC', 'may-giat-say-casper-wd-103i140bwc', N'<ul><li>16 chương trình giặt đa dạng</li><li>Khử trùng lồng giặt ở 90 độ C</li></ul>', N'<p>Dòng máy giặt sấy nguyên chiếc giá siêu cạnh tranh từ Casper.</p>', 9890000, 11500000, 15, N'Giặt 10kg - Sấy 7kg', 24, N'Thái Lan', 'WD-103I140BWC', 1, 1, 1),
(83, 3, 3, 'MG-LG07', N'Máy giặt LG TurboDrum Inverter 13 kg T2313VSAB', 'may-giat-lg-t2313vsab', N'<ul><li>Khối lượng giặt cực lớn 13 kg</li><li>Mâm giặt xoay đảo chiều TurboDrum</li></ul>', N'<p>Thỏa sức giặt chăn bông, ga trải giường lớn cho cả nhà.</p>', 7490000, 8800000, 18, N'13 Kg', 24, N'Việt Nam', 'T2313VSAB', 0, 0, 1),


(84, 4, 6, 'BNL-AR05', N'Bình nóng lạnh Ariston 20 lít Vitaly 20 Slim gián tiếp', 'binh-nong-lanh-ariston-vitaly-20-slim', N'<ul><li>Cầu dao ELCB chống giật an toàn</li><li>Lớp cách nhiệt HDI giữ nhiệt 48h</li></ul>', N'<p>Thiết kế kiểu dáng ngang giá bình dân phù hợp đa số hộ gia đình.</p>', 1890000, 2300000, 50, N'20 Lít - 2500W', 84, N'Việt Nam', 'Vitaly 20 Slim', 1, 1, 1),
(85, 4, 6, 'BNL-AR06', N'Bình nóng lạnh Ariston 30 lít Vitaly 30 Slim', 'binh-nong-lanh-ariston-vitaly-30-slim', N'<ul><li>Thanh đốt mạ đồng chống bám cặn</li><li>Lòng bình tráng men Titan</li></ul>', N'<p>Dung tích lớn 30L thoải mái cho gia đình đông người tắm liên tục.</p>', 2190000, 2600000, 45, N'30 Lít - 2500W', 84, N'Việt Nam', 'Vitaly 30 Slim', 0, 1, 1),
(86, 4, 6, 'BNL-AR07', N'Bình nóng lạnh Ariston 20 lít Andris2 20Top Wi-Fi cao cấp', 'binh-nong-lanh-ariston-andris2-20top-wifi', N'<ul><li>Kết nối Wi-Fi điều khiển qua điện thoại</li><li>Màn hình hiển thị nhiệt độ kĩ thuật số</li></ul>', N'<p>Bật bình nóng lạnh từ xa trên điện thoại trước khi đi làm về.</p>', 4190000, 4800000, 15, N'20 Lít - 2500W', 84, N'Việt Nam', 'Andris2 20Top Wi-Fi', 1, 1, 1),
(87, 4, 6, 'BNL-AR08', N'Bình nóng lạnh trực tiếp Ariston Aures Premium 4.5', 'binh-nong-lanh-ariston-aures-premium-45', N'<ul><li>Làm nóng nước tức thì không chờ đợi</li><li>Hệ thống an toàn đồng bộ TSS</li></ul>', N'<p>Thiết kế siêu mỏng nhẹ, phù hợp nơi có nguồn nước mạnh.</p>', 2390000, 2800000, 30, N'4500W (Trực tiếp)', 24, N'Việt Nam', 'Aures Premium 4.5', 0, 0, 1),
(88, 4, 6, 'BNL-AR09', N'Bình nóng lạnh Ariston 15 lít Slim2 15R', 'binh-nong-lanh-ariston-slim2-15r', N'<ul><li>Dung tích 15L nhỏ gọn</li><li>Đèn LED báo nước nóng sẵn sàng</li></ul>', N'<p>Tiết kiệm không gian phòng tắm và lượng điện tiêu thụ.</p>', 2490000, 2900000, 35, N'15 Lít - 2500W', 84, N'Việt Nam', 'Slim2 15R', 0, 0, 1),
(89, 4, 6, 'BNL-AR10', N'Bình nóng lạnh Ariston 30 lít Slim2 30R ngang', 'binh-nong-lanh-ariston-slim2-30r', N'<ul><li>Vỏ bình chống thấm nước IPX1</li><li>Bộ phản quang Ag+ kháng khuẩn</li></ul>', N'<p>Cung cấp nguồn nước nóng sạch khuẩn an toàn cho làn da nhạy cảm.</p>', 3090000, 3600000, 28, N'30 Lít - 2500W', 84, N'Việt Nam', 'Slim2 30R', 0, 0, 1),
(90, 4, 4, 'BNL-CP03', N'Bình nóng lạnh Casper 15 lít EH-15TH11 vuông', 'binh-nong-lanh-casper-eh-15th11', N'<ul><li>Thanh Anode Magie kích thước lớn chống ăn mòn</li><li>Cầu dao ELCB xịn xò</li></ul>', N'<p>Lựa chọn kinh tế nhất cho phòng tắm diện tích nhỏ.</p>', 1590000, 1950000, 60, N'15 Lít - 2500W', 24, N'Thái Lan', 'EH-15TH11', 0, 1, 1),
(91, 4, 4, 'BNL-CP04', N'Bình nóng lạnh Casper 20 lít SH-20TH11 ngang', 'binh-nong-lanh-casper-sh-20th11', N'<ul><li>Thanh đốt đồng nguyên chất 100%</li><li>Bảo hành bình chứa lên tới 7 năm</li></ul>', N'<p>Làm nóng nước nhanh chóng, đun sôi êm ái không gây tiếng ồn.</p>', 1750000, 2100000, 40, N'20 Lít - 2500W', 24, N'Thái Lan', 'SH-20TH11', 0, 0, 1),
(92, 4, 4, 'BNL-CP05', N'Bình nóng lạnh Casper 30 lít SH-30TH11 ngang', 'binh-nong-lanh-casper-sh-30th11', N'<ul><li>Công nghệ giữ nhiệt Polyurethane mật độ cao</li><li>Màn hình LED báo nhiệt độ</li></ul>', N'<p>Giữ nước nóng kéo dài suốt ngày dài không cần đun lại nhiều lần.</p>', 1990000, 2400000, 35, N'30 Lít - 2500W', 24, N'Thái Lan', 'SH-30TH11', 1, 0, 1),
(93, 4, 4, 'BNL-CP06', N'Bình nóng lạnh trực tiếp Casper EP-45TH11 có bơm trợ lực', 'binh-nong-lanh-casper-ep-45th11', N'<ul><li>Bơm trợ lực siêu êm phù hợp áp lực nước yếu</li><li>Vòi sen mạ crom 5 chế độ</li></ul>', N'<p>Tận hưởng cảm giác tắm sảng khoái tức thì mà không cần chờ đợi.</p>', 2590000, 3100000, 25, N'4500W (Trực tiếp)', 24, N'Thái Lan', 'EP-45TH11', 0, 1, 1),
(94, 4, 2, 'BNL-PN03', N'Bình nóng lạnh Panasonic 15 lít DH-15HAMVW gián tiếp', 'binh-nong-lanh-panasonic-dh-15hamvw', N'<ul><li>Ruột bình thép không gỉ bảo hành vĩnh viễn</li><li>Vỏ chống nước chuẩn IPX4</li></ul>', N'<p>Độ bền chuẩn công nghệ Nhật Bản không lo han gỉ thủng bình.</p>', 3190000, 3700000, 20, N'15 Lít - 2500W', 24, N'Malaysia', 'DH-15HAMVW', 0, 0, 1),
(95, 4, 2, 'BNL-PN04', N'Bình nóng lạnh trực tiếp Panasonic DH-4PTP1VW có bơm trợ lực', 'binh-nong-lanh-panasonic-dh-4ptp1vw', N'<ul><li>Bơm trợ lực DC vận hành cực êm</li><li>Vòi sen có tính năng Ag+ kháng khuẩn</li></ul>', N'<p>Tích hợp 9 tính năng an toàn điện bảo vệ gia đình toàn diện.</p>', 3790000, 4300000, 18, N'4500W (Trực tiếp)', 24, N'Malaysia', 'DH-4PTP1VW', 1, 0, 1),
(96, 4, 2, 'BNL-PN05', N'Bình nóng lạnh trực tiếp Panasonic DH-4RL1VW không bơm', 'binh-nong-lanh-panasonic-dh-4rl1vw', N'<ul><li>Công suất 4500W làm nóng cực nhanh</li><li>Thắt mở nguồn nước bằng 1 nút nhấn</li></ul>', N'<p>Kiểu dáng mỏng tinh tế, lắp đặt vô cùng dễ dàng.</p>', 2290000, 2700000, 30, N'4500W (Trực tiếp)', 24, N'Malaysia', 'DH-4RL1VW', 0, 0, 1),
(97, 4, 6, 'BNL-AR11', N'Bình nóng lạnh Ariston 30 lít LUX 30 UE gián tiếp', 'binh-nong-lanh-ariston-lux-30-ue', N'<ul><li>Thanh đốt 100% Titan bảo hành trọn đời</li><li>Công nghệ Ion Bạc làm sạch nước</li></ul>', N'<p>Dòng sản phẩm cao cấp thiết kế sang trọng cho biệt thự, chung cư cao cấp.</p>', 4590000, 5200000, 12, N'30 Lít - 2500W', 84, N'Việt Nam', 'LUX 30 UE', 0, 1, 1),
(98, 4, 4, 'BNL-CP07', N'Bình nóng lạnh Casper 20 lít EN-20TH11 giá rẻ', 'binh-nong-lanh-casper-en-20th11', N'<ul><li>Cầu dao ELCB chống rò điện</li><li>Nút tùy chỉnh nhiệt độ linh hoạt</li></ul>', N'<p>Mẫu bình nóng lạnh vuông bán chạy cho mọi công trình.</p>', 1650000, 2000000, 45, N'20 Lít - 2500W', 24, N'Thái Lan', 'EN-20TH11', 0, 0, 1),
(99, 4, 6, 'BNL-AR12', N'Bình nóng lạnh Ariston 15 lít Andris2 15R vuông', 'binh-nong-lanh-ariston-andris2-15r', N'<ul><li>Ruột bình tráng men Titan</li><li>Hệ thống an toàn đồng bộ TSS</li></ul>', N'<p>Thiết kế vuông vắn nhỏ gọn dễ dàng lắp đặt trần thạch cao.</p>', 2390000, 2800000, 32, N'15 Lít - 2500W', 84, N'Việt Nam', 'Andris2 15R', 0, 0, 1),
(100, 4, 2, 'BNL-PN06', N'Bình nóng lạnh Panasonic 20 lít DH-20HAMVW cao cấp', 'binh-nong-lanh-panasonic-dh-20hamvw', N'<ul><li>Ruột bình không cần thay thế thanh Magie</li><li>Chịu áp lực nước lớn</li></ul>', N'<p>Công nghệ không bảo trì độc quyền từ Panasonic Nhật Bản.</p>', 3590000, 4100000, 15, N'20 Lít - 2500W', 24, N'Malaysia', 'DH-20HAMVW', 0, 1, 1);
INSERT INTO dbo.HinhAnhSanPham (SanPhamID, DuongDanAnh, MoTaAnh, LaAnhChinh, ThuTu)
VALUES 

(1, N'https://banhangtaikho.com.vn/Images/Product/ftky25wavmv-vTc8I9.jpg', N'Mặt trước sản phẩm', 1, 1),


(1, N'https://dienmayan.vn/Files/216/san-pham-ngung-kinh-doanh/dieu-hoa-daikin-inverter-9000-btu-1-chieu-ftky25wavmv-0.jpg', N'Góc nghiêng dàn lạnh', 0, 2),


(1, N'https://product.hstatic.net/200000574527/product/3-ftky50wvmv-left45-open-3_7b24be06cf704130862b17ee421c4b77_1024x1024.png', N'Dàn nóng ngoài trời', 0, 3),



(2, N'https://bizweb.dktcdn.net/thumb/grande/100/498/701/products/ftky35wvmv.jpg?v=1700036954123', N'Mặt trước sản phẩm', 1, 1),
(2, N'https://dienmayan.vn/Files/216/san-pham-ngung-kinh-doanh/dieu-hoa-daikin-inverter-12000-btu-1-chieu-ftky35wavmv-0.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(2, N'https://product.hstatic.net/200000823005/product/dieu_hoa_daikin_12000btu_inverter_1_chieu_ftky35wavmv__1__0f7a48f4fd1c4ca29a36ec3b9cf2bbe0_1024x1024.jpg', N'Dàn nóng ngoài trời', 0, 3),



(3, N'https://tse3.mm.bing.net/th/id/OIP.sX-wbdVZuJ0cGH4jm0BNDwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(3, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/443/782/products/dieu-hoa-1-chieu-panasonic-inverter-cu-cs-pu9zkh-8m-4.jpg?v=1696219832960', N'Góc nghiêng dàn lạnh', 0, 2),
(3, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/443/782/products/dieu-hoa-1-chieu-panasonic-inverter-cu-cs-pu9zkh-8m-2.jpg?v=1696219830500', N'Dàn nóng ngoài trời', 0, 3),

(4, N'https://dienlanhthanhhoa.net/media/images/dieu-hoa-panasonic/dieu-hoa-panasonic-cu-cs-pu12zkh-8m.jpg', N'Mặt trước sản phẩm', 1, 1),
(4, N'https://tse3.mm.bing.net/th/id/OIP.wXSnmRoP0JWonDwrpg7WWAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(4, N'https://tse2.mm.bing.net/th/id/OIP.m6i3gEkXITzle233DwoeOQHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),



(5, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/443/782/products/may-lanh-casper-inverter-tc-09is35-1.jpg?v=1698223590887', N'Mặt trước sản phẩm', 1, 1),
(5, N'https://dienmayan.vn/Files/216/dieu-hoa/dieu-hoa-casper/638174330073817072-dieu-hoa-casper-inverter-9000-btu-1-chieu-tc-09is35-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(5, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/511/180/products/tc09is35-ztd4ec-bc1819ec-16ee-4a2c-8446-8283a9d9e1dd.jpg?v=1716273668027', N'Dàn nóng ngoài trời', 0, 3),


(6, N'https://tse3.mm.bing.net/th/id/OIP.xArAADPouPhIbEmWuVaCRgHaGY?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(6, N'https://dieuhoataikho.com.vn/images/pro/dieu-hoa-casper-12000btu-inverter-1-chieu-gc-12is35_1393.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(6, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd51-lwiearitjqb98b', N'Dàn nóng ngoài trời', 0, 3),


(7, N'https://dienmayhlp.com/cdn/images/Di%E1%BB%81u%20hoa/LG/dieu-hoa-lg-v10win1-9000-btu.jpg', N'Mặt trước sản phẩm', 1, 1),
(7, N'https://tse2.mm.bing.net/th/id/OIP.fmTyhF7drVudlz668u9pZwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(7, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/475/305/products/3-773c89ba-6e65-41d8-a4ee-4db84268fca9.png?v=1719916005040', N'Dàn nóng ngoài trời', 0, 3),


(8, N'https://tse1.mm.bing.net/th/id/OIP.YeJXvwvmr2kBrYKaYK5b2AHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(8, N'https://dienmayhlp.com/cdn1/images/202405/goods_img/dieu-hoa-lg-12000-btu-1-chieu-inverter-v13win1-gia-re-P1651-1714617850858.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(8, N'https://tse4.mm.bing.net/th/id/OIP.C7BFuyHyn4H3_dyfvWF3AQHaFh?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),


(9, N'https://th.bing.com/th/id/OIP.Jd1yr2C8ju5mrpQMI0A2-AHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(9, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/487/147/products/5226-ftkf-7d2f388e-c4d1-4c02-88a8-8bbbd24e2766.jpg?v=1753086230303', N'Góc nghiêng dàn lạnh', 0, 2),
(9, N'https://th.bing.com/th/id/OIP.nbEzWbG5yfMxBHvCPMJZDwHaEL?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),


(10, N'https://dieuhoaact.vn/wp-content/uploads/2023/05/YZ12WKH.jpg', N'Mặt trước sản phẩm', 1, 1),
(10, N'https://tse4.mm.bing.net/th/id/OIP._EtBues-wfUVDnqTEdLvSAHaDF?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(10, N'https://khodieuhoa.vn/wp-content/uploads/2015/04/Dieu-hoa-Panasonic-YZ12WKH-8-600x450.jpg', N'Dàn nóng ngoài trời', 0, 3),


(11, N'https://tse3.mm.bing.net/th/id/OIP.ZECTebts87GPdT5Iglfz3gHaES?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(11, N'https://dienmaysieure.vn/wp-content/uploads/2024/01/Dieu-hoa-Casper-GC-18IS35-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(11, N'https://tse3.mm.bing.net/th/id/OIP.duQ_V9PBKYWtoV2lhUywsgHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),


(12, N'https://th.bing.com/th/id/OIP.9T0abAFhlI9FAk5ao2G68wHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(12, N'https://dienmayabc.com/media/product/4262_dieu_hoa_samsung_ar10cyhaawknsv_8_org.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(12, N'https://dieuhoabonmua.vn/wp-content/uploads/2023/11/ar10tyaacwk-685Yg0.jpg', N'Dàn nóng ngoài trời', 0, 3),


(13, N'https://th.bing.com/th/id/OIP.d0YAZhEK-BXxk7CWRV-bBAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(13, N'https://n2.com.vn/wp-content/uploads/2023/02/dieu-hoa-tro-tuong-ftky25wavmv-3-1024x660.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(13, N'https://tse4.mm.bing.net/th/id/OIP.qTFGVHIOgU8urKRdBKThiAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(14, N'https://dieuhoataikho.com.vn/images/pro/dieu-hoa-lg-24000btu-1-chieu-inverter-v24win1_1584.png', N'Mặt trước sản phẩm', 1, 1),
(14, N'https://bizweb.dktcdn.net/thumb/grande/100/475/305/products/8-c220f6ad-7bbd-477c-8bf0-1c2a2150bc48.png?v=1719993406140', N'Góc nghiêng dàn lạnh', 0, 2),
(14, N'https://dieuhoabonmua.vn/wp-content/uploads/2024/03/v24win1-dieu-hoa-lg.jpg', N'Dàn nóng ngoài trời', 0, 3),

(15, N'https://th.bing.com/th/id/OIP.0rf0u0OdozBn9OTwV-Ny9wHaFN?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(15, N'https://tse3.mm.bing.net/th/id/OIP.sCO0VlJGyHRbVXeEOxAa0wHaFN?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(15, N'https://product.hstatic.net/200000661547/product/panasonic-nr-bv280qsvn-050821-1156411_1da692c8ec3142d29db496c36cbb1a9b_1024x1024.png', N'Dàn nóng ngoài trời', 0, 3),

(16, N'https://tse2.mm.bing.net/th/id/OIP.PNQrZ_XVrvpaluycLU_Y5QHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(16, N'https://down-vn.img.susercontent.com/file/vn-11134207-820l4-mee0555tfg1scc', N'Góc nghiêng dàn lạnh', 0, 2),
(16, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxkzjrjiml0bfd', N'Dàn nóng ngoài trời', 0, 3),

(17, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/386/618/products/gr-b256jds.png?v=1721727237320', N'Mặt trước sản phẩm', 1, 1),
(17, N'https://tse3.mm.bing.net/th/id/OIP.X5lS3RwkU_k3uSCBZ90pMgHaFh?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(17, N'https://tse3.mm.bing.net/th/id/OIP.PBWIta_IIACd5sKGv7VrDAHaEJ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(18, N'https://tse4.mm.bing.net/th/id/OIP.dx9LS8cnf6ZxZQLewkn2mQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(18, N'https://tse1.mm.bing.net/th/id/OIP.F2TDuUjK79WAZFD913B2-QHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(18, N'https://down-vn.img.susercontent.com/file/vn-11134207-820l4-mf4xyaekodu459', N'Dàn nóng ngoài trời', 0, 3),

(19, N'https://bizweb.dktcdn.net/100/386/618/products/nr-bc360qkvn.jpg?v=1705135684943', N'Mặt trước sản phẩm', 1, 1),
(19, N'https://khodienmayonline.com/wp-content/uploads/2022/07/NR-BC360QKVN.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(19, N'https://dienmaythienphu.vn/wp-content/uploads/2022/09/290920-1120135-13.jpg', N'Dàn nóng ngoài trời', 0, 3),

(20, N'https://th.bing.com/th/id/OIP.oazYZLQhC9r-aHMKH4pJJAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(20, N'https://th.bing.com/th/id/OIP.fRwxbBWUI6WL7VnlsOCcBgHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(20, N'https://tse4.mm.bing.net/th/id/OIP.YSGK_HrP7pdt_jxWGhSUmAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),


(21, N'https://img.gigadigital.vn/image/1717384940388-tu-lanh-lg-inverter-315-lit-gn-m312ps.jpg', N'Mặt trước sản phẩm', 1, 1),
(21, N'https://muahangtaikho.vn/media/product/5241_gn_m312ps.png', N'Góc nghiêng dàn lạnh', 0, 2),
(21, N'https://khodienmayhanoi.com/img/sanpham/3777_tu_lanh_lg_gn_m312ps_20_org.jpg', N'Dàn nóng ngoài trời', 0, 3),

(22, N'https://th.bing.com/th/id/OIP.42cBuh8-s9Amuee5Q3cCtAHaEI?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(22, N'https://tse4.mm.bing.net/th/id/OIP._rD7UmaVePG7famoVxkBQwHaEI?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(22, N'https://th.bing.com/th/id/OIP.6z7CtyIDEGzzAwObfNKAWAHaKF?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(23, N'https://dienmayhoangphat.vn/media/product/1561_may_giat_lg_inverter_9_kg_fv1409s4w_12_.gif', N'Mặt trước sản phẩm', 1, 1),
(23, N'https://sudospaces.com/muasamdienmay/uploads/4may-giat-lg-inverter-9-kg-fv1409s4w_b2a26fa9ab3542cf9bf785707e79fcff_master.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(23, N'https://th.bing.com/th/id/OIP.JM9lj71iiWtWJkVUyfwh8AHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(24, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/480/978/products/3-598033b9-4d53-4b3e-bb87-971e963a1d76.jpg?v=1703156451640', N'Mặt trước sản phẩm', 1, 1),
(24, N'https://cdn.tgdd.vn/Products/Images/1944/236125/Slider/01-1020x570-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(24, N'https://diengiadunghcm.com/wp-content/uploads/2024/05/may-giat-samsung-inverter-9-5-kg-ww95ta046ax-sv-4.jpg', N'Dàn nóng ngoài trời', 0, 3),

(25, N'https://tse3.mm.bing.net/th/id/OIP.UyA79ILZxqjC8ndva3s5agHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(25, N'https://dienmayphuckhanh.vn/wp-content/uploads/2025/01/may-giat-panasonic-inverter-105-kg-na-fd10ar1bv.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(25, N'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/may-giat-panasonic-inverter-10-5kg-na-fd10ar1bv_2_.png', N'Dàn nóng ngoài trời', 0, 3),

(26, N'https://th.bing.com/th/id/OIP.3XOysR3tacYxpLn0LwxWIQHaF_?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(26, N'https://nhabeptrongtin.vn/wp-content/uploads/2023/04/10049570-may-giat-casper-inverter-9-5-kg-wf-95i140bgb.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(26, N'https://tse2.mm.bing.net/th/id/OIP.2b5g-FtI-VxtFb7tgNStkgHaFN?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(27, N'https://dienmayhoangphat.vn/media/product/2652_40.png', N'Mặt trước sản phẩm', 1, 1),
(27, N'https://tse3.mm.bing.net/th/id/OIP.yzCBPZEDoofHH3d0a3GC2gHaEG?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(27, N'https://tse2.mm.bing.net/th/id/OIP.sDNIrR6iOeYvFHIIQvHmsQHaEI?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(28, N'https://down-vn.img.susercontent.com/file/vn-11134207-820l4-megz87onxblu91', N'Mặt trước sản phẩm', 1, 1),
(28, N'https://cdn2.fptshop.com.vn/unsafe/00909172_may_giat_cua_truoc_samsung_ai_inverter_10kg_ww10t634dlxsv_12e72ab9a5.png', N'Góc nghiêng dàn lạnh', 0, 2),
(28, N'https://tse3.mm.bing.net/th/id/OIP.gAlfn_EILh4-DM8kWHMTwwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(29, N'https://th.bing.com/th/id/OIP.LEz211Oc6Lec_2r_mExgOwHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(29, N'https://tse4.mm.bing.net/th/id/OIP.FmREiM-APvK7u_tsKdT0tQHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(29, N'https://bizweb.dktcdn.net/100/425/687/products/na-v90fr1bvt.jpg?v=1715048067907', N'Dàn nóng ngoài trời', 0, 3),

(30, N'https://tse4.mm.bing.net/th/id/OIP.__jxGDa4Yxb4vpkRZK4kRwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(30, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/549/276/products/wt-85ng1-01-01-01-1715703010-f4ebb992-ca3a-4c86-aa73-e3ff124a4ef3.jpg?v=1741774000943', N'Góc nghiêng dàn lạnh', 0, 2),
(30, N'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture/Apro/Apro_product_34228/may-giat-casper-85-kg-wt85ng1-main-34228.png', N'Dàn nóng ngoài trời', 0, 3),

(31, N'https://th.bing.com/th/id/OIP.XpQlGIY-eMC0IfOm58DTUwHaFj?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(31, N'https://cf.shopee.vn/file/1e29a4d20e25ade5aa332f18916232b5', N'Góc nghiêng dàn lạnh', 0, 2),
(31, N'https://luxbath.vn/images/products/2025/12/01/large/binh-nuoc-nong-ariston-slim2-20rs-20-lit-ngang_1764560107.jpg', N'Dàn nóng ngoài trời', 0, 3),

(32, N'https://tse2.mm.bing.net/th/id/OIP.yIuBqT3BIJbvYw3Pno-ZMgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(32, N'https://luxbath.vn/images/products/2025/12/01/resized/binh-nong-lanh-ariston-andris2-30rs-30-lit-vuong_1764557029.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(32, N'https://down-vn.img.susercontent.com/file/395a3e941287585e2635596cb569f7ba', N'Dàn nóng ngoài trời', 0, 3),

(33, N'https://thietbipanasonic.vn/wp-content/uploads/2020/02/binh-nong-lanh-panasonic-20l-dh-20hbm-800x800.jpg', N'Mặt trước sản phẩm', 1, 1),
(33, N'https://dienmaydungtho.vn/Data/images/20HBMVW1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(33, N'https://tse4.mm.bing.net/th/id/OIP.9pLtGB8rnvOgzkcdkdlp-QHaEH?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(34, N'https://tse3.mm.bing.net/th/id/OIP.P43hMg45MsyDy5asp0e7HgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(34, N'https://tse4.mm.bing.net/th/id/OIP.10zKIM-tqTRc0AwcF2lb4gHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(34, N'https://meta.vn/Data/image/2019/11/06/binh-nong-lanh-casper-eh-20th11-20-lit-nd.jpg', N'Dàn nóng ngoài trời', 0, 3),

(35, N'https://th.bing.com/th/id/OIP.dtv3iBSv__gtLDNNOZILDAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(35, N'https://tse1.mm.bing.net/th/id/OIP._tDGB4xlNAPHWR7JbImQKgHaHE?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(35, N'https://dienmaythienphu.vn/wp-content/uploads/2021/12/cong-nang-binh-nong-lanh-ariston-30l-rs.jpg', N'Dàn nóng ngoài trời', 0, 3),

(36, N'https://th.bing.com/th/id/OIP.siAvDsxne_m0zToGlgt2zwHaGr?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(36, N'https://dienmayhuyhoang.com.vn/wp-content/uploads/2024/09/976_eh_30th11.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(36, N'https://dienmaythuanthanh.vn/wp-content/uploads/2021/07/binh-nong-lanh-casper-eh-30th11-30-lit-cho-gia-dinh.jpg', N'Dàn nóng ngoài trời', 0, 3),

(37, N'https://tse1.mm.bing.net/th/id/OIP.J9z9Qj0HPFHKbLO2Afg4kwHaEI?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(37, N'https://meta.vn/Data/image/2022/11/08/binh-nong-lanh-panasonic-dh-30hbmvw-30-lit-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(37, N'https://meta.vn/Data/image/2022/11/08/binh-nong-lanh-panasonic-dh-30hbmvw-30-lit-1.jpg', N'Dàn nóng ngoài trời', 0, 3),

(38, N'https://cdn.tgdd.vn/Products/Images/1962/286052/Slider/00000-1020x574.jpg', N'Mặt trước sản phẩm', 1, 1),
(38, N'https://thietbivesinhhaduong.com.vn/upload/images/binh-nong-lanh-ariston-premium-4-5p-ivory.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(38, N'https://thietbivesinhhaduong.com.vn/upload/baiviet/binh-aristn-ariston-aures-premium-4-1436.jpg', N'Dàn nóng ngoài trời', 0, 3),

(39, N'https://dieuhoataikho.com.vn/images/pro/dieu-hoa-daikin-inverter-9000btu-1-chieu-ftkf25xvmvrkf25xvmv_1348.png', N'Mặt trước sản phẩm', 1, 1),
(39, N'https://digicity.vn/media/product/19738_bannerinfo_ftkf25.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(39, N'https://bizweb.dktcdn.net/thumb/grande/100/490/762/products/may-lanh-daikin-inverter-1-0hp-ftkf25xvmv-model-2023-jpg.webp?v=1689609447323', N'Dàn nóng ngoài trời', 0, 3),

(40, N'https://dieuhoataikho.com.vn/images/pro/dieu-hoa-daikin-inverter-12000btu-1-chieu-ftkf35xvmvrkf35xvmv_1349.png', N'Mặt trước sản phẩm', 1, 1),
(40, N'https://kysudienmay.com/storage/product/13418/may-lanh-daikin-02.webp', N'Góc nghiêng dàn lạnh', 0, 2),
(40, N'https://kysudienmay.com/storage/product/13223/dieu-hoa-daikin-12000-btu-1-chieu-inverter-ft-kf-35-zv-mv-mat-lanh-cuc-nong-dieu-khien.webp', N'Dàn nóng ngoài trời', 0, 3),

(41, N'https://tse1.mm.bing.net/th/id/OIP.y1ntq9SQspNC-WR5ZFpfGAHaEI?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(41, N'https://product.hstatic.net/200000574527/product/daikin-atf25uv1v-n_1c58b4c28c384ac5b2640c6dde3111ba.png', N'Góc nghiêng dàn lạnh', 0, 2),
(41, N'https://product.hstatic.net/200000574527/product/daikin-atf25uv1v-160621-0902590_7821e805116945f39d398984ad8d8dbf_grande.jpg', N'Dàn nóng ngoài trời', 0, 3),

(42, N'https://tse3.mm.bing.net/th/id/OIP.WXcK6H0LUmC_OcrcVU1y0QHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(42, N'https://bizweb.dktcdn.net/100/598/846/products/4786-ftkb-b886001e-620c-48d8-b2db-b909c2585261.jpg?v=1758290567817', N'Góc nghiêng dàn lạnh', 0, 2),
(42, N'https://dienmayan.vn/Files/216/san-pham-ngung-kinh-doanh/dieu-hoa-daikin-inverter-12000-btu-2-chieu-fthf35vavmv-0.jpg', N'Dàn nóng ngoài trời', 0, 3),

(43, N'https://dienmayan.vn/Files/216/xuan/dieu-hoa-panasonic-inverter-1-hp-cu-cs-xu9zkh-8-anh-dai-dien.png', N'Mặt trước sản phẩm', 1, 1),
(43, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/475/305/products/7-ea041ee4-2959-4c3f-8149-f42a70b46174.png?v=1719998145803', N'Góc nghiêng dàn lạnh', 0, 2),
(43, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd5e-lwe0hbenj58b8f', N'Dàn nóng ngoài trời', 0, 3),

(44, N'https://dienmayan.vn/Files/216/xuan/dieu-hoa-panasonic-inverter-15-hp-cu-cs-xu12zkh-8-anh-dai-dien.png', N'Mặt trước sản phẩm', 1, 1),
(44, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/443/782/products/dieuhoa-1-chieu-panasonic-inverter-cu-cs-xu12zkh-8-3.jpg?v=1686656340707', N'Góc nghiêng dàn lạnh', 0, 2),
(44, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/443/782/products/dieuhoa-1-chieu-panasonic-inverter-cu-cs-xu12zkh-8-1.jpg?v=1686656338493', N'Dàn nóng ngoài trời', 0, 3),

(45, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-mab4dwz00ir68b', N'Mặt trước sản phẩm', 1, 1),
(45, N'https://bizweb.dktcdn.net/100/403/584/products/2025-06-02-142949.png?v=1748849528533', N'Góc nghiêng dàn lạnh', 0, 2),
(45, N'https://tse2.mm.bing.net/th/id/OIP.B0RbM76yEbSVMJh_BdLTSQHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(46, N'https://th.bing.com/th/id/OIP.4Nw-sKoj1K_h1ACbMWZyJwHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(46, N'https://daikim.com.vn/wp-content/uploads/2022/03/1-chieu-inverter-scaled.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(46, N'https://product.hstatic.net/200000358641/product/lg-v10api1-3-3-org_9279830d24ca418d8b804e0de5e7e22f_master.jpg', N'Dàn nóng ngoài trời', 0, 3),

(47, N'https://digicity.vn/media/product/20217_lg_v13api1_1_1_org.jpg', N'Mặt trước sản phẩm', 1, 1),
(47, N'https://kithome.com.vn/wp-content/uploads/2024/09/2-80.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(47, N'https://cdn3414.cdn4s6.io.vn/media/san-pham/dieu-hoa-lg-inverter-9000-btu-1-hp-v10win1.jpg', N'Dàn nóng ngoài trời', 0, 3),

(48, N'https://tse1.mm.bing.net/th/id/OIP.Vi5ticA-Kl8PfDr6ZSnX5wHaHW?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(48, N'https://dienmayan.vn/Files/216/Tam/dieu-hoa-casper-inverter-9000-btu-1-chieu-qc-09is36-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(48, N'https://tse1.mm.bing.net/th/id/OIP.DC86EcdUS_Sr31HWifRnfwHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(49, N'https://tse1.mm.bing.net/th/id/OIP.DC86EcdUS_Sr31HWifRnfwHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(49, N'https://bendep.net/wp-content/uploads/2021/08/dieu-hoa-samsung-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(49, N'https://img.websosanh.vn/v10/users/review/images/yvegdhlozc39q/dieu-hoa-samsung-12000-btu-doi-cu-giam-gia-2.jpg?compress=85', N'Dàn nóng ngoài trời', 0, 3),

(50, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdwd-lxjj8zoq9ytmf1', N'Mặt trước sản phẩm', 1, 1),
(50, N'https://panasonicvn.com/wp-content/uploads/2024/07/NR-BV331BPKV-1-compressed.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(50, N'https://dienmaythienphu.vn/wp-content/uploads/2022/11/panasonic-NR-BV331BPKV-3.jpg', N'Dàn nóng ngoài trời', 0, 3),

(51, N'https://down-vn.img.susercontent.com/file/vn-11134211-7ras8-mc312n7b9f2m1a', N'Mặt trước sản phẩm', 1, 1),
(51, N'https://panasonics.vn/public/images/1744863171-Tu-lanh-Panasonic-Inverter-417-lit-NR-BX471GPKV.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(51, N'https://tse3.mm.bing.net/th/id/OIP.Pt6YYYXd8VK22FkM00LApwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(52, N'https://th.bing.com/th/id/OIP._a1z-SpAUfoajDk5QopwpAHaF5?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(52, N'https://cdn.tgdd.vn/Products/Images/1943/220134/Slider/panasonic-nr-ba229pkvn-050821-1049405.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(52, N'https://cdn01.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture/Apro/Apro_product_24692/tu-lanh-panason_slideshow_0_659_615.png.webp', N'Dàn nóng ngoài trời', 0, 3),

(53, N'https://greenair.com.vn/media/product/3380_10050928_tu_lanh_panasonic_inverter_540l_nr_yw590ymmv_2.jpg', N'Mặt trước sản phẩm', 1, 1),
(53, N'https://thiennamphu.com/wp-content/uploads/2025/03/Thiet-ke-chua-co-ten-109-e1750123693461.png', N'Góc nghiêng dàn lạnh', 0, 2),
(53, N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lx11lr80s0yt0b', N'Dàn nóng ngoài trời', 0, 3),

(54, N'https://phanphoidienmay.net/image/cache/catalog/tu-lanh/Samsung/RF48A4010B4/tu-lanh-samsung-inverter-488-lit-rf48a4010b4-sv-akr-av-1300x1300w.jpg', N'Mặt trước sản phẩm', 1, 1),
(54, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m7hqfrsjuhrqca', N'Góc nghiêng dàn lạnh', 0, 2),
(54, N'https://tse1.mm.bing.net/th/id/OIP.oIBPlEc6fRRifohIwLiUUgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(55, N'https://tse1.mm.bing.net/th/id/OIP.DEm6sKWw3A2oEBSw3Lk5DAHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(55, N'https://hc.com.vn/i/ecommerce/media/ckeditor_10678097.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(55, N'https://hoangminhanh.com.vn/files/products/20250216221547_tu_lanh_samsung_inverter_305_lit_rt31cg5424b1sv.jpg', N'Dàn nóng ngoài trời', 0, 3),


(56, N'https://down-vn.img.susercontent.com/file/vn-11134211-7ras8-mc312n7k9w9ae5', N'Mặt trước sản phẩm', 1, 1),
(56, N'https://vuadienmay.vn/uploads/plugin/product_items/782/1628069814-2033246057-731.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(56, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/443/782/products/tu-lanh-sbs-samsung-inverter-647-lit-rs62r5001m9-sv-gia-re-1.jpg?v=1640850541427', N'Dàn nóng ngoài trời', 0, 3),

(57, N'https://tse1.mm.bing.net/th/id/OIP.-mrnDAix-6rMl51AsujbfwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(57, N'https://dienlanhcamerathanhdat.com/wp-content/uploads/2023/05/samsung-rt25m4032bu-sv-3-org.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(57, N'https://maylanhgiagoc.com/wp-content/uploads/2020/12/tu-lanh-samsung-inverter-rb27n4010s8-sv-280-lit-3.jpg', N'Dàn nóng ngoài trời', 0, 3),

(58, N'https://th.bing.com/th/id/OIP.L8pNqZSXvfJOvuKgVgu1KgHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(58, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/386/618/products/gn-d392psa.png?v=1721726094450', N'Góc nghiêng dàn lạnh', 0, 2),
(58, N'https://meta.vn/Data/image/2022/04/08/tu-lanh-lg-inverter-394-lit-gn-d392psa-6.jpg', N'Dàn nóng ngoài trời', 0, 3),

(59, N'https://th.bing.com/th/id/OIP.K1jrFfQMyhB1NqnYacLqfQHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(59, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/598/846/products/tu-lanh-lg-inverter-635-lit-gr-d257mc-23121511141190570.jpg?v=1758290816267', N'Góc nghiêng dàn lạnh', 0, 2),
(59, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/386/618/products/lg-inverter-635-lit-gr-d257mc-4.jpg?v=1746602694400', N'Dàn nóng ngoài trời', 0, 3),

(60, N'https://tse2.mm.bing.net/th/id/OIP.nNWH34HwrTSOBd7rWOohVQHaEW?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(60, N'https://dienmaythienphu.vn/wp-content/uploads/2021/11/tu-lanh-lg-315-lit-gn-d315s-1-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(60, N'https://dienlanhtrangbang.com/wp-content/uploads/2019/07/GN-L205S-2.jpg', N'Dàn nóng ngoài trời', 0, 3),

(61, N'https://tse4.mm.bing.net/th/id/OIP.TF8VP5LJPh1Q0zaOIGlTcAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(61, N'https://product.hstatic.net/1000294646/product/lg-inverter-374-lit-gn-d372bl-2-2_d0452744f39d442b9d1c3da48c452603_large.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(61, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rccc-lqxc094n0lahfe', N'Dàn nóng ngoài trời', 0, 3),

(62, N'https://th.bing.com/th/id/OIP.OeiJJpD7gBVk2XBW3jbXRAHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(62, N'https://369hoanggia.com/wp-content/uploads/2023/09/tu-lanh-casper-RB-320VT.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(62, N'https://dieuhoataikho.com.vn/Uploads/images/Thiet-ke-mau-xam-tinh-te.png', N'Dàn nóng ngoài trời', 0, 3),

(63, N'https://storage.googleapis.com/teko-gae.appspot.com/media/image/2021/4/10/20210410_d65861f9-c239-43ff-ba83-11b938e98ee0.jpg', N'Mặt trước sản phẩm', 1, 1),
(63, N'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhirgatUTP3Agqnwvpniqd5Ph4ji_Qf7c7W-iF_uAjel17uvMP4bSaoIgvg2p9rbayCrajx2FKfxYi0ztfKR9shzCbOcOXPrs9WouIsb0nr5iZHcOTYWITrd39o-2yUxFIcZv5q2Dkz-5Q/s16000-rw/RT_230.png', N'Góc nghiêng dàn lạnh', 0, 2),
(63, N'https://dienmaydaiviet.com/wp-content/uploads/2021/06/Tu-lanh-Casper-RT-230PB-Inverter-218-lit-2.jpg', N'Dàn nóng ngoài trời', 0, 3),

(64, N'https://josivn.com/sites/default/files/tu-lanh-casper-RM-520VT-1.jpg', N'Mặt trước sản phẩm', 1, 1),
(64, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk663gell6o22d', N'Góc nghiêng dàn lạnh', 0, 2),
(64, N'https://dienmaythienphu.vn/_next/image?url=https:%2F%2Fdienmaythienphu.vn%2Fwp-content%2Fuploads%2F2021%2F12%2Fcasper-RM-520VT-1.jpg&w=1920&q=100', N'Dàn nóng ngoài trời', 0, 3),

(65, N'https://th.bing.com/th/id/OIP.18eVIe4dpLc_llsTc5lPyQHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(65, N'https://down-vn.img.susercontent.com/file/0b7ffc47017360100fca560a179a8669', N'Góc nghiêng dàn lạnh', 0, 2),
(65, N'https://dienmay555.vn/media/product/1452_casper_inverter_185_lit_rt_200vs_2_min.jpg', N'Dàn nóng ngoài trời', 0, 3),

(66, N'https://tse3.mm.bing.net/th/id/OIP.wtIVpC4cf3SyX4fo9pICtAHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(66, N'https://cdn11.dienmaycholon.vn/filewebdmclnew/public/userupload/files/Mtsp/tu-lanh/tu-lanh-aqua-aqr-b390ma-slb-lam-lanh-da-chieu-360-do.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(66, N'https://cdn.tgdd.vn/Products/Images/166/284028/tu-mat-sanaky-inverter-350-lit-vh-3589k3-211022-052307.jpg', N'Dàn nóng ngoài trời', 0, 3),

(67, N'https://cdn.mediamart.vn/images/product/may-giat-long-ngang-lg-ai-dd-inverter-10g-fv1410s4w1_fc081745.jpg', N'Mặt trước sản phẩm', 1, 1),
(67, N'https://lh3.googleusercontent.com/ZufQSSFWE7foSH3PCN8OlkMmFIqG0XbnWvubBpWeD-EpdSrln63InPYPQZqG_-J2qzFfeONrvWzFSnZsdVWX_aCf41PdfdCl=rw', N'Góc nghiêng dàn lạnh', 0, 2),
(67, N'https://www.lg.com/content/dam/channel/wcms/vn/images/may-giat-va-may-say/fv1410s4p_aptpevn_eavh_vn_c/large12.jpg', N'Dàn nóng ngoài trời', 0, 3),

(68, N'https://tse1.mm.bing.net/th/id/OIP.JqcImxsYiEGhiYl8OJD5cQHaEI?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(68, N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-loarvwp0wnav87', N'Góc nghiêng dàn lạnh', 0, 2),
(68, N'https://www.lg.com/content/dam/channel/wcms/vn/images/may-giat/fv1412s4w_abwpevn_eavh_vn_c/gallery/DZ-9.jpg?w=800', N'Dàn nóng ngoài trời', 0, 3),

(69, N'https://cdn.mediamart.vn/images/product/may-giat-long-ngang-lg-ai-dd-inverter-10g-fv1410s4w1_fc081745.jpg', N'Mặt trước sản phẩm', 1, 1),
(69, N'https://cdn.tgdd.vn/Products/Images/1944/310434/Slider/may-giat-lg-fv1410s4m1638324579224882294.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(69, N'https://cdn.tgdd.vn/Products/Images/1944/293012/Slider/lg-inverter-10-kg-fv1410d4p-thumb-video-1920x1080.jpg', N'Dàn nóng ngoài trời', 0, 3),

(70, N'https://tse3.mm.bing.net/th/id/OIP.R7l6VTBCFCxfImoEuzgf_gHaEI?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(70, N'https://emarket.com.vn/media/product/1526_may_giat_lg_t2109vsab.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(70, N'https://bizweb.dktcdn.net/thumb/grande/100/403/584/products/2025-09-08-101017.png?v=1757301298143', N'Dàn nóng ngoài trời', 0, 3),

(71, N'https://tse4.mm.bing.net/th/id/OIP.oBVfMG537Bui6t-uuweGngHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(71, N'https://dienlanhcamerathanhdat.com/wp-content/uploads/2023/07/may-gi-t-samsung-ai-inverter-9kg-ww90tp44dsb-sv.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(71, N'https://bizweb.dktcdn.net/100/382/719/products/samsung-9kg-ww90tp44dsb-sv-1-org.jpg?v=1677216111340', N'Dàn nóng ngoài trời', 0, 3),

(72, N'https://storage.googleapis.com/teko-gae.appspot.com/media/image/2022/8/18/20220818_0cb83c69-c763-4ffd-b1e2-7fdb1ded1b4c.png', N'Mặt trước sản phẩm', 1, 1),
(72, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/480/978/products/1-8657580b-1809-4f09-82b1-0a08e48e616a.jpg?v=1701510245640', N'Góc nghiêng dàn lạnh', 0, 2),
(72, N'https://kinghome.vn/data/products/may-giat-say-samsung-9-5-kg-wd95t4046ce-sv-king-home.jpg', N'Dàn nóng ngoài trời', 0, 3),

(73, N'https://th.bing.com/th/id/OIP.ngm53RCQ5_VYGjhcxaV7zwHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(73, N'https://dienmaythienphu.vn/wp-content/uploads/2026/01/68.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(73, N'https://muahangtaikho.vn/media/product/5678_m__y_gi___t_samsung_inverter_12_kg_wa12cg5745bvsv.png', N'Dàn nóng ngoài trời', 0, 3),

(74, N'https://tse4.mm.bing.net/th/id/OIP.8sQPXc-ll06fBan7ugvUmwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(74, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ra0g-m65a1mcnfrxy34', N'Góc nghiêng dàn lạnh', 0, 2),
(74, N'https://product.hstatic.net/200000574527/product/10048924-may-giat-samsung-inverter-8-5-kg-ww85t4040ce-sv-6_1_4beeb7c25b10429db6b302633aad8b8f.png', N'Dàn nóng ngoài trời', 0, 3),

(75, N'https://tse2.mm.bing.net/th/id/OIP.6g_lRAjX69-ULa_ZyElgSwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(75, N'https://dienmaythuanthanh.vn/wp-content/uploads/2022/06/NA-FD95X1LRV.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(75, N'https://cdn2.cellphones.com.vn/x/media/catalog/product/m/a/may-giat-panasonic-inverter-9-5kg-na-fd95x1lrv_3_.png', N'Dàn nóng ngoài trời', 0, 3),

(76, N'https://cdn.mediamart.vn/images/product/may-git-lng-ngang-panasonic-inverter-10kg-na-v10fc1lvt_c8ab297e.jpg', N'Mặt trước sản phẩm', 1, 1),
(76, N'https://dienmaynhapkhaugiare.com.vn/wp-content/uploads/2023/07/May-giat-long-ngang-Panasonic-Inverter-10Kg-NA-V10FC1LVT-1024x1024.png', N'Góc nghiêng dàn lạnh', 0, 2),
(76, N'https://cdn.mediamart.vn/images/product/may-git-lng-ngang-panasonic-inverter-10kg-na-v10fc1lvt_93b54813.jpg', N'Dàn nóng ngoài trời', 0, 3),

(77, N'https://th.bing.com/th/id/OIP.3I1DEbpS8zx6g9EjW1PkDAHaFj?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(77, N'https://tse3.mm.bing.net/th/id/OIP.ASON7rjPgRWwJ3k9u1u6wgHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Góc nghiêng dàn lạnh', 0, 2),
(77, N'https://dienmaydonga.com/wp-content/uploads/2021/12/F85A4GRV-7.jpg', N'Dàn nóng ngoài trời', 0, 3),

(78, N'https://cdn11.dienmaycholon.vn/filewebdmclnew/DMCL21/Picture/Apro/Apro_product_36616/may-giat-panasonic-inverter-105-kg-nav105fc1lv-main-327810.png', N'Mặt trước sản phẩm', 1, 1),
(78, N'https://dienmaysaigon.com/wp-content/uploads/2024/07/may-giat-say-panasonic-inverter-10kg-na-v10fc1wvt-46260.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(78, N'https://dienmaynhapkhaugiare.com.vn/wp-content/uploads/2023/07/May-giat-say-Panasonic-Inverter-10-Kg-NA-V10FC1WVT-1024x1024.png', N'Dàn nóng ngoài trời', 0, 3),

(79, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/438/373/products/may-giat-casper-10-5kg-cua-ngang-wf-105i140bwc-inverter.jpg?v=1662535181050', N'Mặt trước sản phẩm', 1, 1),
(79, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd5i-lvcl22polgp9f6', N'Góc nghiêng dàn lạnh', 0, 2),
(79, N'https://dienmaytienphong.com/wp-content/uploads/2026/05/WF-105I140BWC-album.jpg', N'Dàn nóng ngoài trời', 0, 3),

(80, N'https://tse4.mm.bing.net/th/id/OIP.62SC0GDmP6YhN1SvJFUfXwHaEJ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(80, N'https://dienmaytot.net.vn/wp-content/uploads/2021/12/May-giat-Casper-WT-75N70BGA-1.png', N'Góc nghiêng dàn lạnh', 0, 2),
(80, N'https://banhangtaikho.com.vn/Images/Product/wt-75n70bga-D7270U.jpg', N'Dàn nóng ngoài trời', 0, 3),

(81, N'https://tse4.mm.bing.net/th/id/OIP.P7eYCNbRB5GDpjyRewdBUQHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(81, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/515/856/products/2-737e4f2b-5f99-400c-8bb9-de67b69799ad.jpg?v=1719392961653', N'Góc nghiêng dàn lạnh', 0, 2),
(81, N'https://dienmayan.vn/Files/216/san-pham-ngung-kinh-doanh/may-giat-casper-inverter-85-kg-wf-85i140bgb-7.jpg', N'Dàn nóng ngoài trời', 0, 3),

(82, N'https://th.bing.com/th/id/OIP.QHGKDeNmeey6_WkE5_StowHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(82, N'https://dienmaythienphu.vn/wp-content/uploads/2025/05/WF-P115VGT11.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(82, N'https://cdn11.dienmaycholon.vn/filewebdmclnew/public/userupload/files/news/may-giat/bldc-inverter-van-hanh-em-ai-tiet-kiem-dien-nang.jpg', N'Dàn nóng ngoài trời', 0, 3),

(83, N'https://bizweb.dktcdn.net/100/487/147/products/10049505-may-giat-lg-inverter-13-kg-t2313vsab-5.jpg?v=1752743001020', N'Mặt trước sản phẩm', 1, 1),
(83, N'https://dienmay555.vn/media/product/1733_m__y_gi___t_lg_inverter_13_kg_t2313vsab______nh_n___n_min.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(83, N'https://lh3.googleusercontent.com/dQoCO_yPZCfXSqJlt_LYOATLrr11PBhK6BW3chdialCwKN8_NJItvTQv2vPyo__ZvK2yws4jFETF_nV7AZ_kl27PKBhtdeC1=rw', N'Dàn nóng ngoài trời', 0, 3),

(84, N'https://dienlanhhosen247.com/server/php/files/Ariston%2020%20l%C3%ADt%202500W%20VITALY%2020%20SLIM%202.5%20FE%20(1).jpg', N'Mặt trước sản phẩm', 1, 1),
(84, N'https://cdn.tgdd.vn/Products/Images/1962/329298/Kit/gian-tiep-ariston-20-lit-2500w-vitaly-20-slim-25-fe-2024-hinh-note.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(84, N'https://cdn.tgdd.vn/Products/Images/1962/251431/Kit/gian-tiep-ariston-20-lit-2500w-vitaly-20-slim-25-fe-9.jpg', N'Dàn nóng ngoài trời', 0, 3),

(85, N'https://thietbivesinhso1.com/uploads/products/binh-nong-lanh/ariston/30l/binh-nuoc-nong-ariston-30l-vitaly.png', N'Mặt trước sản phẩm', 1, 1),
(85, N'https://dienmaythienphu.vn/wp-content/uploads/2023/09/1591b22163a98df8338eb4075565fdf2.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(85, N'https://bizweb.dktcdn.net/100/386/618/products/ava-binh-nong-lanh-ariston-sl3-20rs-25-fe-1-644fe83d-d8b9-4bc1-95f2-e198792a3eca-4e5d1a8e-1d3d-49d5-8b22-1a7323012d96.jpg?v=1724400548400', N'Dàn nóng ngoài trời', 0, 3),

(86, N'https://th.bing.com/th/id/OIP.idM0wy4V-RwVcyfUJqTDvgHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(86, N'https://thietbivesinhso1.com/uploads/products/binh-nong-lanh/ariston/20l/binh-nuoc-nong-ariston-20l-blue-slim.png', N'Góc nghiêng dàn lạnh', 0, 2),
(86, N'https://dienmayquanghanh.com/Upload/avatar/content-2024-1/Content-2024-2/ct-binh-nong-lanh-ariston-sl3-20r-25fe-20l-1.jpg', N'Dàn nóng ngoài trời', 0, 3),

(87, N'https://bandienmaytaikho.com/wp-content/uploads/2023/12/truc-tiep-4500w-aures-premium-4-5p-ivory3.jpg', N'Mặt trước sản phẩm', 1, 1),
(87, N'https://cdn.tgdd.vn/Products/Images/1962/286050/may-nuoc-nong-truc-tiep-ariston-4500w-aures-premium-45-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(87, N'https://down-vn.img.susercontent.com/file/vn-11134207-81ztc-mk3k9cwa4idee0', N'Dàn nóng ngoài trời', 0, 3),

(88, N'https://thietbivesinhso1.com/uploads/products/binh-nong-lanh/ariston/15l/binh-nuoc-nong-ariston-15l-slim.png', N'Mặt trước sản phẩm', 1, 1),
(88, N'https://dienmaythienphu.vn/wp-content/uploads/2021/10/ariston-Blue-15R-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(88, N'https://dienmaynamnhung.com/wp-content/uploads/2024/09/binh-ariston-15-lit-an2-15r.gif', N'Dàn nóng ngoài trời', 0, 3),

(89, N'https://product.hstatic.net/200000549377/product/ariston-16_233cc6f9a8ed42c5a01198f7afe65694_master.jpg', N'Mặt trước sản phẩm', 1, 1),
(89, N'https://dienmayquanghanh.com/Upload/avatar/content-2024-1/Content-2024-2/ct-binh-nong-lanh-ariston-sl3-30r-25fe-30l-2.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(89, N'https://tse1.mm.bing.net/th/id/OIP.bMi_nvWc2KnwwseNsPf19QHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(90, N'https://dienmaythienphu.vn/wp-content/uploads/2021/12/77dc15913118b737fab3802b2438d17c.jpg', N'Mặt trước sản phẩm', 1, 1),
(90, N'https://khodiennuoc.vn/images/img-ckfinder/images/binh-nong-lanh-casper-co-thuc-su-tot-khong.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(90, N'https://tse4.mm.bing.net/th/id/OIP.90qYCEzBVo5Lat8bZ1d3xQAAAA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(91, N'https://josivn.com/sites/default/files/binh-nong-lanh-casper-sh20th11-1.jpg', N'Mặt trước sản phẩm', 1, 1),
(91, N'https://spcmidea.vn/wp-content/uploads/2021/07/binh-nong-lanh-casper-thiet-ke-dep-mat-1.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(91, N'https://dienmaythienphu.vn/_next/image?url=https:%2F%2Fdienmaythienphu.vn%2Fwp-content%2Fuploads%2F2021%2F10%2Fcasper-new-SH-20TH11.jpg&w=576&q=100', N'Dàn nóng ngoài trời', 0, 3),

(92, N'https://bizweb.dktcdn.net/100/322/441/products/4-a73a75b9-5ca7-447f-848c-9c31010628eb.jpg?v=1565580714363', N'Mặt trước sản phẩm', 1, 1),
(92, N'https://dienmaythuanthanh.vn/wp-content/uploads/2021/01/CASPER-ENZO-SH-30TH11-30L.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(92, N'https://product.hstatic.net/1000400636/product/binh-nuoc-nong-casper-sh-30th11-2_e70ec2152d8a4382883716007866c167_master.png', N'Dàn nóng ngoài trời', 0, 3),

(93, N'https://dienmaythuanthanh.vn/wp-content/uploads/2021/01/15_1.jpg', N'Mặt trước sản phẩm', 1, 1),
(93, N'https://dienmaythuanthanh.vn/wp-content/uploads/2021/01/voi-sen-gan-tuong.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(93, N'https://dienmaythuanthanh.vn/wp-content/uploads/2021/01/unnamed_1__12.jpg', N'Dàn nóng ngoài trời', 0, 3),

(94, N'https://tse3.mm.bing.net/th/id/OIP.oEYXiWF5vMZ0uQwec_HACQHaJA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(94, N'https://cdn.tgdd.vn/Products/Images/1962/209747/panasonic-dh-15ham-9.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(94, N'https://tse1.mm.bing.net/th/id/OIP.VHqOWOVZMuqGXGEUq8RkUAHaG7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(95, N'https://th.bing.com/th/id/OIP.MepY_HF4kPqQTFbnn4UVYgHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(95, N'https://thietbitaigia.com/wp-content/uploads/2023/11/bang-gia-may-nuoc-nong-panasonic.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(95, N'https://thietbidienduongminh.com/wp-content/uploads/2024/11/May-nuoc-nong-truc-tiep-Panasonic-DH-4UP1VW-co-bom-tro-luc.jpg', N'Dàn nóng ngoài trời', 0, 3),

(96, N'https://down-vn.img.susercontent.com/file/vn-11134201-7r98o-lysmnxigao99b6', N'Mặt trước sản phẩm', 1, 1),
(96, N'https://thietbidienduongminh.com/wp-content/uploads/2024/11/May-nuoc-nong-truc-tiep-khong-co-bom-tro-luc-Panasonic-DH-4RL1VW-.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(96, N'https://tse1.mm.bing.net/th/id/OIP.3OhqwxnvhRnjr6GdzpifoAHaJA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Dàn nóng ngoài trời', 0, 3),

(97, N'https://tse1.mm.bing.net/th/id/OIP.3OhqwxnvhRnjr6GdzpifoAHaJA?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', N'Mặt trước sản phẩm', 1, 1),
(97, N'https://thietbidienduongminh.com/wp-content/uploads/2024/11/May-nuoc-nong-Panasonic-khong-bom-tro-luc-DH-4RL1VW-4500W.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(97, N'https://thietbitaigia.com/wp-content/uploads/2021/07/May-nuoc-nong-truc-tiep-Panasonic-DH-4RL1VW.jpg', N'Dàn nóng ngoài trời', 0, 3),

(98, N'https://spcmidea.vn/wp-content/uploads/2021/07/binh-nong-lanh-casper-sh-20th11-20-lit.jpg', N'Mặt trước sản phẩm', 1, 1),
(98, N'https://img.websosanh.vn/v2/users/dclimg/images/3ml4etp2iwd0n.jpg?compress=85', N'Góc nghiêng dàn lạnh', 0, 2),
(98, N'https://product.hstatic.net/200000311397/product/binh-nong-lanh-casper-20-lit-sh-20th11-chuyenquyen.vn-7_aeca9daf939540caa85e96acb35bdafb.jpg', N'Dàn nóng ngoài trời', 0, 3),

(99, N'https://dienmaythuanthanh.vn/wp-content/uploads/2023/09/binh-nong-lanh-ariston-andris2-15r-15-lit.jpg', N'Mặt trước sản phẩm', 1, 1),
(99, N'https://sieuthibinhnonglanh.vn/uploads/images/products/ariston/binh-nong-lanh-gian-tiep-ariston-andris2-rs-20-lit.jpg', N'Góc nghiêng dàn lạnh', 0, 2),
(99, N'https://luxbath.vn/images/products/2025/12/01/resized/binh-nong-lanh-ariston-andris2-15r-15-lit-vuong_1764557316.jpg', N'Dàn nóng ngoài trời', 0, 3),

(100, N'https://dienmaynamquan.com/wp-content/uploads/2020/07/panasonic-dh-20ham-11.jpg', N'Mặt trước sản phẩm', 1, 1),
(100, N'https://dienmaythienphu.vn/_next/image?url=https:%2F%2Fdienmaythienphu.vn%2Fwp-content%2Fuploads%2F2021%2F02%2FDH-15HAM-1.jpg&w=1920&q=100', N'Góc nghiêng dàn lạnh', 0, 2),
(100, N'https://img.websosanh.vn/v10/users/review/images/p6atvkrwd9asx/binh-nong-lanh-panasonic-2500w-dh-20hamvw-4.jpg?compress=85', N'Dàn nóng ngoài trời', 0, 3);


UPDATE dbo.Banner 
SET HinhAnh = N'https://i.pinimg.com/1200x/d9/23/4d/d9234d264f44510ec9e45533a07ef7f2.jpg'
WHERE BannerID = 1;

UPDATE dbo.Banner 
SET HinhAnh = N'https://tse2.mm.bing.net/th/id/OIP.e1xW6eqGblJYX_20o8vjZQHaEo?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
WHERE BannerID = 2; 

UPDATE dbo.Banner 
SET HinhAnh = N'https://th.bing.com/th/id/OIP.mpkDTKYQ80HSgqwyOr-H6gHaEK?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'
WHERE BannerID = 3; 
UPDATE dbo.Banner 
SET HinhAnh = N'https://th.bing.com/th/id/OIP.0x7csG6S-cTtKyU_pysTzQHaDU?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'
WHERE BannerID = 4; 

UPDATE dbo.Banner 
SET HinhAnh = N'https://i.pinimg.com/1200x/7d/38/c9/7d38c9a21a709ab494eafa3104930584.jpg'
WHERE BannerID = 5;


UPDATE dbo.BaiViet 
SET AnhDaiDien = N'https://cdn2.fptshop.com.vn/unsafe/Uploads/images/tin-tuc/168097/Originals/cach-tinh-cong-suat-dieu-hoa-trung-tam-2.jpg'
WHERE BaiVietID = 1;

UPDATE dbo.BaiViet 
SET AnhDaiDien = N'https://th.bing.com/th/id/OIP.ZqUqAPk1Prztgu1U93kpBgHaHa?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3'
WHERE BaiVietID = 2;

UPDATE dbo.BaiViet 
SET AnhDaiDien = N'https://bizweb.dktcdn.net/100/444/272/themes/845592/assets/share_fb_home.jpg?1682407335142'
WHERE BaiVietID = 3;

UPDATE dbo.BaiViet 
SET AnhDaiDien = N'https://suachuadienlanhhanoi.com.vn/wp-content/uploads/2023/12/so-sanh-may-giat-cua-ngang-va-cua-dung.jpeg'
WHERE BaiVietID = 4;

UPDATE dbo.BaiViet 
SET AnhDaiDien = N'https://tse3.mm.bing.net/th/id/OIP.0VqcvxGrNiUKaLJReAKRIwHaF7?r=0&rs=1&pid=ImgDetMain&o=7&rm=3'
WHERE BaiVietID = 5;

GO




INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Công nghệ tiết kiệm điện', N'Inverter / Eco AI Smart', N'', N'Tổng quan', 1 
FROM dbo.SanPham WHERE SanPhamID BETWEEN 39 AND 100;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Tiêu thụ điện trung bình', N'0.85', N'kW/h', N'Năng lượng', 2 
FROM dbo.SanPham WHERE SanPhamID BETWEEN 39 AND 100;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Môi chất lạnh / Gas', N'R32 / R600a', N'', N'Vận hành', 3 
FROM dbo.SanPham WHERE SanPhamID BETWEEN 39 AND 100;

INSERT INTO dbo.ThongSoKyThuat (SanPhamID, TenThongSo, GiaTri, DonVi, NhomThongSo, ThuTu)
SELECT SanPhamID, N'Tiêu chuẩn chống nước / ăn mòn', N'Dàn mạ vàng GoldFin / IPX4', N'', N'Thiết kế', 4 
FROM dbo.SanPham WHERE SanPhamID BETWEEN 39 AND 100;

GO
