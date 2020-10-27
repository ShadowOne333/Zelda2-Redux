//***********************************************************
//	Permanent Link Dolls
//***********************************************************

// Unused RAM address $0795 will be used for this hack

bank 7;
// Routine to modify the number of lives depending on the number of Link Dolls collected
org $C358	// 0x1C368
	jsr l_D3B0	// $D3B0, Originally LDA #$03
	nop		// STA $0700
	nop

// Related to the number of lives for Link Dolls hack
org $CA9C	// 0x1CAAC
	jsr l_D3A0	// Originally LDA $079F

// Initialize unused RAM $0795 at $03 for the Permanent Link Dolls
org $D3B0	// 0x1D3C0
l_D3B0:
	lda.b #$00	// Load $00 into accumulator
	cmp.w $0795	// Compare with value at $0795 ($03)
	beq l_D3BE	// Branch if equal to $03
	lda.w $0795	// Load value at $0795
	sta.w $0700	// Store as number of lives
	rts
l_D3BE:
	lda.b #$03	// Load $03 into accumulator
	sta.w $0795	// Store $03 at $0795
	sta.w $0700	// Store $03 as number of lives
	rts

// Jump to new Link Doll routine
org $E818	// 0x1E828
	jsr l_FF57	// Originally INC $0700
// Check for amount of lives obtained
org $FF57	// 0x1FF67
l_FF57:	
	inc.w $0700	// Increment number of lives
	inc.w $0795	// Increment Max number of lives
	rts

