// For use with snarfblasm

// This patch optimizes the E001 function which reads a byte from the compressed overworld map. Evidently at one point the map was loaded directly from ROM and later changed to copy the map to SRAM then read from there. However the bank switches before and after reading each byte were left in, drastically increasing CPU usage. Removing these saves about 7% of the CPU at peak.

bank 7;
org $E001
	jmp +	// Was jsr RestoreBank
+

org $E015
	rts	// Was pha; jsr SwitchBank0; pla; rts

// This patch optimizes the F27D function which creates a bit mask of which sprites of a metasprite are offscreen. It's called 15-20 times per frame and can take over 15% of the CPU at peak. The section that's optimized has the following pseudocode:

// for (Y = 3// Y >= 0// Y--)
// 	*(word *)$e = 3b[X]:4d[X] + f274[Y] // 0, 8, $10, $18
//	if (*(word *)$e - *72a:*72c) >> 8
//		c8[*0] |= f270[Y] // 8, 4, 2, 1

// This patch optimizes this by taking advantage of the fact that once the relationship of the object to the screen borders is known the bit mask can be generated all at once. This reduces CPU usage by about 9% under peak load.

org $F27F
	// $0A bytes
	// Calculate delta = x + $18 - screen_x
	ldy $3B,x
	lda $4D,x
	clc
	adc #$18
	bcc +

	iny

+	// $14 bytes
	sec
	sbc $072C
	sta $0E
	tya
	sbc $072A

	bcc NoOverlap	// < 0

	lsr 
	bne NoOverlap	// >= $200

	lda $0E

	jmp $6C60	// Jump to Part2

NoOverlap: // 3 bytes
	lda #$0F

Part3: // 7 bytes
	ldy $00
	sta $00C8, y

	bpl $F2B4


// Available RAM ranges:
//	6340-6957 (618)
//	6c58-6cff (a8)
//	6fa1-6fff (5f)
//	773c-77ff (c4)
//	79f9-7bff (207)
//	7fa6-7fff (5a)

//bank 7; org $FF4C	// $24 bytes available
bank 5;
org $A6AE
// Hijack Load Save init at boot routine to place our code in SRAM
	jsr Part2	// Originally sta.w $4011

org $A590
Part2: // 2 bytes, 5 with new modifications
	sta $4011	// Put back originally hijacked opcode


// Start loop to copy our code to RAM
CopyToSRAM:
	ldy #$00	//Copy code block to SRAM. Run on startup          
CopyToSRAMLoop:
	lda CodeBlock,y              
	sta $6C60,y              
	iny                      
	cpy #$2A	//Size of block    Max size.. This can be used to copy other code as well. 
	//Probably would be good to define SRAM locations/Routines to make code more readable.
	//Define $7f90=BankSplice //Check if bank 5 and go to SRAM or Bank 5 location accordingly
	bne CopyToSRAMLoop
// Finish copy to SRAM, continue with our code
	rts

CodeBlock:
	bcs AtLeast100

Below100: // 6 bytes
	// OverlapMaskLo[min(delta, $18) / 8]
	cmp #$18
	bcc +

	lda #$18
	
+	// 9 bytes
	lsr 
	lsr 
	lsr 
	tay
	lda $6C83,y	//OverlapMaskLo, y

	bpl Done

AtLeast100: // $d bytes
	cmp #$18
	bcs NoOverlap2

	// OverlapMaskHi[(delta - 0x100) / 8]
	lsr 
	lsr 
	lsr 
	tay
	lda $6C87,y	//OverlapMaskHi, y

	bpl Done

NoOverlap2:
	lda #$0F

Done:
	jmp Part3

OverlapMaskLo:
	db $0E,$0C,$08,$00

OverlapMaskHi:
	db $01,$03,$07
