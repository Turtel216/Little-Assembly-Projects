section .text
global  _start

section .data
msg_hello db "Guess The Number!\n", 0ah
msg_won   db "You have won!", 0ah
num     db 100 // input number buffer
rnm     db 100 // the random number

section .text
global  _start

_start:

try_again:
	// PRINT
	mov rax, 1
	mov rdi, 1   // stdout
	mov rsi, msg // the message to be printed
	mov rdx, 17  // message length
	syscall

	// READ
	mov rax, 0
	mov rdi, 0   // stdin
	mov rsi, num // input
	mov rdx, 1   // input length
	syscall

	// GET RANDOM
	mov rax, 318 // sys call for random
	mov rdi, rdm // save random number to rdm
	mov rsi, 1   // length
	mov rdx, 9   // idk maybe range ?
	syscall

	// PRINT
	// message given by user
	mov rax, 1
	mov rdi, 1   // stdout
	mov rsi, num // the message to be printed
	mov rdx, 1   // message length
	syscall

victory:
	// PRINT
	// victory message
	mov rax, 0       // write sys all
	mov rdi, 0       // stdin
	mov rdi, msg_won // victory message
	mov rd, 13       // messge length
	syscall

	// EXIT CALL
	mov rax, 60
	mov rdi, 0
	syscall
