//***************************************************************
//		Original Zelda 2 NES Graphics
//*************************************************************** 

bank 0;
// Palette for Falling animation (Link's)
org $A849	// 0x02859
	db $0F,$18,$36,$2A
org $A9FA	// 0x02A0A
	db $18,$01,$12,$21,$30,$21,$37


bank 1;
// Change palettes at West Hyrule so it doesn't blend with Link's new palette
org $8012	// 0x04022
// North Castle
	db $0F,$36,$16,$07
// Forest
org $8052	// 0x04062
	db $0F,$17,$07,$08
// Palette for Link in West Hyrule (Grass, Desert, Swamp, Graveyard, Lava)
org $809E	// 0x040AE
	db $FF,$18,$36,$2A
// Palette for Link in Forest
org $80AE	// 0x040BE
	db $FF,$18,$36,$2A
// Palette for Link at other locations
org $80BE	// 0x040CE
	db $FF,$18,$36,$2A
// Palette for Link at other locations
org $80CE	// 0x040DE
	db $FF,$18,$36,$2A


bank 2;
// Change palettes at East Hyrule so it doesn't blend with Link's new palette
// Forest
org $8052	// 0x08062
	db $0F,$17,$07,$08
// Palette for Link in West Hyrule (Grass, Desert, Swamp, Graveyard, Lava)
org $809E	// 0x080AE
	db $FF,$18,$36,$2A
// Palette for Link in Forest
org $80AE	// 0x080BE
	db $FF,$18,$36,$2A
// Palette for Link at other locations
org $80BE	// 0x080CE
	db $FF,$18,$36,$2A
// Palette for Link at other locations
org $80CE	// 0x080DE
	db $FF,$18,$36,$2A


bank 3;
// Change palettes for Towns
org $809E	// 0x0C0AE
	db $FF,$18,$36,$2A
	db $FF,$16,$27,$30
	db $FF,$0F,$16,$36
	db $FF,$0F,$13,$36	
org $80AE	// 0x0C0BE
	db $FF,$18,$36,$2A
org $80BE	// 0x0C0CE
	db $FF,$18,$36,$2A
org $80CE	// 0x0C0DE
	db $FF,$18,$36,$2A
org $80DE	// 0x0C0DE
	db $FF,$18,$36,$2A


bank 4;
// Change palettes for Palaces Type A/B
org $809E	// 0x080AE
	db $FF,$18,$36,$2A
org $80AE	// 0x080BE
	db $FF,$18,$36,$2A
org $80BE	// 0x080CE
	db $FF,$18,$36,$2A
org $80CE	// 0x080DE
	db $FF,$18,$36,$2A


bank 5;
// Great Palace palettes for new Link colours
org $8036	// 0x14046
	db $0F,$36,$16,$07
org $809E	// 0x140AE
	db $FF,$18,$36,$2A
org $80AE	// 0x140BE
	db $FF,$18,$36,$2A
org $80B6
	db $FF,$07,$16,$36
	db $FF,$00,$26,$30
	db $FF,$18,$36,$2A
org $80CE	// 0x140DE
	db $FF,$18,$36,$2A
// Change palette for the sword and rocks, respectively
org $AF40	// 0x16F50
	db $0F,$30,$1C,$15	// Originally 0F 30 1C 15
	db $0F,$2B,$0F,$00	// Originally 0F 2B 0F 00
org $AF54	// 0x16F64
	db $0F,$2B,$0F,$00	// Originally 0F 2B 0F 00
	db $0F,$16,$26,$30	// Originally 0F 16 26 30
// File Selection Palettes for Link
org $BC08	// 0x17C18
	db $0F,$18,$36,$2A


bank 7;
// Modify Palette PPU transfer for new Link palette
org $C453	// 0x1C463
	db $0F,$18,$36,$2A
// Modify Overworld palettes for Link, PAUSE and Roaming Enemies
org $C46B	// 0x1C47B
	db $0F,$18,$36,$2A
	db $0F,$30,$12,$0F	// Originally 0F 0F 0F 0F
	db $0F,$30,$06,$12	// Originally 0F 30 16 0F


bank 8;
// Import the new graphics
org $20000	// 0x020000
	incbin code/optional/OriginalGFX.bin



