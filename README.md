# IBM cloud function

## Giới thiệu

Là dịch vụ cho phép chúng ta chạy mã mà không cần quan tâm đến server (FAAS). Dịch vu cho phép 5 triệu lần thực thi 1 tháng

## Node function

Với các hàm cơ bản ta có thể viết code ngay trên giao diện của ibm

Với các hàm phức tạp thì cần cấu hình để build thành file sử dụng webpack rồi deploy.

Mình sử dụng terrafrom để deploy như sau:

```hcl
resource "ibm_function_action" "nodehello" {
  name      = "hello-terraform"
  namespace = "Namespace-V3w"
  publish   = true

  user_defined_annotations = <<EOF
    [
      {
        "key": "web-export",
        "value": true
      }
    ]
  EOF

  limits {
    timeout = 60000
    memory  = 256
  }

  exec {
    kind = "nodejs:16"
    code = file("./web/dist/bundle.js")
  }
}
```

Đoạn code trên tạo ra 1 action có tên là hello-terraform ở namespace Namespace-V3w

## Go function

Với go thì có thể deploy 1 file go hoặc zip thử mục chưa file go và go mod rồi deploy

## Python function

Với python thì có thể deploy 1 file python.

Với các hàm phức tạp khi deploy cần zip file main và virtualenv rồi deploy.

