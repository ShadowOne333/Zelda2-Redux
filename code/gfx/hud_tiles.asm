//***********************************************************
//	HUD Tile Mapping
//***********************************************************

bank 0;
org $962E	// 0x0163E
// Magic level number PPU transfer
	db $20,$46,$01
	db "1"
// Magic spacing PPU transfer
	db $20,$49,$0B
	db "1 m        "
	db $FF
// Life level number PPU transfer
	db $20,$43,$01
	db "1"
// Life spacing PPU transfer
	db $20,$6C,$10
	db "            //  "
	db $FF

// Unknown
org $968B	// 0x0169B
	db $08,$08	// Originally 20 68

// STUFF RELATED TO HUD... ?

org $96BD	// 0x016CD
	lda.w $AB80,x	// Originally LDA $962E,X

org $96C5	// 0x016D5
	cpx.b #$14	// Originally CPX #$13

// Change level digit used for Attack for Life
org $96CE	// 0x016DE
	lda.w $0779	// Originally LDA $0777

org $96EC	// 0x016FC
	sta.w $030D,y	// Originally STA $030C,Y
org $9707	// 0x01717
	sta.w $030D,y	// Originally STA $030C,Y

org $972E	// 0x0173E
	lda.w $AB50,x	// Originally LDA $9641,X

org $9736	// 0x01746
	cpx.b #$1A	// Originally CPX #$18

// Change level digit used for Life for Attack
org $973F	// 0x0174F
	lda.w $0777	// Originally LDA $0779

org $9758	// 0x01768
	sta.w $0315,y	// Originally STA $0313,Y
	lda.b $00
	sta.w $0314,y	// Originally STA $0312,Y
	lda.b $01
	sta.w $0313,y	// Originally STA $0311,Y
	pla
	sta.w $0316,y	// Originally STA $0314,Y

org $9778	// 0x01768
	sta.w $031A,y	// Originally STA $0318,Y
	lda.b $00
	sta.w $0319,y	// Originally STA $0317,Y
	lda.b $01
	sta.w $0318,y	// Originally STA $0316,Y

// Repointed Experience points PPU transfers
org $AB50	// 0x02B60
	db $20,$58,$01
	db "1"
	db $20,$42,$12
	db "          0000/000"
org $AB70	// 0x02B80
l_AB70:
	db $0F,$0F
org $AB80	// 0x02B90
	db $20,$5B,$01
	db "1"
	db $20,$5E,$0C
	db "1  m        "
	db $FF
