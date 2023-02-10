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
