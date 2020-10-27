//***********************************************************
//	Title Screen changes
//***********************************************************

bank 5;
org $A7C5	// 0x167D5
	db $2F,$03,$22,$28	// Intro sprites changes
org $A7E5	// 0x167F5
	db $2F,$05,$22,$30	// Intro sprites changes
// Shooting Star sprite priority change to not appear above the letter "N" of "LINK" ($78) 
org $A8B9	// 0x168C9
	db $90

// Flip palette mapping for the intro text, so the copyright text in the new row uses the proper colour
org $AB19	// 0x16B29
	db $03,$0B

// Change palette for the sword and rocks, respectively
org $AF40	// 0x16F50
	db $0F,$30,$1C,$06	// Originally 0F 30 1C 15
	db $0F,$16,$0F,$08	// Originally 0F 2B 0F 00
org $AF54	// 0x16F64
	db $0F,$16,$0F,$08	// Originally 0F 2B 0F 00
	db $0F,$16,$10,$30	// Originally 0F 16 26 30

// Tile fixes for Title screen new graphics
org $AF92	// 0x16FA2
	db $19	// Originally $32
org $AFD1	// 0x16FE1
	db $BB,$80,$85,$87	// Originally 58 5A 5F 61 
org $AFE6	// 0x16FF6
	db $7F,$81,$BC,$88	// Originally 59 5B 60 62
org $AFFA	// 0x1700A
	db $7C,$FD,$82,$89,$8B	// Originally 56 FD 5C 63 65
org $B01B	// 0x1702B
	db $8D,$47,$50,$47,$7D,$83,$BD,$8A,$8C	// Originally 67 47 50 47 57 5D 5E 64 66

// Title screen flickering tile fix (courtesy of IcePenguin)
org $B04D	// 0x1705D
	fill $0C,$00
	fill $08,$01
	fill $06,$00

// Left rocks tile fixes (?)
org $B070	// 0x17080
	db $8E,$8E,$90,$90,$8E,$8E,$8E,$8E
	db $8E,$8E,$8E,$90,$90,$90,$90,$90
	db $90,$90,$90,$8E,$8E,$8E,$8E,$8E
	db $8E,$90
org $B093	// 0x170A3
	db $99,$99,$76,$7B,$90,$8E,$8E,$8E
	db $8E,$8E,$90,$90,$96,$95,$93,$93
	db $93,$93,$93,$93,$93,$94,$96,$95
	db $93,$93
org $B0B6	// 0x170C6
	db $99,$7A,$75,$76,$8E,$8E,$8E,$8E
	db $90,$90,$90,$90,$93,$91,$91,$91
	db $91,$91,$91,$91,$91,$91,$93,$91
	db $92,$92
org $B0D9	// 0x170E9
	db $99,$7A,$77,$78,$8E,$90,$90,$90
	db $90,$90,$96,$93,$93,$91,$97,$99
	db $99,$99,$75,$99,$75,$99,$99,$99
	db $76,$97,$98,$98,$99,$99,$99,$75

	db $2A,$A0,$20
	db $99,$77,$76,$77,$90,$90,$90,$90
	db $90,$90,$95,$93,$92,$91,$97,$74
	db $77,$74,$99,$97,$75,$74,$75,$76
	db $98,$75,$97,$75,$75,$98,$98,$75

	db $2A,$C0,$20
	db $97,$78,$7A,$78,$96,$96,$95,$93
	db $93,$93,$91,$91,$91,$91
org $B139	// 0x17149
	db $98,$99,$F4,$79,$99,$75

	db $2A,$E0,$20
	db $99,$77,$7A,$77,$93,$93,$92,$91
	db $91,$91,$91,$91,$91,$91,$79,$76
	db $99
org $B165	// 0x17175
	db $99,$78,$77,$78,$92,$91,$91,$92
	db $91,$91,$91,$91,$91,$91,$91,$92
	db $74,$77,$98
org $B181	// 0x17191
	db $98,$75,$78,$99

	db $2B,$20,$20
	db $97,$78,$7A,$77,$92,$92,$92,$92
	db $92,$92,$91,$91,$91,$91,$91,$91
	db $79,$79,$99
org $B1A6	// 0x171B6
	db $98,$75

	db $2B,$40,$20
	db $99,$77,$7A,$79,$7A,$77,$92,$92
	db $92,$92,$92,$92,$92,$91,$91,$91
	db $91,$92,$79,$78,$98
org $B1C9	// 0x171D9
	db $98,$75

	db $2B,$60,$20
	db $97,$78,$7A,$74,$99,$76,$92,$92
	db $92,$92,$92,$92,$92,$92,$92,$91
	db $91,$92
org $B1EB	// 0x171FB
	db $99,$99
