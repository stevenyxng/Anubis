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
	.file	"game.c"
	.text
	.align	2
	.global	level1GoalTiles
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	level1GoalTiles, %function
level1GoalTiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #224
	mov	lr, #208
	ldr	r2, .L4
	ldr	r3, .L4+4
	str	r4, [r2]
	ldr	ip, .L4+8
	ldr	r1, .L4+12
	ldr	r2, .L4+16
	str	lr, [ip]
	str	r1, [r3, #1720]
	str	r2, [r3, #1784]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	goalX
	.word	100724736
	.word	goalY
	.word	786443
	.word	1310739
	.size	level1GoalTiles, .-level1GoalTiles
	.align	2
	.global	level2GoalTiles
	.syntax unified
	.arm
	.fpu softvfp
	.type	level2GoalTiles, %function
level2GoalTiles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #224
	mov	lr, #80
	ldr	r2, .L8
	ldr	r3, .L8+4
	str	r4, [r2]
	ldr	ip, .L8+8
	ldr	r1, .L8+12
	ldr	r2, .L8+16
	str	lr, [ip]
	str	r1, [r3, #696]
	str	r2, [r3, #760]
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	goalX
	.word	100724736
	.word	goalY
	.word	786443
	.word	1310739
	.size	level2GoalTiles, .-level2GoalTiles
	.align	2
	.global	initGems
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGems, %function
initGems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L19
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, r5, lr}
	beq	.L17
	cmp	r3, #2
	beq	.L18
.L12:
	mov	r2, #16
	mov	lr, #1
	mov	ip, #4
	mov	r0, #15
	ldr	r3, .L19+4
	add	r1, r3, #260
.L13:
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	lr, [r3, #44]
	str	ip, [r3, #40]
	str	r0, [r3, #32]
	add	r3, r3, #52
	cmp	r3, r1
	bne	.L13
	pop	{r4, r5, lr}
	bx	lr
.L18:
	mov	r2, #48
	mov	r5, #224
	mov	r4, #136
	mov	lr, #192
	mov	ip, #144
	mov	r0, #64
	mov	r1, #208
	ldr	r3, .L19+4
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #52]
	str	r2, [r3, #212]
	str	r5, [r3, #56]
	str	r4, [r3, #104]
	str	lr, [r3, #108]
	str	ip, [r3, #156]
	str	r0, [r3, #160]
	str	r1, [r3, #208]
	b	.L12
.L17:
	mov	r0, #80
	mov	r1, #32
	mov	r2, #192
	mov	r5, #16
	mov	r4, #114
	mov	lr, #176
	mov	ip, #208
	ldr	r3, .L19+4
	str	r0, [r3]
	str	r0, [r3, #156]
	str	r5, [r3, #52]
	str	r4, [r3, #56]
	str	lr, [r3, #160]
	str	ip, [r3, #212]
	str	r1, [r3, #4]
	str	r1, [r3, #108]
	str	r2, [r3, #104]
	str	r2, [r3, #208]
	b	.L12
.L20:
	.align	2
.L19:
	.word	currentLevel
	.word	gem
	.size	initGems, .-initGems
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"player initialized\000"
	.text
	.align	2
	.global	initializeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L30
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, lr}
	beq	.L29
	cmp	r3, #2
	beq	.L27
	ldr	r4, .L30+4
.L23:
	ldr	r2, .L30+8
	ldr	r1, .L30+12
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	bl	initGems
	mov	r2, #0
	mov	lr, #60
	mov	r1, r2
	mov	ip, #1
	ldr	r0, .L30+20
	ldr	r3, .L30+24
	str	lr, [r0]
	add	r0, r3, #3120
.L24:
	str	r2, [r3]
	str	r1, [r3, #4]
	str	ip, [r3, #44]
	add	r3, r3, #52
	cmp	r3, r0
	add	r2, r2, #4
	bne	.L24
	ldr	r0, .L30+28
	ldr	r3, .L30+32
	ldr	lr, .L30+36
	ldr	r2, .L30+40
	ldr	ip, .L30+44
	str	r1, [r0]
	str	r1, [r3]
	ldr	r0, .L30+48
	ldr	r3, .L30+52
	str	r1, [lr]
	str	ip, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L29:
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+56
	ldr	r1, .L30+60
	ldr	r4, .L30+4
	mov	lr, pc
	bx	r4
	b	.L23
.L27:
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+56
	ldr	r1, .L30+64
	ldr	r4, .L30+4
	mov	lr, pc
	bx	r4
	b	.L23
.L31:
	.align	2
.L30:
	.word	currentLevel
	.word	DMANow
	.word	100722688
	.word	overlayTileMap
	.word	initializePlayer
	.word	nextBarToErase
	.word	timerBar
	.word	hOff
	.word	vOff
	.word	score
	.word	timer
	.word	1800
	.word	.LC0
	.word	mgba_printf
	.word	100724736
	.word	level1TileMapMap
	.word	level2TileMapMap
	.size	initializeGame, .-initializeGame
	.align	2
	.global	setUpLevel1Gems
	.syntax unified
	.arm
	.fpu softvfp
	.type	setUpLevel1Gems, %function
setUpLevel1Gems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r0, #80
	mov	r5, #16
	mov	r4, #114
	mov	lr, #176
	mov	r1, #32
	mov	r2, #192
	mov	ip, #208
	ldr	r3, .L34
	str	r5, [r3, #52]
	str	r4, [r3, #56]
	str	lr, [r3, #160]
	str	r0, [r3]
	str	r0, [r3, #156]
	str	ip, [r3, #212]
	str	r1, [r3, #4]
	str	r1, [r3, #108]
	str	r2, [r3, #104]
	str	r2, [r3, #208]
	pop	{r4, r5, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	gem
	.size	setUpLevel1Gems, .-setUpLevel1Gems
	.align	2
	.global	setUpLevel2Gems
	.syntax unified
	.arm
	.fpu softvfp
	.type	setUpLevel2Gems, %function
setUpLevel2Gems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #48
	mov	r5, #224
	mov	r4, #136
	mov	lr, #192
	mov	ip, #144
	mov	r0, #64
	mov	r1, #208
	ldr	r3, .L38
	str	r5, [r3, #56]
	str	r4, [r3, #104]
	str	lr, [r3, #108]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #52]
	str	r2, [r3, #212]
	str	ip, [r3, #156]
	str	r0, [r3, #160]
	str	r1, [r3, #208]
	pop	{r4, r5, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	gem
	.size	setUpLevel2Gems, .-setUpLevel2Gems
	.global	__aeabi_idivmod
	.align	2
	.global	updateGems
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGems, %function
updateGems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L57
	ldr	r5, .L57+4
	ldr	r6, .L57+8
	ldr	r8, .L57+12
	ldr	r9, .L57+16
	ldr	r10, .L57+20
	sub	sp, sp, #20
	add	r7, r4, #260
.L48:
	ldr	fp, [r4, #44]
	cmp	fp, #0
	bne	.L55
.L42:
	ldr	r3, [r4, #32]
	subs	r3, r3, #1
	strne	r3, [r4, #32]
	bne	.L45
	mov	r3, #15
	ldr	r0, [r4, #36]
	str	r3, [r4, #32]
	ldr	r1, [r4, #40]
	ldr	r3, .L57+24
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L45:
	cmp	fp, #1
	beq	.L56
.L46:
	mov	r3, #512
	strh	r3, [r5, #80]	@ movhi
.L47:
	add	r4, r4, #52
	cmp	r4, r7
	add	r5, r5, #8
	bne	.L48
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L56:
	ldr	r3, .L57+28
	ldr	r1, [r4]
	ldr	r2, [r3]
	add	r3, r1, #16
	sub	r3, r3, r2
	cmp	r3, #0
	ble	.L46
	sub	r2, r1, r2
	cmp	r2, #239
	bgt	.L46
	ldr	r1, .L57+32
	ldr	r3, [r4, #4]
	ldr	r0, [r1]
	add	r1, r3, #16
	sub	r1, r1, r0
	cmp	r1, #0
	ble	.L46
	sub	r3, r3, r0
	cmp	r3, #159
	bgt	.L46
	ldr	r1, [r4, #36]
	lsl	r2, r2, #23
	add	r0, r1, #65
	ldr	r1, .L57+36
	lsr	r2, r2, #23
	orr	r2, r2, #16384
	and	r3, r3, #255
	and	r1, r1, r0, lsl #1
	strh	r2, [r5, #82]	@ movhi
	strh	r3, [r5, #80]	@ movhi
	strh	r1, [r5, #84]	@ movhi
	b	.L47
.L55:
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r6, #16
	ldm	r2, {r2, r3}
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	bne	.L52
.L54:
	ldr	fp, [r4, #44]
	b	.L42
.L52:
	mov	r2, #0
	ldr	r3, [r9]
	ldr	r1, .L57+40
	add	r3, r3, #1
	str	r3, [r9]
	mov	r0, r10
	ldr	r1, [r1]
	str	r2, [r4, #44]
	ldr	r3, .L57+44
	mov	lr, pc
	bx	r3
	b	.L54
.L58:
	.align	2
.L57:
	.word	gem
	.word	shadowOAM
	.word	player
	.word	collision
	.word	score
	.word	stateDing_data
	.word	__aeabi_idivmod
	.word	hOff
	.word	vOff
	.word	1022
	.word	stateDing_length
	.word	playSoundB
	.size	updateGems, .-updateGems
	.align	2
	.global	initTimerBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTimerBar, %function
initTimerBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	str	lr, [sp, #-4]!
	mov	lr, #60
	mov	ip, r2
	mov	r0, #1
	ldr	r1, .L63
	ldr	r3, .L63+4
	str	lr, [r1]
	add	r1, r3, #3120
.L60:
	stm	r3, {r2, ip}
	str	r0, [r3, #44]
	add	r3, r3, #52
	cmp	r3, r1
	add	r2, r2, #4
	bne	.L60
	ldr	lr, [sp], #4
	bx	lr
.L64:
	.align	2
.L63:
	.word	nextBarToErase
	.word	timerBar
	.size	initTimerBar, .-initTimerBar
	.align	2
	.global	updateTimerBar
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTimerBar, %function
updateTimerBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L74
	ldr	r2, .L74+4
	ldr	r3, [r3]
	cmp	r3, r2
	movle	r1, #31
	ldrle	r2, .L74+8
	add	r3, r3, r3, lsl #4
	push	{r4, r5, lr}
	add	r3, r3, r3, lsl #8
	strhle	r1, [r2, #8]	@ movhi
	ldr	r2, .L74+12
	add	r3, r3, r3, lsl #16
	sub	r3, r2, r3
	cmp	r2, r3, ror #1
	bcc	.L67
	mov	ip, #0
	ldr	r0, .L74+16
	ldr	r3, [r0]
	ldr	r2, .L74+20
	add	r1, r3, r3, lsl #1
	add	r1, r3, r1, lsl #2
	add	r2, r2, r1, lsl #2
	sub	r3, r3, #1
	str	r3, [r0]
	str	ip, [r2, #44]
.L67:
	mov	r5, #512
	mov	r4, #24
	ldr	r3, .L74+20
	ldr	r2, .L74+24
	ldr	lr, .L74+28
	add	r0, r3, #3120
.L70:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	ldrne	r1, [r3]
	ldrbne	ip, [r3, #4]	@ zero_extendqisi2
	andne	r1, r1, lr
	add	r3, r3, #52
	strhne	r4, [r2, #4]	@ movhi
	strhne	r1, [r2, #2]	@ movhi
	strhne	ip, [r2]	@ movhi
	strheq	r5, [r2]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L70
	pop	{r4, r5, lr}
	bx	lr
.L75:
	.align	2
.L74:
	.word	timer
	.word	450
	.word	83886592
	.word	143165576
	.word	nextBarToErase
	.word	timerBar
	.word	shadowOAM+400
	.word	511
	.size	updateTimerBar, .-updateTimerBar
	.align	2
	.global	levelDone
	.syntax unified
	.arm
	.fpu softvfp
	.type	levelDone, %function
levelDone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L81
	ldr	r3, [r2]
	cmp	r3, #1
	push	{r4, lr}
	ble	.L80
	ldr	r3, .L81+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	add	r3, r3, #1
	ldr	r1, .L81+8
	str	r3, [r2]
	mov	lr, pc
	bx	r1
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	currentLevel
	.word	goToWin
	.word	goToLevelComplete
	.size	levelDone, .-levelDone
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L102
	ldr	r3, .L102+4
	mov	lr, pc
	bx	r3
	bl	updateGems
	bl	updateTimerBar
	ldr	r3, [r4]
	cmp	r3, #4
	ble	.L84
	ldr	r3, .L102+8
	ldr	r2, .L102+12
	ldr	r1, [r3]
	ldr	r2, [r2]
	cmp	r1, r2
	beq	.L97
.L84:
	ldr	r2, .L102+16
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r2]
	ble	.L98
.L85:
	ldr	r3, [r4]
	cmp	r3, #4
	ble	.L86
	ldr	r3, .L102+20
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L99
	cmp	r3, #2
	beq	.L100
.L86:
	ldr	r3, .L102+24
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L83
	tst	r3, #2
	beq	.L83
	ldr	r3, .L102+28
	ldrh	r3, [r3]
	tst	r3, #3
	bne	.L83
	ldr	r3, .L102+20
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L101
	cmp	r3, #2
	bne	.L83
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L102+32
	ldr	r1, .L102+36
	ldr	r4, .L102+40
	mov	lr, pc
	bx	r4
.L83:
	pop	{r4, lr}
	bx	lr
.L98:
	ldr	r3, .L102+44
	mov	lr, pc
	bx	r3
	b	.L85
.L99:
	mov	lr, #224
	mov	ip, #208
	ldr	r2, .L102+12
	ldr	r3, .L102+32
	str	lr, [r2]
	ldr	r0, .L102+48
	ldr	r1, .L102+52
	ldr	r2, .L102+56
	str	ip, [r0]
	str	r1, [r3, #1720]
	str	r2, [r3, #1784]
	b	.L86
.L97:
	ldr	r1, .L102+48
	ldr	r2, [r3, #4]
	ldr	r3, [r1]
	cmp	r2, r3
	bne	.L84
	bl	levelDone
	b	.L84
.L100:
	mov	lr, #224
	mov	ip, #80
	ldr	r2, .L102+12
	ldr	r3, .L102+32
	str	lr, [r2]
	ldr	r0, .L102+48
	ldr	r1, .L102+52
	ldr	r2, .L102+56
	str	ip, [r0]
	str	r1, [r3, #696]
	str	r2, [r3, #760]
	b	.L86
.L101:
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L102+32
	ldr	r1, .L102+60
	ldr	r4, .L102+40
	mov	lr, pc
	bx	r4
	b	.L83
.L103:
	.align	2
.L102:
	.word	score
	.word	updatePlayer
	.word	player
	.word	goalX
	.word	timer
	.word	currentLevel
	.word	oldButtons
	.word	buttons
	.word	100724736
	.word	level2CheatTileMapMap
	.word	DMANow
	.word	goToLose
	.word	goalY
	.word	786443
	.word	1310739
	.word	level1CheatTileMapMap
	.size	updateGame, .-updateGame
	.align	2
	.global	ding
	.syntax unified
	.arm
	.fpu softvfp
	.type	ding, %function
ding:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	ding, .-ding
	.align	2
	.global	updateGoal
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGoal, %function
updateGoal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L107
	ldr	r3, [r3]
	cmp	r3, #4
	bxle	lr
	ldr	r3, .L107+4
	ldr	r2, .L107+8
	ldr	r1, [r3]
	ldr	r2, [r2]
	cmp	r1, r2
	bxne	lr
	ldr	r1, .L107+12
	ldr	r2, [r3, #4]
	ldr	r3, [r1]
	cmp	r2, r3
	bxne	lr
	b	levelDone
.L108:
	.align	2
.L107:
	.word	score
	.word	player
	.word	goalX
	.word	goalY
	.size	updateGoal, .-updateGoal
	.comm	nextBarToErase,4,4
	.comm	timerBar,3120,4
	.comm	gem,260,4
	.comm	goalY,4,4
	.comm	goalX,4,4
	.comm	timer,4,4
	.comm	score,4,4
	.comm	currentLevel,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	currentCollisionMap,2,2
	.comm	shadowOAM,1024,4
	.comm	player,52,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
