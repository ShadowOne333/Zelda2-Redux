;***********************************************************
;	PAUSE message on pause at Overworld (by IcePenguin)
;***********************************************************

; Overworld pause hijack
%org($A1B3,0)	; 0x021C3
	jsr pause_status; Jump to $A8A0, Originally LDA #$05
	nop		; Originally STA $0736
	nop

%org($A25D,0)	; 0x0226D
	jsr l_ABA0	; $ABA0, Originally LDA $F7, Controller 1
	;fill $06,$EA
	fillbyte $EA
	fill $06
	rts

; UNUSED / FREE SPACE
; Reset ($FE) the dim effect when you open the save menu on the world map.
%org($A8A0,0)	; 0x028B0
pause_status:
	lda #$1E
	sta $00FE
	lda #$05
	sta $0736	; Game mode address
	rts

%org($ABA0,0)	; 0x02BB0
l_ABA0:
	lda $F7	; Load controller 1 inputs
	and #$10	; Check if START has been pressed
	beq l_ABAD	; BEQ $07, branch if equal to RTS
	cmp $00	; Compare if $00
	beq l_ABAD	; BEQ $03, branch if equal to RTS
	jmp l_ABB0	; Jump to $ABB0
l_ABAD:
	rts

%org($ABB0,0)	; 0x02BC0
l_ABB0:
	lda #$00
	cmp $0727	; Load ??? from RAM
	beq l_ABBB	; BEQ $04, branch if equal to 
	inc $0524	; Increment Routine index
	rts
l_ABBB:
	lda #$58	; Load $58 into accumulator
	sta $0244	; Store at $0244 in RAM
	lda #$89	; Load $89 into accumulator
	sta $0245
	lda #$01
	sta $0246
	lda #$70
	sta $0247
	lda #$58
	sta $0248
	lda #$8B
	sta $0249
	lda #$01
	sta $024A
	lda #$78
	sta $024B
	lda #$58
	sta $024C
	lda #$8D
	sta $024D
	lda #$01
	sta $024E
	lda #$80
	sta $024F
	lda #$58
	sta $0250
	lda #$8F
	sta $0251
	lda #$01
	sta $0252	
	lda #$88
	sta $0253
	lda #$58
	sta $0254
	lda #$91
	sta $0255
	lda #$01
	sta $0256
	lda #$90
	sta $0257
	lda #$58
	sta $0258
	lda #$93
	sta $0259
	lda #$01
	sta $025A
	lda #$98
	sta $025B

	inc $0524	; Increment Routine index
	lda #$18	; Load $18 into accumulator
	cmp $00FE	; Compare with value at $00FE
	beq l_AC43	; BEQ $06, branch if equal to
	lda #$18	; Load $18 into accumulator
	sta $00FE	; Store at $00FE
	rts
l_AC43:
	lda #$F8	; Load controller 2 inputs
	sta $00FE
	rts


