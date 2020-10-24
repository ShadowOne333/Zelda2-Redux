//***********************************************************
//	Restart at Current Palace on Game Over (by njosro)
//***********************************************************

bank 0;
org $AB10	// 0x02B20
l_AB10:
	lda.w $0707	// Load current world
	rts
l_AB14:
	lda.w $0706
	asl
	asl
	clc
	adc.w $0707	// Add into $0707 (World)
	adc.w $0748	// Add into overworld area outside of view
	sec
	sbc.b #$34
	tax
	lda.w l_AB30,x	// Load table at $AB30
	sta.w $0561	// Store into area code address
	jmp $C358
org $AB30	// 0x02B40
l_AB30:
	db $FF,$FF,$FF,$00,$0E,$FF,$00,$FF
	db $0F,$FF,$FF,$23,$FF,$24,$FF,$00

bank 7;
// Restart routines hi-jacks
org $CAD0	// 0x1CAE0
	jsr l_AB10	// Originally JSR $CF30
	cmp.b #$03	// Originally CMP #$0F
	bcs $07		// Originally BEQ $07/$1CADE
org $CADE	// 0x1CAEE
	jsr l_AB14	// Originally JSR $C358
	lda.b #$00
	nop
	nop
	nop
