#!/bin/bash

echo "💬 Shell Helper: Command Suggestions (Bengali)"
echo "🔍 কী করতে চাও? লিখো: vpn, tor, proxy, update, exit"

while true; do
    read -p ">> " cmd
    [[ "$cmd" == "exit" ]] && echo "👋 বিদায়!" && break

    case "$cmd" in
        vpn) echo "🔐 VPN চালাতে: expressvpn connect smart" ;;
        tor) echo "🧅 Tor চালাতে: tor &" ;;
        proxy) echo "🔗 Proxychains দিয়ে চালাতে: proxychains curl ifconfig.me" ;;
        update) echo "📦 Update করতে: apt update && apt upgrade -y" ;;
        *) echo "❓ অজানা কমান্ড: $cmd" ;;
    esac
done
