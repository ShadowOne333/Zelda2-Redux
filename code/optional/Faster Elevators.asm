;****************************************************************
;		Faster Elevators
;	Adapted from code by Displaced Gamers:
;	https://www.youtube.com/watch?v=GSSUrnIpcds&t=710s
;****************************************************************
; Changes the elevators Y velocity
%org($D8BF,7)	; 0x1D8CF
bank7_Table_for_Elevator_Y_Velocity:
	db $00,$30,$D0	; Originally $00,$18,$E8
