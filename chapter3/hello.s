	.file	"hello.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.2x"
	.text
	.globl	show_bytes
	.type	show_bytes, @function
show_bytes:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testl	%esi, %esi
	jle	.L2
	movq	%rdi, %rbx
	leal	-1(%rsi), %eax
	leaq	1(%rdi,%rax), %rbp
.L3:
	movzbl	(%rbx), %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	jne	.L3
.L2:
	movl	$10, %edi
	call	putchar
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	show_bytes, .-show_bytes
	.globl	show_int
	.type	show_int, @function
show_int:
.LFB24:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, 12(%rsp)
	movl	$4, %esi
	leaq	12(%rsp), %rdi
	call	show_bytes
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	show_int, .-show_int
	.globl	show_float
	.type	show_float, @function
show_float:
.LFB25:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movss	%xmm0, 12(%rsp)
	movl	$4, %esi
	leaq	12(%rsp), %rdi
	call	show_bytes
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	show_float, .-show_float
	.globl	show_pointer
	.type	show_pointer, @function
show_pointer:
.LFB26:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$8, %esi
	leaq	8(%rsp), %rdi
	call	show_bytes
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	show_pointer, .-show_pointer
	.globl	arith
	.type	arith, @function
arith:
.LFB27:
	.cfi_startproc
	addl	%edi, %esi
	movzwl	%si, %esi
	leal	(%rdx,%rdx,2), %eax
	sall	$4, %eax
	imull	%esi, %eax
	ret
	.cfi_endproc
.LFE27:
	.size	arith, .-arith
	.globl	sotre_prob
	.type	sotre_prob, @function
sotre_prob:
.LFB28:
	.cfi_startproc
	movl	%esi, %esi
	imulq	%rsi, %rdx
	movq	%rdx, (%rdi)
	ret
	.cfi_endproc
.LFE28:
	.size	sotre_prob, .-sotre_prob
	.globl	compare
	.type	compare, @function
compare:
.LFB29:
	.cfi_startproc
	cmpl	%esi, %edi
	cmovb	%edi, %esi
	movl	%esi, (%rdx)
	ret
	.cfi_endproc
.LFE29:
	.size	compare, .-compare
	.globl	arithDivide
	.type	arithDivide, @function
arithDivide:
.LFB30:
	.cfi_startproc
	leal	3(%rdi), %eax
	testl	%edi, %edi
	cmovns	%edi, %eax
	sarl	$2, %eax
	ret
	.cfi_endproc
.LFE30:
	.size	arithDivide, .-arithDivide
	.globl	test1
	.type	test1, @function
test1:
.LFB31:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L19
	movl	%edi, %edx
	subl	%esi, %edx
	movl	%edi, %eax
	xorl	%esi, %eax
	cmpl	%esi, %edi
	cmovl	%edx, %eax
	ret
.L19:
	leal	(%rdi,%rsi), %eax
	sall	$2, %edi
	cmpl	$-2, %esi
	cmovl	%edi, %eax
	ret
	.cfi_endproc
.LFE31:
	.size	test1, .-test1
	.globl	switch_eg
	.type	switch_eg, @function
switch_eg:
.LFB32:
	.cfi_startproc
	subl	$100, %esi
	cmpl	$6, %esi
	ja	.L30
	movl	%esi, %esi
	jmp	*.L26(,%rsi,8)
	.section	.rodata
	.align 8
	.align 4
.L26:
	.quad	.L25
	.quad	.L30
	.quad	.L27
	.quad	.L28
	.quad	.L29
	.quad	.L30
	.quad	.L29
	.text
.L25:
	leal	(%rdi,%rdi,2), %eax
	leal	(%rdi,%rax,4), %eax
	ret
.L27:
	addl	$10, %edi
.L28:
	leal	11(%rdi), %eax
	ret
.L29:
	movl	%edi, %eax
	imull	%edi, %eax
	ret
.L30:
	movl	$0, %eax
	ret
	.cfi_endproc
.LFE32:
	.size	switch_eg, .-switch_eg
	.globl	main
	.type	main, @function
main:
.LFB33:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$128, %edi
	call	show_int
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
