#!/bin/bash
# Hampton POS — Local Print Server
# Double-click this file to start. Keep this window open while taking orders.
clear
echo "======================================"
echo "  HAMPTON ESTATE WINES — POS SERVER"
echo "======================================"
echo ""
echo "  Open on iPad:"
echo "  http://192.168.20.16:8080"
echo ""
echo "  Printer IP: 192.168.20.9"
echo "  Direct Epson printing: ENABLED"
echo ""
echo "  Press Ctrl+C to stop the server."
echo "======================================"
echo ""
cd "/Users/starlight/Desktop/HAMPTON POS"
python3 -m http.server 8080
