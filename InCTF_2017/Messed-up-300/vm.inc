%define vr0 0
%define vr1 1
%define vr2 2
%define vr3 3
%define vr4 4
%define vr5 5
%define vr6 6
%define vr7 7
%define vr8 8
%define vr9 9
%define vr10 10
%define vr11 11
%define vr12 12
%define vr13 13
%define vr14 14
%define vr15 15
%define vr16 16
%define vr17 17
%define vr18 18
%define vr19 19
%define vr20 20
%define vr21 21
%define vr22 22
%define vr23 23
%define vr24 24
%define vr25 25
%define vr26 26
%define vr27 27
%define vr28 28
%define vr29 29
%define vr30 30
%define vr31 31
%define vr32 32
%define vr33 33
%define vr34 34
%define vr35 35
%define vr36 36
%define vr37 37
%define vr38 38
%define vr39 39
%define vr40 40
%define vr41 41
%define vr42 42
%define vr43 43
%define vr44 44
%define vr45 45
%define vr46 46
%define vr47 47

%macro vmov 2
  db 0x00, %1, %2
%endmacro

%macro vmovi 2
  db 0x10, %1
  dd %2
%endmacro

%macro vmovi8 2
  db 0x12, %1
  dw %2
%endmacro

%macro vmovi4 2
  db 0x11, %1
  db %2
%endmacro

%macro vxor 2
  db 0x01, %1, %2
%endmacro

%macro vor 2
  db 0x02, %1, %2
%endmacro

%macro vand 2
  db 0x04, %1, %2
%endmacro

%macro vrshift 2
  db 0x05, %1, %2
%endmacro

%macro vlshift 2
  db 0x06, %1, %2
%endmacro

%macro vsub 2
  db 0x07, %1, %2
%endmacro

%macro vadd 2
  db 0x08, %1, %2
%endmacro

%macro vend 0
  db 0xff
%endmacro
