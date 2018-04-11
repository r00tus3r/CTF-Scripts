all:
	nasm messed_1.nasm
	nasm messed_2.nasm
	objcopy --input binary --output pe-x86-64 --binary-architecture i386:x86-64 \
	  messed_1 messed_1.o
	objcopy --input binary --output pe-x86-64 --binary-architecture i386:x86-64 \
		messed_2 messed_2.o
	g++ -Wall -Wextra messed_up.c messed_1.o messed_2.o -o messed_up -O3 -static
	strip -s messed_up
