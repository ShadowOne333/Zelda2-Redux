;*****************************************************************
;	Original Restart Location at Zelda's Palace on Game Over
;*****************************************************************

; Restore free space
%org($AB10,0)	; 0x02B20
	fillbyte $FF : fill $30

%org($CAD0,0)	; 0x1CAE0
	jsr $CF30	; Region Code * 5 + World Code
	cmp #$0F	; Check if in Great Palace
	beq greatpalace
	lda #$00	; A = 00
	ldy #$01	; Y = 01
	jmp $CAF0
greatpalace:	; $CADE, 0x1CAEE
	jsr $C358	; Reset Number of Lives (to 3)
	lda #$00	; A = 00
	sta $0561	; Area Code
	
