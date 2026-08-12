;****************************************************************
;   	Play FDS or NES Battle Themes at Random 
;	  (by Cyneprepou4uk & ShadowOne333) 
;****************************************************************

; Make the FDS Battle Theme to play randomly alongside the original NES Battle Theme

; Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
%org($A905,0)	; 0x02915
	bne l_A910	; Original FDS Theme branch
	lda #$04	; Load NES Battle Theme ($04)
	bit $051A	; Randomization address
	bmi l_A910	; Branch if it's above $80
	lda #$08	; Load FDS Battle Theme ($08)
l_A910:
	sta $075F	; Store in 'music to play' address
	rts

	fillbyte $FF : fill $04

; Hijack original overworld FDS theme loading routine to change the region check to instead play the theme at random
%org($9489,6)	; 0x19499
	jsr l_9DC0_opt
	nop

%org($9DC0,6)	; 0x19DD0
l_9DC0_opt:
	lda #$04	; Load NES Battle Theme ($08)
	bit $051A	; Randomization address
	bmi l_9DCA_opt	; Branch if it's above $80
	sta $EB		; Store in 'music' address
	rts
l_9DCA_opt:
	lda #$08	; Load FDS Battle Theme ($08)
	sta $EB		; Store in 'music' address
	lda #$00	; Load $00 into accumulator
	sta $0702	; Store to $0702 (Copied world address)
	rts

	fillbyte $FF : fill $02

; Routine for playing FDS or NES theme randomly by using RAM address $051A as reference for the randomization
; Hijack the East Hyrule routine to allow Random play
%org($FEB4,7)	; 0x1FEC4
l_FEB4_opt:
	lda #$04	; Load NES Battle Theme ($08)
	bit $051A	; Randomization address
	bmi l_FEBF_opt	; Branch if it's above $80
	sta $075F	; Store in 'music to play' address
	rts
l_FEBF_opt:
	lda #$08	; Load FDS Battle Theme ($08)
	sta $075F	; Store in 'music to play' address
	lda #$00	; Load $00 into accumulator
	sta $0702	; Store to $0702 (Copied world address)
	rts

	%fillto($FED0,7,$FF)


