//****************************************************************
// 	Zelda 2 Redux - Text data
//****************************************************************

//****************************************
// 	Table file
//****************************************
table code/text/text.tbl

//****************************************
// 	Control codes
//****************************************
define delay   $FD  // End for Credits text

//****************************************
//	Story text pointers
//****************************************

// The story text pointers are stored in a very odd way ($17 entries)
// For the first entry in the text, "AFTER GANON WAS DESTROYED", located at $A932 (0x16942), the pointer is $A932.
// The 2 byte pointers are separated into two different addresses. The lower bytes for each pointer begin at $AAE5 (0x16AF5) with $32, and the second/high byte of the pointers begin at $AAF4 (or 0x16B04) with $A9. The two bytes combined form the pointer for the "AFTER GANON WAS DESTROYED," text.

bank 5;
// Pointers to the low and high byte text pointers 
org $AC75	// LDA for the pointer lower bytes, 0x16C85
	lda.w low_bytes,x	// LDA $AAE5,X
org $AC7A	// LDA for the pointer higher bytes, 0x16C8A
	lda.w high_bytes,x	// LDA $AAF4,X

// Intro story text pointers
org $AAE5	// 0x16AF5
// Low byte section of the pointers
low_bytes:
	db intro_00,intro_01,intro_02,intro_03
	db intro_04,intro_05,intro_06,intro_07
	db intro_08,intro_09,intro_10,intro_11
	db intro_12,intro_13,intro_14
// High bytes section of the pointers
high_bytes:	// $AAF4, 0x16B04
	db intro_00>>8,intro_01>>8,intro_02>>8,intro_03>>8
	db intro_04>>8,intro_05>>8,intro_06>>8,intro_07>>8
	db intro_08>>8,intro_09>>8,intro_10>>8,intro_11>>8
	db intro_12>>8,intro_13>>8,intro_14>>8

//****************************************
//	Credits text
//****************************************

// Starting address for Text
bank 5; org $A932	// 0x16942

//----------------------------------------
intro_00:
	db "AFTER GANON WAS DESTROYED",$9C,"  ",	{delay}
intro_01:
	db "IMPA INFORMED LINK ABOUT A  ",		{delay}
intro_02:
	db "SLEEPING SPELL CAST ON AN   ",		{delay}
intro_03:
	db "ANCESTOR OF PRINCESS ZELDA. ",		{delay}
intro_04:
	db "SHE WILL WAKE ONLY WITH     ",		{delay}
intro_05:
	db "THE POWER OF THE THIRD      ",		{delay}
intro_06:
	db "TRIFORCE OF COURAGE SEALED  ",		{delay}
intro_07:
	db "IN A TEMPLE IN HYRULE.      ",		{delay}
intro_08:
	db "                            ",		{delay}
intro_09:
	db "TO BREAK THE SEAL",$9C," CRYSTALS ",	{delay}
intro_10:
	db "MUST BE PLACED IN STATUES   ",		{delay}
intro_11:
	db "IN 6 WELL GUARDED TEMPLES.  ",		{delay}
intro_12:
	db "LINK SET OUT ON HIS MOST    ",		{delay}
intro_13:
	db "ADVENTURESOME QUEST YET...  ",		{delay}
intro_14:
	db "       ",$0E,"1987 NINTENDO       ",	{delay}
//----------------------------------------
// Fill to 0x16AF5 with $FF
	fillto $AAE4,$FF
//----------------------------------------
