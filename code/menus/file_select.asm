//***************************************************************
// File Select changes (by DarkSamus993, D-man and Cyneprepou4uk)
//***************************************************************

//****************************************
// 	Table file
//****************************************
table code/text/text.tbl

//----------------------------------------

bank 5;
// Move Fairy cursor down by pressing either Select or Down in D-Pad (by DarkSamus993)
org $B303	// 0x17313
	lda.b $F5	// Controller 1 buttons pressed
	and.b #$24	// Check if Down-Select is pressed
	beq l_B321	// BEQ $18, Branch if equal to 0x17331
	lda.b #$01	// Change sound when moving Fairy cursor
	sta.b $18
//l_B30D:

org $B313	// 0x17323
	beq l_B31A	// BEQ $05, Branch to $B31A if cursor position > 4, wrap around to 0
	ldx.b $19
	jmp l_B343
l_B31A:
	ldx.b #$00
	stx.b $19
	jmp l_B343
l_B321:
	lda.b $F5	// Controller 1 buttons pressed
	and.b #$08	// Check if Up is pressed
	beq l_B33D	// BEQ $16, Branch to $B33C if Up is pressed
	lda.b #$02
	sta.b $18
l_B32B:
	dec.b $19
	lda.b $19
l_B32F:
	bmi l_B336	// BMI $05, Branch on minus to $B336
	ldx.b $19
	jmp l_B343
l_B336:
	ldx.b #$04
	stx.b $19
	jmp l_B343
l_B33D:
	ldx.b $19
	lda.b #$00
	sta.b $18
l_B343:
	lda.b $1A
	asl
	asl
	sta.b $17
	lda.b $1A
	asl
	clc
	adc.b $17
	sta.b $17
	txa
	adc.b $17
	sta.b $17
	tax
	lda.w l_BDE0,x
	beq l_B36A	// BEQ $0E, Branch to $B36A
	sta.b $1B
	lda.b #$1C
	sta.b $4D
	ldy.b $1B
	jsr $B574
	jmp l_B376
l_B36A:
	lda.b $18
	and.b #$02
	bne l_B373	// BNE $03, Branch if not equal to $B373
	jmp $B30D
l_B373:
	jmp l_B32B
l_B376:
	lda.b #$40
	ldy.b #$28
	jsr $B596
	jsr $B5B5

	ldx.b #$08
	lda.b #$43
	sta.w $0000
l_B387:
	lsr.w $0002
	bcc l_B3A1	// BCC $15, Branch to $B3A1 if  less than
	lda.w $0000
	sta.w $0218,x
	lda.b #$D2
	sta.w $0219,x
	lda.b #$01
	sta.w $021A,x
	lda.b #$30
	sta.w $021B,x
l_B3A1:
	lda.w $0000
	clc
	adc.b #$18
	sta.w $0000
	dex
	dex
	dex
	dex
	bpl l_B387	// BPL $D7, Branch to $B387 on plus
	lda.b #$21
	sta.w $0000
	lda.b #$07
	sta.w $0001
	jsr $B529
	rts

	fillto $B3CF,$FF

// Elimination mode Cursor Up/Down (by D-man/Cyneprepou4uk)
org $B4A6	// 0x174B6
l_B4A6:
	jsr l_BE20
	tya
	pha
	jsr $B502
	pla
	tay
	lda.b $19
	cmp.b #$03
	beq $1F	// BEQ $1F, Branch to $B4D5
	asl
	bne l_B4BC	// BNE $03, Branch to $B4BC
	clc
	adc.b #$01
l_B4BC:
	and.b $1A
	beq $15	// BEQ $15, Branch to $B4D5
	lda.b $19
	clc
	adc.w l_B4CD,y
	and.b #$03
	sta.b $19
	jmp $B4B2
l_B4CD:
	db $01,$FF,$01,$FF
	db $FF,$FF,$FF,$FF
org $BE20	// 0x17E30
l_BE20:
	jsr l_BE26
	jmp l_BE3D
l_BE26:
	ldy.b #$02
	ldx.b $F5
	txa
	and.b #$24
	bne l_BE37	// BNE $08
	dey
	txa
	and.b #$08
	bne l_BE3A	// BNE $05
	dey
	rts
l_BE37:
	inc.b $19
	rts
l_BE3A:
	dec.b $19
	rts
l_BE3D:
	lda.b $19
	and.b #$03
	sta.b $19
	tya
	beq l_BE48	// BEQ $02
	lda.b #$04
l_BE48:
	sta.b $EB
	rts


org $B759	// 0x17769
	lda.b #$C7	// LDA #$FF

// Bugfix for the alphabet cursor covering the box line
org $B86C	// 0x1787C
	lda.b #$C7	// LDA #$FF	

// File Selection Palettes for Link
org $BC08	// 0x17C18
	db $0F,$07,$37,$2A	// Originally 0F 18 36 2A

// File Selection Text and Tiles/Sprites
org $BC3B	// 0x17C4B
	db $20,$C7,$06
	db "-NAME-"
	db $20,$D2,$07
	db "-LEVEL-"
	db $21,$10,$0B
	db $C9,"-0 ",$FA,"-0 ",$F8,"-0"
	db $21,$70,$0B
	db $C9,"-0 ",$FA,"-0 ",$F8,"-0"
	db $21,$D0,$0B
	db $C9,"-0 ",$FA,"-0 ",$F8,"-0"

// Rename ELIMINATION MODE to ERASE SAVE FILE
org $BCA2	// 0x17CB2
	db "ERASE SAVE FILE "	// Rewrite "ELIMINATION MODE"

// Change "-" to dash "/" in REGISTER NAME
org $BD3B	// 0x17D4B
	db $CE

// Change "-" to dash "/" in ELIMINATION MODE
org $BD8F	// 0x17D9F
	db $CE

// UNUSED SPACE, Possible code for the new Battle Theme?
org $BDB0	// 0x17DC0
	and.b #$20
	beq l_BDC3	// BEQ $10, Branch to $BDC3
	lda.b #$04
	sta.b $EB
	inc.b $19
	lda.b $19
	cmp.b #$05
	bne l_BDC3	// BNE $04, Branch if not equal to $BDC3
	lda.b #$00
	sta.b $19
l_BDC3:
	lda.b $19
	bne $12	// BNE $12, Branch if not equal to
	lda.b $1A
	and.b #$01
	beq $05	// BEQ $05
	inc.b $19
	jmp l_B32F

// Table for cursor routine
org $BDE0	// 0x17DF0
l_BDE0:
	db $40,$58,$70,$00,$A8,$00,$00,$58
	db $70,$90,$A8,$00,$40,$00,$70,$90
	db $A8,$00,$00,$00,$70,$90,$A8,$00
	db $40,$58,$00,$90,$A8,$00,$00,$58
	db $00,$90,$A8,$00,$40,$00,$00,$90
	db $A8,$00,$00,$00,$00,$90,$00,$00
