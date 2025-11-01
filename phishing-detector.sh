#!/bin/bash

echo "🕵️‍♂️ Phishing Detector (Offline Mode)"
echo "🔗 সন্দেহজনক URL বা ইমেইল দিন (exit লিখে বের হতে পারবেন)"

while true; do
    read -p ">> " input
    [[ "$input" == "exit" || "$input" == "quit" ]] && echo "👋 বিদায়!" && break

    echo "🔍 বিশ্লেষণ চলছে..."

    echo "$input" | grep -Eiq "login|verify|update|secure|account|bank|paypal|reset|confirm" && echo "⚠️ সন্দেহজনক keyword পাওয়া গেছে"
    echo "$input" | grep -Eq "http[s]?://[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" && echo "⚠️ IP-based URL → phishing হতে পারে"
    echo "$input" | grep -Eiq "\.com\.secure|\.net\.login|\.xyz\.verify" && echo "⚠️ Obfuscated domain → সন্দেহজনক"

    echo "🌐 DuckDuckGo Search:"
    echo "🔗 https://duckduckgo.com/?q=$(echo $input | sed 's/ /+/g')"
    echo ""
done
