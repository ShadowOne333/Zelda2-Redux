//***********************************************************
//	Max Lives Counter Cap
//***********************************************************
bank 0;
// Pause pane counter related to Crystals and Lives
org $A156	// 0x02166
	sta.w $7896	// Originally STA $7881

org $A15F	// 0x0216F
	sta.w $7897
	jsr PauseCapLives	// Hijack for max number of lives printed
	clc
	adc.b #$CF	// Change to dot tile?
	sta.w $7898

// Force Lives counter to print out max number of 9
org $AC60	// 0x02C70
PauseCapLives:
	lda.w $0700
	cmp.b #$0A
	bcs Pause_GreaterOrEqual10
	inc.w $0700
	lda.w $0700
	dec.w $0700
	rts

Pause_GreaterOrEqual10:
	lda.b #$0A
	rts
//------------------------------------
// Cap Extra Lifes when gaining experience at Max Level for Defend/Life to a max of 9
org $9FC3	// 0x01FD3
	jsr MaxLives_ExpCap

org $A8D5	// 0x028E5, Free space after "overworld_pause" and optional "NewExp" routines
MaxLives_ExpCap:
	lda.w	$0700
	cmp.b	#$09
	bcs	MaxLivesExp_GreaterOrEqual10
	inc.w	$0700
	rts

MaxLivesExp_GreaterOrEqual10:
	lda.b	#$09
	sta.w	$0700
	rts
//------------------------------------
bank 7;
// Hijack for the life counter screen at Game Over
org $C3D4	// 0x1C3E4
	jsr GameOverCapCounter	// Originally LDA $0700

// Visual cap for the life counter screen
org $FF5E	// 0x1FF6E
GameOverCapCounter:
	lda.w $0700
	cmp.b #$0A
	bcs GameOver_GreaterOrEqual10
	rts

GameOver_GreaterOrEqual10:
	lda.b #$09
	rts
//------------------------------------
