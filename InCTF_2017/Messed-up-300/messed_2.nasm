%include "vm.inc"

vmovi4 vr47, "_"
vxor vr6, vr47
vxor vr9, vr47
vxor vr17, vr47
vxor vr21, vr47
vxor vr25, vr47

vmovi4 vr47, "7"
vxor vr0, vr47 
vxor vr7, vr47
vxor vr31, vr47

vor vr0, vr6
vor vr0, vr9
vor vr0, vr17
vor vr0, vr21
vor vr0, vr25
vor vr0, vr7
vor vr0, vr31

vmovi4 vr46, "5"
vxor vr5, vr46
vxor vr24, vr46
vxor vr30, vr46
vxor vr36, vr46

vor vr0, vr5
vor vr0, vr24
vor vr0, vr30
vor vr0, vr36

vmovi vr45, "h4nk"
vxor vr37, vr45

vmovi vr45, "r34m"
vxor vr38, vr45

vmovi vr45, "ynv4"
vxor vr39, vr45

;0
vmovi vr45, "0"
vxor vr8, vr45
vxor vr19, vr45

vor vr0, vr8
vor vr0, vr19

;6
vmovi vr45, "6"
vxor vr10, vr45
vor vr0, vr10

;1
vmovi vr45, "1"
vxor vr23, vr45
vxor vr27, vr45
vor vr0, vr23
vor vr0, vr27

;l
vmovi vr45, "l"
vxor vr16, vr45
vxor vr26, vr45
vor vr0, vr16
vor vr0, vr26

;3
vmovi vr45, "3"
vxor vr15, vr45
vxor vr29, vr45
vor vr0, vr15
vor vr0, vr29

vmovi4 vr44, "f"
vsub vr18, vr44
vmovi4 vr44, "r"
vsub vr20, vr44
vmovi4 vr44, "h"
vsub vr22, vr44
vmovi4 vr44, "v"
vsub vr28, vr44

vor vr0, vr18
vor vr0, vr36
vor vr0, vr23
vor vr0, vr20
vor vr0, vr22
vor vr0, vr28
vor vr0, vr15
vor vr0, vr16
vor vr0, vr10
vor vr0, vr5
vor vr0, vr8
vor vr0, vr6
vor vr0, vr37
vor vr0, vr38
vor vr0, vr39

vend
