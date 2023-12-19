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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r5, r1
	mov	r6, r0
	mov	r7, r2
	mov	r1, r0
	ldr	r2, .L7+8
	mov	r0, #1
	ldr	r4, .L7+12
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L7+16
	ldr	r3, .L7+20
	strh	r8, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L7+24
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+28
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+32
	ldr	r3, .L7+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+40
	mov	lr, pc
	bx	r3
	str	r8, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #910163968
	mov	r5, r1
	mov	r6, r0
	mov	r7, r2
	mov	r1, r0
	ldr	r2, .L11+8
	mov	r0, #2
	ldr	r4, .L11+12
	mov	lr, pc
	bx	r4
	mov	r8, #0
	mov	r2, #1
	mvn	r0, #1520
	mov	r1, #128
	ldr	r4, .L11+16
	ldr	r3, .L11+20
	strh	r8, [r3, #6]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #6]	@ movhi
	mov	r0, r5
	str	r5, [r4, #4]
	str	r2, [r4, #8]
	str	r6, [r4]
	ldr	r3, .L11+24
	str	r7, [r4, #12]
	mov	lr, pc
	bx	r3
	ldr	r5, .L11+28
	adr	r3, .L11
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L11+32
	ldr	r3, .L11+36
	mov	lr, pc
	bx	r5
	ldr	r3, .L11+40
	mov	lr, pc
	bx	r3
	str	r8, [r4, #20]
	str	r0, [r4, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	.align	3
.L11:
	.word	1443109011
	.word	1078844686
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	pauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSounds, %function
pauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L14
	ldr	r0, .L14+4
	ldr	r1, .L14+8
	str	r3, [r0, #8]
	str	r3, [r1, #8]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L15:
	.align	2
.L14:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSounds, .-pauseSounds
	.align	2
	.global	unpauseSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSounds, %function
unpauseSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L17
	ldr	ip, .L17+4
	ldr	r0, .L17+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #8]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #8]
	bx	lr
.L18:
	.align	2
.L17:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSounds, .-unpauseSounds
	.align	2
	.global	stopSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSounds, %function
stopSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L20
	ldr	r1, .L20+4
	ldr	r2, [r2]
	ldr	ip, .L20+8
	ldr	r0, .L20+12
	strh	r3, [r1, #2]	@ movhi
	str	r3, [r2, #20]
	str	r3, [ip, #8]
	str	r3, [r0, #8]
	strh	r3, [r1, #6]	@ movhi
	str	r3, [r2, #32]
	bx	lr
.L21:
	.align	2
.L20:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSounds, .-stopSounds
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
