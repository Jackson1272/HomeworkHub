#!/data/data/com.termux/files/usr/bin/bash
# Copy job logs to Downloads so they can be shared for debugging.
mkdir -p ~/storage/downloads/hw_log
cp ~/hw_log/*.txt ~/storage/downloads/hw_log/ && echo "Logs copied to Downloads/hw_log"
