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
	mov	r2, #0
	ldr	r3, .L17
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L17+4
	ldr	r2, [r3, #8]
	cmp	r2, #0
	beq	.L5
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	ble	.L5
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L15
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #20]
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
	ble	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L16
	ldr	r1, .L17+8
	ldr	r0, .L17+12
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L17
	ldrh	r2, [r3, #2]
	ldrh	r2, [r3, #2]
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+20
	mov	lr, pc
	bx	r3
	b	.L5
.L16:
	ldm	r3, {r0, r1}
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
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
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawIndicator.part.0, %function
drawIndicator.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #136
	ldr	r3, .L20
	ldr	r2, [r3]
	ldr	r1, .L20+4
	ldr	r3, .L20+8
	add	r2, r2, #352
	ldr	r0, .L20+12
	add	r2, r2, #3
	and	r2, r1, r2, lsl #1
	add	r1, r3, #332
	add	r3, r3, #328
	strh	r2, [r1]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	bx	lr
.L21:
	.align	2
.L20:
	.word	bute
	.word	1022
	.word	shadowOAM
	.word	16392
	.size	drawIndicator.part.0, .-drawIndicator.part.0
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	ldr	r4, .L24+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L24+8
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #4352
	mov	r3, #16384
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	ldr	r2, .L24+12
	ldr	r1, .L24+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L24+20
	ldr	r1, .L24+24
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #264
	mov	ip, #15
	mov	r0, #2
	mov	r5, #8
	mov	r4, #10
	mov	fp, #32
	mov	r10, #448
	mov	r9, #3
	mov	r8, #280
	mov	r7, #320
	mov	lr, #56
	mov	r6, #90
	ldr	r1, .L24+28
	str	r3, [r1]
	ldr	r1, .L24+32
	str	r3, [r1]
	ldr	r1, .L24+36
	str	r3, [r1]
	ldr	r1, .L24+40
	str	r3, [r1]
	ldr	r1, .L24+44
	str	r3, [r1]
	ldr	r1, .L24+48
	str	r3, [r1]
	ldr	r1, .L24+52
	str	r3, [r1]
	ldr	r1, .L24+56
	str	r3, [r1]
	ldr	r1, .L24+60
	str	r3, [r1]
	ldr	r1, .L24+64
	str	r2, [r1]
	str	r2, [r1, #4]
	ldr	r2, .L24+68
	str	fp, [r2]
	str	r10, [r2, #4]
	str	r5, [r2, #44]
	str	ip, [r2, #16]
	str	ip, [r2, #20]
	str	r9, [r2, #24]
	str	r4, [r2, #36]
	str	r0, [r2, #8]
	str	r0, [r2, #12]
	ldr	r2, .L24+72
	str	r3, [r1, #24]
	str	r8, [r2]
	str	ip, [r1, #16]
	str	ip, [r1, #20]
	str	r5, [r1, #44]
	str	r4, [r1, #36]
	str	r0, [r1, #8]
	str	r0, [r1, #12]
	str	r7, [r2, #4]
	ldr	r0, .L24+76
	ldr	r1, .L24+80
	ldr	r2, .L24+84
	str	lr, [r0]
	str	lr, [r1]
	str	r6, [r2]
	ldr	r4, .L24+88
	ldr	ip, .L24+92
	ldr	r0, .L24+96
	ldr	r1, .L24+100
	ldr	r2, .L24+104
	str	r3, [r4]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	100728832
	.word	ssTiles
	.word	83886592
	.word	ssPal
	.word	hOff
	.word	vOff
	.word	sailing
	.word	flame1
	.word	flame2
	.word	flame3
	.word	flame4
	.word	flame5
	.word	gotKey
	.word	player
	.word	jumpy
	.word	sherry
	.word	burn
	.word	mark
	.word	more
	.word	caveCheatInt
	.word	snowCheat
	.word	leafCheat
	.word	fishCheat
	.word	oil
	.size	initialize, .-initialize
	.align	2
	.global	setupSoundsReal
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSoundsReal, %function
setupSoundsReal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	push	{r4, r5, r6, lr}
	mov	r0, #67108864
	mov	r4, #1
	mov	ip, #8
	ldr	r3, .L28
	ldr	r2, .L28+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L28+8
	strh	r4, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	r3, .L28+12
	str	r1, [r2, #4092]
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+16
	ldr	r0, [r3]
	ldr	lr, .L28+20
	ldr	r3, .L28+24
	sub	r0, r0, #800
	str	r0, [r3, #12]
	ldr	r6, [lr]
	ldr	r0, .L28+28
	ldr	lr, .L28+32
	ldr	ip, .L28+36
	ldr	r5, [lr]
	ldr	lr, [r0]
	ldr	r0, .L28+40
	ldr	ip, [ip]
	str	r0, [r3, #16]
	ldr	r2, .L28+44
	ldr	r0, .L28+48
	ldr	r1, .L28+52
	str	ip, [r3, #8]
	ldr	r2, [r2]
	ldr	r3, .L28+56
	ldr	ip, [r0]
	ldr	r1, [r1]
	ldr	r0, .L28+60
	str	r2, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	ldr	r3, .L28+64
	str	r5, [r3, #12]
	ldr	r5, .L28+68
	str	r6, [r3, #8]
	str	r5, [r3, #16]
	ldr	r3, .L28+72
	ldr	r5, .L28+76
	str	ip, [r3, #12]
	ldr	ip, .L28+80
	str	lr, [r3, #8]
	str	ip, [r3, #16]
	ldr	r5, [r5]
	ldr	r3, .L28+84
	ldr	r2, .L28+88
	str	r5, [r3, #12]
	ldr	r2, [r2]
	ldr	r5, .L28+92
	ldr	ip, .L28+96
	str	r2, [r3, #8]
	ldr	ip, [ip]
	str	r5, [r3, #16]
	ldr	lr, .L28+100
	ldr	r3, .L28+104
	ldr	lr, [lr]
	str	ip, [r3, #12]
	ldr	r2, .L28+108
	ldr	ip, .L28+112
	str	lr, [r3, #8]
	ldr	r2, [r2]
	str	ip, [r3, #16]
	ldr	r3, .L28+116
	ldr	lr, .L28+120
	str	r2, [r3, #8]
	ldr	r2, .L28+124
	ldr	r5, [lr]
	ldr	ip, .L28+128
	ldr	lr, [r2]
	mov	r2, r4
	ldr	r4, .L28+132
	str	r5, [r3, #12]
	str	r4, [r3, #16]
	ldr	ip, [ip]
	ldr	r3, .L28+136
	str	ip, [r3, #8]
	ldr	ip, .L28+140
	ldr	r4, .L28+144
	str	lr, [r3, #12]
	str	ip, [r3, #16]
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.word	setupSounds
	.word	flip_length
	.word	reflect_sampleRate
	.word	flip
	.word	townWin_sampleRate
	.word	reflect_length
	.word	flip_sampleRate
	.word	flip_data
	.word	town_sampleRate
	.word	townWin_length
	.word	town_length
	.word	town
	.word	town_data
	.word	reflect
	.word	reflect_data
	.word	townWin
	.word	secret_length
	.word	townWin_data
	.word	secret
	.word	secret_sampleRate
	.word	secret_data
	.word	flower_length
	.word	flower_sampleRate
	.word	flower
	.word	shroom_sampleRate
	.word	flower_data
	.word	shroom
	.word	shroom_length
	.word	surf_length
	.word	surf_sampleRate
	.word	shroom_data
	.word	surf
	.word	surf_data
	.word	playSoundA
	.size	setupSoundsReal, .-setupSoundsReal
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
	ldr	r3, .L32
	ldr	r2, .L32+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L32+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L33:
	.align	2
.L32:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
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
	push	{r4, r5, r6, lr}
	bl	initialize
	ldr	r3, .L36
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r6, #256
	mov	r2, #56320
	ldr	r5, .L36+4
	strh	r6, [r4]	@ movhi
	mov	r3, #3264
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L36+8
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L36+12
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L36+16
	mov	r0, #3
	ldr	r1, .L36+20
	mov	lr, pc
	bx	r5
	mov	r3, #0
	ldr	r2, .L36+24
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	hideSprites
	.word	DMANow
	.word	startTiles
	.word	startPal
	.word	100720640
	.word	startMap
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L40
	mov	r2, #0
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L40+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L41:
	.align	2
.L40:
	.word	flip
	.word	playSoundB
	.size	pause.part.0, .-pause.part.0
	.set	instructions.part.0,pause.part.0
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
	ldr	r3, .L44
	mov	lr, pc
	bx	r3
	mov	ip, #0
	mov	r1, #67108864
	mov	r2, #4352
	mov	r0, #55296
	ldr	r3, .L44+4
	ldr	r4, .L44+8
	str	ip, [r3]
	strh	r2, [r1]	@ movhi
	mov	r3, #3488
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L44+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L44+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L44+20
	mov	r0, #3
	ldr	r1, .L44+24
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L44+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L45:
	.align	2
.L44:
	.word	hideSprites
	.word	cheeta
	.word	DMANow
	.word	worldTiles
	.word	worldPal
	.word	100712448
	.word	worldMap
	.word	state
	.size	goToGame, .-goToGame
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r6, #256
	mov	r2, #56320
	ldr	r5, .L48+4
	strh	r6, [r4]	@ movhi
	mov	r3, #2432
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L48+8
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+12
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L48+16
	ldr	r1, .L48+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #2
	ldr	r2, .L48+24
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	hideSprites
	.word	DMANow
	.word	pauseTiles
	.word	pausePal
	.word	100720640
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
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
	ldr	r3, .L62
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	ands	r2, r2, #8
	beq	.L60
.L51:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L61
.L50:
	pop	{r4, lr}
	bx	lr
.L60:
	ldr	r3, .L62+12
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L62+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L61:
	pop	{r4, lr}
	b	pause.part.0
.L63:
	.align	2
.L62:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	flip
	.word	playSoundB
	.size	pause, .-pause
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r6, #256
	mov	r2, #56320
	ldr	r5, .L66+4
	strh	r6, [r4]	@ movhi
	mov	r3, #4064
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	mov	r2, #100663296
	ldr	r1, .L66+8
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r3, #1024
	strh	r1, [r4, #16]	@ movhi
	ldr	r2, .L66+16
	strh	r1, [r4, #18]	@ movhi
	mov	r0, #3
	ldr	r1, .L66+20
	mov	lr, pc
	bx	r5
	mov	r2, #3
	ldr	r3, .L66+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	DMANow
	.word	winTiles
	.word	winPal
	.word	100720640
	.word	winMap
	.word	state
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
	ldr	r3, .L75
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L75+8
	ldrh	r2, [r3]
	ands	r2, r2, #8
	beq	.L74
.L68:
	pop	{r4, lr}
	bx	lr
.L74:
	ldr	r3, .L75+12
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L75+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+20
	mov	r2, #1
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L75+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L76:
	.align	2
.L75:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	flip
	.word	playSoundB
	.word	town
	.word	playSoundA
	.size	win, .-win
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
	push	{r4, r5, r6, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r6, #256
	mov	r2, #56320
	ldr	r5, .L79+4
	strh	r6, [r4]	@ movhi
	mov	r0, #3
	strh	r2, [r4, #8]	@ movhi
	ldr	r3, .L79+8
	mov	r2, #100663296
	ldr	r1, .L79+12
	mov	lr, pc
	bx	r5
	mov	r3, r6
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L79+16
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r3, #1024
	strh	r1, [r4, #16]	@ movhi
	ldr	r2, .L79+20
	strh	r1, [r4, #18]	@ movhi
	mov	r0, #3
	ldr	r1, .L79+24
	mov	lr, pc
	bx	r5
	mov	r2, #4
	ldr	r3, .L79+28
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L80:
	.align	2
.L79:
	.word	hideSprites
	.word	DMANow
	.word	5296
	.word	howTiles
	.word	howPal
	.word	100720640
	.word	howMap
	.word	state
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L93
	ldr	r3, [r4]
	ldr	r5, .L93+4
	add	r3, r3, #1
	ldr	r2, .L93+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L82
	ldr	r2, .L93+12
	ldrh	r2, [r2]
	ands	r6, r2, #8
	beq	.L91
.L82:
	tst	r3, #4
	beq	.L81
	ldr	r3, .L93+12
	ldrh	r2, [r3]
	ands	r5, r2, #4
	beq	.L92
.L81:
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	ldr	r0, [r4]
	ldr	r3, .L93+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+20
	mov	r2, r5
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L93+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L91:
	ldr	r3, .L93+16
	ldr	r0, [r4]
	mov	lr, pc
	bx	r3
	ldr	r3, .L93+20
	mov	r2, r6
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L93+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r5]
	b	.L82
.L94:
	.align	2
.L93:
	.word	rSeed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	srand
	.word	flip
	.word	playSoundB
	.size	start, .-start
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
	ldr	r3, .L102
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L95
	ldr	r3, .L102+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L101
.L95:
	pop	{r4, lr}
	bx	lr
.L101:
	pop	{r4, lr}
	b	instructions.part.0
.L103:
	.align	2
.L102:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToSnow
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToSnow, %function
goToSnow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L110
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r3, #4864
	mov	r2, #55296
	ldr	r5, .L110+4
	strh	r3, [r4]	@ movhi
	mov	r0, #3
	strh	r2, [r4, #10]	@ movhi
	ldr	r1, .L110+8
	mov	r2, #100663296
	add	r3, r3, #1648
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L110+12
	mov	lr, pc
	bx	r5
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L110+16
	ldr	r1, .L110+20
	mov	lr, pc
	bx	r5
	ldr	r2, .L110+24
	mov	r3, #7040
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L110+28
	ldr	r1, .L110+32
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L110+36
	ldr	r1, .L110+40
	mov	lr, pc
	bx	r5
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L110+44
	ldr	r1, .L110+48
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	ip, #32
	mov	r1, #448
	ldr	r2, .L110+52
	ldr	r0, .L110+56
	str	ip, [r2]
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	strh	r3, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	ldr	r3, [r0]
	cmp	r3, #0
	str	r1, [r2, #4]
	movne	r2, #9
	ldrne	r3, .L110+60
	strne	r2, [r3]
	mov	r2, #5
	ldr	r3, .L110+64
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L111:
	.align	2
.L110:
	.word	hideSprites
	.word	DMANow
	.word	epicTiles
	.word	epicPal
	.word	100712448
	.word	epicMap
	.word	-9212
	.word	100679680
	.word	tsTiles
	.word	83886112
	.word	tsPal+32
	.word	100720640
	.word	fallMap
	.word	jumpy
	.word	snowCheat
	.word	cheetad
	.word	state
	.size	goToSnow, .-goToSnow
	.align	2
	.global	goToLeaf
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLeaf, %function
goToLeaf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L118
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r3, #4352
	mov	r2, #55296
	strh	r3, [r4]	@ movhi
	ldr	r5, .L118+4
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #7040
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L118+8
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L118+12
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	lr, #30
	ldr	ip, .L118+16
	strh	r2, [r4, #16]	@ movhi
	mov	r3, #4096
	strh	r2, [r4, #18]	@ movhi
	mov	r0, #3
	ldr	r2, .L118+20
	ldr	r1, .L118+24
	str	lr, [ip, #4]
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L118+28
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #9
	ldrne	r3, .L118+32
	strne	r2, [r3]
	mov	r2, #8
	ldr	r3, .L118+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L119:
	.align	2
.L118:
	.word	hideSprites
	.word	DMANow
	.word	tsTiles
	.word	tsPal
	.word	player
	.word	100712448
	.word	leafMap
	.word	leafCheat
	.word	cheetad
	.word	state
	.size	goToLeaf, .-goToLeaf
	.align	2
	.global	goToFish
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFish, %function
goToFish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #55296
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L126
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #7040
	mov	r2, #100663296
	ldr	r1, .L126+4
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L126+8
	mov	lr, pc
	bx	r4
	mov	r1, #460
	mov	ip, #10
	ldr	r0, .L126+12
	ldr	r2, .L126+16
	str	r1, [r0, #4]
	mov	r3, #4096
	str	ip, [r0]
	ldr	r1, .L126+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L126+24
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #9
	ldrne	r3, .L126+28
	strne	r2, [r3]
	mov	r2, #7
	ldr	r3, .L126+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L127:
	.align	2
.L126:
	.word	DMANow
	.word	tsFishTiles
	.word	tsFishPal
	.word	player
	.word	100712448
	.word	fishMap
	.word	fishCheat
	.word	cheetad
	.word	state
	.size	goToFish, .-goToFish
	.align	2
	.global	goToCave
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToCave, %function
goToCave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L134
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r3, #4352
	mov	r2, #55296
	strh	r3, [r4]	@ movhi
	ldr	r5, .L134+4
	strh	r2, [r4, #8]	@ movhi
	mov	r3, #7040
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L134+8
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L134+12
	mov	lr, pc
	bx	r5
	mov	r1, #0
	mov	r0, #50
	mov	lr, #256
	ldr	ip, .L134+16
	strh	r1, [r4, #16]	@ movhi
	ldr	r2, .L134+20
	strh	r1, [r4, #18]	@ movhi
	mov	r3, #4096
	str	r1, [ip, #24]
	str	r0, [ip, #4]
	ldr	r1, .L134+24
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r3, .L134+28
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #9
	ldrne	r3, .L134+32
	strne	r2, [r3]
	mov	r2, #6
	ldr	r3, .L134+36
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L135:
	.align	2
.L134:
	.word	hideSprites
	.word	DMANow
	.word	tsCaveTiles
	.word	tsCavePal
	.word	player
	.word	100712448
	.word	caveMap
	.word	caveCheatInt
	.word	cheetad
	.word	state
	.size	goToCave, .-goToCave
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L461
	ldr	lr, [r4]
	ldr	r3, [r4, #16]
	add	r3, lr, r3
	ldr	r0, .L461+4
	sub	r3, r3, #1
	sub	sp, sp, #28
	str	r3, [sp, #20]
	ldr	r3, .L461+8
	ldr	ip, [r0]
	str	r2, [r3]
	ldr	r3, .L461+12
	cmp	ip, r2
	str	r2, [r3]
	movne	r3, #3
	moveq	r3, #2
	str	r3, [r4, #8]
	str	r3, [r4, #12]
	ldr	r3, .L461+16
	ldr	r1, [r4, #4]
	ldrh	r3, [r3]
	ldr	r10, [r4, #20]
	ldr	fp, .L461+20
	add	r10, r1, r10
	tst	r3, #64
	str	r2, [r4, #32]
	sub	r10, r10, #1
	ldr	r2, [fp]
	and	r5, r3, #32
	and	r0, r3, #16
	bne	.L140
	mov	r7, #1
	ldr	r6, [r4, #12]
	sub	r6, r1, r6
	cmp	r6, #0
	str	r7, [r4, #32]
	str	r7, [r4, #24]
	bgt	.L413
.L142:
	cmp	r5, #0
	moveq	r7, #1
	moveq	r6, #2
	ldreq	r8, .L461+8
	streq	r6, [r4, #28]
	streq	r7, [r8]
	cmp	r0, #0
	moveq	r7, #1
	moveq	r6, #3
	ldreq	r8, .L461+8
	streq	r6, [r4, #28]
	streq	r7, [r8]
.L140:
	ands	r3, r3, #128
	bne	.L159
	mov	r7, #1
	ldr	r9, [r4, #12]
	add	r6, r9, r10
	cmp	r6, #512
	str	r3, [r4, #24]
	str	r7, [r4, #32]
	blt	.L414
.L161:
	cmp	r5, #0
	bne	.L176
	mov	r3, #1
	cmp	r0, #0
	movne	r5, r3
	moveq	r5, r0
	ldr	r6, .L461+8
	str	r5, [r4, #28]
	str	r3, [r6]
.L180:
	mov	r5, #1
	mov	r3, #2
	ldr	r6, [r4, #8]
	sub	lr, lr, r6
	cmp	lr, #0
	str	r5, [r4, #32]
	str	r3, [r4, #24]
	bgt	.L415
.L181:
	cmp	r0, #0
	beq	.L283
.L195:
	cmp	r2, #1
	beq	.L407
	ldr	r5, .L461+24
.L209:
	ldr	r7, .L461+28
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L214
	ldr	r3, .L461+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L416
.L214:
	ldr	r1, [r4, #32]
	cmp	r1, #0
	beq	.L221
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #36]
	lslne	r1, r1, #5
	beq	.L417
.L223:
	ldr	r0, [r4]
	cmp	r0, #0
	movlt	r10, #0
	add	r6, r4, #16
	ldm	r6, {r6, lr}
	ldr	ip, [r4, #4]
	rsb	r3, r6, #240
	add	r3, r3, r3, lsr #31
	sub	r3, r0, r3, asr #1
	strlt	r10, [r4]
	movlt	r0, r10
	cmp	ip, #0
	movlt	r10, #0
	rsb	r2, lr, #160
	add	r2, r2, r2, lsr #31
	sub	r2, ip, r2, asr #1
	movlt	ip, r10
	rsb	r6, r6, #512
	rsb	lr, lr, #512
	strlt	r10, [r4, #4]
	cmp	r6, r0
	movlt	r0, r6
	ldr	r9, .L461+32
	ldr	r8, .L461+36
	strlt	r6, [r4]
	cmp	lr, ip
	movlt	ip, lr
	strlt	lr, [r4, #4]
	cmp	r3, #0
	str	r3, [r9]
	str	r2, [r8]
	blt	.L418
	cmp	r2, #0
	blt	.L419
	cmp	r3, #272
	movgt	r3, #272
	lslle	r3, r3, #16
	strgt	r3, [r9]
	lsrle	r3, r3, #16
.L229:
	cmp	r2, #352
	movgt	lr, #352
	movgt	r2, lr
	strgt	lr, [r8]
	ble	.L235
.L233:
	ldr	r6, .L461+4
	ldr	lr, [r4, #24]
	ldr	r6, [r6]
	sub	r3, r0, r3
	ldr	r8, .L461+40
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	sub	r2, ip, r2
	add	r1, lr, r1
	cmp	r6, #0
	ldr	r6, .L461+44
	and	r1, r8, r1, lsl #1
	and	r2, r2, #255
	orr	r8, r3, #16384
	strh	r2, [r6, #160]	@ movhi
	strh	r8, [r6, #162]	@ movhi
	strh	r1, [r6, #164]	@ movhi
	beq	.L238
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, .L461+8
	ldr	r2, [r2]
	cmp	r2, #0
	strh	r3, [r6, #162]	@ movhi
	ldrne	r3, [r4, #28]
	add	lr, lr, #20
	addne	r3, r3, #52
	lslne	r3, r3, #2
	lsl	lr, lr, #2
	andne	r3, r3, #1020
	and	lr, lr, #1020
	strh	lr, [r6, #164]	@ movhi
	strhne	r3, [r6, #164]	@ movhi
	ldr	r3, .L461+48
	ldr	r2, .L461+52
	ldr	r3, [r3]
	smull	lr, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	add	r2, r2, r2, lsl #2
	ldr	r1, [r4, #32]
	sub	r3, r3, r2, lsl #1
	orrs	r3, r3, r1
	bne	.L238
	ldr	r2, .L461+56
	ldr	r1, [r2]
	cmp	r1, #0
	moveq	r3, #1
	addne	ip, ip, #1
	subeq	ip, ip, #1
	str	ip, [r4, #4]
	str	r3, [r2]
.L238:
	ldr	r3, [fp]
	cmp	r3, #7
	beq	.L420
	mov	r1, #0
	ldr	r2, .L461+60
	str	r1, [r2]
.L245:
	cmp	r3, #8
	beq	.L250
.L251:
	mov	ip, #0
.L249:
	mov	r3, #5
	mov	r10, #17
	ldr	r9, .L461+64
	ldr	r2, [r9]
	ldr	r8, .L461+68
	str	r2, [sp]
	str	r3, [sp, #12]
	str	r3, [sp, #4]
	str	r10, [sp, #8]
	ldr	r2, .L461+188
	mov	r1, r3
	ldr	r0, [r2]
	str	ip, [r8]
	mov	r2, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mov	r3, #5
	beq	.L252
	mov	r2, #2
	ldr	r1, [fp]
	ldr	r3, .L461+72
	cmp	r1, #8
	str	r2, [r3]
	ldr	r3, [r8]
	beq	.L410
.L253:
	cmp	r3, #0
	beq	.L265
.L255:
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L265
	ldr	r3, .L461+16
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L421
.L265:
	mov	r2, #8
	mov	r0, #424
	mov	r1, #80
	mov	r3, #16
	stmib	sp, {r0, r2}
	str	r2, [sp, #12]
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L272
	ldr	r3, [fp]
	cmp	r3, #6
	moveq	r2, #1
	ldreq	r3, .L461+76
	streq	r2, [r3]
.L272:
	mov	ip, #32
	mov	r0, #312
	mov	r3, #16
	mov	r1, #384
	stmib	sp, {r0, ip}
	str	r3, [sp, #12]
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L273
	ldr	r3, .L461+80
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L273
	ldr	r3, .L461+76
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L422
.L273:
	mov	ip, #32
	mov	r0, #312
	mov	r3, #16
	mov	r1, #384
	stmib	sp, {r0, ip}
	str	r3, [sp, #12]
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L274
	ldrh	r3, [r7]
.L275:
	tst	r3, #2
	beq	.L136
	ldr	r3, .L461+16
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L136
	ldr	r3, [fp]
	cmp	r3, #6
	beq	.L423
.L278:
	ldr	r3, [fp]
	cmp	r3, #7
	beq	.L424
.L279:
	ldr	r3, [fp]
	cmp	r3, #8
	beq	.L425
.L136:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L159:
	cmp	r5, #0
	beq	.L180
	b	.L181
.L176:
	cmp	r0, #0
	bne	.L195
	mov	r3, #1
	str	r0, [r4, #28]
	ldr	r0, .L461+8
	str	r3, [r0]
.L283:
	mov	r5, #1
	mov	r0, #3
	ldr	lr, [r4, #8]
	ldr	r3, [sp, #20]
	add	r3, lr, r3
	cmp	r3, #512
	str	r5, [r4, #32]
	str	r0, [r4, #24]
	bge	.L195
	cmp	r2, r5
	beq	.L426
	cmp	r2, #7
	beq	.L427
	cmp	r2, #5
	beq	.L428
	cmp	r2, #8
	beq	.L429
	cmp	r2, #6
	ldreq	r5, .L461+84
	ldrne	r7, .L461+212
	ldreq	r7, .L461+212
	moveq	r0, r5
	ldrne	r0, [r7]
	streq	r5, [r7]
	b	.L197
.L221:
	mov	r3, #2
	str	r1, [r4, #40]
	str	r3, [r4, #36]
	b	.L223
.L417:
	mov	r2, #2
	add	r1, r1, #1
	rsbs	r3, r1, #0
	and	r3, r3, #7
	and	r1, r1, #7
	rsbpl	r1, r3, #0
	str	r1, [r4, #40]
	str	r2, [r4, #36]
	lsl	r1, r1, #5
	b	.L223
.L419:
	cmp	r3, #272
	mov	r2, #0
	movgt	r3, #272
	str	r2, [r8]
	strgt	r3, [r9]
	ble	.L230
.L235:
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	b	.L233
.L413:
	cmp	r2, r7
	beq	.L430
	cmp	r2, #7
	beq	.L431
	cmp	r2, #5
	beq	.L432
	cmp	r2, #8
	beq	.L433
	cmp	r2, #6
	ldreq	r9, .L461+84
	ldrne	r7, .L461+212
	ldreq	r7, .L461+212
	moveq	r8, r9
	ldrne	r8, [r7]
	streq	r9, [r7]
	b	.L144
.L415:
	cmp	r2, #1
	beq	.L434
	cmp	r2, #7
	beq	.L435
	cmp	r2, #5
	beq	.L436
	cmp	r2, #8
	beq	.L437
	cmp	r2, #6
	ldreq	r5, .L461+84
	ldrne	r7, .L461+212
	ldreq	r7, .L461+212
	moveq	r3, r5
	ldrne	r3, [r7]
	streq	r5, [r7]
	b	.L183
.L418:
	mov	r3, #0
	cmp	r2, r3
	str	r3, [r9]
	strlt	r3, [r8]
	bge	.L229
.L230:
	lsl	r3, r3, #16
	mov	r2, #0
	lsr	r3, r3, #16
	b	.L233
.L274:
	ldr	r3, .L461+76
	ldr	r3, [r3]
	cmp	r3, #0
	ldrh	r3, [r7]
	beq	.L275
	tst	r3, #1
	beq	.L275
	ldr	r2, .L461+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L275
	ldr	r2, [fp]
	cmp	r2, #6
	bne	.L275
	mov	r1, #231
	mov	lr, #33280
	mov	ip, #253
	mov	r0, #1
	ldr	r2, .L461+88
	strh	lr, [r6, #152]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	r1, .L461+92
	ldr	r2, .L461+96
	strh	ip, [r1]	@ movhi
	ldr	r1, .L461+100
	ldr	ip, .L461+104
	str	r1, [r2, #2400]
	ldr	r1, .L461+80
	str	ip, [r2, #2464]
	str	r0, [r1]
	b	.L275
.L252:
	ldr	r2, .L461+184
	ldr	r2, [r2]
	stm	sp, {r2, r3, r10}
	str	r3, [sp, #12]
	ldr	r0, .L461+188
	mov	r1, r3
	mov	r2, #8
	ldr	r0, [r0]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L256
	ldr	r3, .L461+192
	ldr	r3, [r3]
	cmp	r3, #0
	ldr	r2, [fp]
	ldr	r3, [r8]
	beq	.L257
	mov	r0, #2
	ldr	r1, .L461+72
	cmp	r2, #8
	str	r0, [r1]
	bne	.L253
.L410:
	cmp	r3, #0
	beq	.L265
	mov	r3, #1
	ldr	r2, .L461+12
	str	r3, [r2]
	b	.L255
.L250:
	mov	r2, #32
	mov	r0, #400
	mov	r1, #312
	mov	r3, #16
	stmib	sp, {r0, r2}
	str	r2, [sp, #12]
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L251
	ldr	r3, .L461+108
	ldr	ip, [r3]
	rsbs	ip, ip, #1
	movcc	ip, #0
	b	.L249
.L420:
	mov	ip, #280
	mov	r1, #336
	mov	r2, #80
	mov	r3, #1
	stm	sp, {r1, ip}
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	mov	r2, r3
	ldr	r1, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L438
	ldr	r1, .L461+112
	ldr	r3, [r1]
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	ldr	r0, .L461+60
	str	r3, [r0]
	ldr	r3, [fp]
	bne	.L244
	mov	r2, #1
	ldrh	ip, [r7]
	tst	ip, #1
	ldr	ip, .L461+12
	str	r2, [ip]
	beq	.L245
	ldr	r2, .L461+16
	ldrh	r2, [r2]
	ands	r2, r2, #1
	bne	.L245
	ldr	r8, .L461+116
	ldr	ip, [r8]
	cmp	ip, #7
	ldr	lr, .L461+120
	addne	r2, ip, #1
	ldr	ip, .L461+124
	ldr	r9, [lr]
	ldr	ip, [ip]
	cmp	ip, #0
	sub	ip, r9, #6
	str	ip, [lr]
	subne	ip, r9, #12
	strne	ip, [lr]
	cmp	ip, #56
	str	r2, [r8]
	bgt	.L245
	mov	r2, #0
	mov	ip, #1
	str	r2, [r0]
	ldr	r0, .L461+12
	str	ip, [r1]
	str	r2, [r0]
	b	.L245
.L407:
	mov	r0, #60
	mov	r1, #100
	mov	r2, #328
	mov	r6, #240
	mov	r3, #16
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r6, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	ldr	r5, .L461+24
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L210
.L211:
	mov	r3, #1
	ldr	r2, .L461+12
	str	r3, [r2]
	b	.L209
.L256:
	ldr	r2, [fp]
	ldr	r3, [r8]
.L257:
	mov	r1, #0
	cmp	r2, #8
	ldr	r0, .L461+72
	ldreq	r2, .L461+12
	str	r1, [r0]
	streq	r1, [r2]
	b	.L253
.L416:
	mov	ip, #60
	mov	r0, #100
	mov	r1, #328
	mov	r2, #240
	mov	r3, #16
	str	r2, [sp]
	str	ip, [sp, #12]
	str	r0, [sp, #8]
	str	r1, [sp, #4]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L216
	ldr	r2, [fp]
	cmp	r2, #1
	beq	.L439
.L216:
	ldrh	r3, [r7]
	tst	r3, #1
	beq	.L214
	ldr	r3, .L461+16
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L214
	mov	r1, #65
	mov	r2, #80
	mov	r6, #352
	mov	r3, #16
	str	r2, [sp, #8]
	str	r1, [sp, #12]
	str	r6, [sp, #4]
	str	r6, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L214
	ldr	r2, [fp]
	cmp	r2, #1
	bne	.L214
	ldr	r3, .L461+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L219
	ldr	r3, .L461+176
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+220
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #4]
	sub	r3, r3, #40
	str	r3, [r4, #4]
.L220:
	ldr	r2, .L461+4
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r2]
	b	.L214
.L414:
	cmp	r2, r7
	beq	.L440
	cmp	r2, #7
	beq	.L441
	cmp	r2, #5
	beq	.L442
	cmp	r2, #8
	beq	.L443
	cmp	r2, #6
	ldreq	r8, .L461+84
	ldrne	r7, .L461+212
	ldreq	r7, .L461+212
	moveq	r3, r8
	ldrne	r3, [r7]
	streq	r8, [r7]
	b	.L163
.L422:
	ldr	r3, [fp]
	cmp	r3, #6
	moveq	r3, #1
	ldreq	r2, .L461+12
	streq	r3, [r2]
	b	.L273
.L438:
	ldr	r3, .L461+60
	str	r0, [r3]
	ldr	r3, [fp]
.L244:
	cmp	r3, #7
	bne	.L245
	mov	ip, #0
	ldr	r3, .L461+12
	str	ip, [r3]
	b	.L249
.L423:
	ldr	r4, .L461+128
	ldr	r2, [r4]
	cmp	r2, #0
	bne	.L278
	ldr	r3, .L461+132
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+136
	mov	lr, pc
	bx	r3
	mov	r1, #1
	mov	lr, #9
	ldr	ip, .L461+140
	str	r1, [r4]
	mov	r3, #7040
	ldr	r4, .L461+144
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L461+148
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L461+152
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L461+156
	ldr	r1, .L461+160
	mov	lr, pc
	bx	r4
	ldrh	r3, [r7]
	tst	r3, #2
	beq	.L136
	ldr	r3, .L461+16
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L278
	b	.L136
.L425:
	ldr	r4, .L461+192
	ldr	r2, [r4]
	cmp	r2, #0
	bne	.L136
	ldr	r3, .L461+132
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+136
	mov	lr, pc
	bx	r3
	mov	r2, #9
	mov	r1, #1
	ldr	r3, .L461+140
	str	r1, [r4]
	str	r2, [r3]
	b	.L136
.L424:
	ldr	r4, .L461+124
	ldr	r2, [r4]
	cmp	r2, #0
	bne	.L279
	ldr	r3, .L461+132
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+136
	mov	lr, pc
	bx	r3
	mov	r1, #9
	mov	r3, #1
	ldrh	r0, [r7]
	ldr	r2, .L461+140
	tst	r0, #2
	str	r1, [r2]
	str	r3, [r4]
	beq	.L136
	ldr	r3, .L461+16
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L279
	b	.L136
.L421:
	mov	r3, #5
	mov	r10, #17
	ldr	r2, [r9]
	stm	sp, {r2, r3}
	str	r3, [sp, #12]
	str	r10, [sp, #8]
	ldr	r0, .L461+188
	mov	r1, r3
	mov	r2, #8
	ldr	r0, [r0]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mov	r3, #5
	beq	.L260
.L264:
	ldr	r3, .L461+208
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L411
	ldr	r3, .L461+204
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L411
	ldr	r3, .L461+200
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L411
	ldr	r3, .L461+196
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L411
	ldr	r3, .L461+164
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L265
	mov	r1, #1
	str	r2, [r8]
	ldr	r2, .L461+108
	str	r1, [r3]
	str	r1, [r2]
	b	.L265
.L430:
	ldr	r7, .L461+212
	ldr	r8, .L461+168
	str	r8, [r7]
.L144:
	add	r9, r8, lr
	cmp	ip, #0
	ldrb	r9, [r9, r6, lsl #9]	@ zero_extendqisi2
	beq	.L149
	rsbs	r9, r9, #1
	movcc	r9, #0
.L149:
	cmp	r9, #0
	beq	.L142
	cmp	r2, #1
	beq	.L444
	cmp	r2, #7
	beq	.L445
	cmp	r2, #5
	beq	.L446
	cmp	r2, #8
	beq	.L447
	cmp	r2, #6
	ldreq	r9, .L461+84
	moveq	r8, r9
	streq	r9, [r7]
.L152:
	ldr	r7, [sp, #20]
	cmp	ip, #0
	add	r8, r8, r7
	ldrb	r7, [r8, r6, lsl #9]	@ zero_extendqisi2
	beq	.L156
	rsbs	r7, r7, #1
	movcc	r7, #0
.L156:
	cmp	r7, #0
	strne	r6, [r4, #4]
	b	.L142
.L434:
	ldr	r7, .L461+212
	ldr	r3, .L461+168
	str	r3, [r7]
.L183:
	add	r5, r3, r1, lsl #9
	cmp	ip, #0
	ldrb	r5, [r5, lr]	@ zero_extendqisi2
	beq	.L188
	rsbs	r5, r5, #1
	movcc	r5, #0
.L188:
	cmp	r5, #0
	beq	.L181
	cmp	r2, #1
	beq	.L448
	cmp	r2, #7
	beq	.L449
	cmp	r2, #5
	beq	.L450
	cmp	r2, #8
	beq	.L451
	cmp	r2, #6
	ldreq	r5, .L461+84
	moveq	r3, r5
	streq	r5, [r7]
.L190:
	add	r3, r3, r10, lsl #9
	cmp	ip, #0
	ldrb	r3, [r3, lr]	@ zero_extendqisi2
	beq	.L194
	rsbs	r3, r3, #1
	movcc	r3, #0
.L194:
	cmp	r3, #0
	strne	lr, [r4]
	b	.L181
.L210:
	mov	r2, #352
	mov	r0, #65
	mov	r1, #80
	mov	r3, #16
	str	r2, [sp, #4]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L211
	ldr	r3, .L461+108
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L212
	ldr	r3, .L461+172
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L212
	ldr	r3, .L461+80
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L212
	ldr	r3, .L461+112
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L452
.L212:
	mov	r3, #0
	ldr	r2, .L461+12
	str	r3, [r2]
	b	.L209
.L411:
	mov	r2, #1
	str	r2, [r3]
	b	.L265
.L440:
	ldr	r7, .L461+212
	ldr	r3, .L461+168
	str	r3, [r7]
.L163:
	add	r8, r3, lr
	cmp	ip, #0
	ldrb	r8, [r8, r6, lsl #9]	@ zero_extendqisi2
	beq	.L168
	rsbs	r8, r8, #1
	movcc	r8, #0
.L168:
	cmp	r8, #0
	beq	.L161
	cmp	r2, #1
	beq	.L453
	cmp	r2, #7
	beq	.L454
	cmp	r2, #5
	beq	.L455
	cmp	r2, #8
	beq	.L456
	cmp	r2, #6
	ldreq	r8, .L461+84
	moveq	r3, r8
	streq	r8, [r7]
.L171:
	ldr	r7, [sp, #20]
	cmp	ip, #0
	add	r3, r3, r7
	ldrb	r3, [r3, r6, lsl #9]	@ zero_extendqisi2
	beq	.L175
	rsbs	r3, r3, #1
	movcc	r3, #0
.L175:
	cmp	r3, #0
	ldrne	r3, [r4, #4]
	addne	r9, r3, r9
	strne	r9, [r4, #4]
	b	.L161
.L426:
	ldr	r7, .L461+212
	ldr	r0, .L461+168
	str	r0, [r7]
.L197:
	add	r1, r0, r1, lsl #9
	cmp	ip, #0
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	beq	.L202
	rsbs	r1, r1, #1
	movcc	r1, #0
.L202:
	cmp	r1, #0
	beq	.L195
	cmp	r2, #1
	beq	.L457
	cmp	r2, #7
	beq	.L458
	cmp	r2, #5
	beq	.L459
	cmp	r2, #8
	beq	.L460
	cmp	r2, #6
	ldreq	r1, .L461+84
	moveq	r0, r1
	streq	r1, [r7]
.L204:
	add	r0, r0, r10, lsl #9
	cmp	ip, #0
	ldrb	r3, [r0, r3]	@ zero_extendqisi2
	beq	.L208
	rsbs	r3, r3, #1
	movcc	r3, #0
.L208:
	cmp	r3, #0
	ldrne	r3, [r4]
	addne	lr, r3, lr
	strne	lr, [r4]
	b	.L195
.L428:
	ldr	r7, .L461+212
	ldr	r0, .L461+232
	str	r0, [r7]
	b	.L197
.L442:
	ldr	r7, .L461+212
	ldr	r3, .L461+232
	str	r3, [r7]
	b	.L163
.L448:
	ldr	r3, .L461+168
	str	r3, [r7]
	b	.L190
.L444:
	ldr	r8, .L461+168
	str	r8, [r7]
	b	.L152
.L437:
	ldr	r7, .L461+212
	ldr	r3, .L461+236
	str	r3, [r7]
	b	.L183
.L433:
	ldr	r7, .L461+212
	ldr	r8, .L461+236
	str	r8, [r7]
	b	.L144
.L457:
	ldr	r0, .L461+168
	str	r0, [r7]
	b	.L204
.L453:
	ldr	r3, .L461+168
	str	r3, [r7]
	b	.L171
.L431:
	ldr	r7, .L461+212
	ldr	r8, .L461+228
	str	r8, [r7]
	b	.L144
.L435:
	ldr	r7, .L461+212
	ldr	r3, .L461+228
	str	r3, [r7]
	b	.L183
.L441:
	ldr	r7, .L461+212
	ldr	r3, .L461+228
	str	r3, [r7]
	b	.L163
.L427:
	ldr	r7, .L461+212
	ldr	r0, .L461+228
	str	r0, [r7]
	b	.L197
.L432:
	ldr	r7, .L461+212
	ldr	r8, .L461+232
	str	r8, [r7]
	b	.L144
.L462:
	.align	2
.L461:
	.word	player
	.word	sailing
	.word	diag
	.word	detroit
	.word	buttons
	.word	state
	.word	collision
	.word	oldButtons
	.word	hOff
	.word	vOff
	.word	1022
	.word	shadowOAM
	.word	time
	.word	1717986919
	.word	bob
	.word	reel
	.word	burn
	.word	camping
	.word	markpal
	.word	gotKey
	.word	gotCrystal
	.word	caveColBitmap
	.word	100718948
	.word	100719012
	.word	100716544
	.word	15073509
	.word	16515323
	.word	gotBerry
	.word	gotFish
	.word	reelFrame
	.word	meter
	.word	fishCheat
	.word	caveCheatInt
	.word	secret
	.word	playSoundB
	.word	cheetad
	.word	DMANow
	.word	tsCaveTiles
	.word	tsCavePal
	.word	100712448
	.word	caveCheatMap
	.word	flame5
	.word	worldColBitmap
	.word	gotCarrot
	.word	surf
	.word	sailing
	.word	more
	.word	mark
	.word	leafCheat
	.word	flame4
	.word	flame3
	.word	flame2
	.word	flame1
	.word	collisionbitmap
	.word	town
	.word	playSoundA
	.word	sherry
	.word	fishColBitmap
	.word	snowColBitmap
	.word	leafColBitmap
.L436:
	ldr	r7, .L461+212
	ldr	r3, .L461+232
	str	r3, [r7]
	b	.L183
.L439:
	ldr	r3, .L461+180
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L217
	ldr	r3, .L461+176
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+220
	mov	lr, pc
	bx	r3
	ldm	r4, {r2, r3}
	add	r2, r2, #30
	add	r3, r3, #10
	stm	r4, {r2, r3}
.L218:
	ldr	r2, .L461+180
	ldr	r3, [r2]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r2]
	b	.L216
.L260:
	ldr	r2, .L461+184
	ldr	r2, [r2]
	stmib	sp, {r3, r10}
	str	r3, [sp, #12]
	ldr	r1, .L461+188
	ldr	r0, [r1]
	str	r2, [sp]
	mov	r1, r3
	mov	r2, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L263
	ldr	r3, .L461+192
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L264
.L263:
	ldr	r3, .L461+196
	ldr	r2, [r3]
	cmp	r2, #0
	movne	r2, #0
	strne	r2, [r3]
	bne	.L265
	ldr	r3, .L461+200
	ldr	r1, [r3]
	cmp	r1, #0
	bne	.L412
	ldr	r3, .L461+204
	ldr	r2, [r3]
	cmp	r2, #0
	strne	r1, [r3]
	bne	.L265
	ldr	r3, .L461+208
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L265
.L412:
	str	r2, [r3]
	b	.L265
.L429:
	ldr	r7, .L461+212
	ldr	r0, .L461+236
	str	r0, [r7]
	b	.L197
.L443:
	ldr	r7, .L461+212
	ldr	r3, .L461+236
	str	r3, [r7]
	b	.L163
.L445:
	ldr	r8, .L461+228
	str	r8, [r7]
	b	.L152
.L449:
	ldr	r3, .L461+228
	str	r3, [r7]
	b	.L190
.L219:
	ldr	r3, .L461+216
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+220
	mov	lr, pc
	bx	r3
	mov	r2, #376
	mov	r1, #416
	ldr	r3, .L461+224
	stm	r4, {r1, r2}
	stm	r3, {r2, r6}
	b	.L220
.L217:
	ldr	r3, .L461+216
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L461+220
	mov	lr, pc
	bx	r3
	mov	ip, #272
	mov	r0, #336
	mov	r1, #280
	mov	r2, #320
	ldr	r3, .L461+224
	str	ip, [r4]
	stm	r3, {r1, r2}
	str	r0, [r4, #4]
	b	.L218
.L454:
	ldr	r3, .L461+228
	str	r3, [r7]
	b	.L171
.L458:
	ldr	r0, .L461+228
	str	r0, [r7]
	b	.L204
.L450:
	ldr	r3, .L461+232
	str	r3, [r7]
	b	.L190
.L446:
	ldr	r8, .L461+232
	str	r8, [r7]
	b	.L152
.L459:
	ldr	r0, .L461+232
	str	r0, [r7]
	b	.L204
.L455:
	ldr	r3, .L461+232
	str	r3, [r7]
	b	.L171
.L447:
	ldr	r8, .L461+236
	str	r8, [r7]
	b	.L152
.L451:
	ldr	r3, .L461+236
	str	r3, [r7]
	b	.L190
.L460:
	ldr	r0, .L461+236
	str	r0, [r7]
	b	.L204
.L456:
	ldr	r3, .L461+236
	str	r3, [r7]
	b	.L171
.L452:
	mov	r0, #23
	mov	r1, #46
	mov	r2, #264
	mov	r3, #16
	str	r2, [sp]
	str	r6, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	mov	r2, r3
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L211
	b	.L212
	.size	update, .-update
	.align	2
	.global	jumpDate
	.syntax unified
	.arm
	.fpu softvfp
	.type	jumpDate, %function
jumpDate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L706
	ldr	lr, [r4]
	ldr	r1, [r4, #16]
	add	ip, r1, lr
	mov	r3, #0
	mov	r6, ip
	ldr	r2, .L706+4
	ldr	r5, [r4, #4]
	ldr	r0, [r4, #20]
	ldr	r2, [r2]
	sub	sp, sp, #44
	str	ip, [sp, #28]
	str	r3, [r4, #32]
	add	ip, r0, r5
	sub	r3, r6, #1
	cmp	r2, #1
	str	r3, [sp, #20]
	add	ip, ip, #1
	beq	.L648
	cmp	r2, #7
	beq	.L649
	cmp	r2, #5
	beq	.L650
	cmp	r2, #8
	beq	.L651
	cmp	r2, #6
	ldreq	r6, .L706+8
	ldrne	fp, .L706+12
	ldreq	fp, .L706+12
	moveq	r3, r6
	ldrne	r3, [fp]
	streq	r6, [fp]
	b	.L465
.L649:
	ldr	fp, .L706+12
	ldr	r3, .L706+16
	str	r3, [fp]
.L465:
	ldr	r6, .L706+20
	ldr	r6, [r6]
	add	r8, lr, ip, lsl #9
	lsl	r9, ip, #9
	cmp	r6, #0
	ldrb	r7, [r3, r8]	@ zero_extendqisi2
	str	r9, [sp, #24]
	beq	.L470
	rsbs	r7, r7, #1
	movcc	r7, #0
.L470:
	cmp	r7, #0
	bne	.L652
.L575:
	mov	r3, r5
.L471:
	ldr	r10, .L706+24
	ldrh	r7, [r10]
	tst	r7, #64
	ldr	r7, .L706+28
	ldrh	r7, [r7]
	beq	.L645
	tst	r7, #64
	beq	.L653
.L645:
	ldr	ip, .L706+32
	ldr	ip, [ip]
.L479:
	ldr	r8, .L706+36
	sub	r3, r3, ip
	cmp	r3, r8
	movgt	ip, #32
	str	r3, [r4, #4]
	movgt	r3, #448
	movle	ip, lr
	strgt	ip, [r4]
	strgt	r3, [r4, #4]
	tst	r7, #32
	bne	.L499
	mov	r8, #1
	str	r8, [r4, #32]
	mov	r8, #2
	ldr	r9, [r4, #8]
	str	r9, [sp, #32]
	sub	r9, lr, r9
	cmp	r9, #0
	str	r8, [r4, #24]
	bgt	.L654
.L499:
	tst	r7, #16
	beq	.L526
	ldr	lr, [r4, #32]
.L527:
	cmp	ip, #0
	movlt	r8, #0
	rsb	r7, r1, #240
	add	r7, r7, r7, lsr #31
	strlt	r8, [r4]
	sub	r7, ip, r7, asr #1
	movlt	ip, r8
	cmp	r3, #0
	movlt	r8, #0
	rsb	r2, r0, #160
	add	r2, r2, r2, lsr #31
	sub	r2, r3, r2, asr #1
	movlt	r3, r8
	rsb	r1, r1, #512
	strlt	r8, [r4, #4]
	rsb	r0, r0, #512
	cmp	r1, ip
	ldr	r6, .L706+40
	ldr	r5, .L706+44
	strlt	r1, [r4]
	cmp	r0, r3
	strlt	r0, [r4, #4]
	cmp	r7, #0
	str	r7, [r6]
	str	r2, [r5]
	blt	.L655
	cmp	r2, #0
	blt	.L656
	cmp	r7, #272
	movgt	r3, #272
	strgt	r3, [r6]
.L559:
	cmp	r2, #352
	ble	.L562
	mov	r3, #352
.L646:
	str	r3, [r5]
.L562:
	cmp	lr, #0
	beq	.L563
	ldr	r3, [r4, #36]
	subs	r3, r3, #1
	bne	.L647
	mov	r1, #2
	ldr	r3, [r4, #40]
	add	r3, r3, #1
	rsbs	r2, r3, #0
	and	r2, r2, #7
	and	r3, r3, #7
	rsbpl	r3, r2, #0
	str	r3, [r4, #40]
	str	r1, [r4, #36]
.L565:
	mov	r3, #16
	mov	r2, #8
	mov	r0, #168
	mov	r1, #64
	stmib	sp, {r0, r2}
	str	r2, [sp, #12]
	str	r1, [sp]
	mov	r2, r3
	ldm	r4, {r0, r1}
	ldr	r7, .L706+48
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L706+52
	strne	r2, [r3]
	ldrh	r3, [r10]
	tst	r3, #2
	beq	.L569
	ldr	r3, .L706+28
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L569
	ldr	r3, .L706+4
	ldr	r3, [r3]
	cmp	r3, #5
	beq	.L657
.L569:
	ldr	r3, .L706+56
	ldr	r1, [r3]
	add	r0, r1, r1, lsr #31
	asr	r0, r0, #1
	lsl	r0, r0, #28
	lsl	r1, r1, #16
	asr	r0, r0, #16
	lsr	r1, r1, #16
.L568:
	ldr	lr, [r4, #40]
	ldr	r2, [r4, #24]
	ldr	ip, [r6]
	ldr	r3, [r4]
	add	r2, r2, lr, lsl #5
	ldr	r5, [r5]
	sub	r3, r3, ip
	add	r2, r1, r2, lsl #1
	ldr	ip, [r4, #4]
	lsl	r3, r3, #23
	lsl	r2, r2, #22
	ldr	lr, .L706+60
	sub	r1, ip, r5
	lsr	r3, r3, #23
	lsr	r2, r2, #22
	orr	r3, r3, #16384
	and	r1, r1, #255
	orr	r2, r0, r2
	strh	r3, [lr, #58]	@ movhi
	strh	r1, [lr, #56]	@ movhi
	strh	r2, [lr, #60]	@ movhi
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L563:
	mov	r3, #2
	str	lr, [r4, #40]
.L647:
	str	r3, [r4, #36]
	b	.L565
.L526:
	mov	lr, #1
	mov	r9, #3
	ldr	r8, [r4, #8]
	ldr	r7, [sp, #20]
	add	r7, r8, r7
	cmp	r7, #512
	str	lr, [r4, #32]
	str	r9, [r4, #24]
	bge	.L527
	cmp	r2, lr
	beq	.L658
	cmp	r2, #7
	beq	.L659
	cmp	r2, #5
	beq	.L660
	cmp	r2, #8
	beq	.L661
	cmp	r2, #6
	ldreq	r9, .L706+8
	ldrne	lr, [fp]
	moveq	lr, r9
	streq	r9, [fp]
	b	.L529
.L655:
	mov	r3, #0
	cmp	r2, r3
	str	r3, [r6]
	bge	.L559
	b	.L646
.L648:
	ldr	fp, .L706+12
	ldr	r3, .L706+64
	str	r3, [fp]
	b	.L465
.L652:
	cmp	r2, #1
	beq	.L662
	cmp	r2, #7
	beq	.L663
	cmp	r2, #5
	beq	.L664
	cmp	r2, #8
	beq	.L665
	cmp	r2, #6
	ldreq	r7, .L706+8
	moveq	r3, r7
	streq	r7, [fp]
.L473:
	ldr	r7, [sp, #20]
	cmp	r6, #0
	add	r3, r3, r7
	ldrb	r3, [r3, ip, lsl #9]	@ zero_extendqisi2
	beq	.L477
	rsbs	r3, r3, #1
	movcc	r3, #0
.L477:
	cmp	r3, #0
	addne	r3, r5, #2
	strne	r3, [r4, #4]
	bne	.L471
	b	.L575
.L656:
	mov	r3, #0
	cmp	r7, #272
	str	r3, [r5]
	movgt	r3, #272
	strgt	r3, [r6]
	b	.L562
.L654:
	cmp	r2, #1
	beq	.L666
	cmp	r2, #7
	beq	.L667
	cmp	r2, #5
	beq	.L668
	cmp	r2, #8
	beq	.L669
	cmp	r2, #6
	ldreq	r8, .L706+8
	ldrne	r8, [fp]
	streq	r8, [sp, #36]
	strne	r8, [sp, #36]
	streq	r8, [fp]
	b	.L501
.L651:
	ldr	fp, .L706+12
	ldr	r3, .L706+68
	str	r3, [fp]
	b	.L465
.L657:
	ldr	r7, .L706+72
	ldr	r2, [r7]
	cmp	r2, #0
	bne	.L569
	ldr	r3, .L706+76
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L706+80
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r3, #7040
	str	ip, [r7]
	mov	r0, #3
	ldr	r7, .L706+84
	ldr	r2, .L706+88
	ldr	r1, .L706+92
	mov	lr, pc
	bx	r7
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L706+96
	ldr	r1, .L706+100
	mov	lr, pc
	bx	r7
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L706+104
	ldr	r1, .L706+108
	mov	lr, pc
	bx	r7
	mov	r3, #4
	mov	ip, #9
	ldr	lr, .L706+56
	ldr	r2, .L706+112
	mov	r1, r3
	mov	r0, #8192
	str	r3, [lr]
	str	ip, [r2]
	b	.L568
.L663:
	ldr	r3, .L706+16
	str	r3, [fp]
	b	.L473
.L666:
	ldr	r8, .L706+64
	str	r8, [fp]
	str	r8, [sp, #36]
.L501:
	ldr	r8, [sp, #36]
	cmp	r6, #0
	add	r8, r8, r9
	str	r8, [sp, #36]
	ldrb	r8, [r8, r5, lsl #9]	@ zero_extendqisi2
	beq	.L506
	rsbs	r8, r8, #1
	movcc	r8, #0
.L506:
	cmp	r8, #0
	bne	.L670
.L507:
	cmp	r2, #1
	sub	lr, lr, #1
	beq	.L671
	cmp	r2, #7
	beq	.L672
	cmp	r2, #5
	beq	.L673
	cmp	r2, #8
	beq	.L674
	cmp	r2, #6
	ldreq	r9, .L706+8
	ldrne	r8, [fp]
	moveq	r8, r9
	streq	r9, [fp]
	b	.L514
.L653:
	cmp	r2, #1
	beq	.L675
	cmp	r2, #7
	beq	.L676
	cmp	r2, #5
	beq	.L677
	cmp	r2, #8
	beq	.L678
	cmp	r2, #6
	ldreq	r9, .L706+8
	ldrne	r9, [fp]
	streq	r9, [sp, #32]
	strne	r9, [sp, #32]
	streq	r9, [fp]
	b	.L482
.L650:
	ldr	fp, .L706+12
	ldr	r3, .L706+116
	str	r3, [fp]
	b	.L465
.L662:
	ldr	r3, .L706+64
	str	r3, [fp]
	b	.L473
.L670:
	cmp	r2, #1
	beq	.L679
	cmp	r2, #7
	beq	.L680
	cmp	r2, #5
	beq	.L681
	cmp	r2, #8
	beq	.L682
	cmp	r2, #6
	ldreq	r8, .L706+8
	streq	r8, [fp]
	addeq	r8, r8, r9
	streq	r8, [sp, #36]
.L509:
	ldr	r8, [sp, #36]
	ldr	r9, [sp, #24]
	cmp	r6, #0
	add	r8, r8, r9
	ldrb	r8, [r8, #-1024]	@ zero_extendqisi2
	beq	.L513
	rsbs	r8, r8, #1
	movcc	r8, #0
.L513:
	cmp	r8, #0
	beq	.L507
	ldr	lr, [sp, #32]
	sub	ip, ip, lr
	str	ip, [r4]
	b	.L499
.L671:
	ldr	r8, .L706+64
	str	r8, [fp]
.L514:
	add	r8, r8, lr
	cmp	r6, #0
	ldrb	r9, [r8, r5, lsl #9]	@ zero_extendqisi2
	beq	.L519
	rsbs	r9, r9, #1
	movcc	r9, #0
.L519:
	cmp	r9, #0
	beq	.L499
	cmp	r2, #1
	beq	.L683
	cmp	r2, #7
	beq	.L684
	cmp	r2, #5
	beq	.L685
	cmp	r2, #8
	beq	.L686
	cmp	r2, #6
	ldreq	r8, .L706+8
	streq	r8, [fp]
	addeq	r8, r8, lr
.L521:
	ldr	lr, [sp, #24]
	cmp	r6, #0
	add	r8, r8, lr
	ldrb	lr, [r8, #-1024]	@ zero_extendqisi2
	beq	.L525
	rsbs	lr, lr, #1
	movcc	lr, #0
.L525:
	cmp	lr, #0
	subne	ip, ip, #1
	strne	ip, [r4]
	b	.L499
.L658:
	ldr	lr, .L706+64
	str	lr, [fp]
.L529:
	add	lr, lr, r7
	cmp	r6, #0
	ldrb	r9, [lr, r5, lsl #9]	@ zero_extendqisi2
	beq	.L534
	rsbs	r9, r9, #1
	movcc	r9, #0
.L534:
	cmp	r9, #0
	bne	.L687
.L535:
	cmp	r2, #1
	beq	.L688
	cmp	r2, #7
	beq	.L689
	cmp	r2, #5
	beq	.L690
	cmp	r2, #8
	beq	.L691
	cmp	r2, #6
	ldreq	r7, .L706+8
	ldrne	lr, [fp]
	moveq	lr, r7
	streq	r7, [fp]
	b	.L542
.L675:
	ldr	r9, .L706+64
	str	r9, [fp]
	str	r9, [sp, #32]
.L482:
	ldr	r9, [sp, #32]
	cmp	r6, #0
	ldrb	r8, [r9, r8]	@ zero_extendqisi2
	beq	.L487
	rsbs	r8, r8, #1
	movcc	r8, #0
.L487:
	cmp	r8, #0
	bne	.L692
.L489:
	mov	r8, #9
	ldr	r9, .L706+32
	mov	ip, r8
	str	r8, [r9]
	b	.L479
.L687:
	cmp	r2, #1
	beq	.L693
	cmp	r2, #7
	beq	.L694
	cmp	r2, #5
	beq	.L695
	cmp	r2, #8
	beq	.L696
	cmp	r2, #6
	ldreq	lr, .L706+8
	streq	lr, [fp]
	addeq	lr, lr, r7
.L537:
	ldr	r7, [sp, #24]
	cmp	r6, #0
	add	lr, lr, r7
	ldrb	lr, [lr, #-1024]	@ zero_extendqisi2
	beq	.L541
	rsbs	lr, lr, #1
	movcc	lr, #0
.L541:
	cmp	lr, #0
	beq	.L535
	add	ip, ip, r8
	mov	lr, #1
	str	ip, [r4]
	b	.L527
.L692:
	cmp	r2, #1
	beq	.L697
	cmp	r2, #7
	beq	.L698
	cmp	r2, #5
	beq	.L699
	cmp	r2, #8
	beq	.L700
	cmp	r2, #6
	ldreq	r8, .L706+8
	streq	r8, [sp, #32]
	streq	r8, [fp]
.L491:
	ldr	r8, [sp, #20]
	ldr	r9, [sp, #32]
	cmp	r6, #0
	add	r9, r9, r8
	ldrb	ip, [r9, ip, lsl #9]	@ zero_extendqisi2
	beq	.L495
	rsbs	ip, ip, #1
	movcc	ip, #0
.L495:
	cmp	ip, #0
	beq	.L489
	ldr	ip, .L706+72
	ldr	ip, [ip]
	cmp	ip, #0
	bne	.L489
	b	.L645
.L688:
	ldr	lr, .L706+64
	str	lr, [fp]
.L542:
	ldr	r7, [sp, #28]
	cmp	r6, #0
	add	lr, lr, r7
	ldrb	r5, [lr, r5, lsl #9]	@ zero_extendqisi2
	beq	.L547
	rsbs	r5, r5, #1
	movcc	r5, #0
.L547:
	cmp	r5, #0
	bne	.L701
.L579:
	mov	lr, #1
	b	.L527
.L701:
	cmp	r2, #1
	beq	.L702
	cmp	r2, #7
	beq	.L703
	cmp	r2, #5
	beq	.L704
	cmp	r2, #8
	beq	.L705
	cmp	r2, #6
	ldreq	lr, .L706+8
	ldreq	r2, [sp, #28]
	streq	lr, [fp]
	addeq	lr, lr, r2
.L549:
	ldr	r2, [sp, #24]
	cmp	r6, #0
	add	lr, lr, r2
	ldrb	r2, [lr, #-1024]	@ zero_extendqisi2
	beq	.L553
	rsbs	r2, r2, #1
	movcc	r2, #0
.L553:
	cmp	r2, #0
	beq	.L579
	add	ip, ip, #1
	mov	lr, #1
	str	ip, [r4]
	b	.L527
.L660:
	ldr	lr, .L706+116
	str	lr, [fp]
	b	.L529
.L677:
	ldr	r9, .L706+116
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L482
.L679:
	ldr	r8, .L706+64
	str	r8, [fp]
	add	r8, r8, r9
	str	r8, [sp, #36]
	b	.L509
.L690:
	ldr	lr, .L706+116
	str	lr, [fp]
	b	.L542
.L683:
	ldr	r8, .L706+64
	str	r8, [fp]
	add	r8, r8, lr
	b	.L521
.L669:
	ldr	r8, .L706+68
	str	r8, [fp]
	str	r8, [sp, #36]
	b	.L501
.L674:
	ldr	r8, .L706+68
	str	r8, [fp]
	b	.L514
.L693:
	ldr	lr, .L706+64
	str	lr, [fp]
	add	lr, lr, r7
	b	.L537
.L697:
	ldr	r9, .L706+64
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L491
.L702:
	ldr	lr, .L706+64
	ldr	r2, [sp, #28]
	str	lr, [fp]
	add	lr, lr, r2
	b	.L549
.L664:
	ldr	r3, .L706+116
	str	r3, [fp]
	b	.L473
.L667:
	ldr	r8, .L706+16
	str	r8, [fp]
	str	r8, [sp, #36]
	b	.L501
.L672:
	ldr	r8, .L706+16
	str	r8, [fp]
	b	.L514
.L659:
	ldr	lr, .L706+16
	str	lr, [fp]
	b	.L529
.L676:
	ldr	r9, .L706+16
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L482
.L689:
	ldr	lr, .L706+16
	str	lr, [fp]
	b	.L542
.L665:
	ldr	r3, .L706+68
	str	r3, [fp]
	b	.L473
.L668:
	ldr	r8, .L706+116
	str	r8, [fp]
	str	r8, [sp, #36]
	b	.L501
.L673:
	ldr	r8, .L706+116
	str	r8, [fp]
	b	.L514
.L661:
	ldr	lr, .L706+68
	str	lr, [fp]
	b	.L529
.L678:
	ldr	r9, .L706+68
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L482
.L680:
	ldr	r8, .L706+16
	str	r8, [fp]
	add	r8, r8, r9
	str	r8, [sp, #36]
	b	.L509
.L691:
	ldr	lr, .L706+68
	str	lr, [fp]
	b	.L542
.L684:
	ldr	r8, .L706+16
	str	r8, [fp]
	add	r8, r8, lr
	b	.L521
.L694:
	ldr	lr, .L706+16
	str	lr, [fp]
	add	lr, lr, r7
	b	.L537
.L698:
	ldr	r9, .L706+16
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L491
.L703:
	ldr	lr, .L706+16
	ldr	r2, [sp, #28]
	str	lr, [fp]
	add	lr, lr, r2
	b	.L549
.L681:
	ldr	r8, .L706+116
	str	r8, [fp]
	add	r8, r8, r9
	str	r8, [sp, #36]
	b	.L509
.L685:
	ldr	r8, .L706+116
	str	r8, [fp]
	add	r8, r8, lr
	b	.L521
.L699:
	ldr	r9, .L706+116
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L491
.L695:
	ldr	lr, .L706+116
	str	lr, [fp]
	add	lr, lr, r7
	b	.L537
.L704:
	ldr	lr, .L706+116
	ldr	r2, [sp, #28]
	str	lr, [fp]
	add	lr, lr, r2
	b	.L549
.L682:
	ldr	r8, .L706+68
	str	r8, [fp]
	add	r8, r8, r9
	str	r8, [sp, #36]
	b	.L509
.L686:
	ldr	r8, .L706+68
	str	r8, [fp]
	add	r8, r8, lr
	b	.L521
.L700:
	ldr	r9, .L706+68
	str	r9, [fp]
	str	r9, [sp, #32]
	b	.L491
.L696:
	ldr	lr, .L706+68
	str	lr, [fp]
	add	lr, lr, r7
	b	.L537
.L705:
	ldr	lr, .L706+68
	ldr	r2, [sp, #28]
	str	lr, [fp]
	add	lr, lr, r2
	b	.L549
.L707:
	.align	2
.L706:
	.word	jumpy
	.word	state
	.word	caveColBitmap
	.word	collisionbitmap
	.word	fishColBitmap
	.word	sailing
	.word	oldButtons
	.word	buttons
	.word	jumptimer
	.word	494
	.word	hOff
	.word	vOff
	.word	collision
	.word	gotCarrot
	.word	oil
	.word	shadowOAM
	.word	worldColBitmap
	.word	leafColBitmap
	.word	snowCheat
	.word	secret
	.word	playSoundB
	.word	DMANow
	.word	100679680
	.word	tsTiles
	.word	83886112
	.word	tsPal+32
	.word	100720640
	.word	rainMap
	.word	cheetad
	.word	snowColBitmap
	.size	jumpDate, .-jumpDate
	.align	2
	.global	drawSherry
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSherry, %function
drawSherry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L716
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L709
	ldr	r3, .L716+4
	ldr	r1, [r3]
	sub	r3, r1, #169
	cmp	r3, #190
	bls	.L715
.L709:
	mov	r2, #33280
	ldr	r3, .L716+8
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L715:
	ldr	r3, .L716+12
	ldr	r2, .L716+16
	ldr	ip, [r3]
	smull	r3, r2, ip, r2
	str	lr, [sp, #-4]!
	ldr	r0, .L716+20
	ldr	lr, .L716+24
	ldr	r3, [r0]
	ldr	lr, [lr]
	ldr	r0, [r0, #4]
	sub	r3, r3, lr
	sub	r1, r0, r1
	asr	lr, ip, #31
	ldr	r0, .L716+28
	lsl	r3, r3, #23
	rsb	r2, lr, r2, asr #2
	and	r1, r1, #255
	lsr	r3, r3, #23
	orr	r3, r3, r0
	orr	r1, r1, r0
	add	r2, r2, r2, lsl #2
	ldr	r0, .L716+8
	cmp	ip, r2, lsl #1
	strh	r3, [r0, #10]	@ movhi
	strh	r1, [r0, #8]	@ movhi
	bne	.L708
	ldr	r3, .L716+32
	smull	r2, r3, ip, r3
	sub	r3, r3, lr
	add	r3, r3, r3, lsl #1
	sub	r3, ip, r3
	add	r3, r3, #256
	lsl	r3, r3, #1
	strh	r3, [r0, #12]	@ movhi
.L708:
	ldr	lr, [sp], #4
	bx	lr
.L717:
	.align	2
.L716:
	.word	sailing
	.word	vOff
	.word	shadowOAM
	.word	time
	.word	1717986919
	.word	sherry
	.word	hOff
	.word	-32768
	.word	1431655766
	.size	drawSherry, .-drawSherry
	.align	2
	.global	drawGary
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGary, %function
drawGary:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L726
	ldr	r3, [r3]
	cmp	r3, #8
	beq	.L725
.L719:
	mov	r2, #33280
	ldr	r3, .L726+4
	strh	r2, [r3, #144]	@ movhi
	bx	lr
.L725:
	ldr	r3, .L726+8
	ldr	r3, [r3]
	sub	r2, r3, #241
	cmp	r2, #222
	bhi	.L719
	ldr	r2, .L726+12
	ldr	r0, .L726+16
	ldr	r1, [r2]
	smull	r2, r0, r1, r0
	ldr	r2, .L726+20
	ldr	r2, [r2]
	rsb	r2, r2, #368
	add	r2, r2, #2
	str	lr, [sp, #-4]!
	asr	ip, r1, #31
	ldr	lr, .L726+24
	rsb	r3, r3, #400
	lsl	r2, r2, #23
	rsb	r0, ip, r0, asr #2
	and	r3, r3, #255
	lsr	r2, r2, #23
	orr	r2, r2, lr
	orr	r3, r3, lr
	add	r0, r0, r0, lsl #2
	ldr	lr, .L726+4
	cmp	r1, r0, lsl #1
	strh	r2, [lr, #146]	@ movhi
	strh	r3, [lr, #144]	@ movhi
	bne	.L718
	ldr	r3, .L726+28
	smull	r2, r3, r1, r3
	sub	r3, r3, ip
	add	r3, r3, r3, lsl #1
	sub	r1, r1, r3
	add	r1, r1, #256
	add	r1, r1, #3
	lsl	r1, r1, #1
	orr	r1, r1, #16384
	strh	r1, [lr, #148]	@ movhi
.L718:
	ldr	lr, [sp], #4
	bx	lr
.L727:
	.align	2
.L726:
	.word	state
	.word	shadowOAM
	.word	vOff
	.word	time
	.word	1717986919
	.word	hOff
	.word	-32768
	.word	1431655766
	.size	drawGary, .-drawGary
	.align	2
	.global	drawTeri
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTeri, %function
drawTeri:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L740
	ldr	r3, [r3]
	cmp	r3, #5
	beq	.L738
	mov	r2, #33280
	ldr	r3, .L740+4
	strh	r2, [r3, #64]	@ movhi
	strh	r2, [r3, #72]	@ movhi
	bx	lr
.L738:
	ldr	r2, .L740+8
	ldr	r3, .L740+12
	ldr	r1, [r2]
	ldr	r0, [r3]
	ldr	r2, .L740+16
	lsl	r3, r1, #16
	cmp	r0, #0
	ldrh	r2, [r2]
	lsr	r3, r3, #16
	bne	.L730
	sub	r0, r1, #9
	cmp	r0, #166
	bls	.L739
.L730:
	rsb	r3, r3, #440
	and	r3, r3, #255
	mvn	r3, r3, lsl #17
	mov	ip, #33280
	mvn	r3, r3, lsr #17
	rsb	r2, r2, #96
	sub	r1, r1, #280
	ldr	r0, .L740+4
	lsl	r2, r2, #23
	sub	r1, r1, #1
	lsr	r2, r2, #23
	cmp	r1, #174
	strh	r3, [r0, #64]	@ movhi
	strh	r2, [r0, #66]	@ movhi
	strh	ip, [r0, #72]	@ movhi
	bhi	.L734
	ldr	r3, .L740+20
	ldr	r3, [r3]
	add	r3, r3, #648
	lsl	r3, r3, #22
	lsr	r3, r3, #22
	strh	r3, [r0, #68]	@ movhi
	bx	lr
.L734:
	mov	r3, #33280
	strh	r3, [r0, #64]	@ movhi
	bx	lr
.L739:
	ldr	r0, .L740+4
	rsb	r3, r3, #168
	and	r3, r3, #255
	str	lr, [sp, #-4]!
	strh	r3, [r0, #72]	@ movhi
	mov	r3, #33280
	ldr	ip, .L740+24
	ldr	lr, .L740+28
	rsb	r1, r2, #64
	rsb	r2, r2, #96
	and	r1, r1, ip
	and	r2, r2, ip
	strh	lr, [r0, #76]	@ movhi
	strh	r1, [r0, #74]	@ movhi
	strh	r2, [r0, #66]	@ movhi
	strh	r3, [r0, #64]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L741:
	.align	2
.L740:
	.word	state
	.word	shadowOAM
	.word	vOff
	.word	gotCarrot
	.word	hOff
	.word	terr
	.word	511
	.word	21124
	.size	drawTeri, .-drawTeri
	.align	2
	.global	drawMeter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMeter, %function
drawMeter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L755
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L743
	ldr	r3, .L755+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L743
	push	{r4, r5, r6, lr}
	mov	r4, #468
	mov	r0, #472
	mov	r6, #464
	mov	r5, #476
	mov	lr, #144
	mov	ip, #140
	ldr	r3, .L755+8
	ldr	r3, [r3]
	lsl	r3, r3, #6
	ldr	r1, .L755+12
	add	r3, r3, #268
	add	r3, r3, #2
	and	r1, r1, r3
	ldr	r3, .L755+16
	ldr	r2, .L755+20
	strh	r1, [r3, #236]	@ movhi
	ldr	r1, .L755+24
	ldrh	r2, [r2]
	strh	r1, [r3, #210]	@ movhi
	add	r1, r1, #32
	strh	r1, [r3, #218]	@ movhi
	add	r1, r1, #32
	strh	r4, [r3, #220]	@ movhi
	strh	r1, [r3, #130]	@ movhi
	add	r4, r4, #43
	add	r1, r2, #152
	and	r1, r1, r4
	strh	r0, [r3, #132]	@ movhi
	ldr	r0, .L755+28
	orr	r1, r1, #16384
	strh	r6, [r3, #212]	@ movhi
	strh	r0, [r3, #138]	@ movhi
	ldr	r6, .L755+32
	add	r0, r2, #120
	strh	r1, [r3, #82]	@ movhi
	add	r1, r2, #88
	and	r0, r0, r4
	and	r1, r1, r4
	add	r2, r2, #80
	and	r2, r2, r4
	orr	r0, r0, #16384
	orr	r1, r1, #16384
	ldr	r6, [r6]
	strh	r5, [r3, #140]	@ movhi
	strh	r0, [r3, #90]	@ movhi
	ldr	r5, .L755+36
	ldr	r0, .L755+40
	strh	r1, [r3, #98]	@ movhi
	ldr	r4, .L755+44
	ldr	r1, .L755+48
	strh	r2, [r3, #106]	@ movhi
	ldr	r2, .L755+52
	cmp	r6, #0
	strh	lr, [r3, #104]	@ movhi
	strh	r5, [r3, #108]	@ movhi
	strh	ip, [r3, #232]	@ movhi
	strh	r4, [r3, #234]	@ movhi
	strh	r2, [r3, #208]	@ movhi
	strh	r2, [r3, #216]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r2, [r3, #136]	@ movhi
	strh	r0, [r3, #80]	@ movhi
	strh	r0, [r3, #88]	@ movhi
	strh	r0, [r3, #96]	@ movhi
	strh	r1, [r3, #84]	@ movhi
	strh	r1, [r3, #92]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	beq	.L742
	ldr	r2, .L755+56
	ldr	r1, .L755+60
	strh	r2, [r3, #84]	@ movhi
	strh	r2, [r3, #92]	@ movhi
	strh	r2, [r3, #100]	@ movhi
	strh	r1, [r3, #108]	@ movhi
.L742:
	pop	{r4, r5, r6, lr}
	bx	lr
.L743:
	mov	r2, #16896
	ldr	r3, .L755+16
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	strh	r2, [r3, #104]	@ movhi
	strh	r2, [r3, #208]	@ movhi
	strh	r2, [r3, #216]	@ movhi
	strh	r2, [r3, #128]	@ movhi
	strh	r2, [r3, #136]	@ movhi
	strh	r2, [r3, #232]	@ movhi
	bx	lr
.L756:
	.align	2
.L755:
	.word	gotFish
	.word	reel
	.word	reelFrame
	.word	1022
	.word	shadowOAM
	.word	meter
	.word	-32656
	.word	-32560
	.word	fishCheat
	.word	4499
	.word	16528
	.word	16474
	.word	4500
	.word	16524
	.word	8628
	.word	8627
	.size	drawMeter, .-drawMeter
	.align	2
	.global	drawBanner
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBanner, %function
drawBanner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L792
	ldr	r2, [r3]
	cmp	r2, #8
	str	lr, [sp, #-4]!
	beq	.L786
	cmp	r2, #5
	beq	.L787
	cmp	r2, #6
	bne	.L762
	ldr	r3, .L792+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L760
.L759:
	mov	lr, #300
	mov	ip, #428
	ldr	r3, .L792+8
	ldr	r3, [r3]
	ldr	r1, .L792+12
	add	r0, r3, #32
	and	r0, r0, #255
	and	r3, r3, #255
	orr	r0, r0, r1
	orr	r1, r3, r1
	ldr	r3, .L792+16
	strh	r0, [r3, #120]	@ movhi
	ldr	r0, .L792+20
	cmp	r2, #8
	strh	r1, [r3, #112]	@ movhi
	strh	lr, [r3, #116]	@ movhi
	strh	ip, [r3, #124]	@ movhi
	strh	r0, [r3, #114]	@ movhi
	strh	r0, [r3, #122]	@ movhi
	beq	.L788
.L764:
	cmp	r2, #5
	beq	.L789
	cmp	r2, #6
	bne	.L768
	ldr	r2, .L792+4
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L790
.L765:
	mov	r2, #33280
	ldr	lr, [sp], #4
	strh	r2, [r3, #224]	@ movhi
	bx	lr
.L787:
	ldr	r3, .L792+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L759
.L760:
	mov	r1, #33280
	ldr	r3, .L792+16
	strh	r1, [r3, #112]	@ movhi
	strh	r1, [r3, #120]	@ movhi
.L791:
	cmp	r2, #8
	bne	.L764
.L788:
	ldr	r2, .L792+28
	ldr	r2, [r2]
	cmp	r2, #0
	movne	r0, #204
	beq	.L765
.L785:
	ldr	r2, .L792+8
	ldr	r2, [r2]
	ldr	r1, .L792+32
	sub	r2, r2, #27
	and	r2, r2, #255
	strh	r2, [r3, #224]	@ movhi
	strh	r0, [r3, #228]	@ movhi
	strh	r1, [r3, #226]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L786:
	ldr	r3, .L792+28
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L759
	mov	r1, #33280
	ldr	r3, .L792+16
	strh	r1, [r3, #112]	@ movhi
	strh	r1, [r3, #120]	@ movhi
	b	.L791
.L789:
	ldr	r2, .L792+24
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L765
	ldr	r2, .L792+8
	ldr	r2, [r2]
	ldr	r0, .L792+32
	ldr	r1, .L792+36
	sub	r2, r2, #27
	and	r2, r2, #255
	strh	r2, [r3, #224]	@ movhi
	strh	r0, [r3, #226]	@ movhi
	strh	r1, [r3, #228]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L790:
	ldr	r2, .L792+8
	ldr	r2, [r2]
	ldr	r0, .L792+32
	ldr	r1, .L792+40
	sub	r2, r2, #27
	and	r2, r2, #255
	strh	r2, [r3, #224]	@ movhi
	strh	r0, [r3, #226]	@ movhi
	strh	r1, [r3, #228]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L768:
	cmp	r2, #7
	bne	.L765
	ldr	r2, .L792+44
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L765
	mov	r0, #140
	b	.L785
.L762:
	cmp	r2, #7
	bne	.L760
	ldr	r3, .L792+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L760
	b	.L759
.L793:
	.align	2
.L792:
	.word	state
	.word	caveCheatInt
	.word	cheeta
	.word	-32768
	.word	shadowOAM
	.word	-32552
	.word	snowCheat
	.word	leafCheat
	.word	16574
	.word	8334
	.word	8398
	.word	fishCheat
	.size	drawBanner, .-drawBanner
	.align	2
	.global	drawCamp
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCamp, %function
drawCamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L816
	ldr	r1, [r4]
	cmp	r1, #0
	sub	sp, sp, #20
	bne	.L795
	ldr	r5, .L816+4
	ldr	r1, [r5]
	cmp	r1, #0
	bne	.L814
.L795:
	mov	r2, #16896
	ldr	r3, .L816+8
	add	ip, r3, #256
	add	r0, r3, #264
	strh	r2, [ip]	@ movhi
	strh	r2, [r0]	@ movhi
	add	lr, r3, #272
	add	ip, r3, #280
	add	r0, r3, #288
	strh	r2, [lr]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r2, [r0]	@ movhi
	add	lr, r3, #296
	add	ip, r3, #304
	add	r0, r3, #312
	strh	r2, [lr]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r2, [r0]	@ movhi
	add	lr, r3, #320
	add	ip, r3, #488
	add	r0, r3, #480
	strh	r2, [r3, #200]	@ movhi
	strh	r2, [lr]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	r2, [r0]	@ movhi
.L798:
	cmp	r1, #0
	beq	.L799
	ldr	r2, .L816+12
	ldr	r2, [r2]
	sub	r1, r2, #241
	cmp	r1, #222
	bls	.L815
.L799:
	mov	r2, #16896
	strh	r2, [r3, #248]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L814:
	mov	ip, #400
	mov	r1, #312
	mov	r2, #32
	mov	r3, #16
	stm	sp, {r1, ip}
	str	r2, [sp, #12]
	str	r2, [sp, #8]
	ldr	r0, .L816+16
	mov	r2, r3
	ldm	r0, {r0, r1}
	ldr	r6, .L816+20
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	bne	.L796
	ldr	r1, [r4]
	b	.L795
.L815:
	ldr	r1, .L816+24
	ldr	r0, .L816+28
	ldr	r1, [r1]
	ldr	r0, [r0]
	lsl	r1, r1, #5
	add	r1, r1, #652
	rsb	r0, r0, #324
	rsb	r2, r2, #408
	and	r1, r1, #1020
	lsl	r0, r0, #23
	and	r2, r2, #255
	orr	r1, r1, #8192
	lsr	r0, r0, #23
	strh	r2, [r3, #248]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L796:
	ldr	r3, .L816+32
	ldr	r2, [r3]
	lsl	r2, r2, #5
	ldr	r0, .L816+36
	add	r2, r2, #408
	ldr	r3, .L816+8
	add	r2, r2, #3
	and	r2, r2, r0
	orr	r2, r2, #8192
	add	fp, r3, #308
	strh	r2, [fp]	@ movhi
	ldr	r2, .L816+40
	ldr	r2, [r2]
	lsl	r2, r2, #5
	add	r2, r2, #412
	add	r2, r2, #1
	and	r2, r2, r0
	mov	r10, #336
	orr	r2, r2, #8192
	add	fp, r3, #484
	strh	r2, [fp]	@ movhi
	ldr	r2, .L816+44
	mov	r9, #340
	ldr	r2, [r2]
	lsl	r2, r2, #5
	add	r2, r2, #412
	add	r2, r2, #2
	and	r2, r2, r0
	orr	r2, r2, #8192
	add	fp, r3, #316
	strh	r2, [fp]	@ movhi
	ldr	r2, .L816+48
	ldr	r2, [r2]
	lsl	r2, r2, #5
	add	r2, r2, #412
	add	r2, r2, #3
	and	r2, r2, r0
	orr	r2, r2, #8192
	mov	r8, #344
	add	fp, r3, #324
	mov	r7, #348
	strh	r2, [fp]	@ movhi
	ldr	r2, .L816+52
	ldr	r2, [r2]
	lsl	r2, r2, #5
	add	r2, r2, #412
	and	r0, r0, r2
	orr	r0, r0, #8192
	add	r2, r3, #492
	strh	r0, [r2]	@ movhi
	ldr	r2, .L816+56
	add	r0, r3, #272
	strh	r2, [r0, #2]	@ movhi
	ldr	r2, .L816+60
	strh	r2, [r0]	@ movhi
	add	r0, r3, #276
	strh	r10, [r0]	@ movhi
	ldr	r10, .L816+64
	add	r0, r3, #280
	strh	r2, [r0]	@ movhi
	strh	r10, [r0, #2]	@ movhi
	add	r0, r3, #284
	strh	r9, [r0]	@ movhi
	ldr	r9, .L816+68
	add	r0, r3, #288
	mov	r1, #132
	strh	r2, [r0]	@ movhi
	strh	r9, [r0, #2]	@ movhi
	mov	r6, #100
	add	r0, r3, #296
	strh	r2, [r0]	@ movhi
	mov	lr, #108
	ldr	r2, .L816+72
	mov	ip, #116
	strh	r2, [r0, #2]	@ movhi
	mov	r0, #124	@ movhi
	add	r2, r3, #292
	strh	r8, [r2]	@ movhi
	add	r2, r3, #300
	strh	r7, [r2]	@ movhi
	mov	r7, #140	@ movhi
	add	r2, r3, #304
	strh	r6, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	add	r2, r3, #488
	strh	r1, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	add	r2, r3, #480
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	ldr	r6, .L816+76
	add	r2, r3, #312
	ldr	ip, .L816+80
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	add	lr, r3, #264
	add	r2, r3, #320
	strh	r1, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [lr]	@ movhi
	ldr	r2, [r6]
	ldr	r6, .L816+84
	ldr	r6, [r6]
	ldr	r0, .L816+88
	ldr	r1, .L816+92
	cmp	r6, #0
	ldr	r6, .L816+96
	add	r2, r2, #35
	ldr	r0, [r0]
	ldr	r1, [r1]
	and	r2, r2, r6
	orr	r2, r2, #16384
	strh	r2, [lr, #2]	@ movhi
	add	r0, r0, #35
	ldr	lr, .L816+100
	lsl	r1, r1, #12
	orr	r1, r1, #740
	and	r0, r0, r6
	add	r2, r3, #268
	strh	r7, [r3, #200]	@ movhi
	strh	r0, [r3, #202]	@ movhi
	strh	r1, [r3, #204]	@ movhi
	strh	lr, [r2]	@ movhi
	beq	.L797
	ldr	r2, [r5]
	cmp	r2, #0
	beq	.L797
	ldr	r2, .L816+104
	ldr	r2, [r2]
	add	r2, r2, #35
	and	r6, r6, r2
	add	lr, lr, #32
	add	r2, r3, #256
	orr	r6, r6, #16384
	add	r0, r3, #260
	ldr	r1, [r4]
	strh	r6, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	lr, [r0]	@ movhi
	b	.L798
.L797:
	mov	r0, #16896
	ldr	r2, .L816+108
	ldr	r1, [r4]
	strh	r0, [r2]	@ movhi
	b	.L798
.L817:
	.align	2
.L816:
	.word	gotBerry
	.word	camping
	.word	shadowOAM
	.word	vOff
	.word	player
	.word	collision
	.word	litty
	.word	hOff
	.word	flame1
	.word	1023
	.word	flame3
	.word	flame4
	.word	flame5
	.word	flame2
	.word	-32712
	.word	16524
	.word	-32680
	.word	-32648
	.word	-32616
	.word	burn
	.word	16528
	.word	leafCheat
	.word	mark
	.word	markpal
	.word	511
	.word	8204
	.word	more
	.word	shadowOAM+256
	.size	drawCamp, .-drawCamp
	.align	2
	.global	drawKeys
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawKeys, %function
drawKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L824
	ldr	r3, [r3]
	cmp	r3, #6
	bxne	lr
	ldr	r3, .L824+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L820
	ldr	r3, .L824+8
	ldr	r2, [r3]
	sub	r3, r2, #241
	cmp	r3, #166
	bls	.L823
	mov	r2, #33280
	ldr	r3, .L824+12
	strh	r2, [r3, #168]	@ movhi
.L822:
	mov	r2, #33280
	strh	r2, [r3, #152]	@ movhi
	bx	lr
.L820:
	mov	ip, #33280
	mov	r1, #180
	ldr	r3, .L824+12
	ldr	r0, .L824+16
	ldr	r2, .L824+20
	strh	ip, [r3, #168]	@ movhi
	strh	r0, [r3, #152]	@ movhi
	strh	r1, [r3, #154]	@ movhi
	strh	r2, [r3, #156]	@ movhi
	bx	lr
.L823:
	ldr	r3, .L824+24
	ldr	r1, [r3]
	rsb	r1, r1, #80
	ldr	r3, .L824+12
	ldr	r0, .L824+28
	lsl	r1, r1, #23
	rsb	r2, r2, #424
	lsr	r1, r1, #23
	strh	r2, [r3, #168]	@ movhi
	strh	r1, [r3, #170]	@ movhi
	strh	r0, [r3, #172]	@ movhi
	b	.L822
.L825:
	.align	2
.L824:
	.word	state
	.word	gotKey
	.word	vOff
	.word	shadowOAM
	.word	-32764
	.word	8901
	.word	hOff
	.word	8900
	.size	drawKeys, .-drawKeys
	.align	2
	.global	drawInventory
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInventory, %function
drawInventory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	mov	r2, #640
	ldr	r3, .L843
	ldr	ip, [r3]
	ldr	r1, .L843+4
	ldr	r3, .L843+8
	cmp	ip, r0
	strh	r0, [r3, #48]	@ movhi
	strh	r1, [r3, #50]	@ movhi
	strh	r2, [r3, #52]	@ movhi
	beq	.L827
	mov	r0, #5
	mov	r1, #227
	ldr	r2, .L843+12
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #20]	@ movhi
.L827:
	ldr	r2, .L843+16
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L828
	mov	r0, #19
	mov	r1, #227
	ldr	r2, .L843+20
	strh	r0, [r3, #24]	@ movhi
	strh	r1, [r3, #26]	@ movhi
	strh	r2, [r3, #28]	@ movhi
.L828:
	ldr	r2, .L843+24
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L829
	mov	r0, #5
	mov	r1, #213
	ldr	r2, .L843+28
	strh	r0, [r3, #32]	@ movhi
	strh	r1, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
.L829:
	ldr	r2, .L843+32
	ldr	r2, [r2]
	cmp	r2, #0
	bxeq	lr
	mov	r0, #19
	mov	r1, #213
	ldr	r2, .L843+36
	strh	r0, [r3, #40]	@ movhi
	strh	r1, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	bx	lr
.L844:
	.align	2
.L843:
	.word	gotFish
	.word	-32560
	.word	shadowOAM
	.word	21125
	.word	gotBerry
	.word	21157
	.word	gotCarrot
	.word	21124
	.word	gotCrystal
	.word	21156
	.size	drawInventory, .-drawInventory
	.align	2
	.global	drawIndicator
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawIndicator, %function
drawIndicator:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L847
	ldr	r3, [r3]
	cmp	r3, #0
	bne	drawIndicator.part.0
.L846:
	mov	r2, #33280
	ldr	r3, .L847+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L848:
	.align	2
.L847:
	.word	detroit
	.word	shadowOAM+328
	.size	drawIndicator, .-drawIndicator
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawInventory
	ldr	r3, .L865
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L850
	bl	drawIndicator.part.0
.L851:
	ldr	r4, .L865+4
	bl	drawBanner
	ldr	r3, [r4]
	cmp	r3, #5
	beq	.L852
	mov	r2, #67108864
	ldr	r1, .L865+8
	ldrh	r0, [r1]
	ldr	r1, .L865+12
	ldrh	r1, [r1]
	cmp	r3, #1
	strh	r0, [r2, #16]	@ movhi
	strh	r1, [r2, #18]	@ movhi
	beq	.L861
.L854:
	cmp	r3, #7
	beq	.L862
.L856:
	cmp	r3, #8
	beq	.L863
.L857:
	cmp	r3, #6
	beq	.L864
.L858:
	ldr	r4, .L865+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L865+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L850:
	mov	r2, #33280
	ldr	r3, .L865+24
	strh	r2, [r3]	@ movhi
	b	.L851
.L861:
	bl	drawSherry
	ldr	r3, [r4]
	cmp	r3, #5
	beq	.L855
	cmp	r3, #7
	bne	.L856
.L862:
	bl	drawMeter
	ldr	r3, [r4]
	cmp	r3, #8
	bne	.L857
.L863:
	bl	drawGary
	ldr	r3, [r4]
	cmp	r3, #8
	bne	.L857
	bl	drawCamp
	ldr	r3, [r4]
	cmp	r3, #6
	bne	.L858
.L864:
	bl	drawKeys
	b	.L858
.L852:
	mov	r1, #67108864
	ldr	r3, .L865+8
	ldr	r0, .L865+28
	ldrh	r2, [r3]
	ldr	r0, [r0]
	ldr	r3, .L865+12
	strh	r2, [r1, #20]	@ movhi
	sub	r2, r2, r0
	ldrh	r3, [r3]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	strh	r3, [r1, #22]	@ movhi
	strh	r2, [r1, #16]	@ movhi
	ldr	r2, .L865+32
	ldr	r2, [r2]
	add	r3, r3, r2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1, #18]	@ movhi
.L855:
	bl	drawTeri
	ldr	r3, [r4]
	b	.L854
.L866:
	.align	2
.L865:
	.word	detroit
	.word	state
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.word	shadowOAM+328
	.word	fallH
	.word	fallV
	.size	draw, .-draw
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
	push	{r4, r5, lr}
	ldr	r4, .L886
	sub	sp, sp, #20
	bl	update
	ldr	r3, .L886+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L868
	ldr	r2, .L886+8
	ldrh	r2, [r2]
	ands	r2, r2, #8
	beq	.L881
.L868:
	tst	r3, #4
	beq	.L869
	ldr	r3, .L886+8
	ldrh	r2, [r3]
	ands	r2, r2, #4
	beq	.L882
.L869:
	ldr	r4, .L886+12
	ldr	r0, [r4]
	cmp	r0, #4
	ldr	r1, [r4, #4]
	bgt	.L870
	cmp	r1, #4
	ble	.L883
.L871:
	mov	r3, #16
	mov	lr, #464
	mov	ip, #32
	mov	r2, r3
	stm	sp, {ip, lr}
	str	r3, [sp, #12]
	str	r3, [sp, #8]
	ldr	r5, .L886+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L884
	ldr	r3, .L886+20
	ldr	r2, [r4]
	cmp	r2, r3
	ble	.L867
	ldr	r2, [r4, #4]
	cmp	r2, r3
	bgt	.L885
.L867:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L870:
	ldr	r3, .L886+20
	cmp	r0, r3
	ble	.L871
	cmp	r1, #4
	bgt	.L871
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToFish
.L884:
	ldr	r3, .L886+24
	mov	r2, #1
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L886+28
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToCave
.L882:
	ldr	r3, .L886+32
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L886+36
	mov	lr, pc
	bx	r3
	bl	goToWin
	b	.L869
.L883:
	ldr	r3, .L886+40
	mov	r2, #1
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L886+28
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToSnow
.L881:
	ldr	r3, .L886+32
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L886+36
	mov	lr, pc
	bx	r3
	bl	goToPause
	ldrh	r3, [r4]
	b	.L868
.L885:
	ldr	r3, .L886+44
	mov	r2, #1
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L886+28
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLeaf
.L887:
	.align	2
.L886:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	player
	.word	collision
	.word	490
	.word	shroom
	.word	playSoundA
	.word	flip
	.word	playSoundB
	.word	reflect
	.word	flower
	.size	game, .-game
	.align	2
	.global	snow
	.syntax unified
	.arm
	.fpu softvfp
	.type	snow, %function
snow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	jumpDate
	ldr	r3, .L892
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L892+4
	ldr	r2, [r3]
	cmp	r2, #3
	bgt	.L888
	ldr	r2, [r3, #4]
	ldr	r3, .L892+8
	cmp	r2, r3
	bgt	.L891
.L888:
	pop	{r4, lr}
	bx	lr
.L891:
	mov	lr, #30
	ldr	ip, .L892+12
	ldr	r2, .L892+16
	ldr	r3, [ip, #4]
	ldr	r1, [r2]
	ldr	r4, .L892+20
	ldr	r2, .L892+24
	sub	r3, r3, r1
	and	r3, r3, #255
	strh	r3, [r4]	@ movhi
	ldr	r1, [r2, #12]
	ldr	r0, [r2, #16]
	ldr	r3, .L892+28
	mov	r2, #1
	str	lr, [ip]
	str	lr, [ip, #4]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L893:
	.align	2
.L892:
	.word	waitForVBlank
	.word	jumpy
	.word	450
	.word	player
	.word	vOff
	.word	shadowOAM
	.word	town
	.word	playSoundA
	.size	snow, .-snow
	.align	2
	.global	leaf
	.syntax unified
	.arm
	.fpu softvfp
	.type	leaf, %function
leaf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	update
	ldr	r3, .L898
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L898+4
	ldr	r2, [r3]
	cmp	r2, #19
	bgt	.L894
	ldr	r2, [r3, #4]
	cmp	r2, #19
	ble	.L897
.L894:
	pop	{r4, lr}
	bx	lr
.L897:
	mov	ip, #480
	ldr	r0, .L898+8
	ldr	r4, .L898+12
	ldr	r1, [r0, #12]
	mov	r2, #1
	ldr	r0, [r0, #16]
	str	ip, [r3]
	str	ip, [r3, #4]
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToGame
.L899:
	.align	2
.L898:
	.word	waitForVBlank
	.word	player
	.word	town
	.word	playSoundA
	.size	leaf, .-leaf
	.align	2
	.global	fish
	.syntax unified
	.arm
	.fpu softvfp
	.type	fish, %function
fish:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	update
	ldr	r3, .L904
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L904+4
	ldr	r2, [r3]
	cmp	r2, #19
	bgt	.L900
	ldr	r2, [r3, #4]
	cmp	r2, #480
	bgt	.L903
.L900:
	pop	{r4, lr}
	bx	lr
.L903:
	mov	r2, #10
	ldr	r1, .L904+8
	pop	{r4, lr}
	stm	r3, {r1, r2}
	b	goToGame
.L905:
	.align	2
.L904:
	.word	waitForVBlank
	.word	player
	.word	490
	.size	fish, .-fish
	.align	2
	.global	cave
	.syntax unified
	.arm
	.fpu softvfp
	.type	cave, %function
cave:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #20
	bl	update
	ldr	r3, .L910
	mov	lr, pc
	bx	r3
	bl	draw
	mov	r3, #16
	mov	ip, #75
	mov	r0, #0
	mov	r1, #216
	ldr	r4, .L910+4
	stmib	sp, {r0, ip}
	str	r1, [sp]
	mov	r2, r3
	str	r3, [sp, #12]
	ldm	r4, {r0, r1}
	ldr	r5, .L910+8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L909
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L909:
	mov	lr, #50
	ldr	r3, .L910+12
	ldr	ip, .L910+16
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	mov	r2, #1
	ldr	r3, .L910+20
	str	lr, [r4]
	str	ip, [r4, #4]
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	b	goToGame
.L911:
	.align	2
.L910:
	.word	waitForVBlank
	.word	player
	.word	collision
	.word	town
	.word	510
	.word	playSoundA
	.size	cave, .-cave
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
	push	{r7, fp, lr}
	ldr	r3, .L978
	sub	sp, sp, #20
	mov	lr, pc
	bx	r3
	ldr	r3, .L978+4
	mov	lr, pc
	bx	r3
	ldr	r10, .L978+8
	ldr	r2, .L978+12
	ldrh	r3, [r10]
	ldr	r4, [r2]
	ldr	r5, .L978+16
	ldr	r9, .L978+20
	ldr	r8, .L978+24
	ldr	r7, .L978+28
	ldr	fp, .L978+32
	ldr	r6, .L978+36
.L913:
	ldr	r2, .L978+40
	strh	r3, [r2]	@ movhi
	ldr	r3, .L978+44
	ldrh	r3, [r3, #48]
	strh	r3, [r10]	@ movhi
	cmp	r4, #8
	ldrls	pc, [pc, r4, asl #2]
	b	.L914
.L916:
	.word	.L924
	.word	.L923
	.word	.L922
	.word	.L921
	.word	.L920
	.word	.L919
	.word	.L918
	.word	.L917
	.word	.L915
.L915:
	ldr	r3, .L978+48
	mov	lr, pc
	bx	r3
.L914:
	ldr	r3, .L978+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L978+56
	ldr	ip, .L978+60
	mov	lr, pc
	bx	ip
	ldr	r3, [r5]
	ldr	r0, .L978+64
	add	r3, r3, #1
	cmp	r3, r0
	str	r3, [r5]
	moveq	r3, #0
	ldr	r1, [r9]
	ldr	r2, [r8]
	sub	r1, r1, #3
	sub	r2, r2, #1
	str	r1, [r9]
	str	r2, [r8]
	streq	r3, [r5]
	beq	.L926
	tst	r3, #1
	beq	.L926
.L927:
	smull	r1, r2, r6, r3
	asr	r1, r3, #31
	rsb	r2, r1, r2, asr #1
	add	r2, r2, r2, lsl #2
	subs	r2, r3, r2
	bne	.L930
	ldr	ip, .L978+68
	ldr	r0, [ip]
	cmp	r0, #3
	addne	r2, r0, #1
	str	r2, [ip]
.L930:
	ldr	r2, .L978+72
	smull	r0, r2, r3, r2
	sub	r2, r2, r1
	add	r2, r2, r2, lsl #1
	subs	r2, r3, r2, lsl #1
	bne	.L934
	ldr	ip, .L978+76
	ldr	r0, [ip]
	cmp	r0, #2
	addne	r2, r0, #1
	str	r2, [ip]
.L934:
	ldr	r0, .L978+80
	ldr	r2, [r0]
	cmp	r2, #0
	subgt	r2, r2, #1
	strgt	r2, [r0]
	ldr	r0, .L978+84
	ldr	r2, [r0]
	cmp	r2, #0
	ble	.L938
	sub	r2, r2, #1
	cmp	r2, #5
	str	r2, [r0]
	bne	.L938
.L939:
	ldr	r2, [r7]
	cmp	r2, #159
	addle	r2, r2, #1
	strle	r2, [r7]
	ble	.L941
	cmp	r2, #160
	subne	r2, r2, #1
	strne	r2, [r7]
.L941:
	smull	r0, r2, r6, r3
	rsb	r1, r1, r2, asr #2
	add	r1, r1, r1, lsl #2
	cmp	r3, r1, lsl #1
	bne	.L943
	ldr	r2, .L978+88
	ldr	r3, [r2]
	cmp	r3, #0
	sub	r3, r3, #1
	moveq	r3, #7
	ldreq	r2, .L978+88
	str	r3, [r2]
.L943:
	ldr	r3, .L978+92
	ldr	r3, [r3]
	ldr	r1, .L978+96
	cmp	r3, #0
	ldr	r2, [r1]
	bne	.L975
	cmp	r2, #21
	ble	.L947
	ldr	r3, .L978+96
	sub	r2, r2, #1
	str	r2, [r3]
.L948:
	ldr	r3, .L978+100
	ldr	r3, [r3]
	ldr	r1, .L978+104
	cmp	r3, #0
	ldr	r2, [r1]
	bne	.L976
	cmp	r2, #24
	ble	.L950
	ldr	r3, .L978+104
	sub	r2, r2, #2
	str	r2, [r3]
.L951:
	ldr	r3, .L978+108
	ldr	r3, [r3]
	ldr	r1, .L978+112
	cmp	r3, #0
	ldr	r2, [r1]
	bne	.L977
	cmp	r2, #24
	ble	.L953
	ldr	r3, .L978+112
	sub	r2, r2, #2
	str	r2, [r3]
.L954:
	ldr	r3, [fp]
	cmp	r3, #0
	ldr	r3, .L978+12
	ldr	r4, [r3]
	beq	.L955
	ldr	r3, .L978+116
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L955
	ldr	r3, .L978+120
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L955
	ldr	r3, .L978+124
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L955
	cmp	r4, #1
	beq	.L960
.L955:
	ldrh	r3, [r10]
	b	.L913
.L917:
	ldr	r3, .L978+128
	mov	lr, pc
	bx	r3
	b	.L914
.L918:
	ldr	r3, .L978+132
	mov	lr, pc
	bx	r3
	b	.L914
.L919:
	ldr	r3, .L978+136
	mov	lr, pc
	bx	r3
	b	.L914
.L920:
	ldr	r3, .L978+140
	mov	lr, pc
	bx	r3
	b	.L914
.L921:
	ldr	r3, .L978+144
	mov	lr, pc
	bx	r3
	b	.L914
.L922:
	ldr	r3, .L978+148
	mov	lr, pc
	bx	r3
	b	.L914
.L924:
	ldr	r3, .L978+152
	mov	lr, pc
	bx	r3
	b	.L914
.L923:
	ldr	r3, .L978+156
	mov	lr, pc
	bx	r3
	b	.L914
.L938:
	ldr	ip, .L978+160
	ldr	r0, [ip]
	add	r2, r0, r2
	str	r2, [ip]
	b	.L939
.L977:
	cmp	r2, #119
	addle	r2, r2, #2
	strle	r2, [r1]
	ble	.L954
.L953:
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L978+108
	str	r3, [r2]
	b	.L954
.L976:
	cmp	r2, #119
	addle	r2, r2, #2
	strle	r2, [r1]
	ble	.L951
.L950:
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L978+100
	str	r3, [r2]
	b	.L951
.L975:
	cmp	r2, #135
	addle	r2, r2, #1
	strle	r2, [r1]
	ble	.L948
.L947:
	rsbs	r3, r3, #1
	movcc	r3, #0
	ldr	r2, .L978+92
	str	r3, [r2]
	b	.L948
.L926:
	ldr	r1, .L978+164
	ldr	r2, [r1]
	cmp	r2, #3
	add	r2, r2, #1
	moveq	r2, #0
	ldreq	r1, .L978+164
	str	r2, [r1]
	b	.L927
.L960:
	mov	r1, #240
	mov	r0, #46
	str	r1, [sp, #4]
	mov	ip, #23
	mov	r2, #264
	ldr	r1, .L978+168
	str	r0, [sp, #8]
	mov	r3, #16
	mov	r0, r1
	str	ip, [sp, #12]
	str	r2, [sp]
	ldr	ip, .L978+172
	mov	r2, r3
	ldr	r1, [r1, #4]
	ldr	r0, [r0]
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L972
	ldr	r3, .L978+40
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, .L978+176
	str	r4, [r3]
	ldrh	r3, [r10]
	beq	.L971
	ands	ip, r3, #1
	beq	.L963
.L971:
	ldr	r2, .L978+12
	ldr	r4, [r2]
	b	.L913
.L963:
	ldr	r3, .L978+180
	ldr	r1, [r3, #12]
	ldr	r0, [r3, #16]
	ldr	r3, .L978+176
	str	ip, [r3]
	ldr	r3, .L978+124
	str	ip, [r3]
	ldr	r3, .L978+116
	str	ip, [r3]
	ldr	r3, .L978+120
	mov	r2, r4
	str	ip, [r3]
	ldr	r3, .L978+184
	str	ip, [fp]
	mov	lr, pc
	bx	r3
	ldr	r3, .L978+188
	mov	lr, pc
	bx	r3
.L972:
	ldrh	r3, [r10]
	b	.L971
.L979:
	.align	2
.L978:
	.word	setupSoundsReal
	.word	goToStart
	.word	buttons
	.word	state
	.word	time
	.word	fallV
	.word	fallH
	.word	meter
	.word	gotBerry
	.word	1717986919
	.word	oldButtons
	.word	67109120
	.word	leaf
	.word	waitForVBlank
	.word	shadowOAM
	.word	DMANow
	.word	10000000
	.word	terr
	.word	715827883
	.word	bute
	.word	jumptimer
	.word	cheetad
	.word	reelFrame
	.word	markd
	.word	mark
	.word	burnd
	.word	burn
	.word	mored
	.word	more
	.word	gotCarrot
	.word	gotCrystal
	.word	gotFish
	.word	fish
	.word	cave
	.word	snow
	.word	instructions
	.word	win
	.word	pause
	.word	start
	.word	game
	.word	cheeta
	.word	litty
	.word	player
	.word	collision
	.word	detroit
	.word	townWin
	.word	playSoundA
	.word	goToWin
	.size	main, .-main
	.comm	cheetad,4,4
	.comm	cheeta,4,4
	.comm	mored,4,4
	.comm	more,4,4
	.comm	oil,4,4
	.comm	fishCheat,4,4
	.comm	snowCheat,4,4
	.comm	leafCheat,4,4
	.comm	caveCheatInt,4,4
	.comm	flame5,4,4
	.comm	flame4,4,4
	.comm	flame3,4,4
	.comm	flame2,4,4
	.comm	flame1,4,4
	.comm	burn,4,4
	.comm	burnd,4,4
	.comm	markd,4,4
	.comm	markpal,4,4
	.comm	mark,4,4
	.comm	camping,4,4
	.comm	reelFrame,4,4
	.comm	meter,4,4
	.comm	reel,4,4
	.comm	terr,4,4
	.comm	litty,4,4
	.comm	bute,4,4
	.comm	jumptimer,4,4
	.comm	bob,4,4
	.comm	time,4,4
	.comm	gotKey,4,4
	.comm	gotCrystal,4,4
	.comm	gotBerry,4,4
	.comm	gotCarrot,4,4
	.comm	gotFish,4,4
	.comm	detroit,4,4
	.comm	diag,4,4
	.comm	fallV,4,4
	.comm	fallH,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	townWin,20,4
	.comm	flower,20,4
	.comm	secret,20,4
	.comm	surf,20,4
	.comm	shroom,20,4
	.comm	flip,20,4
	.comm	reflect,20,4
	.comm	town,20,4
	.comm	jumpy,56,4
	.comm	sherry,56,4
	.comm	player,56,4
	.comm	shadowOAM,1024,4
	.comm	collisionbitmap,4,4
	.comm	sailing,4,4
	.comm	state,4,4
	.comm	rSeed,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	songs,200,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
