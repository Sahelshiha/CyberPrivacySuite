#!/bin/bash

echo "🔁 Starting VPN Rotate Bot (ExpressVPN Required)"

while true; do
    echo "🔐 Connecting to smart location..."
    expressvpn connect smart
    echo "🌍 Current IP:"
    curl -s https://api.ipify.org
    echo "⏳ Waiting 10 minutes before next rotate..."
    sleep 600
    echo "🔄 Disconnecting VPN..."
    expressvpn disconnect
done
