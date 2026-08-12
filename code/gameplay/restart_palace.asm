;***********************************************************
;	Restart at Current Palace on Game Over (by njosro)
;***********************************************************

%org($AB10,0)	; 0x02B20
l_AB10:
	lda $0707	; Load current world
	rts
l_AB14:
	lda $0706	; Get region
	asl
	asl
	clc
	adc $0707	; Add into $0707 (World)
	adc $0748	; Add into overworld area outside of view
	sec
	sbc #$34
	tax
	lda l_AB30,x	; Load table at $AB30
	sta $0561	; Store into area code address
	jmp $C358

%org($AB30,0)	; 0x02B40
l_AB30:
	db $FF,$FF,$FF,$00,$0E,$FF,$00,$FF
	db $0F,$FF,$FF,$23,$FF,$24,$FF,$00

; Restart routines hi-jacks
%org($CAD0,7)	; 0x1CAE0
	jsr l_AB10	; Originally JSR $CF30
	cmp #$03	; Originally CMP #$0F
	bcs l_CADE	; Originally BEQ $07/$1CADE
	lda #$00	; A=00
	ldy #$01	; Y=01
	jmp l_CAF0	; Jump to $CAF0
l_CADE:		; 0x1CAEE
	jsr l_AB14	; Originally JSR $C358
	lda #$00	; A=0
	nop		; Originally STA $0561 (Area code)
	nop
	nop
	sta $0701	; Facing direction when entering area
	sta $075C	; Position code when entering area (0-3)
	lda #$01	; A=01 (If 0, restart in North Castle)
	ldy #$02	; Y=02
l_CAF0:
	sta $076C
	sty $075F	; Music to play
	rts
