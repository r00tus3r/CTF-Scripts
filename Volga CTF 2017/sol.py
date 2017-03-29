from subprocess import Popen,PIPE,STDOUT

key=['2', 'F', 'u', 'M', 'l', 'X', '%', '3', 'k', 'B', 'J', ':', '.', 'N', '*', 'e', 'p', 'q', 'A', '0', 'L', 'h', '=', 'E', 'n', '/', 'd', 'i', 'T', '1', 'c', 'w', 'y', 'a', 'z', '$', '7', 'S', 'H', ',', 'O', 'o', 'P', ';', 'r', 'U', 's', 'W', 'v', '4', 'g', '\\', 'Z', '<', 't', 'x', '(', '8', 'm', 'f', '>', '-', '#', 'I', '?', 'b', 'D', 'Y', 'C', '+', 'R', 'Q', '!', 'K', '5', 'j', 'V', '6', '9', '&', ')', 'G']

p=16631
q=511115
r=0x7FFFFFFF
s=82
flag=""
data=[]

for i in range(0,0x80):
    flag=""
    a=(p*i)+q
    b=a%r%s
    flag=flag+key[b]
    for j in range(0,16):
        c=p*(a%r)+q
        flag=flag+key[c%r%s]
        a=c
    data.append(flag)
    cmd="openssl enc -aes-128-cbc -d -in flag.zip.enc -out flag.zip -k '"+data[i]+"'" 
    f = Popen(cmd,stdout=PIPE, stdin=PIPE, stderr=STDOUT, shell=True)
    qwe=f.communicate()[0]
    qwe=qwe.split(" ")
    if (qwe[0]!="bad"):
        print flag
        print "Decrypted"
        break
