#!/data/data/com.termux/files/usr/bin/bash
# Refresh ~/hw9.py. Prefers a copy in Downloads; falls back to this repo's main branch.
set -e
SRC=~/storage/downloads/hw9.py
URL=https://raw.githubusercontent.com/Jackson1272/HomeworkHub/main/hw9.py
if [ -f "$SRC" ]; then
  cp -f "$SRC" ~/hw9.py && echo "hw9.py updated from Downloads"
elif curl -fsSL "$URL" -o ~/hw9.py.new; then
  mv ~/hw9.py.new ~/hw9.py && echo "hw9.py updated from GitHub"
else
  rm -f ~/hw9.py.new; exit 1
fi
python -m py_compile ~/hw9.py && echo "hw9.py compiles OK"
