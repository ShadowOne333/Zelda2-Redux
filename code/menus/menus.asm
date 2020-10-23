//***********************************************************
//	Menu changes
//***********************************************************

bank 0;
// Change a blank red tile for arrow/comma one (?)
org $878C	// 0x0079C
	lda.b #$9C	// Originally LDA #$FF
// Change old Arrow tile for new one
org $9F38	// 0x01F48
	lda.b #$9C	// LDA #$FB
// Change Magic bag tile for new Arrow
org $A63D	// 0x0264D
	lda.b #$9C	// Originally LDA #$FA, Controller 1?
// Change old Arrow tile for new one
org $A67B	// 0x0268B
	ldx.b #$9C	// Originally LDA #$FB, Controller 2?
// Change "x" in Lives remaining screen to uppercase "X"
org $A991	// 0x029A1
	db "X"		// Originally $FC or "x"


bank 7; 
// Change Magic bag tile for new Arrow
org $CB12	// 0x1CB22
	lda.b #$9C	// Originally LDA #$FA
// Change Magic bag tile for new Arrow in Continue/Save screen
org $FDD6	// 0x1FDE6
	db $9C	// Originally $FA
// Move old comma ($9C) for new one ($32) in Continue/Save screen
org $FE38	// 0x1FE48
	db $32	// Originally $9C

