# Multi-Zone Clock (Tkinter)

A lightweight, touch-friendly **multi-timezone digital clock** written in Python using Tkinter.

Designed for Linux devices such as **Raspberry Pi** with small horizontal displays (e.g., 7" touchscreen). Displays 3 different U.S. time zones simultaneously.

![2026-01-02-02-23-11-957(1)](https://github.com/user-attachments/assets/e8739896-9356-489d-bca7-346999a6d9bc)

---

## Features

* Displays **PST, MST, CST, EST** at the same time
* Digital clock layout (horizontal orientation)
* 12-hour / 24-hour toggle
* AM/PM indicators (shown in both modes)
* Night-mode between 22:00–06:00
* Touch-controls & mouse freindly (no keyboard required)
* Long-press exit safety (prevents accidental closes)

---

## Supported Systems

* **Linux only**
* Tested on:

  * Raspberry Pi OS
  * Debian-based distributions

> Windows and macOS are **not supported at this time**.

---

## Requirements

### 1. System packages

Tkinter is required.

Run:

```bash
sudo apt update
sudo apt install -y python3 python3-tk
```

That’s it.
No pip packages are required.

### For RHEL Distros

```
sudo dnf install -y python3 python3-tkinter
```
---

### 2. Python version

* Python **3.8 or newer** recommended

Check with:

```bash
python3 --version
```

---

## Downloading the Script

Clone the repository:

```bash
git clone https://github.com/MarcialSegura/time_zone_clock.git
cd time_zone_clock
```

Or download just the file:

```bash
wget https://raw.githubusercontent.com/MarcialSegura/time_zone_clock/main/multizone_clock.py
```

---

## Running the Clock

Make the script executable:

```bash
chmod +x multizone_clock.py
```

Run it:

```bash
./multizone_clock.py
```

Or explicitly with Python:

```bash
python3 multizone_clock.py
```

---

## Touchscreen & Display Orientation

* The UI is designed for **horizontal (landscape) displays**
* Works best on **7" screens**
* No keyboard required
* Mouse or touchscreen input supported

If using Raspberry Pi, ensure display rotation is set correctly at the OS level.

---

## Exiting the App

To prevent accidental exits:

* Press and **hold anywhere on the screen or mouse click** for 1 second.

---

## Version Control & Reuse 

This project is intentionally simple so it can be:

* Re-installed on other Linux devices
* Extended later (systemd service, kiosk mode, Docker, etc.)

---

## Additional Testing

Show casing app running on CentOS VM via Proxmox.
![Adobe Express - 2026-01-10 19-14-31](https://github.com/user-attachments/assets/3eb357df-c2c2-4d0b-8557-777740e9b421)


