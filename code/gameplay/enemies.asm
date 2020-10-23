//***********************************************************
//	Enemy attributes changes
//***********************************************************

bank 1;
// Enemy data in West Hyrule and Death Mountain
// Unknown value changed
org $8921	// 0x04931
	db $22

// Enemy Attribute changes
org $94EB	// 0x054FB
	db $C6	// Blue Moblin, Originally $C5
	db $48	// Orange Daira, Originally $48
	db $89	// Red Daira, Originally $C5
	db $45	// Orange Goriya, Originally $C5
	db $86	// Red Goriya, Originally $85
	db $C7	// Blue Goriya, Originally $C6
org $94F7	// 0x09507
// Allow Dumb Moblin to give out minimum Exp
	db $51	// Dumb Moblin, Originally $50

bank 2;
// Enemy data in East Hyrule
// Unknown values changed
org $89CF	// 0x089DF
	db $7D,$98
org $8A1F	// 0x08A2F
	db $40

org $94DB	// 0x094EB
	db $C7	// Disallow Moa from stealing experience, originally $D7
org $94E5	// 0x094F5
	db $83	// Disallow Bago Bago from stealing experience, originally $93

// Fix a bug in the original game in which the Red and Orange variants of the Lizalfos had the Exp values changed between the two
org $94EF	// 0x094FF
	db $8A	// Fix Red Lizalfos experience points, originally $89
	db $49	// Fix Orange Lizalfos experience points, originally $4A


bank 3;
// Enemy data pointers, repoint enemy
org $85CB	// 0x0C5DB
	dw $7390	// Points to $CC30, originally $70F9/$C990, label "enemy_data"

// UNUSED SPACE
// Makes Towns Bots and Aches give out Exp (?)
org $88D9	// 0x0C8E9
	db $7B,$8C

org $8A7C	// 0x0CA8C
	db $F4,$67,$FF,$15,$6D	// Area data for Towns (?)

// UNUSED SPACE
org $8C30	// 0x0CC40
enemy_data:
	db $13,$78,$06,$76,$21,$5A,$06,$68
	db $46,$5A,$46,$68,$86,$5A,$86,$68
	db $C6,$78,$C6

org $94D9	// 0x0D4E9
// Change enemy attribute
	db $C1	// Add tile mapping to an enemy (?)


bank 4;
org $8B64	// 0x10B74
	db $79		// Enemy data from enemy in one of the Palaces(?)

// Enemy HP changes for Palaces
org $9427	// 0x11437
	db $14	// ($FA) HP for Bubble (Magic Stealing)	
org $942E	// 0x1143E
	db $0A	// ($FA) HP for Bubble (Slow?)
	db $14	// ($FA) HP for Bubble (Fast?)

// Enemy attributes for Palaces A (Experience)
org $94DB	// 0x114EB
// Reduce experience points for Bubbles, add minimum experience for fodder enemies instead of being 0, and also disallow Experience stealing from all enemies in Palaces
	db $85,$47,$C0,$C0
	db $C6,$00,$51,$80
	db $86,$00,$83
org $94F1	// 0x11501
	db $83,$4B,$87,$86
	db $87,$CA,$C1

// Make Bubble enemies non-respawnable to avoid Exp abuse given their reduced HP
org $9547	// 0x11557
	db $06	// Originally $46 (Slow Bubble)
org $954F	// 0x1155F
	db $06	// Originally $46 (Fast Bubble)

// Bubble Enemy HP for Palaces Type B
org $A927	// 0x12937
	db $14	// ($FA) Slow Bubble HP
org $A92F	// 0x1293F
	db $14	// ($FA) Fast Bubble HP

// Enemy attribute changes for Palace Type B
org $A9DB	// 0x129EB
// Reduce experience points for Bubbles, add minimum experience for fodder enemies instead of being 0, and also disallow Experience stealing from all enemies in Palaces
	db $85,$57,$C0,$C0
	db $CC,$00,$51,$80
	db $86,$C6
org $A9F1	// 0x12A01
	db $83	// Originally $93


bank 5;
// Repoint certain enemies for Great Palace
org $85AD	// 0x145BD
	dw $705F	// Originally $7000
	dw $700E	// Originally $7000
// Repoint certain enemy data for Great Palace 
org $89BE	// 0x149CE
	db $17,$DE

// Enemy HP points for Great Palace
org $9435	// 0x15445
// Bubbles, King Bubble HP, and Fokkas HPs
	db $70,$70,$50,$E0,$00,$28,$50

// Enemy attributes for Great Palace
org $94DB	// 0x155EB
// Reduce experience points for Bubbles, Fokkas and King Bubble; add minimum experience for fodder enemies instead of being 0, and also disallow Experience stealing from all enemies in Palaces.
	db $C3,$C2,$C0,$D0
	db $81,$00,$00,$82
	db $C3,$05,$86,$86
	db $87,$40,$C7,$C8
	db $47,$C0,$48,$8B
	db $CC


bank 7;
// Disallow Moa from stealing Exp
org $E2FD	// 0x1E30D
	lda.b #$00	// Originally LDA #$0A
	cpy.b #$06	// Check if Enemy = $06 (Moa)
	bne $02		// BNE $02
	lda.b #$00	// Originally LDA #$14
