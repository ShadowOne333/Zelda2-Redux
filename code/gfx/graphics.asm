;****************************************
;	Import modified graphics
;****************************************
; Disable bankcross error during compilation to allow our full 0x20000 file to be imported
check bankcross off

; Import new Redux graphics
%org($8000,8)	; $20000, 0x20010
	incbin code/gfx/ReduxGFX.bin

; Restore bankcross checks
check bankcross full
