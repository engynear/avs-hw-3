	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	dzeta
	.type	dzeta, @function
dzeta:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -12[rbp], 1
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
	movsd	xmm0, QWORD PTR -8[rbp]
	leave
	ret
	.size	dzeta, .-dzeta
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
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -12[rbp]
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	edi, 10000000
	call	dzeta
	movsd	xmm1, QWORD PTR .LC5[rip]
	mulsd	xmm0, xmm1
	call	sqrt@PLT
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	mov	eax, DWORD PTR -12[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	movq	xmm0, rdx
	mov	esi, eax
	lea	rdi, .LC6[rip]
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
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
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
