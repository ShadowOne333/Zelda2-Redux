//***********************************************************
//	Modern Title Screen to match recent Zelda games
//     Based on TS from "Journey of a Day" by IcePenguin
//		Reworked Title by ShadowOne333
//***********************************************************

// Tile mappings for the title screen
bank 5;
org $16F69	// 0x16F79
// ZELDA II Magenta letters tilemap
	db $22,$6B,$09
	db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4

org $16F84	// 0x16F94
// First row of ADVENTURE tilemap
	db $22,$88,$18
	db $F4,$1E,$20,$22,$24,$26,$28,$2A
	db $2C,$2E,$30,$32,$34,$36,$F4,$F4
	db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$FD

org $16FAA	// 0x16FBA
// Second row of ADVENTURE tilemap
	db $22,$A7,$19
	db $F4,$F4,$1F,$21,$23,$25,$27,$29
	db $2B,$2D,$2F,$31,$33,$35,$37,$13
	db $F4,$F4,$F4,$F4,$F4,$F4,$F4,$F4,$FD

org $16FC6	// 0x16FD6
// Third row, start of LINK tilemap
	db $22,$CA,$0E
	db $3E,$40,$42,$08,$4B,$4D,$51,$0D
	db $58,$5A,$5F,$61,$10,$F4

org $16FDB	// 0x16FEB
// Fourth row, second LINK row tilemap
	db $22,$EA,$0D
	db $3F,$41,$43,$0C,$4C,$4E,$52,$54
	db $59,$5B,$60,$62,$11

org $16FEF	// 0x16FFF
// Fourth row, second LINK row tilemap
	db $23,$09,$17
	db $44,$46,$48,$4A,$1A,$0A,$4F,$55
	db $56,$0B,$5C,$63,$65,$12,$3B,$F4
	db $F4,$F4,$F4,$F4,$F4,$F4,$FD

org $17014	// 0x17024
// Fifth and final row, bottom of LINK tilemap
	db $23,$29,$17
	db $45,$47,$49,$49,$67,$14,$15,$16
	db $17,$18,$19,$1B,$1C,$1D,$F4,$F4
	db $F4,$F4,$F4,$F4,$F4,$F4,$FD


//-------------------------------------------
// Import new title screen graphics
//-------------------------------------------

bank 8;	org $21080	// 0x021090
// Import the new graphics
	incbin code/optional/ReworkedTitleScreen.chr



