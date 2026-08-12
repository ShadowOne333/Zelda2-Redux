;***********************************************************
;	Shield spell - Tunic color change (by ShadowOne333)
;***********************************************************

; Change behaviour of Spell casting
%org($8DD4,0)	; 0x0DE4
	cpx #$49	; Originally BEQ $49 / BEQ $0E1F

%org($8E48,0)	; 0x0E58	
	dw shield_tunic	; $AAC0, Originally $8E8D

; Main Tunic changing routine
%org($AAC0,0)	; 0x02AD0
shield_tunic:
	lda $0779	; Load Life level
	cmp #$05	; Check if Life/Defense level = 5
	bcc blue_tunic	; BCC $09, Branch if level is less than 5
red_tunic:
	lda #$16	; Load color $16 (Red)
	sta $69DE	; Store into Link's current palette
	sta $070F	; Store into Link's color after Shield spell
	rts
blue_tunic:
	lda #$11	; Load color $11 (Blue)
	sta $69DE	; Store into Link's current palette
	sta $070F	; Store into Link's color after Shield spell
	rts
