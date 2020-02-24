//********************************************************************
// Original Title screen from Zelda 2
//********************************************************************

bank 5;
org $AF5A	// 0x16F6A
// Some PPU stuff
	db $26

bank 7;
// Tile map of sorts?
org $FFFF	// 0x2000F
	db $FF

incbin code/optional/OriginalTitleScreen.bin
