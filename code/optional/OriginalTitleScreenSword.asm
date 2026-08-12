;*****************************************************************
;	Original Title Screen Sword graphics
;*****************************************************************

%org($AF58,5)	; 0x16F68
; Restore a specific colour from the palette for the old Sword graphics ($26), and improve the red shading ($05)
	db $0F,$05,$26,$30	; Originally 0F 16 26 30

; Disable bankcross error during compilation to allow our full 0x20000 file to be imported
check bankcross off
; Title screen graphics
%org($8000,8)	; $20000, 0x20010
	incbin code/optional/OriginalTitleScreen.bin
; Restore bankcross checks
check bankcross full
