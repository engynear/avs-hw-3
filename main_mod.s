	.intel_syntax noprefix
	.text
	.globl	dzeta
dzeta:										# функция дзета
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi				# -20[rbp] = n, параметр функции
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0			# -8[rbp] = sum, локальная переменная функции
	mov	DWORD PTR -12[rbp], 1				# -12[rbp] = i
	jmp	.L2
.L3:
	cvtsi2sd	xmm0, DWORD PTR -12[rbp]
	movsd	xmm1, QWORD PTR .LC1[rip]
	call	pow@PLT
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L2:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jle	.L3
	movsd	xmm0, QWORD PTR -8[rbp]		# return sum(возвращаемое значение функции)
	leave
	ret
	.section	.rodata
	.align 8
.LC3:
	.string	"Enter the number of decimal places from 1 to 7:\t "
.LC4:
	.string	"%d"
.LC6:
	.string	"Pi = %.*f\n"
	.text
	.globl	main
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rdi, .LC3[rip]
	call	printf@PLT
	lea	rax, -12[rbp]				# -12[rbp] = n (число вводимое пользователем)
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	call	__isoc99_scanf@PLT
	mov	edi, 10000000
	call	dzeta
	movsd	xmm1, QWORD PTR .LC5[rip]
	mulsd	xmm0, xmm1
	call	sqrt@PLT
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax		# -8[rbp] = pi
	mov	eax, DWORD PTR -12[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	mov	esi, eax
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT				#  printf("Pi = %.*f\n", n, pi);
	leave
	ret
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	0
	.long	1072693248
	.align 8
.LC5:
	.long	0
	.long	1075314688
