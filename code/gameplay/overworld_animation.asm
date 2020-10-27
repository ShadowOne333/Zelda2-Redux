//***********************************************************
//	NMI changes for CHR bank swap / Animation
//***********************************************************

// This changes requires the game's CHR banks to be expanded from 14 up to 16.
// The original Zelda 2 game uses 14 CHR banks, by making use of the additional 2 free banks we can make copies of the previous bank to make the switching to have 4 animation frames, basically 4 banks = 4 frames.

bank 0;
// UNUSED SPACE  - NMI Routine for the Animated bank swap
org $AA40	// 0x02A50
	lda.b $12	// Load Frame counter
	and.b #$30
	lsr
	lsr
	lsr
	lsr
	tay
	lda.w l_AA70,y	// Load table at $AA70
	sta.w $A000
	lda.w l_AA80,y
	sta.w $A000
	lda.w l_AA90,y
	sta.w $A000
	lda.w l_AAA0,y
	sta.w $A000	
	lda.w l_AAB0,y
	sta.w $A000
	rts
org $AA70
l_AA70:
	db $10,$10,$10,$10
org $AA80
l_AA80:
	db $08,$01,$00,$01
org $AA90
l_AA90:
	db $04,$00,$01,$01
org $AAA0
l_AAA0:
	db $02,$01,$01,$01
org $AAB0
l_AAB0:
	db $01,$01,$01,$01


bank 7;
// Jump to custom subroutine for Animated tiles on Overworld
org $C182	// 0x1C192
	jsr l_FF4C	// Permanent frame counter, jump to $FF4C
// NMI hijack for animation code
org $FF4C	// 0x1FF5C
l_FF4C:
	lda.w $0768	// Load PPU register flags
	bne l_FF54	// BNE $03, Branch if not $00
	jsr $AA40	// Jump to 0x02A50
l_FF54:		// 0x1FF64
	inc.b $12	// Increment frame counter
	rts
