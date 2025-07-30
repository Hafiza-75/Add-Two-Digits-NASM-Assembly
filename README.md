# Assembly Program: Add Two Digits (0–9)

This project is a simple **NASM (x86) assembly language program** that prompts the user to input two digits (0–9), adds them, and prints the result — handling both single and double-digit sums (e.g., 7 + 8 = 15).

## Tech Stack
- Assembly Language (NASM)
- Linux system calls (`int 0x80`)
- x86 32-bit architecture

---

## Features

- Reads two digits from the user (0–9)
- Converts ASCII to integer
- Adds the two numbers
- Converts the result back to ASCII
- Prints the correct sum (supports 0–18)
- Clean exit via system call

---
## Sample Output

```
Enter first number (0-9): 6  
Enter second number (0-9): 8  
Addition Result: 14
```

---

## How to Compile and Run

Make sure you have NASM installed. Then:

```bash
nasm -f elf32 add_digits.asm -o add_digits.o
ld -m elf_i386 add_digits.o -o add_digits
./add_digits
```
