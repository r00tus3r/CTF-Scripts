from z3 import *

k = [
BitVec("k[0]", 8),
BitVec("k[1]", 8),
BitVec("k[2]", 8),
BitVec("k[3]", 8),
BitVec("k[4]", 8),
BitVec("k[5]", 8),
BitVec("k[6]", 8),
BitVec("k[7]", 8),
BitVec("k[8]", 8),
BitVec("k[9]", 8),
BitVec("k[10]", 8),
BitVec("k[11]", 8),
BitVec("k[12]", 8),
BitVec("k[13]", 8),
BitVec("k[14]", 8),
BitVec("k[15]", 8),
BitVec("k[16]", 8),
BitVec("k[17]", 8),
BitVec("k[18]", 8),
BitVec("k[19]", 8)]

s = Solver()

s.add(0x3e * k[0] + 0x17 * k[1] + 0x31 * k[2] + 0x2f * k[3] + 0x3f * k[4] + 0x24 * k[5] + 0x5b * k[6] + 6 * k[7] + 0x1f * k[8] + 0x10 * k[9] + 0xb * k[10] + 0x5b * k[11] + 2 * k[12] + 0x31 * k[13] + 0x49 * k[14] + 0x13 * k[15] + 0x4d * k[16] + 0x4c * k[17] + 0x43 * k[18] + 0x56 * k[19]== 0x14c3a)

s.add(0x59 * k[0] + 0x25 * k[1] + 0x22 * k[2] + 0x4c * k[3] + 0x1e * k[4] + 0xe * k[5] + 0x49 * k[6] + 0x20 * k[7] + 0x14 * k[8] + 0x54 * k[9] + 0x55 * k[10] + 0x43 * k[11] + 3 * k[12] + 0x3e * k[13] + 0x36 * k[14] + 0x14 * k[15] + 0x4e * k[16] + 0x64 * k[17] + 0x24 * k[18] + 0x40 * k[19]== 0x1643b)

s.add(k[0] * 0x64 +k[1] * 0x47 +k[2] * 0x27 +k[3] * 0x1a +k[4] * 0x4a +k[5] * 0x49 +k[6] * 0x53 +k[7] * 0x5f +k[8] * 0x3e +k[9] * 0x5a +k[10] * 0x8 +k[11] * 0xb +k[12] * 0x4d +k[13] * 0x20 +k[14] * 0x13 +k[15] * 0x9 +k[16] * 0x17 +k[17] * 0x4c +k[18] * 0x3e +k[19] * 0x58 == 0x19675)

s.add(k[0] * 0x6 +k[1] * 0x3d +k[2] * 0x45 +k[3] * 0x48 +k[4] * 0x54 +k[5] * 0x1b +k[6] * 0x12 +k[7] * 0x45 +k[8] * 0xe +k[9] * 0x63 +k[10] * 0x14 +k[11] * 0x15 +k[12] * 0xd +k[13] * 0x17 +k[14] * 0x2a +k[15] * 0xf +k[16] * 0x20 +k[17] * 0x11 +k[18] * 0x49 +k[19] * 0x17 == 0x12486)

s.add(k[0] * 0x14 +k[1] * 0x4a +k[2] * 0x31 +k[3] * 0x2b +k[4] * 0x3f +k[5] * 0x60 +k[6] * 0x4 +k[7] * 0x58 +k[8] * 0x54 +k[9] * 0x5f +k[10] * 0x24 +k[11] * 0x33 +k[12] * 0x59 +k[13] * 0x27 +k[14] * 0x2 +k[15] * 0x29 +k[16] * 0x4d +k[17] * 0xb +k[18] * 0x16 +k[19] * 0x14 == 0x17a5b)

s.add(k[0] * 0x29 +k[1] * 0x33 +k[2] * 0xb +k[3] * 0x50 +k[4] * 0x0 +k[5] * 0x28 +k[6] * 0x1a +k[7] * 0x5 +k[8] * 0xb +k[9] * 0x4e +k[10] * 0x3c +k[11] * 0x23 +k[12] * 0x35 +k[13] * 0x21 +k[14] * 0x45 +k[15] * 0x43 +k[16] * 0x0 +k[17] * 0x64 +k[18] * 0x27 +k[19] * 0x19 == 0x131a7)

s.add(k[0] * 0x1c +k[1] * 0x1b +k[2] * 0x3 +k[3] * 0x39 +k[4] * 0x40 +k[5] * 0x17 +k[6] * 0x44 +k[7] * 0x31 +k[8] * 0x1a +k[9] * 0x10 +k[10] * 0x14 +k[11] * 0x42 +k[12] * 0x3a +k[13] * 0x3 +k[14] * 0x33 +k[15] * 0x1c +k[16] * 0x27 +k[17] * 0x5 +k[18] * 0x38 +k[19] * 0x34 == 0x11048)

s.add(k[0] * 0x29 +k[1] * 0x3c +k[2] * 0x33 +k[3] * 0x62 +k[4] * 0x28 +k[5] * 0x24 +k[6] * 0x32 +k[7] * 0x38 +k[8] * 0x4f +k[9] * 0x32 +k[10] * 0x39 +k[11] * 0x30 +k[12] * 0x34 +k[13] * 0x2b +k[14] * 0x42 +k[15] * 0x40 +k[16] * 0x8 +k[17] * 0x26 +k[18] * 0x41 +k[19] * 0x1a == 0x16d60)

s.add(k[0] * 0x41 +k[1] * 0x58 +k[2] * 0x35 +k[3] * 0x24 +k[4] * 0x1d +k[5] * 0x54 +k[6] * 0x15 +k[7] * 0x62 +k[8] * 0x5c +k[9] * 0xe +k[10] * 0x5e +k[11] * 0x1d +k[12] * 0x2a +k[13] * 0x53 +k[14] * 0x2d +k[15] * 0x22 +k[16] * 0x2c +k[17] * 0x4e +k[18] * 0x2c +k[19] * 0x4d == 0x18452)

s.add(k[0] * 0x4e +k[1] * 0x40 +k[2] * 0x5c +k[3] * 0x12 +k[4] * 0x27 +k[5] * 0x62 +k[6] * 0x2e +k[7] * 0x7 +k[8] * 0x3c +k[9] * 0x30 +k[10] * 0x1f +k[11] * 0x4a +k[12] * 0x28 +k[13] * 0x1a +k[14] * 0x46 +k[15] * 0x1d +k[16] * 0x17 +k[17] * 0xd +k[18] * 0x64 +k[19] * 0x21 == 0x1649e)

s.add(k[0] * 0x26 +k[1] * 0x3f +k[2] * 0x42 +k[3] * 0x35 +k[4] * 0x7 +k[5] * 0x57 +k[6] * 0x46 +k[7] * 0x4d +k[8] * 0x33 +k[9] * 0x62 +k[10] * 0x64 +k[11] * 0x53 +k[12] * 0x4b +k[13] * 0x43 +k[14] * 0x7 +k[15] * 0x29 +k[16] * 0x3f +k[17] * 0x50 +k[18] * 0x2d +k[19] * 0x5d == 0x1ac8f)

s.add(k[0] * 0x12 +k[1] * 0x44 +k[2] * 0x4c +k[3] * 0x55 +k[4] * 0x6 +k[5] * 0x24 +k[6] * 0x18 +k[7] * 0x34 +k[8] * 0x39 +k[9] * 0x0 +k[10] * 0x4 +k[11] * 0x5f +k[12] * 0x58 +k[13] * 0x48 +k[14] * 0x2e +k[15] * 0x9 +k[16] * 0x54 +k[17] * 0x1f +k[18] * 0x16 +k[19] * 0x5e == 0x14c7a)

s.add(k[0] * 0x63 +k[1] * 0x3a +k[2] * 0x9 +k[3] * 0x48 +k[4] * 0x1c +k[5] * 0x5f +k[6] * 0xb +k[7] * 0x4a +k[8] * 0x2 +k[9] * 0x2e +k[10] * 0x2d +k[11] * 0x3e +k[12] * 0xa +k[13] * 0x13 +k[14] * 0x61 +k[15] * 0x1e +k[16] * 0x5b +k[17] * 0x49 +k[18] * 0x53 +k[19] * 0x37 == 0x19896)

s.add(k[0] * 0x64 +k[1] * 0x21 +k[2] * 0x5c +k[3] * 0x7 +k[4] * 0x3c +k[5] * 0x4b +k[6] * 0x1e +k[7] * 0x55 +k[8] * 0x3e +k[9] * 0x64 +k[10] * 0x2f +k[11] * 0x59 +k[12] * 0xe +k[13] * 0x2f +k[14] * 0x49 +k[15] * 0x4f +k[16] * 0x5c +k[17] * 0x63 +k[18] * 0x34 +k[19] * 0x1b == 0x1cd63)

s.add(k[0] * 0x19 +k[1] * 0x13 +k[2] * 0x3 +k[3] * 0x59 +k[4] * 0x1d +k[5] * 0x2 +k[6] * 0xe +k[7] * 0x1d +k[8] * 0x2a +k[9] * 0x17 +k[10] * 0x58 +k[11] * 0x5f +k[12] * 0x4c +k[13] * 0x36 +k[14] * 0x1 +k[15] * 0x2f +k[16] * 0x4d +k[17] * 0x32 +k[18] * 0x32 +k[19] * 0x17 == 0x12b35)

s.add(k[0] * 0x64 +k[1] * 0x45 +k[2] * 0x47 +k[3] * 0x61 +k[4] * 0x48 +k[5] * 0x22 +k[6] * 0x29 +k[7] * 0x8 +k[8] * 0x23 +k[9] * 0x28 +k[10] * 0x5b +k[11] * 0x31 +k[12] * 0x36 +k[13] * 0x8 +k[14] * 0x14 +k[15] * 0x2 +k[16] * 0xf +k[17] * 0x49 +k[18] * 0x4d +k[19] * 0x54 == 0x166d4)

s.add(k[0] * 0x2e +k[1] * 0x51 +k[2] * 0x33 +k[3] * 0x9 +k[4] * 0x62 +k[5] * 0x63 +k[6] * 0x2f +k[7] * 0x3d +k[8] * 0x26 +k[9] * 0x61 +k[10] * 0x3c +k[11] * 0x58 +k[12] * 0x3f +k[13] * 0x36 +k[14] * 0x1e +k[15] * 0xf +k[16] * 0x39 +k[17] * 0x48 +k[18] * 0x3c +k[19] * 0x2c == 0x1a725)

s.add(k[0] * 0x20 +k[1] * 0x2a +k[2] * 0x1e +k[3] * 0x14 +k[4] * 0x38 +k[5] * 0x4 +k[6] * 0x23 +k[7] * 0x49 +k[8] * 0xd +k[9] * 0x2a +k[10] * 0x40 +k[11] * 0x5a +k[12] * 0x51 +k[13] * 0x1f +k[14] * 0x52 +k[15] * 0x2b +k[16] * 0x5b +k[17] * 0x5d +k[18] * 0x4 +k[19] * 0x1 == 0x15188)

s.add(k[0] * 0x37 +k[1] * 0x20 +k[2] * 0x33 +k[3] * 0x3 +k[4] * 0x20 +k[5] * 0x3b +k[6] * 0x54 +k[7] * 0x14 +k[8] * 0x60 +k[9] * 0x7 +k[10] * 0x63 +k[11] * 0x26 +k[12] * 0x3 +k[13] * 0x15 +k[14] * 0x50 +k[15] * 0x58 +k[16] * 0x32 +k[17] * 0x2e +k[18] * 0x22 +k[19] * 0x44 == 0x1387c)

s.add(k[0] * 0x46 +k[1] * 0x1e +k[2] * 0x4c +k[3] * 0x1d +k[4] * 0x21 +k[5] * 0x32 +k[6] * 0x5f +k[7] * 0x2f +k[8] * 0xb +k[9] * 0x4 +k[10] * 0x60 +k[11] * 0x52 +k[12] * 0x5b +k[13] * 0x34 +k[14] * 0x44 +k[15] * 0x53 +k[16] * 0x1c +k[17] * 0x1b +k[18] * 0x59 +k[19] * 0x1e == 0x16b44)

s.add(k[0] * 0x19 +k[1] * 0x32 +k[2] * 0x19 +k[3] * 0x5f +k[4] * 0x4e +k[5] * 0x1c +k[6] * 0x1 +k[7] * 0x4d +k[8] * 0x3e +k[9] * 0x59 +k[10] * 0x0 +k[11] * 0x48 +k[12] * 0x26 +k[13] * 0x26 +k[14] * 0x21 +k[15] * 0x22 +k[16] * 0x4b +k[17] * 0x3b +k[18] * 0x12 +k[19] * 0x32 == 0x16c3e)

s.add(k[0] * 0x6 +k[1] * 0x3 +k[2] * 0x3b +k[3] * 0x2 +k[4] * 0xf +k[5] * 0x1a +k[6] * 0x5d +k[7] * 0x5e +k[8] * 0x2 +k[9] * 0xa +k[10] * 0x2c +k[11] * 0x54 +k[12] * 0x29 +k[13] * 0x1a +k[14] * 0x5a +k[15] * 0x26 +k[16] * 0x1e +k[17] * 0x5b +k[18] * 0x12 +k[19] * 0x51 == 0x115dc)

s.add(k[0] * 0x49 +k[1] * 0xa +k[2] * 0x51 +k[3] * 0x38 +k[4] * 0x4b +k[5] * 0x43 +k[6] * 0x11 +k[7] * 0x55 +k[8] * 0x4d +k[9] * 0x5f +k[10] * 0x0 +k[11] * 0x40 +k[12] * 0x44 +k[13] * 0x60 +k[14] * 0x64 +k[15] * 0x4e +k[16] * 0x4c +k[17] * 0x1a +k[18] * 0x2 +k[19] * 0x28 == 0x1ad75)

s.add(k[0] * 0x5f +k[1] * 0x6 +k[2] * 0x4d +k[3] * 0x2e +k[4] * 0x9 +k[5] * 0x40 +k[6] * 0x4d +k[7] * 0x46 +k[8] * 0x62 +k[9] * 0x61 +k[10] * 0x37 +k[11] * 0x40 +k[12] * 0x23 +k[13] * 0x21 +k[14] * 0x4b +k[15] * 0x45 +k[16] * 0x2a +k[17] * 0x2f +k[18] * 0x4 +k[19] * 0x36 == 0x18369)

while s.check() == sat:
    m = s.model()
    print (
    str("%.8x"%(m[k[0]].as_long())).decode("hex") +
    str("%.8x"%(m[k[1]].as_long())).decode("hex") +
    str("%.8x"%(m[k[2]].as_long())).decode("hex") +
    str("%.8x"%(m[k[3]].as_long())).decode("hex") +
    str("%.8x"%(m[k[4]].as_long())).decode("hex") +
    str("%.8x"%(m[k[5]].as_long())).decode("hex") +
    str("%.8x"%(m[k[6]].as_long())).decode("hex") +
    str("%.8x"%(m[k[7]].as_long())).decode("hex") +
    str("%.8x"%(m[k[8]].as_long())).decode("hex") +
    str("%.8x"%(m[k[9]].as_long())).decode("hex") +
    str("%.8x"%(m[k[10]].as_long())).decode("hex") +
    str("%.8x"%(m[k[11]].as_long())).decode("hex") +
    str("%.8x"%(m[k[12]].as_long())).decode("hex") +
    str("%.8x"%(m[k[13]].as_long())).decode("hex") +
    str("%.8x"%(m[k[14]].as_long())).decode("hex") +
    str("%.8x"%(m[k[15]].as_long())).decode("hex") +
    str("%.8x"%(m[k[16]].as_long())).decode("hex") +
    str("%.8x"%(m[k[17]].as_long())).decode("hex") +
    str("%.8x"%(m[k[18]].as_long())).decode("hex") +
    str("%.8x"%(m[k[19]].as_long())).decode("hex") )

    s.add(Or(k[0] != s.model()[k[0]],
    k[1] != s.model()[k[1]],
    k[2] != s.model()[k[2]],
    k[3] != s.model()[k[3]],
    k[4] != s.model()[k[4]],
    k[5] != s.model()[k[5]],
    k[6] != s.model()[k[6]],
    k[7] != s.model()[k[7]],
    k[8] != s.model()[k[8]],
    k[9] != s.model()[k[9]],
    k[10] != s.model()[k[10]],
    k[11] != s.model()[k[11]],
    k[12] != s.model()[k[12]],
    k[13] != s.model()[k[13]],
    k[14] != s.model()[k[14]],
    k[15] != s.model()[k[15]],
    k[16] != s.model()[k[16]],
    k[17] != s.model()[k[17]],
    k[18] != s.model()[k[18]],
    k[19] != s.model()[k[19]]))