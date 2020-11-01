//****************************************************************
//   	Play FDS or NES Battle Themes at Random 
//	  (by Cyneprepou4uk & ShadowOne333) 
//****************************************************************

// Make the FDS Battle Theme to play randomly alongside the original NES Battle Theme

bank 0;
// Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
org $A905	// 0x02915
	bne l_A910	// Original FDS Theme branch
	lda.b #$04	// Load NES Battle Theme ($08)
	bit.w $051A	// Randomization address
	bmi l_A910	// Branch if it's above $80
	lda.b #$08	// Load FDS Battle Theme ($08)
l_A910:
	sta.w $075F	// Store in 'music to play' address
	rts

	fill $04,$FF

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
	lda.b #$08	// Load FDS Battle Theme ($08)
	sta.b $EB	// Store in 'music' address
	lda.b #$00	// Load $00 into accumulator
	sta.w $0702	// Store to $0702 (Copied world address)
	rts

	fill $02,$FF

bank 7;
// Routine for playing FDS or NES theme randomly by using RAM address $051A as reference for the randomization
org $FEB4	// 0x1FEC4
// Hijack the East Hyrule routine to allow Random play
l_FEB4:
	lda.b #$04	// Load NES Battle Theme ($08)
	bit.w $051A	// Randomization address
	bmi l_FEBF	// Branch if it's above $80
	sta.w $075F	// Store in 'music to play' address
	rts
l_FEBF:
	lda.b #$08	// Load FDS Battle Theme ($08)
	sta.w $075F	// Store in 'music to play' address
	lda.b #$00	// Load $00 into accumulator
	sta.w $0702	// Store to $0702 (Copied world address)
	rts

	fillto $FED0,$FF


