;***********************************************************
;	NMI changes for CHR bank swap / Animation
;***********************************************************

; This changes requires the game's CHR banks to be expanded from 14 up to 16.
; The original Zelda 2 game uses 14 CHR banks, by making use of the additional 2 free banks we can make copies of the previous bank to make the switching to have 4 animation frames, basically 4 banks = 4 frames.

; UNUSED SPACE  - NMI Routine for the Animated bank swap
%org($AA40,0)	; 0x02A50
	lda $12	; Load Frame counter
	and #$30
	lsr
	lsr
	lsr
	lsr
	tay
	lda l_AA70,y	; Load table at $AA70
	sta $A000
	lda l_AA80,y
	sta $A000
	lda l_AA90,y
	sta $A000
	lda l_AAA0,y
	sta $A000	
	lda l_AAB0,y
	sta $A000
	rts

%org($AA70,0)	; 0x02A80
l_AA70:
	db $10,$10,$10,$10
%org($AA80,0)	; 0x02A90
l_AA80:
	db $08,$01,$00,$01
%org($AA90,0)	; 0x02AA0
l_AA90:
	db $04,$00,$01,$01
%org($AAA0,0)	; 0x02AB0
l_AAA0:
	db $02,$01,$01,$01
%org($AAB0,0)	; 0x02AC0
l_AAB0:
	db $01,$01,$01,$01


; Jump to custom subroutine for Animated tiles on Overworld
%org($C182,7)	; 0x1C192
	jsr l_FF4C	; Permanent frame counter, jump to $FF4C
; NMI hijack for animation code
%org($FF4C,7)	; 0x1FF5C
l_FF4C:
	lda $0768	; Load PPU register flags
	bne l_FF54	; BNE $03, Branch if not $00
	jsr $AA40	; Jump to 0x02A50
l_FF54:		; 0x1FF64
	inc $12	; Increment frame counter
	rts
