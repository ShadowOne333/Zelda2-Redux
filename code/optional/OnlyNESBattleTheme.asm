//****************************************************************
//	Only the NES theme plays during battles/encounters
//****************************************************************

// Overworld music change routine by IcePenguin
bank 0; org $A912	// 0x02922
	lda.b #$04	// Load music entry $04

//-------------------------------------------------------------
// Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
bank 6; org $9DC7	// 0x19DD7
	lda.b #$04	// Force NES Battle Theme ($04)
org $9DCC	// 0x19DDC
	lda.b #$04	// Force NES Battle Theme ($04)

//-------------------------------------------------------------
// Routine for loading new battle theme into East Hyrule
bank 7; org $FEBB	// 0x1FECB
	lda.b #$04	// Force NES battle theme ($04)
org $FEC1	// 0x1FED1
	lda.b #$04	// Force NES battle theme ($04)

//-------------------------------------------------------------

