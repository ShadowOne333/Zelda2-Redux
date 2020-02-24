//****************************************
// Import modified graphics
//****************************************

bank 7;
org $FFFF	// $0x2000F
	db $FF

incbin code/Z2ReduxGFX.bin
