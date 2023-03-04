import sys
import signal
from scapy.all import *
from time import sleep

print('\u001b[33;1m'+"""                     
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
sleep(1.5)

def exit_nigga(sussy, baka):
   print('\u001b[36;1m'+"All saved in log.pcap file!")
   sys.exit()

def infinity(owo):
   while True:
      wrpcap("log.pcap", owo)
      yield

def main():
   print('\u001b[36;1m'+"Local traffic:\n")
   try:
      desc = '\u001b[32;1m'+"%IP.dst% to %IP.src%\n"
      for i in infinity(sniff(filter="127.0.0.1", prn=lambda x:x.sprintf(desc))):
         signal.signal(signal.SIGINT, exit_nigga)
   except Exception as sesso:
      print('\u001b[31;1m'+f"\nERROR: {sesso}"+'\u001b[0m')
      sys.exit()

main()
