;***************************************************************
;		New GFX (by darthvaderx)
; Combines assets from Rev Edition (Revility) and
; New Link Sprites (Falchion22) into Zelda 2 Redux
;*************************************************************** 

; Palette for Falling Animation
%org($A849,0)	; 0x02859
	db $0F,$07,$37,$29	; Originally [0F 18 36 2A]
; Palette for Flashing Link
%org($AA04,0)	; 0x02A14
	db $31,$01,$29		; Originally [01 2A 11]

; Palette for West Hyrule Grass
%org($8036,1)	; 0x04046
	db $0F,$29,$27,$17	; Originally [0F 29 19 09]
; Palette for Link (Grass, Desert, Swamp, Graveyard and Lava)
%org($809E,1)	; 0x040AE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palette for Link (Forest)
%org($80AE,1)	; 0x040BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palette for Link (Unknown)
%org($80BE,1)	; 0x040CE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palette for Link (Unknown)
%org($80CE,1)	; 0x040DE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]

; Palette for East Hyrule Forest
%org($8036,2)	; 0x08046
	db $0F,$29,$27,$17	; Originally [0F 29 19 09]
; Palette for Link (Grass, Desert, Swamp, Graveyard and Lava)
%org($809E,2)	; 0x080AE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palette for Link (Palisade Pass)
%org($80AE,2)	; 0x080BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palette for Link (Unknown)
%org($80BE,2)	; 0x080CE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palette for Link (Unknown)
%org($80CE,2)	; 0x080DE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]

; Palettes for East Hyrule Forest
%org($8072,3)	; 0x0C082
	db $0F,$30,$17,$07	; Originally [0F 30 29 17]
%org($8092,3)	; 0x0C0A2
	db $0F,$30,$17,$07	; Originally [0F 30 29 17]
; Palette for Link (Grass, Desert, Swamp, Graveyard and Lava)
%org($809E,3)	; 0x0C0AE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palettes for Link (Unknown)
%org($80AE,3)	; 0x0C0BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A] 
%org($80BA,3)	; 0x0C0CA
	db $FF,$01,$2D,$37	; Originally [FF 03 10 36]
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
%org($80CE,3)	; 0x0C0DE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
%org($80DE,3)	; 0x0C0EE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]

; Palettes for Palaces Type A/B
; Palettes for Link (Unknown)
%org($809E,4)	; 0x100AE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
%org($80AE,4)	; 0x100BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A] 
%org($80BE,4)	; 0x100BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
%org($80CE,4)	; 0x100DE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palettes for Palaces (A/B)
; Palace 1 Entrance
%org($8474,4)	; 0x10484
	db $22,$0F,$27,$30	; Originally [22 0F 10 30]
; Palace 2 Entrance
%org($8484,4)	; 0x10494
	db $22,$0F,$11,$31	; Originally [22 0F 1C 3C]
; Palace 3 Entrance
%org($8494,4)	; 0x104A4
	db $22,$0F,$1C,$3C	; Originally [22 0F 06 26]
; Palettes for Palaces
%org($BF04,4)	; 0x13F14
	db $0F,$17,$27,$30	; Originally [0F 00 10 30]
	db $0F,$17,$16,$30	; Originally [0F 00 16 30]
%org($BF14,4)	; 0x13F24
	db $0F,$0F,$0A,$2A	; Originally [0F 0C 1C 3C]
	db $0F,$0A,$16,$30	; Originally [0F 0C 16 30]
%org($BF24,4)	; 0x13F34
	db $0F,$0C,$1C,$3C	; Originally [0F 0F 06 26]
	db $0F,$0C,$16,$30	; Originally [0F 06 16 30]
%org($BF44,4)	; 0x13F54
	db $0F,$0F,$11,$31	; Originally [0F 0F 0A 2A]
	db $0F,$11,$16,$30	; Originally [0F 0A 16 30]

; Palettes for Great Palace
; Palettes for Link (Unknown)
%org($809E,5)	; 0x140AE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
%org($80AE,5)	; 0x140BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A] 
%org($80BE,5)	; 0x140BE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
%org($80CE,5)	; 0x140DE
	db $FF,$07,$37,$29	; Originally [FF 18 36 2A]
; Palettes for Intro
%org($AF40,5)	; 0x16F50
	db $0F,$28,$18,$06	; Originally [0F 30 1C 15]
	db $0F,$18,$0F,$08	; Originally [0F 2B 0F 00]
%org($AF54,5)	; 0x16F64
	db $0F,$18,$0F,$08	; Originally [0F 2B 0F 00]
	db $0F,$16,$10,$30	; Originally [0F 16 26 30]
	db $0F,$08,$19,$21	; Originally [0F 0F 19 21]
; Palette for Selection Screen (Link)
%org($BC08,5)	; 0x17C18
	db $0F,$07,$37,$29	; Originally [0F 18 36 2A]

; Table for a Link Palette PPU Transfer
%org($C453,7)	; 0x1C463
	db $0F,$07,$37,$29	; Originally [0F 18 36 2A]
	db $FF			; End byte
; Table for an Overworld Palette PPU Transfer
	db $3F,$00,$20		; PPU Transfer to $3F00
	db $0F,$18,$2A,$1A	; Originally [0F 30 29 19]
%org($C467,7)	; 0x1C477
	db $0F,$30,$38,$21	; Originally [0F 30 36 21]
	db $0F,$07,$37,$29	; Originally [0F 18 36 2A]
	db $0F,$30,$12,$0F	; Originally [0F 0F 0F 0F]
	db $0F,$30,$16,$0F	; Originally [0F 30 16 30]



; Disable bankcross error during compilation to allow our full 0x20000 file to be imported
check bankcross off
; Import the new graphics
%org($8000,8)	; $20000, 0x20010
	incbin code/optional/NewGFX.bin
; Restore bankcross checks
check bankcross full


;----------------------------------------
; Text changes to match new item graphics for Rev and NewGFX
;----------------------------------------
; 	Table file
;----------------------------------------
incsrc "code/text/text.tbl"
;----------------------------------------
!line	= $FD  ; line break
!delay	= $FE  ; text delay
!end	= $FF  ; end
;----------------------------------------
%org($E4CA,3)	; 0x0E4DA
;text_10:	; 3 less characters
	db "ONLY WITH",	!line
	db "BOMBS YOU",	!line
	db "CAN BREAK",	!line
	db "ROCKS",	!line
	db "BLOCKING",	!line
	db "THE WAY...",!end
	db $FF,$FF,$FF
;----------------------------------------
%org($E62A,3)	; 0x0E63A
;text_17:	; 1 less character
	db "THERE ARE",	!line
	db "BOMBS AT",	!line
	db "DEATH",	!line
	db "MOUNTAIN'S",!line
	db "SPECTACLE",	!line
	db "ROCK...",	!end
	db $FF
;----------------------------------------
%org($E7C1,3)	; 0x0E7D1
;text_27:	; 6 less characters
	db "THE TEMPLE",!line
	db "IN MIDORO",	!line
	db "SWAMP HAS",	!line
	db "A SACRED",	!line
	db "BRACELET.",	!end
	db $FF,$FF,$FF,$FF,$FF,$FF
