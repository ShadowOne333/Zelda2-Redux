//****************************************************************
//    Change Blue Tunic to Red Tunic at Level 7 instead of 5
//****************************************************************

bank 0;
org $2AC0	// 0x02AD0
	lda.w $0779	// Load Life level
	cmp.b #$07	// Check if Life/Defense level = 7
