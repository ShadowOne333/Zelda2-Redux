;**************************************************************
;	Famicom Disk System Experience Level Requiements
;**************************************************************

; Table for Level Up experience
%org($9659,0)	; 0x01669
	; High byte
	db $00,$01,$02,$03,$05,$09,$0F,$0F
	db $00,$01,$02,$03,$05,$09,$0F,$0F
	db $00,$01,$02,$03,$05,$09,$0F,$0F
	; Low byte
	db $64,$2C,$BC,$E8,$DC,$C4,$A0,$A0
	db $64,$2C,$BC,$E8,$DC,$C4,$A0,$A0
	db $32,$2C,$BC,$E8,$DC,$C4,$A0,$A0

; Table for AML digits in Level Up Pane (10s)
%org($9E42,0)	; 0x01E52
	db $D0

; Table for AML digits in Level Up Pane (100s)
%org($9E4A,0)	; 0x01E5A
	db $D1,$D3,$D7,$D0,$D5,$D5,$D0,$D0
	db $D1,$D3,$D7,$D0,$D5,$D5,$D0,$D0
	db $F4,$D3,$D7,$D0

; Table for AML digits in Level Up Pane (1000s)
%org($9E64,0)	; 0x01E74
	db $D0,$D1,$D1,$D2,$D4,$D4,$F4,$F4
	db $F4,$D1,$D1,$D2,$D4,$D4,$F4,$F4
	db $F4,$D1,$D1,$D2,$D4,$D4
