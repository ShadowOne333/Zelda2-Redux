;****************************************************************
;	Miscellaneous hacks done to Zelda 2
;****************************************************************

;***********************************************************
;	Fairy frames? 
;***********************************************************

; Modify fairy frames
%org($827F,0)	; 0x0028F
	db $A1,$A3

;***********************************************************
;	Change lava tiles to new animated ones
;***********************************************************

%org($87CB,0)	; 0x007DB
	db $A7,$A8,$A9,$AA	; Originally 6E 6E 6E 6E

;***********************************************************
;	Magic consumption table
;***********************************************************

%org($8D7B,0)	; 0x00D8B
; Magic consumption table
	db $20,$18,$18,$10,$10,$10,$10,$10	; Shield
	db $30,$28,$20,$20,$18,$10,$0C,$08	; Jump
	db $48,$48,$40,$40,$30,$30,$30,$30	; Life
	db $50,$50,$40,$40,$28,$28,$28,$28	; Fairy
	db $78,$50,$40,$20,$10,$10,$10,$10	; Fire
	db $78,$78,$50,$30,$28,$20,$18,$10	; Reflect
	db $78,$70,$60,$50,$30,$20,$18,$10	; Spell
	db $78,$78,$78,$78,$78,$78,$60,$40	; Thunder

;***********************************************************
;   Fairy Cancel by Pressing A Button (by ShadowOne333)
;***********************************************************

; Hijack original Fairy routine
%org($91AA,0)	; 0x011BA
	jsr l_A920	; Originally LDA #$08
	nop		; Originally STA $13

%org($A920,0)	; 0x02930
l_A920:
	lda $F5	; Load controller 1 inputs
	cmp #$80	; Compare if Button A is pressed
	beq fairy_cancel	; Branch to Fairy Cancel if A is pressed
; Original code
	lda #$08	; Load fairy state ($08)
	sta $13	; Store at RAM $13
	rts
fairy_cancel:	; Fairy Cancel routine
	lda #$00	; Load human state ($00)
	sta $13	; Store at RAM $13 (Fairy State 1)
	sta $076F	; Store at RAM $076F (Fairy State 2)
	sta $057D	; Store at RAM $057D (Y Velocity 1)
	sta $03E6	; Store at RAM $03E6 (Y Velocity 2)
	rts

;***********************************************************
;	Spell flash reduction
;***********************************************************

%org($9241,0)	; 0x01251
	lda $074B	; Spell flash counter, originally STA $074B

;***********************************************************
;	Sword beam/fire speed
;***********************************************************

%org($9819,0)	; 0x01829
; 30 - Speed when facing right, D0 - Speed when facing left
	db $30,$D0	; Originally 20 E0

;***********************************************************
;	More common enemy drops
;***********************************************************
; Reduce the number of enemies for getting an item from 6 to 5
%org($E89F,7)	; 0x1E8AF
	cmp #$05	; Originally CMP #$06

;***********************************************************
;	Save Experience gained to SRAM
;***********************************************************

;%org($81C9,0)	; 0x021D9
; Originally STA $0775 and STA $0776
;	nop #06
;%org($CAC4,7)	; 0x1CAD4
;	nop #06

