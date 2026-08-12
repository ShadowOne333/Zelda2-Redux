;*****************************************************************
;	New Experience system
;*****************************************************************

%org($968D,0)	; 0x0169D
	jsr $A8B0

%org($9690,0)	; 0x016A0
	fillbyte $EA : fill $11	; Fill $11 bytes with NOP

%org($9DA7,0)	; 0x01DB7
	jsr $A8D0

%org($A0CE,0)	; 0x020DE
	fillbyte $EA : fill $22	; Fill $22 bytes with NOP

%org($A8B0,0)	; 0x028C0
	lda #$27
	cmp $0775
	beq l_A8B8	; BEQ $01
	rts
l_A8B8:
	lda #$0F
	cmp $0776
	bmi l_A8C0	; BMI $01
	rts
l_A8C0:
	lda #$27
	sta $0775
	lda #$0F
	sta $0776
	rts

	fillbyte $FF : fill $05	; Fill $05 bytes with $FF

	lda $F7
	and #$08
	bne l_A8DA	; BNE $04
	inc $0524
	rts
l_A8DA:
	lda #$01
	sta $074C
	lda #$03
	sta $074E
	rts

;------------------------------------

%org($9B67,4)	; 0x11B77
	jsr $9EF0

%org($9B70,4)	; 0x11B80
	jsr $9F00

%org($9EF0,4)	; 0x11F00
	lda $0771
	sta $0756
	rts

%org($9F00,4)	; 0x11F10
	lda $0770
	sta $0755
	rts
