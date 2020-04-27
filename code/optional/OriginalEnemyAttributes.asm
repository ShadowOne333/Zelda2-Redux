//********************************************************************
// Original Enemy Attributes
//********************************************************************

bank 1;
// Original Experience Points and Steal Experience (Exp)
org $94D5	// $054E5
	db $40,$40,$40,$C2,$C1,$81,$94,$C2
	db $80,$90,$84,$10,$10,$81,$C2,$02
	db $92,$84,$84,$40,$44,$85,$C5,$48
	db $89,$45,$85,$C6,$C2,$00,$51,$C3
	db $83,$00,$50,$02

bank 2;
// Original Experience Points and Steal Experience (Exp)
// Fix for the Orange/Red Lizalfos Exp. bug
org $94D5	// $094E5
	db $40,$40,$40,$C3,$C1,$81,$D7,$C4
	db $80,$90,$84,$10,$10,$83,$C4,$10
	db $93,$C5,$C5,$40,$E7,$85,$C4,$C7
	db $E7,$CA
	db $8A,$49,$CB	// Orange-Red Lizalfos fix - Originally 89 4A CB
	db $87,$00,$00,$00,$00,$00,$00

bank 4;
// Original Hit Points (HP)
org $9421	// $11421
	db $00,$00,$00,$03,$04,$FF,$FA,$10
	db $00,$00,$38,$02,$02,$FA,$FA,$08
	db $08,$0C,$0C,$00,$00,$00,$00,$00
	db $10,$18,$38,$02,$02,$20,$10,$08
	db $20,$30,$50,$0C

// Original Experience Points and Steal Experience (Exp)
org $94D5	// $114E5
	db $40,$40,$40,$C2,$C1,$80,$87,$57
	db $C0,$C0,$D5,$00,$50,$80,$87,$00
	db $93,$C5,$C5,$40,$00,$00,$00,$00
	db $47,$89,$CA,$93,$93,$4B,$87,$86
	db $87,$CA,$C0,$C7

// Original Respawn rate
org $9541	// $11551
	db $96,$86,$96,$46,$46,$86,$46,$40
	db $90,$86,$40,$80,$40,$90,$46,$90
	db $06,$06,$06,$90,$90,$90,$90,$90
	db $00,$00,$00,$00,$00,$00,$00,$00
	db $C0,$C0,$80,$00

// Original Hit Points (HP)
org $A921	// $12931
	db $00,$00,$00,$03,$04,$FF,$FA,$10
	db $00,$00,$08,$02,$02,$02,$FA,$38
	db $08,$0C,$0C,$00,$00,$00,$00,$00
	db $10,$18,$38,$02,$02,$01,$20,$18
	db $48,$C0,$10,$20

// Original Experience Points and Steal Experience (Exp)
org $A9D5	// $129E5
	db $40,$40,$40,$C3,$C1,$80,$87,$57
	db $C0,$C0,$CC,$00,$50,$80,$87,$D5
	db $83,$C5,$C5,$40,$00,$00,$00,$00
	db $47,$89,$CA,$93,$93,$89,$C9,$87
	db $CC,$4E,$8C,$C8

bank 5;
// Original Hit Points (HP)
org $9421	// $15431
	db $00,$00,$00,$18,$30,$FF,$06,$04
	db $00,$00,$02,$02,$02,$04,$06,$08
	db $08,$0C,$0C,$00,$FF,$FF,$60,$FF
	db $00,$30,$60,$00,$02,$90,$38,$00
	db $00,$00,$C0,$F8

// Original Experience Points and Steal Experience (Exp)
org $94D5	// $154E5
	db $40,$40,$40,$C4,$C4,$84,$D3,$C2
	db $C0,$D0,$80,$00,$00,$82,$C3,$05
	db $95,$85,$85,$40,$C5,$C5,$55,$C0
	db $48,$88,$C9,$90,$90,$8B,$C0,$02
	db $02,$02,$CF,$4A
