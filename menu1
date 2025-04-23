#!/bin/bash

while true; do
    clear
    echo "==========================================="
    echo "        QUẢN LÝ REALM PROXY - TLTVPN"
    echo "==========================================="
    echo " 1. Cài đặt chuyển tiếp Realm"
    echo " 2. Reload & Khởi động Realm"
    echo " 3. Kiểm tra trạng thái Realm"
    echo " 4. Chỉnh sửa cấu hình Realm"
    echo " 5. Kích hoạt BBR tăng tốc mạng"
    echo " 6. Đặt mật khẩu mới cho VPS"
    echo " 0. Thoát"
    echo "==========================================="
    read -p ">> Nhập lựa chọn của bạn: " choice

    case "$choice" in
        1)
            echo "🔧 Đang tiến hành cài đặt chuyển tiếp Realm..."
            bash -c "$(wget -qO- https://raw.githubusercontent.com/tanlaota23/Chuy-n-ti-p/main/Ct1)"
            echo "✅ Cài đặt hoàn tất."
            read -p "Nhấn Enter để quay lại menu..."
            ;;
        2)
            echo "🔄 Reload & khởi động Realm..."
            systemctl daemon-reload && systemctl enable --now realm && systemctl restart realm
            echo "✅ Realm đã được reload và khởi động lại."
            read -p "Nhấn Enter để quay lại menu..."
            ;;
        3)
            echo "📋 Trạng thái dịch vụ Realm:"
            systemctl status realm
            read -p "Nhấn Enter để quay lại menu..."
            ;;
        4)
            echo "✏️ Đang mở cấu hình Realm..."
            nano /root/realm.toml
            echo "🔄 Khởi động lại Realm với cấu hình mới..."
            systemctl restart realm
            echo "✅ Đã cập nhật cấu hình và restart Realm."
            read -p "Nhấn Enter để quay lại menu..."
            ;;
        5)
            echo "🚀 Kích hoạt BBR tăng tốc mạng..."
            modprobe tcp_bbr
            echo "tcp_bbr" | tee -a /etc/modules-load.d/modules.conf
            echo "net.core.default_qdisc=fq" | tee -a /etc/sysctl.conf
            echo "net.ipv4.tcp_congestion_control=bbr" | tee -a /etc/sysctl.conf
            sysctl -p
            echo "✅ BBR đã được kích hoạt thành công."
            read -p "Nhấn Enter để quay lại menu..."
            ;;
        6)
            echo "🔐 Đặt lại mật khẩu cho VPS..."
            bash <(curl -H "Authorization: token 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" https://raw.githubusercontent.com/Duyvj/code-/main/setpass.sh)
            echo "✅ Mật khẩu VPS đã được thay đổi!"
            read -p "Nhấn Enter để quay lại menu..."
            ;;
        0)
            echo "👋 Cảm ơn bạn đã sử dụng. Hẹn gặp lại!"
            exit 0
            ;;
        *)
            echo "❌ Lựa chọn không hợp lệ. Vui lòng thử lại!"
            read -p "Nhấn Enter để quay lại menu..."
            ;;
    esac
done
