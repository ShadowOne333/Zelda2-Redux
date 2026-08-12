;***********************************************************
;	Max Lives Counter Cap
;***********************************************************
; Pause pane counter related to Crystals and Lives
%org($A156,0)	; 0x02166
	sta $7896	; Originally STA $7881

%org($A15F,0)	; 0x0216F
	sta $7897
	jsr PauseCapLives	; Hijack for max number of lives printed
	clc
	adc #$CF	; Change to dot tile?
	sta $7898

; Force Lives counter to print out max number of 9
%org($AC60,0)	; 0x02C70
PauseCapLives:
	lda $0700
	cmp #$0A
	bcs Pause_GreaterOrEqual10
	inc $0700
	lda $0700
	dec $0700
	rts

Pause_GreaterOrEqual10:
	lda #$0A
	rts
;------------------------------------
; Cap Extra Lifes when gaining experience at Max Level for Defend/Life to a max of 9
%org($9FC3,0)	; 0x01FD3
	jsr MaxLives_ExpCap

%org($A8D5,0)	; 0x028E5, Free space after "overworld_pause" and optional "NewExp" routines
MaxLives_ExpCap:
	lda	$0700
	cmp	#$09
	bcs	MaxLivesExp_GreaterOrEqual10
	inc	$0700
	rts

MaxLivesExp_GreaterOrEqual10:
	lda	#$09
	sta	$0700
	rts
;------------------------------------
; Hijack for the life counter screen at Game Over
%org($C3D4,7)	; 0x1C3E4
	jsr GameOverCapCounter	; Originally LDA $0700

; Visual cap for the life counter screen
%org($FF5E,7)	; 0x1FF6E
GameOverCapCounter:
	lda $0700
	cmp #$0A
	bcs GameOver_GreaterOrEqual10
	rts

GameOver_GreaterOrEqual10:
	lda #$09
	rts
;------------------------------------
