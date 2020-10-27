//***********************************************************
//  Saria Bridge Draws Automatically on Subsequent Visits
// 		(by IcePenguin)
//***********************************************************

bank 0;
// Hijacks for Saria Bridge code
org $97A4
	jsr l_AC90	// Jump to $AC90
	fillto $97B6,$EA	// Fill with NOP
org $A826	// 0x02836
	jsr $AD00	// Originally STA $9607

// Related to the new HUD Hearts code
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

bank 3;
// Modify level data for the Saria Bridge area
org $8A7C	// 0x0CA8C
	db $F4,$67,$FF,$15,$6D


bank 7;
// Related to Saria Bridge hack
org $C1F6	// 0x1C206
	bmi $0E		// Originally BCC $0E
