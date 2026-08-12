;***********************************************************
;	Hearts Life Meter (by IcePenguin)
;***********************************************************

%org($979C,0)	; 0x017AC
	jsr l_B000	; $B000, Originally LDA $0774
	nop		; Originally STA $0565
	jsr l_B100	; $B100, Originally LSR x5 
	nop

; Hearts in Life meter
%org($B000,0)	; 0x03010
l_B000:
	lda #$00	; Load zero into accumulator
	cmp $0774	; Current life left in meter
	bne $01
	rts
	
	lda #$80	; Load $80 into accumulator
	cmp $0774	; Compare with current life left
	bmi $01		; Branch on minus
	rts
	
	lda #$C7
	sta $0309,y
	lda #$C7
	sta $030A,y
	lda #$C7
	sta $030B,y
	lda #$C7
	sta $030C,y
	lda #$80
	cmp $0774
	bmi $01
	rts
	
	lda #$F6
	sta $030D,y
	lda #$88
	cmp $0774
	bmi $01
	rts
	
	lda #$F7
	sta $030D,y
	lda #$90
	cmp $0774
	bmi $01
	rts
	
	lda #$FC
	sta $030D,y
	lda #$98
	cmp $0774
	bmi $01
	rts
	
	lda #$C7
	sta $030D,y
	lda #$A0
	cmp $0774
	bmi $01
	rts
	
	lda #$F6
	sta $030E,y
	lda #$A8
	cmp $0774
	bmi $01
	rts
	
	lda #$F7
	sta $030E,y
	lda #$B0
	cmp $0774
	bmi $01
	rts
	
	lda #$FC
	sta $030E,y
	lda #$B8
	cmp $0774
	bmi $01
	rts
	
	lda #$C7
	sta $030E,y
	lda #$C0
	cmp $0774
	bmi $01
	rts
	
	lda #$F6
	sta $030F,y
	lda #$C8
	cmp $0774
	bmi $01
	rts
	
	lda #$F7
	sta $030F,y
	lda #$D0
	cmp $0774
	bmi $01
	rts
	
	lda #$FC
	sta $030F,y
	lda #$D8
	cmp $0774
	bmi $01
	rts
	
	lda #$C7
	sta $030F,y
	lda #$E0
	cmp $0774
	bmi $01
	rts
	
	lda #$F6
	sta $0310,y
	lda #$E8
	cmp $0774
	bmi $01
	rts
	
	lda #$F7
	sta $0310,y
	lda #$F0
	cmp $0774
	bmi $01
	rts
	
	lda #$FC
	sta $0310,y
	lda #$F8
	cmp $0774
	bmi $01
	rts
	
	lda #$C7
	sta $0310,y
	rts

%org($B100,0)	; 0x03110
l_B100:
	lda #$00
	cmp $0774
	bmi $01
	rts

	lda #$F6
	sta $0309,y
	lda #$08
	cmp $0774
	bmi $01
	rts

	lda #$F7
	sta $0309,y
	lda #$10
	cmp $0774
	bmi $01
	rts

	lda #$FC
	sta $0309,y
	lda #$18
	cmp $0774
	bmi $01
	rts
	
	lda #$C7
	sta $0309,y
	lda #$20
	cmp $0774
	bmi $01
	rts

	lda #$F6
	sta $030A,y
	lda #$28
	cmp $0774
	bmi $01
	rts

	lda #$F7
	sta $030A,y
	lda #$30
	cmp $0774
	bmi $01
	rts

	lda #$FC
	sta $030A,y
	lda #$38
	cmp $0774
	bmi $01
	rts
	
	lda #$C7
	sta $030A,y
	lda #$40
	cmp $0774
	bmi $01
	rts

	lda #$F6
	sta $030B,y
	lda #$48
	cmp $0774
	bmi $01
	rts

	lda #$F7
	sta $030B,y
	lda #$50
	cmp $0774
	bmi $01
	rts

	lda #$FC
	sta $030B,y
	lda #$58
	cmp $0774
	bmi $01
	rts

	lda #$C7
	sta $030B,y
	lda #$60
	cmp $0774
	bmi $01
	rts

	lda #$F6
	sta $030C,y
	lda #$68
	cmp $0774
	bmi $01
	rts

	lda #$F7
	sta $030C,y
	lda #$70
	cmp $0774
	bmi $01
	rts

	lda #$FC
	sta $030C,y
	lda #$78
	cmp $0774
	bmi $01
	rts

	lda #$C7
	sta $030C,y
	rts


; Load current life left in Meter for HUD update
%org($D4D1,7)	; 0x1D4E1
	lda $0774	; Originally LDA $0565

