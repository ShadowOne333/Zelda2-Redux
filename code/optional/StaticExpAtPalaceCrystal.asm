;***************************************************************
;	Static experience points upon Palace Crystal placement
;***************************************************************

; Experience to be added upon Crystal placement (low byte)
%org($9B67,4)	; 0x11B77
	jsr l_9F10
; Experience to be added upon Crystal placement (high byte)
%org($9B70,4)	; 0x11B80
	jsr l_9F60

; Moved to $9F10 so it doesn't collide with New Exp system patch
%org($9F10,4)	; 0x11F20
l_9F10:
	lda #$0D
	cmp $0561
	beq l_9F59	; F0 42
	lda #$22
	cmp $0561
	beq l_9F53	; F0 35
	lda #$0E
	cmp $0561
	beq l_9F4D	; F0 28
	lda #$1C
	cmp $0561
	beq l_9F47	; F0 1B 
	lda #$29
	cmp $0561
	beq l_9F41	; F0 0E
	lda #$3A
	cmp $0561
	beq l_9F3B	; F0 01
	rts
l_9F3B:
	lda #$B8
	sta $0756
	rts
l_9F41:
	lda #$C4
	sta $0756
	rts
l_9F47:
	lda #$D0
	sta $0756
	rts
l_9F4D:
	lda #$DC
	sta $0756
	rts
l_9F53:
	lda #$E8
	sta $0756
	rts
l_9F59:
	lda #$F4
	sta $0756
	rts
	db $FF

l_9F60:
	lda #$0D
	cmp $0561
	beq l_9FA9	; F0 42
	lda #$22
	cmp $0561
	beq l_9FA3	; F0 35
	lda #$0E
	cmp $0561
	beq l_9F9D	; F0 28
	lda #$1C
	cmp $0561
	beq l_9F97	; F0 1B
	lda #$29
	cmp $0561
	beq l_9F91	; F0 0E
	lda #$3A
	cmp $0561
	beq l_9F8B	; F0 01
	rts
l_9F8B:
	lda #$0B
	sta $0755
	rts
l_9F91:
	lda #$09
	sta $0755
	rts
l_9F97:
	lda #$07
	sta $0755
	rts
l_9F9D:
	lda #$05
	sta $0755
	rts
l_9FA3:
	lda #$03
	sta $0755
	rts
l_9FA9:
	lda #$01
	sta $0755
	rts
