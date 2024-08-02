section .text
  global _start

section .data
  msg db "Guess The Number!\n", 0ah

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, 17
    syscall
    mov rax, 60
    mov rdi, 0
    syscall
