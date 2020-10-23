//***********************************************************
// Palace changes (Unused windows changes for Palaces...?)
//***********************************************************

bank 4;
// Modify area pointer for Palace Type B
org $A012	// 0x12022
	dw $A541	// Originally $A163
org $A042	// 0x12052
	dw $A541	// Originally $A163
org $A050	// 0x12060
	dw $A78D,$A1A1,$A393,$A76B	// Originally $A6DA, $A1A1,$A393,$A640
org $A06A	// 0x1207A
	dw $A565	// Originally $A326
org $A078	// 0x12088
	dw $A541	// Originally $7230 -> 10AD0

// UNUSED SPACE
// New area data for certain rooms in Palaces
org $A529	// 0x12539
	db $18,$60,$80,$13
	db $45,$00,$44,$00,$89,$05,$4A,$00
	db $44,$00,$07,$F1,$B0,$71,$F0,$50
	db $48,$00,$44,$00
l_A541:
	db $24,$60,$00,$10
	db $45,$00,$44,$00,$D4,$0E,$DC,$00
	db $43,$00,$44,$00,$63,$02,$D1,$0E
	db $03,$F1,$B0,$71,$F0,$50,$84,$05
	db $D1,$00,$60,$01,$43,$00,$44,$00
l_A565:
	db $1E,$60,$0E,$10
	db $E1,$00,$D0,$08,$60,$01,$43,$00
	db $49,$00,$63,$02,$D1,$0E,$D6,$08
	db $60,$01,$43,$00,$49,$00,$63,$02
	db $D1,$0E

org $A75A	// 0x1276A
	db $11,$60,$80,$12
	db $BF,$70,$44,$00,$49,$00,$B4,$70
	db $8D,$05,$99,$0F,$05
l_A76B:
	db $22,$60,$00,$10
	db $48,$00,$67,$09,$80,$C2,$44,$00
	db $67,$09,$80,$C2,$44,$00,$67,$09
	db $80,$C2,$B3,$A3,$41,$00,$67,$09
	db $80,$C2,$44,$00,$15,$B9 
l_A78D:
	db $2A,$60,$0E,$10
	db $D2,$08,$46,$00,$D4,$0E,$D6,$80
	db $B2,$F7,$41,$00,$B1,$71,$43,$00
	db $45,$09,$60,$71,$D2,$0E,$87,$05
	db $D3,$0C,$D2,$02,$10,$2F,$20,$71
	db $D2,$04,$D2,$06,$1C,$23


//***********************************************************
//	Great Palace changes
//***********************************************************

bank 5;
// Great Palace area data modifications
org $8A86	// 0x14A96
	db $A0,$3E

// PPU Macro for some Great Palace data (?)
// Possibly fix spawn position of some enemies in Great Palace
org $9058	// 0x15068
	db $21,$CD,$05		// Originally 21 CB 05
org $916E	// 0x1517E
	db $21,$CD,$45,$F4,$FF	// Originally 21 CB 45

