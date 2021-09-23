//***********************************************************
//	Shield spell - Tunic color change (by ShadowOne333)
//***********************************************************

bank 0;
// Change behaviour of Spell casting
org $8DD4	// 0x0DE4
	cpx.b #$49	// Originally BEQ $49 / BEQ $0E1F
	
org $8E48	// 0x0E58
	dw shield_tunic	// $AAC0, Originally $8E8D

// Main Tunic changing routine
org $AAC0	// 0x02AD0
shield_tunic:
	lda.w $0779	// Load Life level
	cmp.b #$05	// Check if Life/Defense level = 5
	bcc blue_tunic	// BCC $09, Branch if level is less than 5
red_tunic:
	lda.b #$16	// Load color $16 (Red)
	sta.w $69DE	// Store into Link's current palette
	sta.w $070F	// Store into Link's color after Shield spell
	rts
blue_tunic:
	lda.b #$11	// Load color $11 (Blue)
	sta.w $69DE	// Store into Link's current palette
	sta.w $070F	// Store into Link's color after Shield spell
	rts
