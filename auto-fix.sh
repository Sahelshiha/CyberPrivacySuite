#!/bin/bash

echo "🔧 Starting Auto-Fix for Proxychains + Tor"

CONFIG="/etc/proxychains4.conf"

if [ -f "$CONFIG" ]; then
    echo "📄 Editing proxychains config..."
    sed -i 's/^#dynamic_chain/dynamic_chain/' "$CONFIG"
    sed -i '/\[ProxyList\]/a socks5 127.0.0.1 9050' "$CONFIG"
    echo "✅ Proxychains config updated"
else
    echo "❌ Config file not found: $CONFIG"
    exit 1
fi

echo "🧅 Starting Tor..."
tor &

echo "🌐 Checking IP via proxychains:"
proxychains curl ifconfig.me || echo "❌ Proxychains curl failed"

echo "✅ Auto-Fix complete."
