//***********************************************************
//	FDS Battle Theme in East Hyrule (by IcePenguin) 
//***********************************************************

bank 0;
// Jump to change overworld music
org $8891	// 0x008A1
	jsr l_A8F0	// Originally LDA #$02, STA #$EB
	nop

// Overworld music change routine by IcePenguin
org $A8F0	// 0x02900
l_A8F0:
	lda.w $0707	// Load current world
	sta.w $0702	// Store at $0702
	lda.b #$02	// Load music entry $02
	sta.b $EB	// Store in music address at RAM
	rts

	fill $05,$FF
l_A900:
	ldx.w $0707	// Load current world
	cpx.b #$00	// Compare with $00 (Caves or Encounter)
	bne world0	// BNE $07, Branch if not world $00
	ldx.w $0706	// Load current region (East/West Hyrule)
	cpx.b #$02	// Compare if its $02 (East Hyrule)
	beq east	// BEQ $04
world0:		// $A90E, 0x0291E
	sta.w $075F	// Music to play address
	rts
east:		// $A912, 0x02922
	lda.b #$08	// Load music entry $08
	sta.w $075F	// Music to play address
	rts

bank 6;
// Music data modifications
org $9489	// 0x19499
	jsr l_9DC0
	nop

org $9DC0	// 0x19DD0
l_9DC0:
	lda.b #$02
	cmp.w $0706	// Compare if current region = $02
	beq l_9DCC	// BEQ $05, Branch to $9DCC
	lda.b #$04	// Load song $04
	sta.b $EB	// Store to music address
	rts
l_9DCC:
	lda.b #$08	// Load song $08
	sta.b $EB	// Store to music address
	lda.b #$00
	sta.w $0702	// Store to $0702
	rts

org $A000	// 0x1A010
// Table for ?, Related to Music
	db $08,$0A,$17,$1E,$1C,$2E,$2E,$2E
	db $2F,$00,$35,$35,$3B,$41,$3B,$47
	db $4D,$4D,$53,$59,$53,$5F,$00,$65
	db $6B,$71,$77,$00,$7D,$00,$88,$88
	db $8E,$8E,$88,$88,$8E,$8E,$94,$94
	db $9A,$9A,$94,$94,$9A,$9A,$00
// Intro - Part 1 (08 - 1F)
	db $18		// Offset for Not-Lengths
	dw $B073	// Pointer to Square 1
	db $4B		// Offset for Square 2
	db $27		// Offset for Triangle
	db $68		// OFfset for Noise
// Intro - Part 2 (0A - 25)
	db $18
	dw $B0EB
	db $3C
	db $1D
	db $56
// Header for ? (0C -> 2B)
	db $18
	dw $B148
	db $16
	db $0A
	db $24
// Header for ? (31)
	db $18
	dw $B173
	db $1D
	db $0D
	db $28
// Header for ? (37)
	db $18
	dw $B1A2
	db $25
	db $13
	db $31
// Header for ? (3D)
	db $18
	dw $B1DA
	db $0F
	db $08
	db $1B
// Header for ? (43)
	db $18
	dw $B1FC
	db $19
	db $0D
	db $1D
// Header for ? (49)
	db $18
	dw $B21D
	db $1D
	db $0D
	db $21
// Header for ? (4F)
	db $18
	dw $B242
	db $0D
	db $09
	db $15
// Header for ? (55)
	db $08
	dw $B25F
	db $17
	db $0C
	db $2F
// Header for ? (5B)
	db $08
	dw $B295
	db $1A
	db $0D
	db $32
// Header for ? (64)
	db $08
	dw $B2CE
	db $31
	db $19
	db $51
// Header for ? (6A)
	db $08
	dw $B326
	db $3F
	db $20
	db $60
// Header for ? (70)
	db $18
	dw $B3B1
	db $11
	db $09
	db $00

	db $42,$A2,$0D,$09,$15,$10,$5F,$A2
	db $07,$04,$00,$10,$6C,$A2,$07,$04
	db $00,$10,$79,$A2,$0D,$07,$00,$10
	db $8B,$A2,$0D,$07,$00,$10

org $A0A1	// 0x1A0B1
	fillto $A24A,$FF

org $A25F	// 0x1A26F
	db $1B,$19,$D6,$00,$11,$0F,$CC,$DA
	db $9A,$DA,$9A,$9A,$9A,$21,$1F,$DC
	db $00,$17,$15,$D2,$E0,$A0,$E0,$A0
	db $A0,$A0,$9A,$A0,$A6,$EC,$A6,$E0
	db $00,$94,$9A,$A0,$E6,$A0,$DA,$9A
	db $DA,$E0,$9A,$E6,$98,$9E,$A4,$EA
	db $A4,$DE,$00,$92,$98,$9E,$E4,$9E
	db $D8,$98,$D8,$DE,$98,$E4,$AC,$A4
	db $9A,$AE,$A4,$9E,$33,$43,$00

org $A2A6	// 0x1A2B6
	fillto $A3B9,$FF

org $B072	// 0x1B082
	db $00
l_B073:
	db $5B,$83,$83,$9B,$9B,$9B,$9B,$9B
	db $83,$97,$DA,$83,$83,$9B,$9B,$9B
	db $9B,$9B,$83,$97,$DA,$83,$83,$9B
	db $9B,$9B,$9B,$9A,$10,$10,$90,$10
	db $10,$90,$10,$10,$90,$90,$00,$4B
	db $83,$83,$8B,$8B,$8B,$8B,$87,$83
	db $87,$C6,$C2,$87,$87,$87,$89,$83
	db $89,$C8,$83,$83,$89,$89,$89,$89
	db $88,$04,$04,$84,$04,$04,$84,$04
	db $04,$84,$84,$DA,$9B,$9B,$9B,$DA
	db $9B,$9B,$9B,$D6,$97,$97,$97,$D6
	db $97,$97,$97,$D2,$93,$93,$93,$D2
	db $93,$93,$93,$D0,$D0,$D0,$94,$98
	db $C8,$C8,$C8,$C8,$C8,$C8,$C8,$C8
	db $C8,$C8,$C8,$C8,$C8,$C8,$C8,$C8

org $B0EB	// 0x1B0EB
l_B0EB:
	db $63,$42,$22,$A3,$A5,$A9,$6E,$1A
	db $6C,$1A,$68,$1A,$64,$1A,$62,$1E
	db $63,$B3,$B3,$B3,$E8,$B3,$B3,$B3
	db $E8,$B3,$B3,$B3,$00,$D0,$95,$91
	db $8F,$50,$10,$91,$95,$A3,$5A,$14
	db $5A,$14,$5A,$14,$5A,$14,$50,$10
	db $51,$A9,$A9,$A9,$E2,$A9,$A9,$A9
	db $E2,$A9,$A9,$A9,$DA,$9B,$9B,$9B
	db $E2,$DA,$E4,$E4,$E4,$E4,$DA,$9B
	db $9B,$9B,$DA,$B9,$B9,$B9,$F2,$B9
	db $B9,$B9,$F2,$B9,$B9,$B9,$C8,$89
	db $89,$89,$C8,$C8,$00
l_B148:		// 0x1B158
	db $5F,$42,$22,$64,$2C,$FA,$F8,$F6
	db $F2,$00,$CC,$91,$8D,$8B,$4C,$10
	db $54,$24,$EC,$E8,$EC,$E2,$DE,$9F
	db $9F,$9F,$DE,$DE,$9F,$9D,$9F,$E2
	db $A5,$A3,$A5,$EC,$C8,$89,$89,$89
	db $C8,$C8,$00
l_B173:		// 0x1B183
	db $6E,$2E,$EC,$42,$24,$A5,$A9,$AD
	db $6C,$2C,$69,$C2,$00,$5E,$1E,$DA
	db $42,$1A,$95,$9B,$A5,$62,$22,$22
	db $20,$22,$24,$E2,$DA,$E4,$A5,$9B
	db $A5,$EC,$E4,$5A,$1A,$E2,$E8,$DA
	db $C8,$89,$89,$89,$C8,$C8,$00
l_B1A2:		// 0x1B1B2
	db $B1,$AD,$B1,$E8,$42,$1E,$9F,$9F
	db $9F,$99,$95,$99,$D0,$42,$10,$91
	db $91,$91,$00,$9F,$9F,$9F,$DE,$42
	db $18,$99,$99,$99,$87,$87,$87,$C6
	db $42,$06,$87,$87,$87,$D0,$99,$97
	db $99,$DE,$E4,$E8,$A5,$A3,$A5,$D8
	db $D0,$C8,$89,$89,$89,$C8,$C8,$00
l_B1DA:		// 0x1B1EA
	db $5B,$C2,$E4,$64,$24,$63,$C2,$00
	db $4B,$C2,$D4,$54,$14,$51,$C2,$DA
	db $9B,$9B,$9B,$DA,$DA,$DA,$9B,$9B
	db $9B,$DA,$DA,$C8,$89,$89,$89,$C8
	db $C8,$00
l_B1FC:		// 0x1B20C
	db $9F,$A5,$AD,$B3,$AD,$A5,$9F,$A5
	db $AD,$B3,$AD,$A5,$00,$95,$9F,$A5
	db $AD,$A5,$9F,$95,$9F,$A5,$AD,$A5
	db $9F,$5F,$C2,$24,$6C,$49,$C0,$08
	db $48
l_B21D:		// 0x1B22D
	db $B7,$B9,$B7,$B3,$B7,$B3,$B1,$B3
	db $B1,$AD,$B1,$AD,$00,$24,$2C,$24
	db $2C,$24,$2C,$24,$2C,$1E,$24,$1E
	db $24,$1E,$24,$1E,$24,$5F,$C2,$24
	db $6C,$49,$C0,$08,$48
l_B242:		// 0x1B252
	db $70,$32,$6C,$30,$68,$2C,$64,$28
	db $00,$E8,$E4,$DE,$D8,$50,$18,$58
	db $1E,$5E,$18,$64,$10,$48,$08,$48
	db $08,$48,$08,$48,$08 
l_B25F:		// 0x1B26F
	db $1F,$2D,$29,$25,$E2,$DA,$1F,$33
	db $31,$29,$6D,$00,$15,$1F,$1F,$1F
	db $D4,$D4,$15,$1F,$1F,$1F,$5F,$DE
	db $AC,$DE,$AC,$9E,$AC,$DE,$AC,$DE
	db $AC,$9E,$AC,$DE,$AC,$DE,$AC,$9E
	db $AC,$DE,$AC,$DE,$AC,$9E,$AC,$C8
	db $88,$C8,$88,$88,$88,$00
l_B295:		// 0x1B2A5
	db $1B,$29,$25,$63,$82,$DE,$1B,$2F
	db $EC,$29,$25,$E2,$00,$11,$1B,$1B
	db $5B,$82,$82,$D0,$11,$23,$E2,$23
	db $1B,$9A,$DA,$A8,$DA,$A8,$9A,$A8
	db $DA,$A8,$DA,$A8,$9A,$A8,$DA,$A8
	db $DA,$A8,$9A,$A8,$DA,$A8,$DA,$A8
	db $9A,$A8,$C8,$88,$C8,$88,$88,$88
	db $00
l_B2CE:		// 0x1B2DE
	db $57,$C2,$DA,$1F,$23,$E4,$61,$C2
	db $E4,$29,$2D,$EE,$2D,$63,$82,$C2
	db $29,$2F,$2D,$63,$82,$C2,$33,$33
	db $00,$4D,$C2,$D6,$17,$17,$DE,$57
	db $C2,$D6,$21,$21,$E8,$23,$5D,$82
	db $C2,$23,$29,$23,$5D,$82,$C2,$31
	db $31,$D6,$9E,$25,$EE,$D6,$9E,$25
	db $EE,$E0,$90,$17,$E0,$E0,$90,$17
	db $E0,$D4,$9C,$23,$E8,$D4,$9C,$23
	db $E8,$D4,$9C,$23,$E8,$D4,$9C,$23
	db $E8,$C8,$88,$C8,$88,$88,$88,$00
l_B326:		// 0x1B336
	db $57,$C2,$DA,$1F,$23,$E4,$63,$C2
	db $E4,$29,$2D,$EE,$EC,$A8,$EC,$A8
	db $AC,$A8,$EC,$A8,$EC,$A8,$AC,$A8
	db $B2,$F2,$F2,$F2,$B2,$6D,$43,$00
	db $4D,$C2,$D6,$17,$17,$DE,$5B,$C2
	db $DE,$23,$25,$E8,$DC,$9C,$DC,$9C
	db $9C,$9C,$DC,$9C,$DC,$9C,$9C,$9C
	db $A8,$E8,$E8,$E8,$A8,$5D,$43,$D6
	db $9E,$25,$EE,$D6,$9E,$25,$EE,$DA
	db $A2,$29,$F2,$DA,$A2,$29,$F2,$D4
	db $9C,$23,$E8,$D4,$9C,$23,$E8,$94
	db $D4,$D4,$D4,$94,$D4,$D4,$9C,$23
	db $C8,$88,$C8,$88,$88,$88,$C8,$88
	db $C8,$88,$88,$88,$C8,$88,$C8,$88
	db $88,$88,$C8,$88,$C8,$88,$88,$88
	db $C8,$88,$C8,$88,$88,$88,$C8,$88
	db $C8,$88,$88,$88,$88,$C8,$C8,$C8
	db $88,$49,$41
l_B3B1:		// 0x1B3C1
	db $AC,$A4,$9A,$AE,$A4,$9E,$33,$43
	db $00,$A4,$9A,$94,$A4,$9E,$96,$2D
	db $43,$B2,$AC,$A4,$B6,$AE,$A4,$3B
	db $43,$08,$0A,$15,$15,$17,$19,$19
	db $19,$1A,$00


bank 7;
// Move pointer to music data (and the data itself) 0x30 bytes below to avoid collide with Exp hacks
org $C436	// 0x1C446
	jsr l_A900	// Originally STA $075F
// Related to the Battle Theme music
org $CBAA	// 0x1CBBA
	jsr l_FEAA	// Originally STA $0707
org $CBC8	// 0x1CBD8
	jsr l_FEB4	// Originally LDA #$04 (Load Battle theme)
	nop		// Originally STA $075F (Music to play)
	nop

// Routine for loading new battle theme into East Hyrule
org $FEAA	// 0x1FEBA
l_FEAA:
	sta.w $0707	// Store current world
	lda.w $0707	// Load current world
	sta.w $0702	// Store ???
	rts
l_FEB4:
	lda.b #$02	// Load $02 into accumulator
	cmp.w $0706	// Compare if we are at East Hyrule
	beq l_FEC1	// BEQ $06, Branch if at East Hyrule
	lda.b #$04	// Load normal battle theme ($04)
	sta.w $075F	// Store into music address
	rts
l_FEC1:
	lda.b #$08	// Load new battle theme ($08)
	sta.w $075F	// Store into music address
	lda.b #$00	// Load $00 into accumulator
	sta.w $0702	// Store ???
	rts

