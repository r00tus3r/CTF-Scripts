# coding: utf-8

ror = lambda val, r_bits, max_bits: \
    ((val & (2**max_bits-1)) >> r_bits%max_bits) | \
    (val << (max_bits-(r_bits%max_bits)) & (2**max_bits-1))

max_bits = 32

f = open('data.jac2', 'rb')
enc = f.readlines()
enc = enc[0].encode('hex')
data = []
arr = [0x6291bda5, 0xd40cbbbb, 0xcdb9f3e5, 0xedbd5140, 0x2a716584, 0x42a476de, 0x79c7cea9, 0x48852b0e, 0x2a53b9c8, 0x2984790b, 0xdaaed337, 0x0245815e, 0x014020ae, 0x3a84aaa9, 0x84b1fd24, 0x2766105f, 0x1b765e10, 0xb691adc9, 0xeb50c850, 0x264c358b, 0x32213a84, 0x387a7378, 0x1d7a8a61, 0x883de7f1, 0x2c3bae3b, 0x6de14ba2]

for i in range(0, 96, 8):
    data.append(int('0x'+enc[i+6:i+8]+enc[i+4:i+6]+enc[i+2:i+4]+enc[i:i+2], 16))

for i in range(0, 12, 2):
    for j in range(25, 1, -2):
        data[i+1] = data[i+1] - arr[j] & 0xffffffff
        data[i+1] = (ror(data[i+1], data[i] & 0x1f, max_bits) ^ data[i]) & 0xffffffff
        data[i] = data[i] - arr[j-1] & 0xffffffff
        data[i] = (ror(data[i], data[i+1] & 0x1f, max_bits) ^ data[i+1]) & 0xffffffff
    print hex(data[i])
    print hex(data[i+1]
    print '--------------------------------------------'

for i in range(0, 12, 2):
    data[i] = data[i] - arr[0] & 0xffffffff
    data[i+1] = data[i+1] - arr[1] & 0xffffffff

flag = ''
for i in range(12):
    flag += str(hex(data[i])).strip('L')[2:].decode('hex')[::-1]
    print flag
    
#VolgaCTF{ptr@ce_ant1_r3verse_@ll_in_va1n}
