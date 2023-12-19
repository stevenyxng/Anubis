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
	.file	"player.c"
	.text
	.align	2
	.global	initializePlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializePlayer, %function
initializePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #16
	mov	lr, #4
	mov	r1, #8
	mov	ip, #20
	mov	r0, #0
	ldr	r3, .L4
	str	lr, [r3, #40]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	ip, [r3, #32]
	str	r0, [r3, #28]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initializePlayer, .-initializePlayer
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L108
	ldr	r5, [r4, #28]
	cmp	r5, #1
	beq	.L100
	ldr	r3, .L108+4
	ldr	r2, [r3]
	cmp	r2, #4
	beq	.L39
	mov	r5, #1
	mov	r0, #2
	mov	r1, #4
	str	r2, [r4, #24]
	ldr	r2, .L108+8
	str	r5, [r4, #28]
	str	r0, [r2]
	str	r1, [r3]
.L36:
	ldr	r7, .L108+12
	ldr	r3, [r7]
	cmp	r3, #15
	bgt	.L43
	ldr	r2, [r4]
	sub	r2, r2, r3
	cmp	r2, #119
	addgt	r3, r3, #1
	strgt	r3, [r7]
	cmp	r3, #0
	bgt	.L43
.L45:
	ldr	r6, .L108+16
	ldr	r3, [r6]
	cmp	r3, #95
	bgt	.L46
	ldr	r2, [r4, #4]
	sub	r2, r2, r3
	cmp	r2, #79
	addgt	r3, r3, #1
	strgt	r3, [r6]
	cmp	r3, #0
	bgt	.L46
.L48:
	ldr	r3, [r4, #32]
	subs	r3, r3, #1
	strne	r3, [r4, #32]
	bne	.L50
	mov	r2, #20
	ldr	r0, [r4, #36]
	ldr	r3, .L108+20
	ldr	r1, [r4, #40]
	str	r2, [r4, #32]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L50:
	cmp	r5, #0
	beq	.L51
	ldr	ip, .L108+8
	ldr	r2, [ip]
	cmp	r2, #0
	beq	.L52
	ldr	r1, [r7]
	ldr	r3, [r4]
	ldr	lr, [r6]
	sub	r3, r3, r1
	ldr	r0, [r4, #4]
	ldr	r1, [r4, #36]
	lsl	r3, r3, #23
	sub	r0, r0, lr
	lsr	r3, r3, #23
	ldr	lr, .L108+24
	lsl	r1, r1, #6
	sub	r2, r2, #1
	orr	r3, r3, #16384
	and	r0, r0, #255
	and	r1, r1, #960
	str	r2, [ip]
	strh	r3, [lr, #2]	@ movhi
	strh	r0, [lr]	@ movhi
	strh	r1, [lr, #4]	@ movhi
.L6:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L39:
	ldr	r3, .L108+28
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L40
	ldr	r2, .L108+32
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L40
	mov	r5, #1
	mov	r2, #2
	ldr	r3, .L108+8
	str	r5, [r4, #28]
	str	r5, [r4, #24]
	str	r2, [r3]
	b	.L36
.L46:
	ldr	r2, [r4, #4]
	sub	r2, r2, r3
	cmp	r2, #80
	suble	r3, r3, #1
	strle	r3, [r6]
	b	.L48
.L43:
	ldr	r2, [r4]
	sub	r2, r2, r3
	cmp	r2, #120
	suble	r3, r3, #1
	strle	r3, [r7]
	b	.L45
.L51:
	ldr	r2, [r7]
	ldr	r3, [r4]
	ldr	ip, [r6]
	ldr	r1, [r4, #4]
	sub	r3, r3, r2
	ldr	r2, [r4, #36]
	lsl	r3, r3, #23
	ldr	r0, .L108+24
	lsr	r3, r3, #23
	sub	r1, r1, ip
	lsl	r2, r2, #6
	orr	r3, r3, #16384
	and	r1, r1, #255
	and	r2, r2, #960
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L100:
	ldr	r0, [r4]
	ldr	r3, [r4, #16]
	ldr	ip, [r4, #4]
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #24]
	add	r3, r0, r3
	add	r2, ip, r2
	sub	r5, r3, #1
	sub	lr, r2, #1
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L8
.L10:
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L9
.L12:
	cmp	ip, #0
	ble	.L14
	ldr	r3, .L108+36
	ldr	r3, [r3]
	ldr	r2, [r4, #12]
	cmp	r3, #1
	ldreq	r3, .L108+40
	sub	ip, ip, r2
	beq	.L98
	cmp	r3, #2
	bne	.L14
	ldr	r3, .L108+44
.L98:
	add	r0, r0, ip, lsl #8
	ldrb	r2, [r0, r3]	@ zero_extendqisi2
	cmp	r2, #0
	lsl	r2, ip, #8
	beq	.L14
	add	r2, r5, r2
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L14
.L94:
	str	ip, [r4, #4]
.L8:
	ldr	r3, .L108+28
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L35
.L106:
	ldr	r2, .L108+32
	ldrh	r2, [r2]
	ands	r2, r2, #128
	bne	.L35
.L96:
	ldr	r3, .L108+4
	ldr	r5, [r4, #28]
	str	r2, [r3]
	b	.L36
.L35:
	tst	r3, #64
	beq	.L37
	ldr	r2, .L108+32
	ldrh	r2, [r2]
	tst	r2, #64
	bne	.L37
	mov	r2, #1
	ldr	r3, .L108+4
	ldr	r5, [r4, #28]
	str	r2, [r3]
	b	.L36
.L52:
	ldr	r3, [r4, #24]
	cmp	r3, #1
	beq	.L101
	cmp	r3, #0
	bne	.L55
	mov	r0, #6
	ldr	ip, [r7]
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	ldr	r1, [r6]
	sub	r3, r3, ip
	sub	r2, r2, #16
	ldr	ip, .L108+48
	sub	r2, r2, r1
	lsl	r3, r3, #23
	ldr	r1, .L108+24
	lsr	r3, r3, #23
	and	r2, r2, #255
	orr	r2, r2, ip
	orr	r3, r3, ip
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	b	.L6
.L37:
	tst	r3, #32
	beq	.L38
	ldr	r2, .L108+32
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L102
.L38:
	tst	r3, #16
	ldr	r5, [r4, #28]
	beq	.L36
	ldr	r3, .L108+32
	ldrh	r3, [r3]
	tst	r3, #16
	moveq	r2, #3
	ldreq	r3, .L108+4
	streq	r2, [r3]
	b	.L36
.L40:
	tst	r3, #128
	beq	.L41
	ldr	r2, .L108+32
	ldrh	r2, [r2]
	ands	r2, r2, #128
	beq	.L103
.L41:
	tst	r3, #32
	beq	.L42
	ldr	r2, .L108+32
	ldrh	r2, [r2]
	tst	r2, #32
	bne	.L42
	mov	r3, #2
	mov	r5, #1
	ldr	r2, .L108+8
	str	r5, [r4, #28]
	str	r3, [r4, #24]
	str	r3, [r2]
	b	.L36
.L101:
	mov	ip, #8
	ldr	r0, [r7]
	ldr	r3, [r4]
	ldr	r1, [r6]
	ldr	r2, [r4, #4]
	sub	r3, r3, r0
	sub	r2, r2, r1
	ldr	r0, .L108+48
	lsl	r3, r3, #23
	ldr	r1, .L108+24
	lsr	r3, r3, #23
	and	r2, r2, #255
	orr	r3, r3, r0
	orr	r2, r2, r0
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	b	.L6
.L13:
	cmp	r2, #255
	bgt	.L14
	ldr	r3, .L108+36
	ldr	r3, [r3]
	ldr	r2, [r4, #12]
	cmp	r3, #1
	ldreq	r3, .L108+40
	add	lr, r2, lr
	beq	.L99
	cmp	r3, #2
	bne	.L14
	ldr	r3, .L108+44
.L99:
	add	r0, r0, lr, lsl #8
	ldrb	r1, [r0, r3]	@ zero_extendqisi2
	cmp	r1, #0
	lsl	lr, lr, #8
	beq	.L14
	add	lr, r5, lr
	ldrb	r3, [lr, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L14
	add	ip, r2, ip
	b	.L94
.L9:
	cmp	r3, #255
	bgt	.L14
	ldr	r3, .L108+36
	ldr	r3, [r3]
	ldr	r2, [r4, #8]
	cmp	r3, #1
	add	r5, r2, r5
	beq	.L104
	cmp	r3, #2
	bne	.L14
	ldr	r3, .L108+44
	add	ip, r5, ip, lsl #8
	ldrb	r1, [ip, r3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L14
.L33:
	add	r5, r5, lr, lsl #8
	ldrb	r3, [r5, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L14
	add	r0, r2, r0
	b	.L95
.L11:
	cmp	r0, #0
	ble	.L14
	ldr	r3, .L108+36
	ldr	r2, [r3]
	ldr	r3, [r4, #8]
	cmp	r2, #1
	sub	r0, r0, r3
	beq	.L105
	cmp	r2, #2
	bne	.L14
	ldr	r3, .L108+44
	add	ip, r0, ip, lsl #8
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L14
.L28:
	add	lr, r0, lr, lsl #8
	ldrb	r3, [lr, r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L14
.L95:
	str	r0, [r4]
	b	.L8
.L105:
	ldr	r3, .L108+40
	add	ip, r0, ip, lsl #8
	ldrb	r2, [ip, r3]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L28
.L14:
	mov	r3, #0
	str	r3, [r4, #28]
	ldr	r3, .L108+28
	ldrh	r3, [r3]
	tst	r3, #128
	beq	.L35
	b	.L106
.L42:
	tst	r3, #16
	beq	.L36
	ldr	r3, .L108+32
	ldrh	r3, [r3]
	tst	r3, #16
	bne	.L36
	mov	r3, #1
	mov	r0, #3
	mov	r1, #2
	ldr	r2, .L108+8
	mov	r5, r3
	str	r3, [r4, #28]
	str	r0, [r4, #24]
	str	r1, [r2]
	b	.L36
.L55:
	cmp	r3, #2
	beq	.L107
	cmp	r3, #3
	bne	.L6
	ldr	r3, [r4]
	ldr	r2, [r7]
	sub	r3, r3, #16
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r0, #2
.L97:
	mvn	r3, r3, lsr #17
	ldr	r1, [r6]
	ldr	r2, [r4, #4]
	sub	r2, r2, r1
	and	r2, r2, #255
	ldr	r1, .L108+24
	orr	r2, r2, #16384
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	b	.L6
.L102:
	mov	r2, #2
	b	.L96
.L103:
	mov	r5, #1
	mov	r1, #2
	ldr	r3, .L108+8
	str	r2, [r4, #24]
	str	r5, [r4, #28]
	str	r1, [r3]
	b	.L36
.L107:
	ldr	r2, [r7]
	ldr	r3, [r4]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mov	r0, #66
	b	.L97
.L104:
	ldr	r3, .L108+40
	add	ip, r5, ip, lsl #8
	ldrb	r1, [ip, r3]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L33
	b	.L14
.L109:
	.align	2
.L108:
	.word	player
	.word	nextDirection
	.word	justMoved
	.word	hOff
	.word	vOff
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	currentLevel
	.word	level1CollisionMapBitmap
	.word	level2CollisionMapBitmap
	.word	-32768
	.size	updatePlayer, .-updatePlayer
	.comm	nextDirection,4,4
	.comm	justMoved,4,4
	.comm	currentLevel,4,4
	.comm	currentCollisionMap,2,2
	.comm	shadowOAM,1024,4
	.comm	player,52,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
