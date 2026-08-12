;****************************************************************
;	Change the Text printing sound from Dialog boxes
;****************************************************************

; Sound for Text printing per-character
%org($B746,3)	; 0x0F756
	lda #$50	; Originally LDA #$60
	sta $EF	; Originally STA $EC, SFX Type 1
; Changed SFX Type from 1 to 3
