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
define end   $FF  // end

//****************************************
// Credits text pointers
//****************************************
bank 5; org $925D  // 0x1526D
// Pointer table for End Credits
	dw credits_00, credits_01, credits_02, credits_03
	dw credits_04, credits_05, credits_06, credits_07
	dw credits_08, credits_09, credits_10, credits_11
	dw credits_10, credits_12, credits_10, credits_13
	dw credits_14, credits_15

//****************************************
//	Credits text
//****************************************

// Starting address for Text
bank 5; org $927D	// 0x1528D

//----------------------------------------
credits_00:
	db $22,$47,$12	// PPU transfer to $2247
	db "EXECUTIVE PRODUCER",{end}
credits_01:
	db $22,$88,$10	// PPU transfer to $2288
	db "HIROSHI YAMAUCHI",	{end}
//----------------------------------------
credits_02:
	db $22,$4C,$08	// PPU transfer to $224C
	db "PRODUCER",		{end}
credits_03:
	db $22,$88,$10	// PPU transfer to $2288
	db "SHIGERU MIYAMOTO",	{end}
//----------------------------------------
credits_04:
	db $22,$4C,$08	// PPU transfer to $224C
	db "DIRECTOR",		{end}
credits_05:
	db $22,$88,$10	// PPU transfer to $2288
	db "TADASHI SUGIYAMA"
	db $22,$C9,$0D	// PPU transfer to $22C9
	db "YOICHI YAMADA",	{end}
//----------------------------------------
credits_06:
	db $22,$4C,$08	// PPU transfer to $224C
	db "DESIGNER",		{end}
credits_07:
	db $22,$88,$10	// PPU transfer to $2288
	db "KAZUNOBU SHIMIZU"
	db $22,$C9,$10	// PPU transfer to $22C9
	db "                ",	{end}
//----------------------------------------
credits_08:
	db $22,$49,$0E	// PPU transfer to $2249
	db "SOUND COMPOSER",	{end}
credits_09:
	db $22,$88,$0F	// PPU transfer to $2288
	db "AKITO NAKATSUKA",	{end}
//----------------------------------------
credits_10:	// Repoint 1, 0xEFE6
	db $22,$49,$0A	// PPU transfer to $2249
	db "PROGRAMMER",	{end}
credits_11:
	db $22,$89,$0E	// PPU transfer to $2289
	db "KAZUAKI MORITA"
	db $22,$C8,$10	// PPU transfer to $22C8
	db "TATSUO NISHIYAMA",	{end}
credits_12:
	db $22,$87,$13	// PPU transfer to $2287
	db "SHIGEHIRO KASAMATSU"
	db $22,$C8,$10	// PPU transfer to $22C8
	db "YASUNARI NISHIDA",	{end}
credits_13:
	db $22,$86,$10	// PPU transfer to $2286
	db "TOSHIHIKO NAKAGO"
	db $22,$C8,$10	// PPU transfer to $22C8
	db "             ",	{end}
//----------------------------------------
credits_14:	//org $A550, 0x016560
	db $22,$47,$11	// PPU transfer to $2247
	db "THANKS A MILLION.",	{end}
//----------------------------------------
credits_15:
	db $22,$8B,$0A	// PPU transfer to $2287
	db "PUSH START"
	db $22,$CB,$09	// PPU transfer to $22cB
	db "TO REPLAY",	{end}
//----------------------------------------
// Fill to 0x15410 with $FF
	fillto $9400,$FF
//----------------------------------------

