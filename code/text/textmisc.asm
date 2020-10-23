//***********************************************************
//	Text changes
//***********************************************************

bank 3;
// Text priting delay speed
org $B614	// 0x0F624
	lda.b #$0A	// Originally LDA #$2A
	sta.w $0566	// Delay between letters
	lda.b #$20	// Letter positions, Originally LDA #$00

// Text delay after $FD and %FE commands (newline and delay, respectively)
org $B656	// 0x0F666
	ldy.b #$04	// Originally LDY #$0B
	cmp.b #$FD	// Compare if command $FD (newline) is used
	beq $02
	ldy.b #$18	// Delay after dialong line with $FE (delay), Originally LDY #$2D 

// New Y positions for letters
org $B66A	// 0x0F67A
	adc.b #$20	// Go down 1 tile (0x08 pixels), originally ADC #$40 (0x10 pixels)

// Regarding letters positions and removal of extra vertical tile
org $B6F4	// 0x0F704
	nop		// Originally AND #$3F
	nop
	sta.w $0305	// Originally STA $0306
org $B739	// 0x0F&49
	stx.w $0306	// Originally STX $0305
org $B74D	// 0x0F75D
// Reduce delay between letters
	lda.b #$01	// Originally LDA #$05
