//***********************************************************
//	Hearts Life Meter
//***********************************************************

bank 0;
org $179C	// 0x017AC
	jsr l_B000	// $B000, Originally LDA $0774
	nop		// Originally STA $0565
	jsr l_B100	// $B100, Originally LSR x5 
	nop		
	jsr l_AC90	// Jump to $AC90
	
org $97A7	// 0x017B7
	fillto $97B6,$EA	// Fill with NOP
	
org $97CF	// 0x017DF
	lda.w l_AB70,x	// Originally TAX, LDA #$0F

// Related to the new HUD Hearts code by IcePenguin
org $AC90	// 0x02CA0
l_AC90:
	lda.b #$00
	cmp.w $0796	// Check Link's stabs address
	beq $39	// BEQ $39
	lda.b #$02
	cmp.w $0796
	beq $32	// BEQ $32
	lda.b #$04
	cmp.w $0796
	beq $2B	// BEQ $2B
	lda.b #$06
	cmp.w $0796
	beq $24	// BEQ $24
	lda.b #$10
	cmp.w $0796
	beq $1D	// BEQ $1D
	lda.b #$12
	cmp.w $0796
	beq $16	// BEQ $16
	lda.b #$14
	cmp.w $0796
	beq $0F	// BEQ $0F
	lda.b #$16
	cmp.w $0796
	beq $08	// BEQ $08
	rts

org $ACD0	// 0x02CE0
	lda.b #$01
	cmp.w $079D	// Compare with 7 magic containers address
	bne end1	// BNE $25
	lda.b #$06
	cmp.w $0561	// Compare with area code address
	bne end1	// BNE $1E
	lda.b #$00
	cmp.w $0744	// Compare with buttons pressed on Controller 1
	bne next1	// BNE $03
	inc.w $0796
next1:
	lda.b #$02
	cmp.w $0744	// Compare with buttons pressed on Controller 1
	bne next2	// BNE $03
	inc.w $0796
next2:
	lda.b #$01
	cmp.w $0744	// Compare with buttons pressed on Controller 1
	bne end1	// BNE $03
	inc.w $0796
end1:
	rts
	
	fill $03,$FF

org $AD00	// 0x02D10
	sta.w $0796
	lda.b #$01
	sta.w $079D	// Have 7 magic containers
	rts


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

