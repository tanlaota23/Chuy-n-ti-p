#!/bin/bash

while true; do
    clear
    echo "============================"
    echo "       Quản lý Realm Proxy"
    echo "============================"
    echo "1. Cài đặt chuyển tiếp"
    echo "2. Reload dịch vụ"
    echo "3. Bật và khởi động dịch vụ"
    echo "4. Khởi động lại dịch vụ"
    echo "5. Kiểm tra trạng thái dịch vụ"
    echo "0. Quay lại menu chính"
    echo "============================"
    read -p "Chọn một tùy chọn: " choice

    case "$choice" in
        1)
            bash -c "$(wget -qO- https://raw.githubusercontent.com/tanlaota23/Chuy-n-ti-p/main/Ct1)"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        2)
            systemctl daemon-reload
            echo "Đã reload dịch vụ!"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        3)
            systemctl enable realm && systemctl start realm
            echo "Đã bật và khởi động Realm!"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        4)
            systemctl restart realm
            echo "Đã khởi động lại Realm!"
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        5)
            systemctl status realm
            read -p "Nhấn Enter để tiếp tục..."
            ;;
        0)
            echo "Quay lại menu chính..."
            sleep 1
            continue
            ;;
        *)
            echo "Lựa chọn không hợp lệ! Vui lòng nhập lại."
            sleep 1
            ;;
    esac
done
