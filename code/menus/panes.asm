//***********************************************************
//	Pause and Level Panes
//***********************************************************

//****************************************
// 	Table file
//****************************************
table code/text/text.tbl

//----------------------------------------

bank 0;
// Items base X position
org $9B24	// 0x01B34
	lda.b #$78	// Originally LDA #$98

// Items base X position
org $9B2C	// 0x01BC4
	lda.b #$88	// Originally LDA #$A8

// Pointers for Pause pane assets
org $9B5A	// 0x01B6A
	dw $7800	// Number of Lives
	dw $78FC	// ???
	dw $78FC
	dw $78FC
	dw $78FC
	dw $78FC
	dw $78FC
	dw $78FC

// Level pane tile mapping pointers
org $9B80	// 0x01B90
	dw $7800	// Border with corners
	dw l_9BB8	// Border with corners and middle joint
	dw l_9C0C	// Up / Cancel
	dw l_9BD4	// NEXT, Now empty line
	dw $78C4
	dw $789A
	dw l_9BF0	// MAGIC
	dw $790A	// Originally $78FC
	dw l_9BD4	// Originally $9BAA -> Border with corners
	dw $78E0	// Originally $78E0
	dw $78B6	// Originally $78B6
	dw $790A	// Originally $9BD4 -> NEXT
	dw $790A	// Originally $9BB8 -> Border with Corners and Joint
	dw l_9BE2	// Originally $9BE2 -> ATTACK
	dw $790A	// Originally $78EE
	dw l_9BD4	// Originally $9BAA -> Border with corners
	dw $78D2
	dw $78A8
	dw l_9BFE	// Originally $9BFE -> LIFE
	dw $790A
	dw l_9BAA	// Originally $9BAA -> Border with corners

// Tile mappings for Level-Up pane
org $9BAA
l_9BAA:		// 0x01BAA, Border with corners and middle line
	db $CA
	fill $0C,$CB
	db $CA
l_9BB8:		// 0x01BC8, LEVEL UP
	db $CA,$CB,$CB
	db "LEVEL UP"
	db $CB,$CB,$CA
l_9BC6:		// 0x01BD6, Blank space with ...
	db $CC,"        "
	db $CC,"...",$CC
l_9BD4:		// 0x01BE4, Border with corners and middle line
	db $CA
	fill $0C,$CB
	db $CA
l_9BE2:		// 0x01BF2, ATK.
	db $CC,"      "
	db "ATK."
	db "  ",$CC	
l_9BF0:		// 0x01C00, MGK.
	db $CC,"      "
	db "MGK."
	db "  ",$CC
l_9BFE:		// 0x01C0E, DEF.
	db $CC,"      "
	db "DEF."
	db "  ",$CC
l_9C0C:		// 0x01C1C
	db $CC
	fill $06,$F4	// Fill with " "
	db "CANCEL"
	db $CC


// Pause tile mapping pointers
org $A349	// 0x2C59
	lda.w l_9C1A,y

// Tile mappings for Pause pane
org $9C1A
l_9C1A:		// 0x01C2A, Border with corners and middle line
	db $CA
	fill $08,$CB
	db $CA,$CB,$CB,$CB,$CA
l_9C28:		// 0x01C38, SHIELD
	db $CC," "
	db "SHIELD"
	db " ",$CC,"...",$CC
l_9C36:		// 0x01C46, JUMP
	db $CC," "
	db "JUMP"
	db "   ",$CC,"...",$CC
l_9C44:		// 0x01C54, LIFE/HEAL
	db $CC," "
	db "HEAL"
	db "   ",$CC,"...",$CC
l_9C52:		// 0x01C62, FAIRY
	db $CC," "
	db "FAIRY"
	db "  ",$CC,"...",$CC
l_9C60:		// 0x01C70, FIRE
	db $CC," "
	db "FIRE"
	db "   ",$CC,"...",$CC
l_9C6E:		// 0x01C7E, REFLECT
	db $CC," "
	db "REFLECT"
	db $CC,"...",$CC
l_9C7C:		// 0x01C8C, ENIGMA/SPELL
	db $CC," "
	db "ENIGMA"
	db " ",$CC,"...",$CC
l_9C8A:		// 0x01C9A, THUNDER
	db $CC," "
	db "THUNDER"
	db $CC,"...",$CC
l_9C98:		// 0x01CA8
	db $CC,"        ",$CC
	db $B9,$CD,$96,$CC	// Key, Crystal and Lives Icons
l_9CA6:		// 0x01CB6
	db $CC,"        ",$CC
	db "   ",$CC		// Empty
l_9CB4:		// 0x01CC4
	db $CC,"            ",$CC	// Empty
l_9CC2:		// 0x01CD2
	db $CC,"            ",$CC	// Empty
l_9CD0:		// 0x01CE0
	db $CC,"            ",$CC	// Empty
l_9CDE:		// 0x01CEE
	db $CC,"   "
	db "0"			// Key Counter
	db "        ",$CC
l_9CEC:		// 0x01CFC
	db $CC,"   "
	db "0"			// Crystal Counter
	db "        ",$CC
l_9CFA:		// 0x01D0A
	db $CC,"   "
	db "0"			// Lives Counter
	db "        ",$CC
l_9D08:		// 0x01D18, Border with corners and middle line
	db $CA
	fill $0C,$CB
	db $CA
l_9D16:		// 0x01D26
	db $CC,"        "	// Empty
	db $CC,"   ",$CC
l_9D24:		// 0x01D34
	db $CC,"            ",$CC	// Empty
l_9D32:		// 0x01D42
	db $CC,"   0  "
	db "BOOST"	// WILL
	db " ",$CC
l_9D40:		// 0x01D50
	db $CC,"            ",$CC	// GO UP, Empty

// Pause pane counters related to Crystals and Lives
org $A156	// 0x02166
	sta.w $7896	// Originally STA $7881
org $A15F	// 0x0216F
	sta.w $7897
	jsr l_AC60
	clc
	adc.b #$CF	// Change to dot tile?
	sta.w $7898

// Force Lives counter to print out max number of 9
org $AC60	// 0x02C70
l_AC60:
	lda.w $079E
	lda.w $0700	// Load current number of lives
	sta.w $079E
	lda.b #$09
	cmp.w $079E
	bpl decrement	// BPL $06, Branch on plus to
	lda.b #$0A
	sta.w $079E
	rts
decrement:
	inc.w $079E
	lda.w $079E
	dec.w $079E
	rts
