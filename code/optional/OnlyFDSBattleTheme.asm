//****************************************************************
//	Only the FDS theme plays during battles/encounters
//****************************************************************

// Overworld music change routine by IcePenguin
bank 0; org $A912	// 0x02922
	lda.b #$08	// Load music entry $08

//-------------------------------------------------------------
// Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
bank 6; org $9DC7	// 0x19DD7
	lda.b #$08	// Force FDS Battle Theme ($08)
org $9DCC	// 0x19DDC
	lda.b #$08	// Force FDS Battle Theme ($08)

//-------------------------------------------------------------
// Routine for loading new battle theme into East Hyrule
bank 7; org $FEBB	// 0x1FECB
	lda.b #$08	// Force FDS battle theme ($08)
org $FEC1	// 0x1FED1
	lda.b #$08	// Force FDS battle theme ($08)

//-------------------------------------------------------------

