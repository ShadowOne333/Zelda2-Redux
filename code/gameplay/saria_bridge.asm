;***********************************************************
;  Saria Bridge Draws Automatically on Subsequent Visits
; 		(by IcePenguin)
;***********************************************************
; Note: RAM address $077A is a confirmed unused RAM address that we can use
; It was $079D previously, but that caused a bug with the 8th container since that RAM is used for Kasuto bitflags
; (RAM fix by suloku)
;-----------------------------------------------------------
; Hijacks for Saria Bridge code
%org($97A4,0)	; 0x017B4
	jsr l_AC90	; Jump to $AC90
	%fillto($97B6,0,$EA)	; Fill with NOP up to 0x017C6

%org($A826,0)	; 0x02836
	jsr $AD00	; Originally STA $9607

; Related to the new HUD Hearts code
%org($AC90,0)	; 0x02CA0
l_AC90:
	lda #$00
	cmp $0796	; Check Link's stabs address
	beq $39	; BEQ $39
	lda #$02
	cmp $0796
	beq $32	; BEQ $32
	lda #$04
	cmp $0796
	beq $2B	; BEQ $2B
	lda #$06
	cmp $0796
	beq $24	; BEQ $24
	lda #$10
	cmp $0796
	beq $1D	; BEQ $1D
	lda #$12
	cmp $0796
	beq $16	; BEQ $16
	lda #$14
	cmp $0796
	beq $0F	; BEQ $0F
	lda #$16
	cmp $0796
	beq $08	; BEQ $08
	rts

%org($ACD0,0)	; 0x02CE0
	lda #$01
	cmp $077A	; Check if Saria's Bridge has been enabled before
	bne end1	; BNE $25, branch out if the Bridge has already been triggered before
	lda #$06
	cmp $0561	; Compare with area code address
	bne end1	; BNE $1E
	lda #$00
	cmp $0744	; Compare with buttons pressed on Controller 1
	bne next1	; BNE $03
	inc $0796
next1:
	lda #$02
	cmp $0744	; Compare with buttons pressed on Controller 1
	bne next2	; BNE $03
	inc $0796
next2:
	lda #$01
	cmp $0744	; Compare with buttons pressed on Controller 1
	bne end1	; BNE $03
	inc $0796
end1:
	rts

	;fill $03,$FF
	fillbyte $FF : fill $03

%org($AD00,0)	; 0x02D10
	sta $0796
	lda #$01
	sta $077A	; Store into free RAM address specific for Saria's Bridge check
	rts

; Modify level data for the Saria Bridge area
%org($8A7C,3)	; 0x0CA8C
	db $F4,$67,$FF,$15,$6D


; Related to Saria Bridge hack
%org($C1F6,7)	; 0x1C206
	bmi $0E		; Originally BCC $0E
