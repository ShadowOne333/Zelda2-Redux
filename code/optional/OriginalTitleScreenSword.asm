//********************************************************************
//	Original Title Screen Sword graphics
//********************************************************************

bank 5;
org $AF5A	// 0x16F6A
// Restore a specific colour from the palette for the old Sword graphics
	db $26

bank 8;
// Title screen graphics
org $20000	// 0x20010
	incbin code/optional/OriginalTitleScreen.bin
