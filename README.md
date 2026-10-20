# ❄️ Website Bán & Quản Lý Thiết Bị Điện Lạnh Huy Sơn (`BTL_LapTrinhWeb`)

![ASP.NET Core MVC](https://img.shields.io/badge/ASP.NET%20Core%20MVC-8.0%2B-512BD4?style=for-the-badge&logo=dotnet&logoColor=white)
![Entity Framework Core](https://img.shields.io/badge/EF%20Core-SQL%20Server-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Bootstrap 5](https://img.shields.io/badge/Bootstrap-5.3-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)
![JavaScript AJAX](https://img.shields.io/badge/AJAX-Fetch%20API-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

Hệ thống thương mại điện tử và quản lý kho vận hành chuyên biệt cho ngành Điện Lạnh (Điều hòa không khí, Tủ lạnh, Máy giặt, Bình nóng lạnh)**. Dự án được xây dựng trên nền tảng **ASP.NET Core MVC** kết hợp **Entity Framework Core**, áp dụng cơ chế phân quyền 3 tầng (**Role-Based Access Control: `Admin` - `Staff` - `Customer`**) và kiểm soát tồn kho thời gian thực.

---

##  Điểm Nổi Bật Của Hệ Thống

### 1. Phân hệ Khách hàng (`Customer`)
* **Danh mục & Tìm kiếm đa tiêu chí:** Duyệt sản phẩm theo 4 nhóm thiết bị chính (*Điều hòa, Tủ lạnh, Máy giặt, Bình nóng lạnh*), trang *Sản phẩm nổi bật*, *Sản phẩm mới lên kệ*. Tìm kiếm thông minh theo tên, mã sản phẩm, mã Model, công suất hoặc thương hiệu kèm bộ lọc sắp xếp giá và **phân trang tự động**.
* **Chuyên gia Tư vấn Kỹ thuật tự động (`/Home/TechnicalAdvice`):** Thuật toán phân tích diện tích phòng ($\text{m}^2$), số lượng thành viên sử dụng và ngân sách để khuyến nghị công suất chuẩn xác (`BTU / HP`, `Lít`, `Kg`), đưa ra lưu ý lắp đặt và gợi ý sản phẩm trực tiếp từ CSDL kèm cẩm nang FAQ.
* **Bảng giá Vật tư & Công lắp đặt (`/Home/PriceList`):** Niêm yết minh bạch 42 hạng mục nhân công, ống đồng, dây điện, bảo dưỡng kèm bộ lọc tra cứu tức thì (Live Filter).
* **Giỏ hàng AJAX & Kiểm soát Tồn kho (`SoLuongTon`):** Thêm vào giỏ, tăng/giảm số lượng không cần tải lại trang. Tự động chặn đặt vượt số lượng tồn kho thực tế và khóa nút mua đối với sản phẩm tạm hết hàng.
* **Áp dụng Mã khuyến mãi & Thanh toán đa phương thức:** Kiểm tra điều kiện mã giảm giá (`Percent` hoặc `Amount`) trực tiếp qua AJAX tại trang Giỏ hàng và trang Thanh toán. Hỗ trợ **Thanh toán khi nhận hàng (COD)** và **Chuyển khoản quét mã VietQR / VNPAY tự động** theo đúng số tiền đơn hàng.
* **Quản lý Hồ sơ & Đơn mua (`/Account/Profile`):** Cập nhật thông tin cá nhân, sổ địa chỉ nhận hàng mặc định, đổi mật khẩu, xem chi tiết các sản phẩm trong đơn và **tự hủy đơn hàng** khi đơn đang ở trạng thái *Chờ xác nhận (`Pending`)* (tự động hoàn lại số lượng vào kho).

### 2. Phân hệ Quản trị & Vận hành (`Admin` & `Staff`)
* **Nguyên tắc Chống xung đột lợi ích (Separation of Duties):** Tài khoản `Admin` và `Staff` chỉ được phép xem trước (Preview) giao diện bán hàng, bị khóa toàn bộ chức năng Giỏ hàng và Đặt mua hàng.
* **Bảng điều khiển thống kê (`/Admin`):** Hiển thị các chỉ số KPI vận hành, danh sách đơn hàng mới nhất, cảnh báo sản phẩm sắp hết kho và biểu đồ trực quan (**Chart.js**).
* **Quản lý Đơn hàng & Hoàn kho tự động (`/Admin/Orders`):** Lọc đơn theo trạng thái, cập nhật trạng thái đơn hàng & thanh toán, lưu vết nhân sự xử lý vào bảng `LichSuDonHang`. Tự động **cộng hoàn trả lại tồn kho (`SoLuongTon`) và lượt dùng mã khuyến mãi** khi đơn hàng chuyển sang trạng thái *Hủy (`Cancelled`)*.
* **Quản lý Kho hàng & Sản phẩm (`/Admin/Products`):** Nhập thêm hàng vào kho (`+Nhập`), điều chỉnh giá bán nhanh trên từng dòng, thêm sản phẩm mới vào kho và ẩn/hiện trạng thái kinh doanh.
* **Quản lý Khách hàng (`/Admin/Customers`) & Bài viết (`/Admin/Posts`):** Tra cứu khách hàng, khóa/mở khóa tài khoản vi phạm (`TrangThai = 0` chặn đăng nhập ngay lập tức); đăng và quản lý tin tức tư vấn điện lạnh.
* **Quản trị Cấp cao (Chỉ dành riêng cho `Admin`):**
  * **Biểu đồ Doanh thu 6 tháng & Tỷ lệ đơn hàng** trên Dashboard.
  * **Quản lý Nhân sự (`/Admin/Staffs`):** Cấp tài khoản mới cho `Staff` / `Admin`, khóa hoặc mở khóa nhân viên.
  * **Quản lý Mã khuyến mãi (`/Admin/Coupons`):** Phát hành mã giảm giá mới, thiết lập đơn tối thiểu, giới hạn lượt dùng và hạn sử dụng.

---

## 🔐 Ma Trận Phân Quyền 3 Vai Trò (RBAC)

| Chức năng / Nghiệp vụ                                        | `Customer` (Khách hàng)  | `Staff` (Nhân viên)  | `Admin` (Quản trị viên)   |
|                          :---                                |           :---:          |           :---:      |         :---:             |
| Xem sản phẩm, Tư vấn kỹ thuật, Bảng giá lắp đặt              |       YES                |  *(Chế độ Xem)*      |  *(Chế độ Xem)*           |
| Giỏ hàng, Áp mã giảm giá, Đặt hàng, Hủy đơn cá nhân          |       YES                |  *(Khóa mua hàng)*   |  *(Khóa mua hàng)*        |
| Quản lý Đơn hàng (Duyệt đơn, Đổi trạng thái, Hoàn kho)       |       NO                 |         YES          |        YES                |
| Quản lý Kho & Sản phẩm (Nhập thêm tồn kho, Sửa giá, Thêm SP) |       NO                 |         YES          |        YES                |
| Quản lý Khách hàng (Khóa / Mở khóa tài khoản `Customer`)     |       NO                 |         YES          |        YES                |
| Quản lý Bài viết Tin tức (Đăng bài, Xóa bài)                 |       NO                 |         YES          |        YES                |
| **Xem Tổng Doanh Thu & Biểu đồ tài chính (`Chart.js`)**      |       NO                 |         NO           |  **(Chỉ Admin)**          |
| **Quản lý Nhân sự (`/Admin/Staffs`)**                        |       NO                 |         NO           |  **(Chỉ Admin)**          |
| **Quản lý Mã khuyến mãi (`/Admin/Coupons`)**                 |       No                 |         NO           |  **(Chỉ Admin)**          |

---

## 🛠️ Công Nghệ Sử Dụng

* **Backend:** C#, ASP.NET Core MVC (`.NET 8.0 / 9.0`)
* **ORM & Database:** Entity Framework Core, Microsoft SQL Server (`DienLanhHuySon`)
* **Authentication & Security:** Cookie-based Authentication (`HuySonCookie`), Role-based Authorization (`[Authorize(Roles = "Admin,Staff")]`)
* **Frontend:** Razor Views (`.cshtml`), HTML5, CSS3, Bootstrap 5, FontAwesome 6.4, JavaScript (ES6 Fetch API), Chart.js
* **Tích hợp thanh toán:** VietQR API (Tự động sinh mã QR chuyển khoản theo số tiền và mã đơn hàng)

---

## 📂 Cấu Trúc Thư Mục Dự Án

```text
BTL_LapTrinhWeb/
├── Controllers/
│   ├── AccountController.cs      # Đăng nhập, Đăng ký, Hồ sơ, Sổ địa chỉ, Khách hủy đơn
│   ├── AdminController.cs        # Dashboard, Quản lý Đơn, Kho SP, Khách, Staff, Bài viết, Coupon
│   ├── CartController.cs         # Giỏ hàng AJAX, Kiểm tra tồn kho SoLuongTon
│   ├── CheckoutController.cs     # Mua ngay, Áp mã giảm giá, Đặt hàng COD & VietQR
│   ├── HomeController.cs         # Trang chủ, Bảng giá lắp đặt, Chuyên gia Tư vấn kỹ thuật, Tin tức
│   └── ProductController.cs      # 4 trang Danh mục, SP Nổi bật, SP Mới, Tìm kiếm, Chi tiết SP
├── Models/
│   ├── DienLanhHuySonContext.cs  # DbContext kết nối 17 bảng SQL Server
│   ├── AdminDashboardViewModel.cs
│   ├── CheckoutViewModel.cs
│   ├── HomeViewModel.cs
│   ├── LoginViewModel.cs
│   ├── ProductListViewModel.cs
│   ├── RegisterViewModel.cs
│   ├── TechnicalAdviceViewModel.cs
│   └── [17 Entities Models]      # SanPham, DonHang, NguoiDung, KhuyenMai, GioHang...
├── Views/
│   ├── Account/                  # Login.cshtml, Register.cshtml, Profile.cshtml
│   ├── Admin/                    # Index, Orders, Products, Customers, Staffs, Posts, Coupons
│   ├── Cart/                     # Index.cshtml
│   ├── Checkout/                 # Checkout.cshtml, ThanhToanQR.cshtml, DatHangThanhCong.cshtml
│   ├── Home/                     # Index, PriceList, TechnicalAdvice, NewsDetails
│   ├── Product/                  # AirConditioner, Refrigerator, WashingMachine, WaterHeater,
│   │                             # FeaturedProducts, NewProducts, Search, ProductDetail
│   └── Shared/                   # _Layout.cshtml (Bán hàng), _AdminLayout.cshtml (Quản trị)
├── wwwroot/                      # CSS, JS, Bootstrap, Hình ảnh tĩnh
├── appsettings.json              # Cấu hình chuỗi kết nối DefaultConnection
└── Program.cs                    # Cấu hình DI, Cookie Authentication & Routing
```

---

## 🚀 Hướng Dẫn Cài Đặt & Chạy Dự Án

### Bước 1: Clone dự án về máy
```bash
git clone [https://github.com/](https://github.com/)<username>/<repository-name>.git
cd BTL_LapTrinhWeb
```

### Bước 2: Khởi tạo Cơ sở dữ liệu SQL Server
1. Mở **SQL Server Management Studio (SSMS)**.
2. Mở file script SQL khởi tạo CSDL **`DienLanhHuySon`** và nhấn **Execute (`F5`)** để tạo 17 bảng cùng dữ liệu mẫu.
3. Kiểm tra chuỗi kết nối trong file `appsettings.json`:
   ```json
   "ConnectionStrings": {
     "DefaultConnection": "Server=YOUR_SERVER_NAME;Database=DienLanhHuySon;Trusted_Connection=True;TrustServerCertificate=True;"
   }
   ```

### Bước 3: Build và Chạy ứng dụng
* **Cách 1 (Visual Studio 2022):** Mở file `BTL_LapTrinhWeb.sln` $\rightarrow$ Nhấn `Ctrl + Shift + B` để Build $\rightarrow$ Nhấn `F5` (hoặc `Ctrl + F5`) để chạy.
* **Cách 2 (.NET CLI):**
  ```bash
  dotnet restore
  dotnet build
  dotnet run
  ```

---

## 🔑 Tài Khoản Dùng Thử (Demo Accounts)

Sau khi chạy script CSDL mẫu, bạn có thể đăng nhập để kiểm thử phân quyền với các tài khoản sau:

| Vai trò (Role) | Email đăng nhập | Mật khẩu | Quyền hạn khi đăng nhập |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin@dienlanhhuyson.vn` | `123456` | Vào thẳng `/Admin`, xem biểu đồ doanh thu, quản lý Staff, Khuyến mãi, Kho, Đơn hàng |
| **Staff** | `staff@dienlanhhuyson.vn` | `123456` | Vào thẳng `/Admin`, xử lý đơn hàng, nhập kho SP, đăng bài viết (ẩn doanh thu & Staff) |
| **Customer** | `minhanh@example.com` | `123456` | Mua sắm, thêm giỏ hàng, áp mã `WELCOME5` / `HUYSON200K`, đặt hàng & theo dõi đơn |

---

## 📞 Thông Tin Liên Hệ Bài Tập Lớn
* **Sinh Viên: Ninh Quang Huy - 0325532335
* **Sinh Viên: Bùi Bảo Sơn - 
