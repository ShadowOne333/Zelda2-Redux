//********************************************************************
//	Original Title Screen Sword graphics
//********************************************************************

bank 5;
org $AF58	// 0x16F68
// Restore a specific colour from the palette for the old Sword graphics ($26), and improve the red shading ($05)
	db $0F,$05,$26,$30	// Originally 0F 16 26 30

bank 8;
// Title screen graphics
org $20000	// 0x20010
	incbin code/optional/OriginalTitleScreen.bin
