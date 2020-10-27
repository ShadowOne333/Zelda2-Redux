//***********************************************************
//	Text changes
//***********************************************************

// Make changes to the delay speeds to improve the writing/typing speed of the text
// Modify the text boxes so the leftover empty row carried over from the Japanese release used for accentuation marks can now be used for normal text by switching the empty row with the one with actual text (leaving only the very last row of the text box empty due to this change). This change allows for 7 rows of text with 10 characters each instead of the 4 rows of ttext from the original game, allowing for more text per-box.

bank 3;
// Text priting delay speed
org $B614	// 0x0F624
	lda.b #$0A	// Originally LDA #$2A
	sta.w $0566	// Delay between letters
	lda.b #$20	// Letter positions, Originally LDA #$00

// Text delay after $FD and $FE commands (newline and delay, respectively)
org $B656	// 0x0F666
	ldy.b #$04	// Originally LDY #$0B
	cmp.b #$FD	// Compare if command $FD (newline) is used
	beq $02
	ldy.b #$18	// Delay after dialong line with $FE (delay), Originally LDY #$2D 

// Add 0x20 to the Name Table address offset (RAM $048A for Y offset) instead of 0x40 when a line break happens, swap the values set to 305 and 306, and start the first line at offset 0x20 instead of 0 (RAM $0489 for X offset).
org $B66A	// 0x0F67A
	adc.b #$20	// Go down 1 tile (0x08 pixels), originally ADC #$40 (0x10 pixels)
org $B6F4	// 0x0F704
	nop		// Fix to make the comma appear, 
	nop		// Originally AND #$3F
	sta.w $0305	// Originally STA $0306
org $B739	// 0x0F&49
	stx.w $0306	// Originally STX $0305
org $B74D	// 0x0F75D
// Reduce delay between letters
	lda.b #$01	// Originally LDA #$05
