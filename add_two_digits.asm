section .data
    prompt1     db "Enter first number (0-9): ", 0
    prompt2     db "Enter second number (0-9): ", 0
    result_msg  db "Addition Result: ", 0
    newline     db 10, 0

section .bss
    num1    resb 1
    num2    resb 1
    result  resb 2   ; to hold up to 2 digits (e.g., '1''2')

section .text
    global _start

_start:
    ; -------- Prompt 1 --------
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 24
    int 0x80

    ; -------- Read first digit --------
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 1
    int 0x80

    ; -------- Prompt 2 --------
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 25
    int 0x80

    ; -------- Read second digit --------
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 1
    int 0x80

    ; -------- Convert ASCII to integer --------
    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    add al, bl        ; AL = num1 + num2

    ; -------- Divide to extract digits --------
    mov ah, 0         ; clear AH for DIV
    mov bl, 10
    div bl            ; AL = quotient (tens), AH = remainder (ones)

    add al, '0'       ; convert tens to ASCII
    mov [result], al
    add ah, '0'       ; convert ones to ASCII
    mov [result+1], ah

    ; -------- Print result message --------
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 17
    int 0x80

    ; -------- Print result --------
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 2
    int 0x80

    ; -------- Print newline --------
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; -------- Exit --------
    mov eax, 1
    mov ebx, 0
    int 0x80
