;****************************************************************
; 	Zelda 2 Redux - Text data
;****************************************************************

;****************************************
; 	Table file
;****************************************
incsrc "code/text/text.tbl"

;****************************************
; 	Control codes
;****************************************
!end	= $FF

;****************************************
;	Game over text
;****************************************
; Starting address for Text
%org($FE11,7)	; 0x1FE21
game_over_text:
	db $22,$05,$16,"TO AVOID DAMAGING SAVE"	; "TO AVOID DAMAGING GAME"
	db $22,$45,$16,"DATA,  HOLD  DOWN  THE"	; "INFO  SAVED,  HOLD  IN"
	db $22,$85,$16,"RESET  BUTTON  AS  YOU"	; "RESET  BUTTON  AS  YOU"
	db $22,$C5,$16,"TURN  THE  POWER  OFF."	; "TURN POWER OFF.       "
	db !end
;----------------------------------------
