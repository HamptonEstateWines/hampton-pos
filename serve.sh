#!/bin/bash
# Hampton POS — local HTTP server
# Serves the POS on port 8080 so the iPad can print directly to the Epson printer.
# Access from iPad: http://192.168.20.16:8080
cd "$(dirname "$0")"
echo "Hampton POS running at http://192.168.20.16:8080"
python3 -m http.server 8080
