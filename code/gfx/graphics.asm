//****************************************
//	Import modified graphics
//****************************************

bank 8;
// Import new Redux graphics
org $20000	// 0x20010
	incbin code/gfx/ReduxGFX.bin
