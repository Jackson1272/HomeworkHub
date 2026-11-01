# HomeworkHub

Phone-side homework solver (`hw9.py`): drop a photo of a problem into the phone's `HW` folder.
The phone sends it to Claude and pushes the solution to your watch through ntfy.

## Phone setup (Termux, F-Droid build)
1. Set Termux's battery use to Unrestricted and add it to Never auto sleeping apps.
2. Put `hw9.py` and the `phone/` scripts in Downloads, then:
   ```bash
   bash ~/storage/downloads/setup.sh
   ```
3. Save your API key once:
   ```bash
   echo 'export ANTHROPIC_API_KEY="sk-ant-..."' > ~/.hwkey && chmod 600 ~/.hwkey
   ```
4. Free test (no API call): `bash ~/test.sh`. Normal run: `bash ~/go.sh`.
5. Update the script: `bash ~/update.sh`. Share logs: `bash ~/storage/downloads/pull_logs.sh`.

**Never point `HW_DIR` at the camera folder. `setup.sh` refuses to.**

This repo is public: the API key stays in `~/.hwkey` on the phone and is never committed.
