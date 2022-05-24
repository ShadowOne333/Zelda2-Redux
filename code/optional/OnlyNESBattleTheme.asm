//****************************************************************
//	Only the NES theme plays during battles/encounters
//****************************************************************

bank 6;
// Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
org $9489	// 0x19499
	jsr l_9DC0
	nop

org $9DC0	// 0x19DD0
l_9DC0:
	lda.b #$04	// Load NES Battle Theme ($08)
	bit.w $051A	// Randomization address
	bmi l_9DCA	// Branch if it's above $80
	sta.b $EB	// Store in 'music' address
	rts
l_9DCA:
	lda.b #$04	// Load FDS Battle Theme ($08)
	sta.b $EB	// Store in 'music' address
	lda.b #$00	// Load $00 into accumulator
	sta.w $0702	// Store to $0702 (Copied world address)
	rts

	fill $02,$FF
