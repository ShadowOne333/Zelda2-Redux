//****************************************************************
//	Restart on the Same Screen after a Game Over
//****************************************************************

bank 7;
// Experience to be added (high byte - low byte)
org $CA5F	// 0x1CA6F
	sta.w $0755	// Originally 8D 75 07 - STA $0775
	sta.w $0756	// Originally 8D 76 07 - STA $0776

org $CABA	// 0x01CACA
	beq l_CACC	// BEQ $10
	lda.b #$00
	sta.w $0775	// Store in current experience (high byte)
	sta.w $0776	// Store in current experience (low byte)
	lda.b #$40	// Load #$40 into accumulator
	sta.w $07B0	// ???
	jmp $CF05
l_CACC:
	lda.w $0795	// Load value stored at $0795 (Lives/Dolls)
	sta.w $0700	// Store as current number of lives
	jsr $CF30
	cmp.b #$0F
	beq l_CADF	// BEQ $07
	lda.b #$06
	ldy.b #$01
	jmp $CAF0
l_CADF:
	jsr $C358
	nop
	lda.b #$00
