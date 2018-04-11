from z3 import *

k = [
  BitVec("k[0]", 32),
  BitVec("k[1]", 32),
  BitVec("k[2]", 32),
  BitVec("k[3]", 32),
  BitVec("k[4]", 32)
]

s = Solver()
s.add(k[0] ^ k[2] ^ k[4] == 0x37133713)
s.add((k[0] ^ k[4]) | (k[1] ^ k[3]) == 0x7f7f7f7f)

for i in range(5):
  for j in range(4):
    v = Extract(8 * j + 7, 8 * j, k[i])
    s.add(v >= 0x21, v <= 0x7e)


while s.check() == sat:
    m = s.model()
    print (str("%.8x"%(m[k[0]].as_long())).decode("hex") +
    str("%.8x"%(m[k[1]].as_long())).decode("hex") +
    str("%.8x"%(m[k[2]].as_long())).decode("hex") +
    str("%.8x"%(m[k[3]].as_long())).decode("hex") +
    str("%.8x"%(m[k[4]].as_long())).decode("hex"))

    s.add(Or(k[0] != s.model()[k[0]],  k[1] != s.model()[k[1]], k[2] != s.model()[k[2]], k[3] != s.model()[k[3]], k[4] != s.model()[k[4]]))

