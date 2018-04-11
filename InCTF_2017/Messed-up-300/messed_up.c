#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <vector>
#include <string>
#include <string.h>

#define IMPORT_DATA_AS_STRING(str_name, symbol_name) \
  extern "C" char symbol_name ## _start; \
  extern "C" char symbol_name ##_end; \
  const std::string str_name( \
    &symbol_name ## _start, \
    &symbol_name ## _end - &symbol_name ## _start)

IMPORT_DATA_AS_STRING(bytecode1, _binary_messed_1);
IMPORT_DATA_AS_STRING(bytecode2, _binary_messed_2);

class VM {
public:
	uint32_t r[48]{};
	uint32_t pc{};
	std::vector<uint8_t> mem;

	bool exec_ins();
	bool check1(char input1[]);
	bool check2(char input1[], char input2[]);
};

bool VM::exec_ins() {
	switch (mem[pc]) {
		case 0x00: { //MOV dst_reg, src_reg
			r[mem[pc+1]] = r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0x10: {  // MOVI dst_reg, imm32
			memcpy(&r[mem[pc+1]], &mem[pc+2], 4);
			pc += 6;
			return false;
		}

    case 0x11: {  // MOVI4 dst_reg, imm4
      memcpy(&r[mem[pc+1]], &mem[pc+2], 1);
      pc += 3;
      return false;
    }

    case 0x12: {  // MOVI8 dst_reg, imm8
      memcpy(&r[mem[pc+1]], &mem[pc+2], 2);
      pc += 4;
      return false;
    }

		case 0x01: { //XOR dst_reg, src_reg
			r[mem[pc+1]] ^= r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0x02: { //OR dst_reg, src_reg
			r[mem[pc+1]] |= r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0x04: { //AND dst_reg, src_reg
			r[mem[pc+1]] &= r[mem[pc+2]];
			pc += 3;
			return false;
		}

    case 0x07: { //SUB dst_reg, src_reg
			r[mem[pc+1]] -= r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0x08: { //ADD dst_reg, src_reg
			r[mem[pc+1]] += r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0x05: { //RSHIFT dst_reg, src_reg
			r[mem[pc+1]] = r[mem[pc+1]] >> r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0x06: { //LSHIFT dst_reg, src_reg
			r[mem[pc+1]] = r[mem[pc+1]] << r[mem[pc+2]];
			pc += 3;
			return false;
		}

		case 0xff: { // END
			return true;
		}
	}
}

bool VM::check1(char input1[20]) {
  memcpy(&r[0], input1+0, 4);
  memcpy(&r[1], input1+4, 4);
  memcpy(&r[2], input1+8, 4);
  memcpy(&r[3], input1+12, 4);
	memcpy(&r[4], input1+16, 4);

  bool end = false;
  while (!end) {
    /*for (int i = 0; i < 8; i++)
      printf("r%i: %.8x  ", i, r[i]);
    putchar('\n');*/
    end = exec_ins();
  }

  return !(bool)r[0];
}

bool VM::check2(char input1[], char input2[]) {

  int l1 = strlen(input2) + 3;
  int l2 = strlen(input1) * 2;

  if(l1 != l2) {
    printf("Incorrect Length.\n");
    exit(0);
  }

  for (int i=0; i<strlen(input2); i++ ){
    memcpy(&r[i], input2+i, 1);
  }

  memcpy(&r[37], input2+1, 4);
  memcpy(&r[38], input2+32, 4);
  memcpy(&r[39], input2+11, 4);

  bool end = false;
  while (!end) {
    /*for (int i = 0; i < 48; i++)
      printf("r%i: %.8x  ", i, r[i]);
    putchar('\n');*/
    end = exec_ins();
  }

  return !(bool)r[0];
}

void flag(char input2[]){
  puts("\nThe Flag is:");
  printf("inctf{%s}\n", input2);
}

int main() {
	char input1[100]{};
	char input2[100]{};

	printf("Welcome to the Messed Up Challenge\nEnter first Input: ");
	fflush(stdout);
	scanf("%s", input1);

	VM vm;

  vm.mem.resize(4096);
  memcpy(&vm.mem[0], bytecode1.data(), bytecode1.size());

  bool check1 = vm.check1(input1);

  if (check1) {
    puts("\nCool. You have passed Level 1.");
  }
	else {
    puts("Nope.");
    return 1;
  }

	printf("Enter second Input: ");
	fflush(stdout);
	scanf("%s", input2);

	VM vm1;

	vm1.mem.resize(4096);
	memcpy(&vm1.mem[0], bytecode2.data(), bytecode2.size());

  bool check2 = vm1.check2(input1, input2);

	if (check1 & check2) {
		puts("\nYou are Awesome. Level 2 Completed.");
    flag(input2);
	}
	else {
		puts("Nope.");
    return 1;
	}

	return 0;

}
