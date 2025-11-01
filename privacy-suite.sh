#!/bin/bash

echo "🛡️ Privacy Suite Initializing..."

CONFIG="/etc/proxychains4.conf"
if [ -f "$CONFIG" ]; then
    echo "📄 Fixing proxychains config..."
    sed -i 's/^#dynamic_chain/dynamic_chain/' "$CONFIG"
    sed -i '/\[ProxyList\]/a socks5 127.0.0.1 9050' "$CONFIG"
    echo "✅ Proxychains config updated"
else
    echo "❌ Config file not found: $CONFIG"
fi

echo "🧅 Starting Tor..."
tor & sleep 10

echo -n "🔐 VPN Status: "
pgrep expressvpn > /dev/null && echo "✅ VPN is running" || echo "❌ VPN not detected"

echo -n "🧅 Tor Status: "
pgrep tor > /dev/null && echo "✅ Tor is running" || echo "❌ Tor not running"

echo -n "🔗 Proxychains Config: "
grep -q "socks5 127.0.0.1 9050" "$CONFIG" && echo "✅ Tor proxy configured" || echo "⚠️ Tor proxy missing"

echo "🌐 External IP via proxychains:"
proxychains curl -s https://api.ipify.org || echo "❌ Proxychains IP check failed"

echo "🔍 Tor Exit Node Info:"
proxychains curl -s https://check.torproject.org | grep -E "Your IP address appears to be|Congratulations" || echo "❌ Tor check failed"

echo "✅ Privacy Suite Complete."
