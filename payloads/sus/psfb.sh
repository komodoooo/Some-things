read -p $'\nBinary file name: ' BINNAME
echo $'\nShellcode:'
objdump -d ./$BINNAME|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
#https://www.commandlinefu.com/commands/view/6051/get-all-shellcode-on-binary-file-from-objdump
