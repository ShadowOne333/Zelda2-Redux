;*************************************
;	Pixel Perfect Sword Reach
;	hack by suloku
;*************************************
; Vanilla game sprite collision requires the sword sprite to overlap with the enemy/item sprite. This patch makes it so the sprites just need to touch, makin the sword a bit longer by an extra 2 pixels.
;-------------------------------------
;If you check the Zelda II dissassembly project (https://github.com/FiendsOfTheElements/z2disassembly) you'll find this table at bank 7:

;bank7_table26:
	;.byte    $F8,$02	; 0x1e9ac $E99C F8 02

; The first value ($F8) is used when Link faces right, and the other ($02) when Link faces left.
; The pixel perfect patch changes these values to:
	;.byte    $FA,$00
; The longer sword patch changes them to:
	;.byte    $FC,$FE
; That's all there is to it.
; Breackable blocks are unaffected, as it seems this code is used for sprite collision and those blocks are handled in another manner.

; For anyone reading this, there are two more tables after this one, which might be for other strickes (upward/downward slash), but I didn't really look into it.
;-------------------
%org($E99C,7)	; 0x1E9AC
bank7_table26:
	db $FA,$00	; 0x1e9ac $E99C F8 02
LE99E:
	db $07,$00	; 0x1e9ae $E99E 07 00
LE9A0:
	db $03,$03	; 0x1e9b0 $E9A0 03 03      
