//****************************************************************
//    Change the Sound that plays when grabbing a minor item
//****************************************************************

bank 7;
// Sound for Items already available in-ground inside Temples
org $E79A	// 0x1E7AA
	lda.b #$02	// Originally LDA #$08
	sta.b $EC	// Originally STA $EF, SFX Type 4
// Changed SFX Type from 4 to 1

// Sound for Items already available in-ground in Overworld
org $E802	// 0x1E812
	lda.b #$02	// Originally LDA #$08
	sta.b $EC	// Originally STA $EF, SFX Type 4

// Sound for Item drops from enemies
org $E847	// 0x1E857
	lda.b #$02	// Originally LDA #$08
	sta.b $EC	// Originally STA $EF, SFX Type 4
