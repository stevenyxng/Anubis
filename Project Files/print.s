	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"print.c"
	.text
	.align	2
	.global	mgba_open
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_open, %function
mgba_open:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r2, .L3+4
	strh	r2, [r3, #-127]	@ movhi
	ldr	r2, .L3+8
	ldrh	r0, [r3, #-127]
	sub	r3, r0, r2
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	bx	lr
.L4:
	.align	2
.L3:
	.word	83884031
	.word	-16162
	.word	7658
	.size	mgba_open, .-mgba_open
	.align	2
	.global	mgba_printf_level
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_printf_level, %function
mgba_printf_level:
	@ Function supports interworking.
	@ args = 4, pretend = 12, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r1, r2, r3}
	ldr	r3, .L8
	ldrh	r2, [r3, #-127]
	push	{r4, r5, lr}
	cmp	r2, #0
	ldreq	r2, .L8+4
	strheq	r2, [r3, #-127]	@ movhi
	sub	sp, sp, #8
	mov	r4, r0
	ldrheq	r3, [r3, #-127]
	mov	r1, #256
	add	r3, sp, #24
	ldr	r2, [sp, #20]
	ldr	r5, .L8+8
	ldr	r0, .L8+12
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r5
	and	r4, r4, #7
	ldr	r3, .L8
	orr	r4, r4, #256
	strh	r4, [r3, #-255]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, lr}
	add	sp, sp, #12
	bx	lr
.L9:
	.align	2
.L8:
	.word	83884031
	.word	-16162
	.word	vsnprintf
	.word	83883520
	.size	mgba_printf_level, .-mgba_printf_level
	.align	2
	.global	mgba_printf
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_printf, %function
mgba_printf:
	@ Function supports interworking.
	@ args = 4, pretend = 16, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 1
	push	{r0, r1, r2, r3}
	ldr	r3, .L13
	ldrh	r2, [r3, #-127]
	push	{r4, lr}
	cmp	r2, #0
	ldreq	r2, .L13+4
	strheq	r2, [r3, #-127]	@ movhi
	sub	sp, sp, #8
	ldrheq	r3, [r3, #-127]
	ldr	r2, [sp, #16]
	add	r3, sp, #20
	mov	r1, #256
	ldr	r4, .L13+8
	ldr	r0, .L13+12
	str	r3, [sp, #4]
	mov	lr, pc
	bx	r4
	ldr	r3, .L13
	ldr	r2, .L13+16
	strh	r2, [r3, #-255]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	add	sp, sp, #16
	bx	lr
.L14:
	.align	2
.L13:
	.word	83884031
	.word	-16162
	.word	vsnprintf
	.word	83883520
	.word	258
	.size	mgba_printf, .-mgba_printf
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Breakpoint Reached\000"
	.text
	.align	2
	.global	mgba_break
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_break, %function
mgba_break:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r1, .L16
	b	mgba_printf_level
.L17:
	.align	2
.L16:
	.word	.LC0
	.size	mgba_break, .-mgba_break
	.align	2
	.global	mgba_close
	.syntax unified
	.arm
	.fpu softvfp
	.type	mgba_close, %function
mgba_close:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	ldr	r3, .L19
	strh	r2, [r3, #-127]	@ movhi
	bx	lr
.L20:
	.align	2
.L19:
	.word	83884031
	.size	mgba_close, .-mgba_close
	.ident	"GCC: (devkitARM release 53) 9.1.0"
