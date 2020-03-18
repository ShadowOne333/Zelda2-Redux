//********************************************************************
// Original Spell Magic Consumption behaviour from Zelda 2
//********************************************************************

bank 0;
org $AB10	// 0x02B20
// Restore free space
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF

bank 7;
org $CAD0	// 0x1CAE0
	jsr $CF30	// Region Code * 5 + World Code
	cmp.b #$0F	// Check if in Great Palace
	beq greatpalace
	lda.b #$00	// A = 00
	ldy.b #$01	// Y = 01
	jmp $CAF0
greatpalace:
	jsr $C358	// Reset Number of Lives (to 3)
	lda.b #$00	// A = 00
	sta.w $0561	// Area Code
	
