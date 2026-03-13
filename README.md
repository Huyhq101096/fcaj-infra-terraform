# Terraform Infrastructure Project

## Mục tiêu
Đây là cấu trúc dự án Terraform đơn giản, phù hợp cho:

- Học Terraform theo hướng thực tế
- Tách rõ từng phần hạ tầng
- Dễ mở rộng sau này khi cần thêm môi trường như `dev`, `staging`, `prod`
- Dễ bảo trì và đọc hiểu hơn so với việc viết tất cả vào một file

Project này hiện chỉ phục vụ cho **một môi trường duy nhất**, nên cấu trúc sẽ gọn hơn, chưa cần tách riêng thư mục `dev` hoặc `prod`.

---

# Project Structure

```bash
terraform-infra/
├── README.md
├── .gitignore
├── versions.tf
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── locals.tf
├── network.tf
├── security.tf
├── compute.tf
├── database.tf
├── iam.tf
├── outputs.tf
└── modules/
```


---

## Giải thích từng file

Cấu trúc này chia Terraform theo **chức năng hạ tầng** thay vì dồn toàn bộ vào một file lớn.  
Cách tổ chức này giúp project:

- Dễ đọc
- Dễ bảo trì
- Dễ tìm đúng phần cần chỉnh sửa
- Thuận tiện mở rộng thêm tài nguyên trong tương lai

### 1. `providers.tf` nói Terraform sẽ làm việc với ai và bằng phiên bản nào

### 2. `variables.tf` định nghĩa các đầu vào mà project cần

### 3. `terraform.tfvars` gán giá trị thật cho các đầu vào đó

### 4. `locals.tf` gom các giá trị dùng chung để tránh lặp code

### 5. `main.tf` là nơi gọi module hoặc khai báo resource chính

### 6. `outputs.tf` xuất ra các giá trị quan trọng sau khi apply xong


## Setup aws profile
cd enviroment/dev
run : $env:AWS_PROFILE = "fcaj-dev"
run : aws configure --profile fcaj-dev

echo $env:AWS_PROFILE : xem đang sử dụng profile nào
aws sts get-caller-identity : xem đang sử dụng account nào
$env:AWS_PROFILE = "fcaj-dev" : đổi thông tin profile đang sử dụng

aws configure --profile fcaj-dev : tạo và config profile
aws configure list-profiles : xem list profile
aws sts get-caller-identity --profile fcaj-dev : xem thông tin