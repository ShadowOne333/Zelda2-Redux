//***********************************************************
//	PAUSE message on pause at Overworld (by IcePenguin)
//***********************************************************

bank 0;
// Overworld pause hijack
org $A1B3	// 0x021C3
	jsr pause_status// Jump to $A8A0, Originally LDA #$05
	nop		// Originally STA $0736
	nop

org $A25D	// 0x0226D
	jsr l_ABA0	// $ABA0, Originally LDA $F7, Controller 1
	fill $06,$EA
	rts

// UNUSED / FREE SPACE
// Reset ($FE) the dim effect when you open the save menu on the world map.
org $A8A0	// 0x028B0
pause_status:
	lda.b #$1E
	sta.w $00FE
	lda.b #$05
	sta.w $0736	// Game mode address
	rts

org $ABA0	// 0x02BB0
l_ABA0:
	lda.b $F7	// Load controller 1 inputs
	and.b #$10	// Check if START has been pressed
	beq l_ABAD	// BEQ $07, branch if equal to RTS
	cmp.b $00	// Compare if $00
	beq l_ABAD	// BEQ $03, branch if equal to RTS
	jmp l_ABB0	// Jump to $ABB0
l_ABAD:
	rts

org $ABB0	// 0x02BC0
l_ABB0:
	lda.b #$00
	cmp.w $0727	// Load ??? from RAM
	beq l_ABBB	// BEQ $04, branch if equal to 
	inc.w $0524	// Increment Routine index
	rts
l_ABBB:
	lda.b #$58	// Load $58 into accumulator
	sta.w $0244	// Store at $0244 in RAM
	lda.b #$89	// Load $89 into accumulator
	sta.w $0245
	lda.b #$01
	sta.w $0246
	lda.b #$70
	sta.w $0247
	lda.b #$58
	sta.w $0248
	lda.b #$8B
	sta.w $0249
	lda.b #$01
	sta.w $024A
	lda.b #$78
	sta.w $024B
	lda.b #$58
	sta.w $024C
	lda.b #$8D
	sta.w $024D
	lda.b #$01
	sta.w $024E
	lda.b #$80
	sta.w $024F
	lda.b #$58
	sta.w $0250
	lda.b #$8F
	sta.w $0251
	lda.b #$01
	sta.w $0252	
	lda.b #$88
	sta.w $0253
	lda.b #$58
	sta.w $0254
	lda.b #$91
	sta.w $0255
	lda.b #$01
	sta.w $0256
	lda.b #$90
	sta.w $0257
	lda.b #$58
	sta.w $0258
	lda.b #$93
	sta.w $0259
	lda.b #$01
	sta.w $025A
	lda.b #$98
	sta.w $025B

	inc.w $0524	// Increment Routine index
	lda.b #$18	// Load $18 into accumulator
	cmp.w $00FE	// Compare with value at $00FE
	beq l_AC43	// BEQ $06, branch if equal to
	lda.b #$18	// Load $18 into accumulator
	sta.w $00FE	// Store at $00FE
	rts
l_AC43:
	lda.b #$F8	// Load controller 2 inputs
	sta.w $00FE
	rts


