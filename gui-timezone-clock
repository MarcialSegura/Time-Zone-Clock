#!/usr/bin/env python3
import tkinter as tk
from datetime import datetime, time
from zoneinfo import ZoneInfo

# ---------------- Configuration ----------------

ZONES = {
    "PST": "America/Los_Angeles",
    "MST": "America/Denver",
    "CST": "America/Chicago",
    "EST": "America/New_York",
}

HOME_ZONE = "EST"

UPDATE_MS = 1000
EXIT_HOLD_MS = 1000

# 7" screen (800x480) — large, intentional
ZONE_FONT = ("DejaVu Sans", 22)
TIME_FONT = ("DSEG7 Classic", 52)
HOME_TIME_FONT = ("DSEG7 Classic", 60)
BUTTON_FONT = ("DejaVu Sans", 16)

# Night mode
NIGHT_START = time(22, 0)
NIGHT_END = time(6, 0)

# Colors
BG = "black"
DAY = "white"
NIGHT = "#ffb000"

HOME_DAY = "#00e0ff"
HOME_NIGHT = "#ffa040"
HOME_BG = "#101010"

BTN_BG = "#202020"
BTN_FG = "white"

# -----------------------------------------------


class MultiZoneClock:
    def __init__(self, root):
        self.root = root
        self.root.attributes("-fullscreen", True)
        self.root.configure(bg=BG)

        self.use_24h = False
        self.exit_timer = None
        self.labels = {}

        container = tk.Frame(root, bg=BG)
        container.pack(expand=True, fill="both")

        container.grid_columnconfigure(1, weight=1)

        for idx, zone in enumerate(ZONES):
            is_home = zone == HOME_ZONE

            row = tk.Frame(container, bg=HOME_BG if is_home else BG)
            row.pack(fill="both", expand=True, padx=30, pady=8)

            zone_lbl = tk.Label(
                row,
                text=zone,
                font=ZONE_FONT,
                fg="gray",
                bg=row["bg"],
                width=4,
                anchor="w",
            )
            zone_lbl.pack(side="left")

            time_lbl = tk.Label(
                row,
                font=HOME_TIME_FONT if is_home else TIME_FONT,
                fg=DAY,
                bg=row["bg"],
                anchor="e",
            )
            time_lbl.pack(side="right", padx=(10, 0))

            self.labels[zone] = time_lbl

            if is_home:
                self.format_btn = tk.Button(
                    row,
                    text="12H",
                    font=BUTTON_FONT,
                    bg=BTN_BG,
                    fg=BTN_FG,
                    relief="flat",
                    command=self.toggle_format,
                    padx=14,
                    pady=8,
                )
                self.format_btn.pack(side="right", padx=(10, 0))

        # Long press anywhere to exit
        self.root.bind("<ButtonPress-1>", self.on_press)
        self.root.bind("<ButtonRelease-1>", self.on_release)

        self.update()

    # ---------- Exit ----------

    def on_press(self, event):
        self.exit_timer = self.root.after(EXIT_HOLD_MS, self.root.destroy)

    def on_release(self, event):
        if self.exit_timer:
            self.root.after_cancel(self.exit_timer)
            self.exit_timer = None

    # ---------- Format ----------

    def toggle_format(self):
        self.use_24h = not self.use_24h
        self.format_btn.config(text="24H" if self.use_24h else "12H")

    # ---------- Night ----------

    def night_mode(self):
        now = datetime.now().time()
        return now >= NIGHT_START or now <= NIGHT_END

    # ---------- Loop ----------

    def update(self):
        night = self.night_mode()

        for zone, tz in ZONES.items():
            now = datetime.now(ZoneInfo(tz))

            if self.use_24h:
                text = now.strftime("%H:%M:%S")
            else:
                text = now.strftime("%I:%M:%S %p").lstrip("0")

            if zone == HOME_ZONE:
                fg = HOME_NIGHT if night else HOME_DAY
            else:
                fg = NIGHT if night else DAY

            self.labels[zone].config(text=text, fg=fg)

        self.root.after(UPDATE_MS, self.update)


if __name__ == "__main__":
    root = tk.Tk()
    MultiZoneClock(root)
    root.mainloop()
