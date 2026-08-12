;***********************************************************
;	Manual save by pressing Up+A on Pause
;***********************************************************

; Button values for remapping purposes:
; FOR RAM ADDRESSES LOADED FROM $F5/$F7

; 01 = D-Pad Right	| 02 = D-Pad Left
; 04 = D-Pad Down	| 08 = D-Pad Up
; 10 = Start Button	| 20 = Select Button
; 40 = B Button	| 80 = A Button

; Change save input from controller 2 to controller 1
%org($A19F,0)	; 0x021AF
	lda $F7	; Originally LDA $F8, Controller 2
	cmp #$88	; Press Up+A to save (Change to $20 for Select to save)

; Change save input from controller 2 to controller 1 at Pause Pane
%org($A1DD,0)	; 0x021ED
	lda $F7	; Originally LDA $F8, Controller 2

; Life counter change for manual save
%org($AB96,0)	; 0x02BA6
l_AB96:
	inc $0700	; Increment Life counter address
	lda $0700	; Load life counter address
	dec $0700	; Decrement life counter address
	rts

; Manual save fix so the game doesn't count saves as Deaths
%org($CA9C,7)	; 0x1CAAC
; Hijack for the manual save fix 
	jsr l_D3A0	; Originally LDA $079F

%org($D39A,7)	; 0x1D3AA
l_D3A0:
	lda $0700	; Load number of lives
	beq l_D3A8	; If A=0 (Lives=0), branch to original code
	lda #$FF	; Set A to 255
	rts
l_D3A8:
	lda $079F	; Load number of continues used
	rts
l_D3AC:
	;fill $04,$FF
