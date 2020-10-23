//********************************************************************
//	Original Restart Location at Zelda's Palace on Game Over
//********************************************************************

bank 0;
org $AB10	// 0x02B20
// Restore free space
	fill $30,$FF

bank 7;
org $CAD0	// 0x1CAE0
	jsr $CF30	// Region Code * 5 + World Code
	cmp.b #$0F	// Check if in Great Palace
	beq greatpalace
	lda.b #$00	// A = 00
	ldy.b #$01	// Y = 01
	jmp $CAF0
greatpalace:	// $CADE, 0x1CAEE
	jsr $C358	// Reset Number of Lives (to 3)
	lda.b #$00	// A = 00
	sta.w $0561	// Area Code
	
