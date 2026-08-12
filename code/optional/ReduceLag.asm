;****************************************************************
; Reduce screen lag by reducing max number of spawnable enemies
;****************************************************************

; Reduce maximum number of enemies from the spawner from $05 to $02
%org($9B3B,1)	; 0x05B4B
	ldx $02
