;****************************************************************
;	Restart on the Same Screen after a Game Over
;****************************************************************

; Experience to be added (high byte - low byte)
%org($CA5F,7)	; 0x1CA6F
	sta $0755	; Originally 8D 75 07 - STA $0775
	sta $0756	; Originally 8D 76 07 - STA $0776

%org($CABA,7)	; 0x01CACA
	beq l_CACC	; BEQ $10
	lda #$00
	sta $0775	; Store in current experience (high byte)
	sta $0776	; Store in current experience (low byte)
	lda #$40	; Load #$40 into accumulator
	sta $07B0	; ???
	jmp $CF05
l_CACC:
	lda $0795	; Load value stored at $0795 (Lives/Dolls)
	sta $0700	; Store as current number of lives
	jsr $CF30
	cmp #$0F
	beq l_CADF	; BEQ $07
	lda #$06
	ldy #$01
	jmp $CAF0
l_CADF:
	jsr $C358
	nop
	lda #$00
