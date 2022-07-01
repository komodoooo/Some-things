import sys
import signal
from colorama import Fore
from scapy.all import *

print(Fore.LIGHTYELLOW_EX+"""                     
            ___
           /  /
        __/ _/
       /  _/
      /_ /
       / /
      / /
      //\n
Press 2 times ctrl+c to exit
""")

def exit_nigga(sussy, baka):
   print(Fore.CYAN+"All saved in log.pcap file!")
   sys.exit()

def infinity(owo):
   while True:
      wrpcap("log.pcap", owo)
      yield

def main():
   print(Fore.CYAN+"Local traffic:\n")
   try:
      desc = Fore.LIGHTGREEN_EX+"%IP.dst% to %IP.src%\n"
      for i in infinity(sniff(filter="127.0.0.1", prn=lambda x:x.sprintf(desc))):
         signal.signal(signal.SIGINT, exit_nigga)
   except Exception as sesso:
      print(Fore.RED+f"\nERROR: {sesso}")
      sys.exit()

main()
