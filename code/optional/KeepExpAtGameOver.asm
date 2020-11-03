//****************************************************************
//	Keep Experience after a Game Over
//****************************************************************

bank 7;
// Experience to be added (high byte - low byte)
org $CA5F	// 0x1CA6F
	sta.w $0755	// Originally 8D 75 07 - STA $0775
	sta.w $0756	// Originally 8D 76 07 - STA $0776

org $CABA	// 0x01CACA
	beq.b $14		// F0 14 - Originally BEQ $08 - Branch to 0x1CAE0
	lda.b #$00	// Originally LDA #$40
	sta.w $0775	// Store in current experience (high byte)
	sta.w $0776	// Store in current experience (low byte)
	nop		// Originally STA $0775
	nop
	nop
	nop
	lda.b #$40	// Originally STA $0776
	sta.w $07B0	// Originally STA $0756
	jmp $CF05	// JMP $CF0F on original patch - Originally STA $0755
