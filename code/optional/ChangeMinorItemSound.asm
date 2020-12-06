//****************************************************************
//	Change the Text printing sound from Dialog boxes
//****************************************************************

bank 7;
// Sound for Text printing per-character
org $E802	// 0x1E812
	lda.b #$02	// Originally LDA #$08
	sta.b $EC	// Originally STA $EF, SFX Type 4
// Changed SFX Type from 1 to 3
