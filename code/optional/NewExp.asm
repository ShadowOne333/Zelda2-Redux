//*****************************************************************
//	New Experience system
//*****************************************************************

bank 0;
org $968D	// 0x0169D
	jsr $A8B0

org $9690	// 0x016A0
	fill $11,$EA	// Fill $11 bytes with NOP

org $9DA7	// 0x01DB7
	jsr $A8D0

org $A0CE	// 0x020DE
	fill $22,$EA	// Fill $22 bytes with NOP

org $A8B0	// 0x028C0
	lda.b #$27
	cmp.w $0775
	beq l_A8B8	// BEQ $01
	rts
l_A8B8:
	lda.b #$0F
	cmp.w $0776
	bmi l_A8C0	// BMI $01
	rts
l_A8C0:
	lda.b #$27
	sta.w $0775
	lda.b #$0F
	sta.w $0776
	rts

	fill $05,$FF

	lda.b $F7
	and.b #$08
	bne l_A8DA	// BNE $04
	inc.w $0524
	rts
l_A8DA:
	lda.b #$01
	sta.w $074C
	lda.b #$03
	sta.w $074E
	rts

//------------------------------------

bank 4;
org $9B67	// 0x11B77
	jsr $9EF0

org $9B70	// 0x11B80
	jsr $9F00

org $9EF0	// 0x11F00
	lda.w $0771
	sta.w $0756
	rts

org $9F00	// 0x11F10
	lda.w $0770
	sta.w $0755
	rts
