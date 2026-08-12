;*****************************************************************
;	Original Title screen palette from Zelda 2
;*****************************************************************

; SWORD
%org($AF58,5)	; 0x16F68
; Restore a specific colour from the palette for the old Sword graphics ($26), and improve the red shading ($05)
	db $0F,$05,$26,$30	; Originally 0F 16 26 30

; PALETTE
%org($AF44,5)	; 0x16F54
	db $0F,$2B,$0F,$00
%org($AF54,5)	; 0x16F64
	db $0F,$2B,$0F,$00

; Title screen graphics
; Disable bankcross error during compilation to allow our full 0x20000 file to be imported
check bankcross off
; Import the new graphics
%org($8000,8)	; $20000, 0x20010
	incbin code/optional/OriginalTitleScreen.bin
; Restore bankcross checks
check bankcross full	
