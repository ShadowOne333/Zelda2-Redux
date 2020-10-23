//***************************************************************
//	Static experience points upon Palace Crystal placement
//***************************************************************

bank 4;
// Experience to be added upon Crystal placement (low byte)
org $9B67	// 0x11B77
	jsr l_9F10
// Experience to be added upon Crystal placement (high byte)
org $9B70	// 0x11B80
	jsr l_9F60

// Moved to $9F10 so it doesn't collide with New Exp system patch
org $9F10	// 0x11F20
l_9F10:
	lda.b #$0D
	cmp.w $0561
	beq l_9F59	// F0 42
	lda.b #$22
	cmp.w $0561
	beq l_9F53	// F0 35
	lda.b #$0E
	cmp.w $0561
	beq l_9F4D	// F0 28
	lda.b #$1C
	cmp.w $0561
	beq l_9F47	// F0 1B 
	lda.b #$29
	cmp.w $0561
	beq l_9F41	// F0 0E
	lda.b #$3A
	cmp.w $0561
	beq l_9F3B	// F0 01
	rts
l_9F3B:
	lda.b #$B8
	sta.w $0756
	rts
l_9F41:
	lda.b #$C4
	sta.w $0756
	rts
l_9F47:
	lda.b #$D0
	sta.w $0756
	rts
l_9F4D:
	lda.b #$DC
	sta.w $0756
	rts
l_9F53:
	lda.b #$E8
	sta.w $0756
	rts
l_9F59:
	lda.b #$F4
	sta.w $0756
	rts
	db $FF

l_9F60:
	lda.b #$0D
	cmp.w $0561
	beq l_9FA9	// F0 42
	lda.b #$22
	cmp.w $0561
	beq l_9FA3	// F0 35
	lda.b #$0E
	cmp.w $0561
	beq l_9F9D	// F0 28
	lda.b #$1C
	cmp.w $0561
	beq l_9F97	// F0 1B
	lda.b #$29
	cmp.w $0561
	beq l_9F91	// F0 0E
	lda.b #$3A
	cmp.w $0561
	beq l_9F8B	// F0 01
	rts
l_9F8B:
	lda.b #$0B
	sta.w $0755
	rts
l_9F91:
	lda.b #$09
	sta.w $0755
	rts
l_9F97:
	lda.b #$07
	sta.w $0755
	rts
l_9F9D:
	lda.b #$05
	sta.w $0755
	rts
l_9FA3:
	lda.b #$03
	sta.w $0755
	rts
l_9FA9:
	lda.b #$01
	sta.w $0755
	rts
