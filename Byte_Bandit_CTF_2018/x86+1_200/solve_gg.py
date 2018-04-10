import struct
import math

orig = "onppnfbljlefpnbblhbbmnmmpnkapcacokhapneabjolbeckpnlaplkffepgpnbdnlgkpgfkpnpaddoakpdlbeimmdpkglaa"
flag_parts = []

for i in xrange(0, len(orig), 2):
    num = ord(orig[i]) << 8
    num = num + ord(orig[i + 1])
    num = num - 0x6161
    digit1 = (num & 0xf00) >> 8
    digit2 = num & 0xf
    flag_parts.append((str(hex(digit1).replace('0x', '')) + str(hex(digit2).replace('0x', '')))[::-1])

final_parts = []

for i in xrange(0, len(flag_parts), 4):
    curr = flag_parts[i]
    curr += flag_parts[i + 1]
    curr += flag_parts[i + 2]
    curr += flag_parts[i + 3]
    final_parts.append(curr)

final_conc = ''.join(final_parts)
start = "3fed"
test = [start+''.join(x) for x in zip(*[list(final_conc[z::12]) for z in range(12)])]
flag = ''

for i in test:
    val = struct.unpack('!d', i.decode('hex'))[0]
    h = math.pi - math.asin(val)
    flag += hex(struct.unpack('<Q', struct.pack('<d', h))[0])[8:16].decode('hex')

print flag[::-1]

#flag{x87_w1ll_y0u_3v3r_n333d_it}
