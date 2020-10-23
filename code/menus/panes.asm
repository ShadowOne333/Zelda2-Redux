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
	dw $7800	// Border with corners
	dw $78FC	// Empty line
	dw $78FC
	dw $78FC
	dw $78FC
	dw $78FC
	dw $78FC
	dw $78FC

// Level pane tile mapping pointers
org $9B80	// 0x01B90
	dw $7800	// Border with corners
	dw $9BB8	// Border with corners and middle joint
	dw $9C0C	// Up / Cancel
	dw $9BD4
	dw $78C4
	dw $789A
	dw $9BF0
	dw $790A	// Originally $78FC
	dw $9BD4	// Originally $9BAA
	dw $78E0	// Originally $78E0
	dw $78B6	// Originally $78B6
	dw $790A	// Originally $9BD4
	dw $790A	// Originally $9BB8
	dw $9BE2	// Originally $9BE2
	dw $790A	// Originally $78EE
	dw $9BD4	// Originally $9BAA

// Tile mappings for Level-Up pane
org $9BBB	// 0x01BCB
	db "LEVEL UP"
org $9BCF	// 0x01BDF
	db $CC,"...",$CC,$CA
	fillto $9BE1,$CB
	db $CA
org $9BEB	// 0x01BFB
	db "K.  "
org $9BFA	// 0x01C0A
	db ". "
org $9C05	// 0x01C15
	db "DEF"
	db ".  "
	db $CC,$CC
	fillto $9C12,$F4	// Fill with " "

// Tile mappings for Pause pane
org $9C1A	// 0x01C2A
	db $CA
	fillto $9C23,$CB
	db $CA,$CB,$CB,$CB,$CA
org $9C30	// 0x01C40
	db " ",$CC
org $9C3C	// 0x01C4C
	db "   ",$CC,"xxx",$CC
	db $CC," HEAL   ",$CC	// LIFE
org $9C59	// 0x01C69
	db "  ",$CC
org $9C66	// 0x01C76
	db "   ",$CC
org $9C77	// 0x01C87
	db $CC
org $9C7E	// 0x01C8E
	db "ENIGMA ",$CC	// SPELL  
org $9C93	// 0x01CA3
	db $CC,"...",$CC
	db $CC,"        ",$CC
	db $B9,$CD,$96,$CC
	db $CC,"        ",$CC
org $9D08	// 0x01D18
	db $CA
	fillto $9D15,$CB
	db $CA
org $9D1F	// 0x01D2F
	db $CC
org $9D39	// 0x01D49
	db "BOOST"	// WILL 
org $9D47	// 0x01D57
	db "     "	// GO UP

// Pause pane counters related to Crystals and Lives
org $A156	// 0x02166
	sta.w $7896	// Originally STA $7881
org $A15F	// 0x0216F
	sta.w $7897
	jsr $AC60
	clc
	adc.b #$CF
	sta.w $7898
