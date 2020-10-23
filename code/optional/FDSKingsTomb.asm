//********************************************************************
//	Famicom Disk System King's Tomb layout
//********************************************************************

bank 3;
// Modify Tilemappings table for Area Object
org $849E	// 0x0C4AE
	db $AF,$B0,$B1,$B2

// Change pointer to area towns for King's tomb
org $859B	// 0x0C5AB
	dw $8BD0	// D0 8B

// Change pointer for enemys in town for King's Tomb
org $8619	// 0x0C629
	dw $7355	// 55 75

// Tilemap for the new King's Tomb
org $8BD0	// 0x0CBE0
	db $24,$60,$A0,$29,$F5,$09,$A0,$F1
	db $D4,$81,$DA,$82,$53,$E3,$52,$E3
	db $52,$E3,$83,$F6,$73,$0A,$56,$E3
	db $52,$E3,$52,$E3,$D4,$81,$DA,$80
	db $A2,$F1,$F1,$08,$FF,$0D,$54,$8D
	db $37,$06,$7E,$04,$7B,$04,$73,$C4
	db $76,$C4
