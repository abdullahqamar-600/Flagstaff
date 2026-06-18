#!/bin/bash
cd /Users/usama.shakeel/Downloads/flagstaff
python3 -m http.server ${PORT:-8081}
