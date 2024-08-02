section .text
global  _start

section .data
msg_hello db "Guess The Number!\n", 0ah
msg_won   db "You have won!", 0ah
msg_lose   db "You have lost :(", 0ah
num     db 1  // input number buffer
rnm     db 1  // the random number
cnt     db 0  // keeps track of number of tries

section .text
global  _start

_start:

try_again:
	// increase counter by one
	mv  rax, cnt
	mv  rdi, 1
	add rax, rdi

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

	// COMPARE
	mov rax, num // input
	mov rdi, rdm // random number
	cmp rax, rdi
	je  victory  // if equal show victory screen

	// check number of tries
	mov rax, cnt
	mov rax, 3
	cmp rax, rdi
	jne try_again // try again
	je  you_lose

victory:
	// PRINT
	// victory message
	mov  rax, 0       // write sys all
	mov  rdi, 0       // stdin
	mov  rdi, msg_won // victory message
	mov  rd, 13       // messge length
	syscall
	jump exit

you_lose:
	// PRINT
	// losing message
	mov  rax, 0        // write sys all
	mov  rdi, 0        // stdin
	mov  rdi, msg_lose // losing message
	mov  rd, 16        // messge length
	syscall
	jump exit

exit:
	// EXIT CALL
	mov rax, 60
	mov rdi, 0
	syscall
