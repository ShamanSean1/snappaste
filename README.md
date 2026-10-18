# SnapPaste

Spot a bug, tap a key — the screenshot lands right in your AI chat.

You're testing your app, you see something wrong, you **double-tap ⌘**. SnapPaste grabs the screen, jumps back to Claude / ChatGPT / whatever you were just in, and pastes it into the message box.

- **Double-tap ⌘** — whole screen
- **Double-tap ⌥** — drag to select an area

## Install

Paste this into Terminal:

```sh
curl -fsSL https://github.com/ShamanSean1/snappaste/releases/latest/download/install.sh | sh
```

SnapPaste opens with a one-minute tour. Run the same command again any time to update.

Works on Apple Silicon Macs (macOS 12.3+) and Intel Macs (macOS 13+).

<details>
<summary>Rather download it manually?</summary>

Grab `SnapPaste.zip` from the [latest release](https://github.com/ShamanSean1/snappaste/releases/latest), unzip, and drag SnapPaste into Applications. macOS will warn that it can't verify the developer the first time:

- **macOS 15 or newer:** click Done, then System Settings → Privacy & Security → scroll down → **Open Anyway**.
- **macOS 14 or older:** right-click SnapPaste → Open → Open.
</details>

## Uninstall

Quit SnapPaste (menu bar icon → Quit), then drag it from Applications to the Trash.
