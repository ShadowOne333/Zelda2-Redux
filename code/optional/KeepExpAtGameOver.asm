;****************************************************************
;	Keep Experience after a Game Over
;****************************************************************

; Experience to be added (high byte - low byte)
%org($CA5F,7)	; 0x1CA6F
	sta $0755	; Originally 8D 75 07 - STA $0775
	sta $0756	; Originally 8D 76 07 - STA $0776

%org($CABA,7)	; 0x01CACA
	beq $14	; F0 14 - Originally BEQ $08 - Branch to 0x1CAE0
	lda #$00	; Originally LDA #$40
	sta $0775	; Store in current experience (high byte)
	sta $0776	; Store in current experience (low byte)
	nop #4		; Originally STA $0775
	lda #$40	; Originally STA $0776
	sta $07B0	; Originally STA $0756
	jmp $CF05	; JMP $CF0F on original patch - Originally STA $0755
