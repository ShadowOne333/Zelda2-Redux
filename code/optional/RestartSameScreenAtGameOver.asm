//****************************************************************
//	Restart on the Same Screen after a Game Over
//****************************************************************

bank 7;
org $CA5F	// 0x1CA6F
	sta.w $0755	// Originally 8D 75 07 - STA $0775
	sta.w $0756	// Originally 8D 76 07 - STA $0776

org $CABA	// 0x01CACA
	beq l_CACC	// BEQ $10
	lda.b #$00
	sta.w $0775
	sta.w $0776
	lda.b #$40
	sta.w $07B0
	jmp $CF05
l_CACC:
	lda.b #$03
	sta.w $0700
	jsr $CF30
	cmp.b #$0F
	beq l_CADF	// BEQ $07
	lda.b #$06
	ldy.b #$01
	jmp $CAF0
l_CADF:
	jsr $C358
	nop
	nop
	lda.b #$00
