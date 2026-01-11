## Issue: File Conversion Issues (On my Rasepberry Pi)

**Symptom**  
I ran into this issue while I was attempting to make a `Desktop Icon executable` for the app. 

`env: 'python3\r': No such file or directory`

**Root Cause**  
Line ending Issue. I learned that (CRLF) stands for Carriage Return (CR) and Line Feed (LF). TLDR, it's a file permission issue. My text editor VS Code was setup for CRLF so when I transferred the file script from my Windows machine to the Pi 3 B+ it wasn't in the right format for Linux to read.

**Investigation**  
- I thought it was an issue with Python not being installed or it was a dir path issue at first
- Confirmed that the files belong to my username and not root
- Begin researching online the error code the terminal was issuing 

**Fix**  
1. dos2unix ( I used this method to fix it. This will convert the file from CR to LF.)
- Open Terminal on the Raspberry Pi
- Run sudo apt install dos2unix
- Run dos2unix /home/pi/multizone_clock.py

Or 

2. Exporting LF
- On your text editor save your script in LF before exporting

**Takeaway**  
- Instead of moving file using a usb, use Github or any kind of version control platform to download the files from a repo
- Use LR formatting on my text editor
- Questions to ask myself: When a Linux script won’t run:
1. Am I in the right home directory?
2. Do I own the file?
3. Is it executable?
4. Are line endings Unix (LF)?

If all four are “yes,” it runs. If not, Linux will block you — quietly.


## Issue: File Ownership (On my Rasepberry Pi)

**Symptom**  
Not able to move any file into the home dir. Part of trying to make a `Desktop Icon executable` for the app.

**Root Cause**  
Trying to move the multizone_clock.py file to the home dir so that way we can create a executable on the desktop. The idea was to only see a executable on the desktop and not have to run multizone_clock.py in a text editor every time you wanted to run it. 

**Investigation**  
- Trying to make permission changes through the files properties wasn't working. You can see options to change ownership but it wasn't allowing me to do it this way.
- Begin researching online the error code the terminal was issuing 

**Fix**  
- Running `sudo chown hivoltpi3:hivoltpi3 /home/hivoltpi3/multizone_clock.py` (Your dir path will look different than mine)

Why this works:
- - Transfers ownership from root to you
- - Restores normal user control

**Takeaway**  

- If you don’t own the file, you don’t control it.
