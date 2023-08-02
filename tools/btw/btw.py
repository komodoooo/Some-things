import sys

HELP = """
Encode: python3 btw.py btw <word to encode>
Decode: python3 btw.py unbtw <file to decode>
"""
def btw(btw):
    tbw = str()
    for i in list(btw):
        for s in range(ord(i)):
            tbw += "btw "
        tbw += "BTW "
    print(tbw)

def unbtw(btw):
    if btw[-1] != " ":
        btw+=" "
    wtb = [chr(len(i.split(" "))-1) for i in btw.strip().split("BTW ")]
    print("".join([i for i in wtb]))

try:
    if sys.argv[1].startswith("btw"): btw(sys.argv[2])
    elif sys.argv[1].startswith("unbtw"): unbtw(open(sys.argv[2], "r").read())
except Exception as e:
    quit(f"{e}\n{HELP}")
