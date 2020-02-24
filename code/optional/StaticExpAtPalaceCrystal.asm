//********************************************************************
// Static experience points upon Palace Crystal placement
//********************************************************************

bank 4;
org $9B67	// 0x11B77
// Experience to be added upon Crystal placement (low byte)
	jsr $9F10
org $9B70	// 0x11B80
// Experience to be added upon Crystal placement (high byte)
	jsr $9F60

// Moved to $9F10 so it doesn't collide with the New Exp system patch
org $9F10	// 0x11F20
	lda.b #$0D
	cmp.w $0561
	beq label1	// F0 42
	lda.b #$22
	cmp.w $0561
	beq label2	// F0 35
	lda.b #$0E
	cmp.w $0561
	beq label3	// F0 28
	lda.b #$1C
	cmp.w $0561
	beq label4	// F0 1B 
	lda.b #$29
	cmp.w $0561
	beq label5	// F0 0E
	lda.b #$3A
	cmp.w $0561
	beq label6	// F0 01
	rts

label6:
	lda.b #$B8
	sta.w $0756
	rts

label5:
	lda.b #$C4
	sta.w $0756
	rts

label4:
	lda.b #$D0
	sta.w $0756
	rts

label3:
	lda.b #$DC
	sta.w $0756
	rts

label2:
	lda.b #$E8
	sta.w $0756
	rts
label1:
	lda.b #$F4
	sta.w $0756
	rts

	db $FF


	lda.b #$0D
	cmp.w $0561
	beq label7	// F0 42
	lda.b #$22
	cmp.w $0561
	beq label8	// F0 35
	lda.b #$0E
	cmp.w $0561
	beq label9	// F0 28
	lda.b #$1C
	cmp.w $0561
	beq label10	// F0 1B
	lda.b #$29
	cmp.w $0561
	beq label11	// F0 0E
	lda.b #$3A
	cmp.w $0561
	beq label12	// F0 01
	rts

label12:
	lda.b #$0B
	sta.w $0755
	rts

label11:
	lda.b #$09
	sta.w $0755
	rts

label10:
	lda.b #$07
	sta.w $0755
	rts

label9:
	lda.b #$05
	sta.w $0755
	rts

label8:
	lda.b #$03
	sta.w $0755
	rts

label7:
	lda.b #$01
	sta.w $0755
	rts
