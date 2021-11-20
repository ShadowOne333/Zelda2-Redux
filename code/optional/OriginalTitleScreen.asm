//*****************************************************************
//	Original Title screen palette from Zelda 2
//*****************************************************************

bank 5;
// SWORD
org $AF58	// 0x16F68
// Restore a specific colour from the palette for the old Sword graphics ($26), and improve the red shading ($05)
	db $0F,$05,$26,$30	// Originally 0F 16 26 30

// PALETTE
org $AF44	// 0x16F54
	db $0F,$2B,$0F,$00
org $AF54	// 0x16F64
	db $0F,$2B,$0F,$00

bank 8;
// Title screen graphics
org $20000	// 0x20010
	incbin code/optional/OriginalTitleScreen.bin
