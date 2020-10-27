//***********************************************************
//	Hearts Life Meter (by IcePenguin)
//***********************************************************

bank 0;
org $979C	// 0x017AC
	jsr l_B000	// $B000, Originally LDA $0774
	nop		// Originally STA $0565
	jsr l_B100	// $B100, Originally LSR x5 
	nop

// Hearts in Life meter
org $B000	// 0x03010
l_B000:
	lda.b #$00	// Load zero into accumulator
	cmp.w $0774	// Current life left in meter
	bne $01
	rts
	
	lda.b #$80	// Load $80 into accumulator
	cmp.w $0774	// Compare with current life left
	bmi $01		// Branch on minus
	rts
	
	lda.b #$C7
	sta.w $0309,y
	lda.b #$C7
	sta.w $030A,y
	lda.b #$C7
	sta.w $030B,y
	lda.b #$C7
	sta.w $030C,y
	lda.b #$80
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F6
	sta.w $030D,y
	lda.b #$88
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F7
	sta.w $030D,y
	lda.b #$90
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$FC
	sta.w $030D,y
	lda.b #$98
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$C7
	sta.w $030D,y
	lda.b #$A0
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F6
	sta.w $030E,y
	lda.b #$A8
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F7
	sta.w $030E,y
	lda.b #$B0
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$FC
	sta.w $030E,y
	lda.b #$B8
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$C7
	sta.w $030E,y
	lda.b #$C0
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F6
	sta.w $030F,y
	lda.b #$C8
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F7
	sta.w $030F,y
	lda.b #$D0
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$FC
	sta.w $030F,y
	lda.b #$D8
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$C7
	sta.w $030F,y
	lda.b #$E0
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F6
	sta.w $0310,y
	lda.b #$E8
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$F7
	sta.w $0310,y
	lda.b #$F0
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$FC
	sta.w $0310,y
	lda.b #$F8
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$C7
	sta.w $0310,y
	rts

org $B100	// 0x03110
l_B100:
	lda.b #$00
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F6
	sta.w $0309,y
	lda.b #$08
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F7
	sta.w $0309,y
	lda.b #$10
	cmp.w $0774
	bmi $01
	rts

	lda.b #$FC
	sta.w $0309,y
	lda.b #$18
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$C7
	sta.w $0309,y
	lda.b #$20
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F6
	sta.w $030A,y
	lda.b #$28
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F7
	sta.w $030A,y
	lda.b #$30
	cmp.w $0774
	bmi $01
	rts

	lda.b #$FC
	sta.w $030A,y
	lda.b #$38
	cmp.w $0774
	bmi $01
	rts
	
	lda.b #$C7
	sta.w $030A,y
	lda.b #$40
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F6
	sta.w $030B,y
	lda.b #$48
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F7
	sta.w $030B,y
	lda.b #$50
	cmp.w $0774
	bmi $01
	rts

	lda.b #$FC
	sta.w $030B,y
	lda.b #$58
	cmp.w $0774
	bmi $01
	rts

	lda.b #$C7
	sta.w $030B,y
	lda.b #$60
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F6
	sta.w $030C,y
	lda.b #$68
	cmp.w $0774
	bmi $01
	rts

	lda.b #$F7
	sta.w $030C,y
	lda.b #$70
	cmp.w $0774
	bmi $01
	rts

	lda.b #$FC
	sta.w $030C,y
	lda.b #$78
	cmp.w $0774
	bmi $01
	rts

	lda.b #$C7
	sta.w $030C,y
	rts


bank 7;
// Load current life left in Meter for HUD update
org $D4D1	// 0x1D4E1
	lda.w $0774	// Originally LDA $0565

