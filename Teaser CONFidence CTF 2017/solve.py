correct = "983bb35ed0a800fcc85d12806df9225364713be578ba67f65bc508b77f0c54878eda18a5eed50bac705bdc7db205623221e8ffe330483955a22216960754a122".decode('hex')
correct = [ord(x) for x in correct]
n=[0 for x in xrange(0,64)]

def reverse_perm(imm,line):
    global correct
    global n
    n=[0 for x in xrange(0,64)]
    for i in range(0,512):
        dst_bit=i % 8
        dst_byte = i / 8
        idx=abs(imm[i])
        src_bit = idx % 8
        src_byte = idx / 8
        c=(correct[dst_byte]>>dst_bit) &1
        if(imm[i]<0):
            c=c^1
        if(imm[i]==0 and "-0" in line[i]):
            c=c^1
        n[src_byte] |= c << src_bit
    correct=n

def xor(imm):
    global n
    global correct
    for i in range(0,64):
        n[i]=(n[i]^imm[i]) % 256
    correct=n

def parse_file():
    with open('newtext') as f:
        for i in xrange(0,1024):
            line = f.readline()
            if line=="\n":
                continue
            if line[:4]=="perm":
                line=line[6:].split(", ")
                line[511]=line[511].split("]")[0]
                imm=[int(x) for x in line]
                reverse_perm(imm,line)
            elif line[:3]=="xor":
                line=line[5:].split(", ")
                line[63]=line[63].split("]")[0]
                imm=[int(x) for x in line]
                xor(imm)
            else:
                print i
                print "Error"
                exit(0)

if __name__== "__main__":
    parse_file()
    n=n[:27]
    flag=""
    for i in n:
        flag+=chr(i)
    print flag
