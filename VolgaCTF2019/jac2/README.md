# JAC II

### Challenge description
Whenever this binary is executed it transforms the input somehow - fancy that! We've tried this with our flag and now the only file with the flag is gone 😃

Can this transformation be reversed?

### Files
* [jac2](jac2)
* [data.jac2](data.jac2)

### High level overview
* Understand the encryption algorithm by reversing the program and write a python script to decrypt the contents of the file
* Modified init function, includes checks for debugger, patch ptrace calls to enable debugging
* Encrypts the data in the given file using a const array and some arithmetic operations

