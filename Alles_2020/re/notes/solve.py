from z3 import *

array = [BitVec(f"array[{i}]", 32) for i in range(0, 29)]
s = Solver()

s.add(array[0] == ord('A'))
s.add(array[1] == ord('L'))
s.add(array[2] == ord('L'))
s.add(array[3] == ord('E'))
s.add(array[4] == ord('S'))
s.add(array[5] == ord('{'))
s.add(array[15] - array[24] - array[1] + array[6] == 90)
s.add(array[17] - array[23] - array[2] == -123)
s.add(array[28] == 125)
s.add(array[17] * array[24] - array[3] - array[23] * array[2] == -4937)
s.add(array[11] * array[14] - array[26] + array[7] + array[16] == 5105)
s.add(array[3] - array[6] == -30)
s.add(array[21] == 105)
s.add(array[9] * array[27] - array[24] * array[21] - array[25] == 1129)
s.add(array[18] * array[6] + array[23] * array[3] + array[20] == 17936)
s.add(array[7] - array[13] + array[19] * array[5] == 13413)
s.add(array[10] * array[0] * array[12] - array[26] == 837149)
for i in range(0, 28):
    s.add(And(33 <= array[i], array[i] <= 127))

while s.check() == sat:
    m = s.model()
    out = ''
    for i in range(29):
        out += chr(int(str(m[array[i]])))
    print(out)

