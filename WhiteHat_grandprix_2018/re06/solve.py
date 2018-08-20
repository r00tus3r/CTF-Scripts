# coding: utf-8
    
arr = []
e = 0x23c5
n = 0xa09d

while e != 0:
    arr.append(e%2)
    e /= 2
        
import codecs
f = codecs.open('b64_decoded', encoding = 'UTF-16LE')

data = []
for i in xrange(43):
    data.append(f.read(1))

import string
import struct

flag = ""
for k in xrange(len(data)):
    num = struct.unpack('h', data[k].encode('utf-16le'))[0]
    if num < 0:
        num = 0xffff + num + 1
        
    for j in string.printable:
        q = 1
        for i in xrange(len(arr)-1, -1, -1):
            q = q * q % n
            if arr[i] == 1:
                q = q *ord(j) % n
        if q == num:
            flag += j
print flag
