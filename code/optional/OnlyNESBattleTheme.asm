;****************************************************************
;	Only the NES theme plays during battles/encounters
;****************************************************************

; Overworld music change routine by IcePenguin
%org($A912,0)	; 0x02922
	lda #$04	; Load music entry $04

;-------------------------------------------------------------
; Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
%org($9DC7,6)	; 0x19DD7
	lda #$04	; Force NES Battle Theme ($04)
%org($9DCC,6)	; 0x19DDC
	lda #$04	; Force NES Battle Theme ($04)

;-------------------------------------------------------------
; Routine for loading new battle theme into East Hyrule
%org($FEBB,7)	; 0x1FECB
	lda #$04	; Force NES battle theme ($04)
%org($FEC1,7)	; 0x1FED1
	lda #$04	; Force NES battle theme ($04)

;-------------------------------------------------------------

