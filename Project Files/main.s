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
	.file	"main.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	tst	r2, #1
	push	{r4, lr}
	strh	ip, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #8]
	cmp	r2, ip
	beq	.L5
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L5
	ldr	r2, [r3, #12]
	cmp	r2, ip
	bne	.L15
	ldr	r3, .L17+8
	ldr	r1, .L17+12
	ldr	r3, [r3]
	strh	r2, [r1, #2]	@ movhi
	str	r2, [r3, #20]
.L5:
	ldr	r3, .L17+16
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L3
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L16
	ldr	r3, .L17+8
	ldr	r1, .L17+12
	ldr	r3, [r3]
	strh	r2, [r1, #6]	@ movhi
	str	r2, [r3, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	mov	r2, #1
	ldm	r3, {r0, r1}
	ldr	r4, .L17+20
	str	ip, [r3, #20]
	mov	lr, pc
	bx	r4
	b	.L5
.L16:
	mov	ip, #0
	mov	r2, #1
	ldm	r3, {r0, r1}
	ldr	r4, .L17+24
	str	ip, [r3, #20]
	mov	lr, pc
	bx	r4
	b	.L3
.L18:
	.align	2
.L17:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L21
	mov	lr, pc
	bx	r3
	ldr	r4, .L21+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L21+8
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r1, .L21+12
	ldr	r2, .L21+16
	strh	r1, [r3]	@ movhi
	mov	r0, #3
	mov	r3, #38400
	ldr	r2, [r2]
	ldr	r1, .L21+20
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #1
	ldr	r1, .L21+24
	ldr	r3, .L21+28
	strb	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	1027
	.word	videoBuffer
	.word	startBitmapBitmap
	.word	state
	.word	currentLevel
	.size	goToStart, .-goToStart
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L25
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L26:
	.align	2
.L25:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #128
	mov	r4, #67108864
	mvn	r2, #136
	mov	r3, #2
	mov	r5, #1
	strh	r1, [r4, #132]	@ movhi
	strh	r2, [r4, #128]	@ movhi
	strh	r3, [r4, #130]	@ movhi
	bl	goToStart
	ldr	r2, .L29
	ldr	r3, .L29+4
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r1, #8
	mov	r0, #97
	strh	r1, [r4, #4]	@ movhi
	ldr	r3, .L29+8
	ldr	r2, .L29+12
	ldr	r1, .L29+16
	strh	r5, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	pop	{r4, r5, r6, lr}
	str	r1, [r2, #4092]
	bx	lr
.L30:
	.align	2
.L29:
	.word	currentLevel
	.word	setupSounds
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #1
	ldr	r3, .L33
	ldr	ip, .L33+4
	ldr	r2, [r3]
	mov	r0, #3
	mov	r3, #38400
	ldr	r1, .L33+8
	ldr	r4, .L33+12
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	ldr	r3, .L33+16
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L33+20
	ldr	r3, .L33+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	videoBuffer
	.word	state
	.word	instructionBitmap
	.word	DMANow
	.word	stateDing_length
	.word	stateDing_data
	.word	playSoundB
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L40+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #2
	ldr	r3, .L44
	ldr	ip, .L44+4
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L44+8
	ldr	r3, .L44+12
	strb	lr, [ip]
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r3, #4864
	mov	r2, #56832
	mov	r0, #7424
	strh	r3, [r1]	@ movhi
	ldr	r4, .L44+16
	strh	r2, [r1, #8]	@ movhi
	mov	r3, #1024
	strh	r0, [r1, #10]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L44+20
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L44+24
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L44+28
	ldr	r1, .L44+32
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L44+36
	ldr	r1, .L44+40
	mov	lr, pc
	bx	r4
	ldr	r3, .L44+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	stateDing_length
	.word	state
	.word	stateDing_data
	.word	playSoundB
	.word	DMANow
	.word	tilesetTiles
	.word	tilesetPal
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	initializeGame
	.size	goToGame, .-goToGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions.part.0, %function
instructions.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L48
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L49:
	.align	2
.L48:
	.word	buttons
	.size	instructions.part.0, .-instructions.part.0
	.set	levelComplete.part.0,instructions.part.0
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	instructions.part.0
.L53:
	.align	2
.L52:
	.word	oldButtons
	.size	instructions, .-instructions
	.align	2
	.global	goToLevelComplete
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLevelComplete, %function
goToLevelComplete:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #3
	ldr	r2, .L56
	ldr	r3, .L56+4
	strb	r4, [r2]
	ldr	r5, .L56+8
	mov	lr, pc
	bx	r3
	mov	r0, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L56+12
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldr	r1, .L56+16
	ldr	r3, .L56+20
	strh	r1, [r2]	@ movhi
	mov	r0, r4
	ldr	r2, [r3]
	ldr	r1, .L56+24
	mov	r3, #38400
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	1027
	.word	videoBuffer
	.word	levelCompleteBGBitmap
	.size	goToLevelComplete, .-goToLevelComplete
	.align	2
	.global	levelComplete
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelComplete, %function
levelComplete:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	instructions
	.size	levelComplete, .-levelComplete
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #4
	mov	r0, #8
	mov	ip, #22
	ldr	r2, .L61
	ldr	r3, .L61+4
	strb	lr, [r2]
	ldr	r1, .L61+8
	ldr	lr, .L61+12
	strh	r0, [r3, #16]	@ movhi
	strh	lr, [r3, #18]	@ movhi
	ldr	r4, .L61+16
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, .L61+20
	strh	ip, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	state
	.word	shadowOAM
	.word	stateDing_length
	.word	16600
	.word	playSoundB
	.word	stateDing_data
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L70
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
	ldr	r3, .L70+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L63:
	pop	{r4, lr}
	bx	lr
.L69:
	pop	{r4, lr}
	b	goToPause
.L71:
	.align	2
.L70:
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L84
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L73
	ldr	r2, .L84+4
	ldrh	r2, [r2]
	ands	r2, r2, #8
	beq	.L82
.L73:
	tst	r3, #4
	beq	.L72
	ldr	r3, .L84+4
	ldrh	r2, [r3]
	ands	r4, r2, #4
	beq	.L83
.L72:
	pop	{r4, lr}
	bx	lr
.L83:
	bl	goToStart
	ldr	r3, .L84+8
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L84+12
	ldr	r3, .L84+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L82:
	mov	r0, #2
	mov	ip, #512
	ldr	r3, .L84+20
	ldr	r1, .L84+8
	strb	r0, [r3]
	ldr	r3, .L84+24
	ldr	r1, [r1]
	strh	ip, [r3, #16]	@ movhi
	ldr	r0, .L84+12
	ldr	r3, .L84+16
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L73
.L85:
	.align	2
.L84:
	.word	oldButtons
	.word	buttons
	.word	stateDing_length
	.word	stateDing_data
	.word	playSoundB
	.word	state
	.word	shadowOAM
	.size	pause, .-pause
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Debugging Initialized\000"
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L113
	mov	lr, pc
	bx	r3
	ldr	r3, .L113+4
	mov	lr, pc
	bx	r3
	ldr	r0, .L113+8
	ldr	r3, .L113+12
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	ldr	r5, .L113+16
	ldr	fp, .L113+20
	ldr	r10, .L113+24
	ldr	r9, .L113+28
	ldr	r8, .L113+32
	ldr	r7, .L113+36
	ldr	r6, .L113+40
.L96:
	ldrh	r1, [r5]
	strh	r1, [fp]	@ movhi
	ldrb	r2, [r10]	@ zero_extendqisi2
	ldrh	r3, [r7, #48]
	strh	r3, [r5]	@ movhi
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L87
.L89:
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L88
.L88:
	tst	r1, #8
	ldrne	r3, .L113+44
	movne	lr, pc
	bxne	r3
.L87:
	mov	lr, pc
	bx	r9
	ldr	r3, .L113+48
	ldr	r2, [r3]
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	strh	r3, [r4, #16]	@ movhi
	ldr	r3, [r8]
	add	r2, r2, r2, lsr #31
	add	r1, r3, r3, lsr #31
	asr	r2, r2, #1
	asr	r1, r1, #1
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsl	r1, r1, #16
	lsr	r2, r2, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	strh	r3, [r4, #18]	@ movhi
	mov	r0, #3
	strh	r2, [r4, #20]	@ movhi
	mov	r3, #512
	strh	r1, [r4, #22]	@ movhi
	mov	r2, #117440512
	mov	r1, r6
	ldr	ip, .L113+52
	mov	lr, pc
	bx	ip
	b	.L96
.L90:
	tst	r1, #8
	beq	.L87
	ldr	r3, .L113+56
	mov	lr, pc
	bx	r3
	b	.L87
.L91:
	ldr	r3, .L113+60
	mov	lr, pc
	bx	r3
	b	.L87
.L92:
	tst	r1, #8
	beq	.L87
	ldr	r3, .L113+64
	mov	lr, pc
	bx	r3
	b	.L87
.L93:
	ldr	r3, .L113+68
	mov	lr, pc
	bx	r3
	b	.L87
.L95:
	tst	r1, #8
	beq	.L87
	tst	r3, #8
	bne	.L87
	ldr	r3, .L113+72
	mov	lr, pc
	bx	r3
	b	.L87
.L94:
	tst	r1, #8
	beq	.L87
	ldr	r3, .L113+76
	mov	lr, pc
	bx	r3
	b	.L87
.L114:
	.align	2
.L113:
	.word	initialize
	.word	mgba_open
	.word	.LC0
	.word	mgba_printf
	.word	buttons
	.word	oldButtons
	.word	state
	.word	waitForVBlank
	.word	vOff
	.word	67109120
	.word	shadowOAM
	.word	lose.part.0
	.word	hOff
	.word	DMANow
	.word	win.part.0
	.word	pause
	.word	levelComplete.part.0
	.word	game
	.word	goToInstructions
	.word	instructions.part.0
	.size	main, .-main
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #5
	ldr	r2, .L117
	push	{r4, lr}
	ldr	r3, .L117+4
	strb	r1, [r2]
	ldr	r4, .L117+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L117+12
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r1, #67108864
	ldr	r2, .L117+16
	ldr	ip, .L117+20
	str	r3, [r2]
	ldr	r0, .L117+24
	ldr	r2, .L117+28
	str	r3, [ip]
	ldr	r2, [r2]
	strh	r0, [r1]	@ movhi
	mov	r3, #38400
	mov	r0, #3
	ldr	r1, .L117+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L118:
	.align	2
.L117:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	1027
	.word	videoBuffer
	.word	winBGBitmap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L121
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	win.part.0
.L122:
	.align	2
.L121:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #6
	ldr	r2, .L125
	push	{r4, r5, r6, lr}
	ldr	r3, .L125+4
	mov	r4, #0
	strb	r1, [r2]
	ldr	r5, .L125+8
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L125+12
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	ldr	r2, .L125+16
	ldr	r0, .L125+20
	str	r4, [r2]
	ldr	r1, .L125+24
	ldr	r2, .L125+28
	str	r4, [r0]
	ldr	r2, [r2]
	strh	r1, [r3]	@ movhi
	mov	r0, #3
	mov	r3, #38400
	ldr	r1, .L125+32
	mov	lr, pc
	bx	r5
	ldr	r3, .L125+36
	mov	r2, r4
	ldr	r1, [r3]
	ldr	r0, .L125+40
	ldr	r3, .L125+44
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	.align	2
.L125:
	.word	state
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	1027
	.word	videoBuffer
	.word	gameOverBitmap
	.word	stateDing_length
	.word	stateDing_data
	.word	playSoundB
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L130
	ldr	r2, .L130+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L130+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L131:
	.align	2
.L130:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	state,1,1
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	currentLevel,4,4
	.comm	currentCollisionMap,2,2
	.comm	shadowOAM,1024,4
	.comm	player,52,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
