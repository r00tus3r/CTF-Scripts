%include "vm.inc"

;k[0] ^ k[2] ^ k[4] == 0x13371337
vmov vr10, vr0
vmovi vr11, 0x13371337
vxor vr10, vr2
vxor vr10, vr4
vxor vr10, vr11 ;Good -> vr10 = 0
;res0 in vr10

;k[0] ^ k[4]) | (k[1] ^ k[3]) == 0x7f7f7f7f
vmov vr11, vr0
vxor vr11, vr4
vmov vr12, vr1
vxor vr12, vr3
vor vr11, vr12
vmovi vr13, 0x7f7f7f7f
vxor vr11, vr13 ;Good -> vr11 == 0
;res1 in vr11

vor vr10, vr11

vmov vr0, vr10

vend
