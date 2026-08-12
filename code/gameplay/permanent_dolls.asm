;***********************************************************
;	Permanent Link Dolls
;***********************************************************

; Unused RAM address $0795 will be used for this hack

; Routine to modify the number of lives depending on the number of Link Dolls collected
%org($C358,7)	; 0x1C368
	jsr	InitializePermanentLives	; $D3B0, Originally LDA #$03
	nop					; STA $0700
	nop

; Initialize unused RAM $0795 at $03 for the Permanent Link Dolls
%org($D3B0,7)	; 0x1D3C0
InitializePermanentLives:
	lda	#$00	; Load $00 into accumulator
	cmp	$0795	; Compare with value at $0795 ($00 for New Game)
	beq	NewGameSetup	; Branch if equal to $00
	lda	$0795	; Load value at $0795
	sta	$0700	; Store as number of lives
	rts

NewGameSetup:	; Value $00 (New Game)
	lda	#$03	; Load $03 into accumulator
	sta	$0795	; Store $03 at $0795
	sta	$0700	; Store $03 as number of lives
	rts

; Jump to new Link Doll routine
%org($E818,7)	; 0x1E828
	jsr SaveDollLives	; Originally INC $0700

; Check for amount of lives obtained
%org($FF57,7)	; 0x1FF67
SaveDollLives:	
	inc $0700	; Increment number of lives
	inc $0795	; Increment Max number of lives
	rts

