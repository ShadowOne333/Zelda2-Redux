//****************************************************************
//	Secret... ???
//****************************************************************

bank 1;
org $8BEC	// 0x04BFC
// Enemy data West Hyrule & Death Mountain
	db $66,$04

org $A133	// 0x06143
// Death Mountain key areas Y location
	db $37
// Death Mountain key areas X location
org $A172	// 0x06182
	db $10

org $A577	// 0x06587
// Area data for Death Mountain
	db $B0,$20,$A2,$0F,$0B
