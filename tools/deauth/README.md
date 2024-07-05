# Deauth attack
Deauthenticate all devices from a wireless network exploiting the deauthentication frame in the IEEE 802.11w standard.
Basically, this script send a deauthentication frame to the wireless access point to the broadcast MAC address,
leading to a denial of service causing a temporarily disconnection of all devices.
## Requirements
Beside **a working wireless NIC** you also need the following packages on your linux-based distribution to run the script:
* _`net-tools` and `wireless-tools`(`wireless_tools` for arch-based distros)_
* _`python3` and `python-scapy`_
## Get the BSSID
Run the `iw dev wlan0 scan` command and grab the respective MAC address of the chosen wireless network.
### View avaible wireless interfaces
Just run `iwconfig`
## Usage 
You need to run this program with privileges. Use `sudo`.
```
usage: deauth.py [-h] [-s [SECONDS]] [-i [INTERFACE]] BSSID

Deauthenticate temporarily all devices connected to a WI-FI network (IEEE 802.11w)

positional arguments:
  BSSID                 MAC address of the wireless access point

options:
  -h, --help            show this help message and exit
  -s [SECONDS], --seconds [SECONDS]
                        disconnection time in seconds from the network. (default: 10)
  -i [INTERFACE], --interface [INTERFACE]
                        Wireless interface. (default: wlan0)
```
