;hello_world.asm
;Author: Ashish Tiwari

global _start ;Marks the starting point by making _start global so that linker knows where to start the excution in object file.
section .text: ;Actual code
_start:
    mov eax, 0x4 ;Use the write system call(which is 4) ssize_t write(int fd, const void *buf, size_t count); These arguments we will give in ebx,ecx,edx
    mov ebx, 1 ;stdout has 1 as its file descriptor
    mov ecx, message
    mov edx, message_len
    int 0x80 ;This interrupt is kernel. Kernel will go and check eax to see which system call to execute and return also to eax INVOKED

    mov eax, 0x1 ;Exit system call
    mov ebx, 0; giving it what to exit with
    int 0x80 ;EXIT


section .data: ;Some definitions
    message: db "Hello_world!", 0xA ;0xA is hex for newline character
    message_len equ $-message

;Note- Sys call return values are stored in eax format

;To compile into object file $nasm -f elf32 -o  hello.o test.asm
;To create executable from object file $ld -m elf_i386 -o hello hello.o