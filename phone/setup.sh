#!/data/data/com.termux/files/usr/bin/bash
# One-time Termux setup for an HW phone (S22 or S25).
# Usage: bash setup.sh            (watches /storage/emulated/0/HW)
#        HW_DIR=/some/dir bash setup.sh
# Never point HW_DIR at DCIM/Camera: every photo would be sent to Claude.
set -e
HW_DIR="${HW_DIR:-/storage/emulated/0/HW}"
case "$HW_DIR" in *DCIM*|*Camera*) echo "Refusing camera folder: $HW_DIR"; exit 1;; esac

pkg update -y && pkg upgrade -y
pkg install -y python python-pillow curl
[ -d ~/storage ] || { termux-setup-storage; sleep 5; }
mkdir -p "$HW_DIR"

cat > ~/go.sh <<EOS
cd ~
. ~/.hwkey
termux-wake-lock
HW_DIR=$HW_DIR python ~/hw9.py
EOS
cat > ~/test.sh <<EOS
cd ~
termux-wake-lock
HW_DIR=$HW_DIR HW_MODE=receive python ~/hw9.py
EOS
cp -f "$(dirname "$0")/update.sh" ~/update.sh 2>/dev/null || true

bash ~/update.sh || echo "!! hw9.py not found yet - put it in Downloads and run: bash ~/update.sh"
python -c "import PIL; print('setup OK')"
[ -f ~/.hwkey ] || echo "Next: echo 'export ANTHROPIC_API_KEY=\"sk-ant-...\"' > ~/.hwkey && chmod 600 ~/.hwkey"
