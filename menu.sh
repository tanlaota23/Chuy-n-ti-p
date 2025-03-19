#!/bin/bash

while true; do
    clear
    echo "========================"
    echo "      Quản lý Realm Proxy-tltvpn"
    echo "========================"
    echo "1. Cài đặt chuyển tiếp"
    echo "2. Reload dịch vụ  systemctl daemon-reload"
    echo "3. Bật và khởi động dịch vụ  systemctl enable realm && systemctl start realm"
    echo "4. Khởi động lại dịch vụ"
    echo "5. Kiểm tra trạng thái dịch vụ"
    echo "6. Chỉnh sửa cấu hình chuyển tiếp"
    echo "0. Thoát"
    echo "========================"
    read -p "Chọn một tùy chọn: " choice

    case "$choice" in
        1)
            bash -c "$(wget -qO- https://raw.githubusercontent.com/tanlaota23/Chuy-n-ti-p/main/Ct1)"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        2)
            systemctl daemon-reload
            echo "✅ Đã reload dịch vụ."
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        3)
            systemctl enable realm && systemctl start realm
            echo "✅ Đã bật và khởi động Realm!"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        4)
            systemctl restart realm
            echo "✅ Đã khởi động lại Realm!"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        5)
            systemctl status realm
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        6)
            nano /root/realm.toml
            systemctl restart realm
            echo "✅ Đã cập nhật cấu hình và khởi động lại Realm!"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        0)
            echo "👋 Thoát chương trình."
            exit 0
            ;;
        *)
            echo "❌ Lựa chọn không hợp lệ! Vui lòng nhập lại."
            read -p "Nhấn Enter để tiếp tục..."
            ;;
    esac
done
