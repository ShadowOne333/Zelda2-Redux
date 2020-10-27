//***********************************************************
//	Max Lives Counter Cap
//***********************************************************

bank 0;
// Pause pane counters related to Crystals and Lives
org $A156	// 0x02166
	sta.w $7896	// Originally STA $7881
org $A15F	// 0x0216F
	sta.w $7897
	jsr l_AC60	// Hijack for max number of lives printed
	clc
	adc.b #$CF	// Change to dot tile?
	sta.w $7898


// Force Lives counter to print out max number of 9
org $AC60	// 0x02C70
l_AC60:
	lda.w $079E
	lda.w $0700	// Load current number of lives
	sta.w $079E
	lda.b #$09
	cmp.w $079E
	bpl decrement	// BPL $06, Branch on plus to
	lda.b #$0A
	sta.w $079E
	rts
decrement:
	inc.w $079E
	lda.w $079E
	dec.w $079E
	rts

bank 7;
// Hijack for the life counter screen
org $C3D4	// 0x1C3E4
	jsr l_FF5E	// Originally LDA $0700

// Visual cap for the life counter screen
org $FF5E	// 0x1FF6E
l_FF5E:
	lda.w $079E	// Load value at $079E (Dolls?)
	lda.b #$09	// Load $09 into accumulator
	cmp.w $0700	// Compare to number of lives
	bpl l_FF69	// BPL $01, Branch on plus
	rts
l_FF69:		// 0x1FF79
	lda.w $0700
	sta.w $079E
	rts
