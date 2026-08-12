;***************************************************************
; File Select changes (by DarkSamus993, D-man and Cyneprepou4uk)
;	     Copy/Erase save file system by minucce
; -  Code should be used only for educational, documentation and modding purposes
;***************************************************************

;****************************************
; 	Table file
;****************************************
incsrc "code/text/text.tbl"

;****************************************
; 	Continue Screen modifications
;****************************************

%org($CA85,7)	; 0x1CA95
	lda $F7		; Current input
	cmp $0744	; Previous input
	beq l_CAF6	; Wait for unique press

	and #$10	; Start = Confirm
	bne l_CA9C

	lda $F7		; Down,Up,Select = Move cursor
	and #($04|$08|$20)
	beq l_CAF6
	bne l_CAF9

	nop #4

assert pc() <= $CA9C	; 0x1CAAC

l_CA9C:
	skip $5A
l_CAF6:
	skip 3
l_CAF9:		; 0x1CB09

;****************************************
; 	Main File Select changes
;****************************************

%org($B281,5)	; 0x17291
	ldx.b #((main_menu_mode2_init-1)>>8)
	ldy.b #((main_menu_mode2_init-1)>>0)

	jmp bank5_jmp_bank6

assert pc() <= $B28B	; 0x1B29B

;----------------------------------------------------------

%org($B296,5)	; 0x172A6
	ldx.b #((main_menu_exit_check-1)>>8)
	ldy.b #((main_menu_exit_check-1)>>0)

	jsr bank5_jmp_bank6
	nop

assert pc() <= $B29E	; 0x1B2AE

;----------------------------------------------------------

%org($B303,5)	; 0x17313
main_menu_cursor:
	ldx $19		; Cursor position

.down_cursor:
	lda $F5	; Joypad 1
	and #$24	; Down, Select
	beq .up_cursor

	inx
	cpx #$05
	bne .move_cursor

	ldx #$00
	beq .move_cursor

;----------------------------------------------------------

.up_cursor:
	lda $F5		; Joypad 1
	and #$08
	beq .draw_cursor

	dex
	bpl .move_cursor

	ldx #$04

;----------------------------------------------------------

.move_cursor:
	stx $19

	lda #$02	; Move sound
	sta $EB

.draw_cursor:
	ldy .cursor_ypos,x
	sty $1B

	lda #$1C	; Xpos
	sta $4D

	jsr $B574	; Draw fairy

;----------------------------------------------------------

	lda #$3E	; Ypos
	ldy #$29	; Xpos
	jsr menu_draw_dolls

	jsr $B5B5	; Second Quest

	ldy #$41
	jsr menu_draw_triforce

	lda #$21	; Draw names
	sta $00

	lda #$07
	sta $01

	jsr $B529
	rts

;----------------------------------------------------------

.cursor_ypos:
	db $3E,$56,$6E,$8C,$A4

;----------------------------------------------------------

menu_draw_triforce:
	ldx #$08

.loop:
	lsr $02
	bcc .next

	tya
	sta $0218,x

	lda #$D2
	sta $0219,x

	lda #$01
	sta $021A,x

	lda #$31
	sta $021B,x

.next:
	tya
	clc
	adc #$18
	tay

	dex
	dex
	dex
	dex
	bpl .loop

	rts

;----------------------------------------------------------

register_menu_dolls:
	jsr menu_draw_dolls

	ldx $19		; Current name
	lda .palette_pos,x
	tax

	lda #$00	; Bright palette
	sta $0200,x

	rts

.palette_pos:
	db $0E+8,$0E+4,$0E+0

	;nop #10

assert pc() <= $B3CF	; 0x173DF

;##########################################################

%org($B692,5)	; 0x176A2
register_menu_mode:
	ldx.b #(register_name_menu>>8)
	ldy.b #((register_name_menu-1)>>0)

	jmp bank5_jmp_bank6

;----------------------------------------------------------

register_menu_draw:
	ldy $1B		; Active cursor
	jsr $B574

	jsr $B5B5	; Second Quest

	ldy #$39
	jsr menu_draw_triforce

	lda #$36	; Print dolls
	ldy #$29
	jsr register_menu_dolls

	jmp $B700
	;nop #80

assert pc() <= $B700	; 0x17710

;----------------------------------------------------------

%org($B727,5)	; 0x17737
	lda #$38	; Name cursor Xpos

%org($B750,5)	; 0x17760
	inc $0204	; Name cursor Ypos

;==========================================================

%org($B8C4,5)	; 0x178D4
	lda #$20	; Name location
	sta $00

	lda #$E7
	sta $01

	jmp $B529

assert pc() <= $B8CF	; 0x178DF

;----------------------------------------------------------

%org($BCDA,5)	; 0x17CEA
	; Register your name
	db $21,$ED,$03,"   "


	; Alphabet box
	db $22,$04,$01,$CA
	db $22,$05,$57,$CB
	db $22,$1C,$01,$CA

	db $22,$24,$C9,$CC
	db $22,$3C,$C9,$CC

	db $23,$44,$01,$CA
	db $23,$45,$57,$CB
	db $23,$5C,$01,$CA

;##########################################################

%org($B596,5)	; 0x175A6
	jmp menu_draw_dolls

;----------------------------------------------------------

bank5_jmp_bank6:
	lda #$06
	sta $0769

	txa	; PC
	pha

	tya
	pha

	jmp $FFC9

;----------------------------------------------------------

main_menu_return:
	lda #$00
	sta $073E
	sta $073B

	lda #$00
	sta $0736

	rts

	;nop #18

assert pc() <= $B5B5	; 0x175C5

;----------------------------------------------------------

%org($BBF5,5)	; 0x17C05
	; Main menu palette
	db $3F,$00,$20

	db $0F,$30,$12,$16
	db $0F,$00,$02,$06
	db $0F,$10,$00,$10
	db $0F,$30,$30,$30

	db $0F,$07,$37,$2A
	db $0F,$16,$27,$30
	db $0F,$07,$27,$1A
	db $0F,$27,$27,$0F

	db $FF

assert pc() <= $BC19	; 0x17C29

;##########################################################

%org($B425,5)	; 0x17435
	ldx.b #((copy_erase_menu-1)>>8)
	ldy.b #((copy_erase_menu-1)>>0)

	jmp bank5_jmp_bank6

;----------------------------------------------------------

menu_erase_file:
	lda $19		; Data pointers
	jsr $BA6F

	lda #$BA	; Clear data
	sta $09

	lda #$E3
	sta $08

	lda $07
	sta $0B

	lda $06
	sta $0A

	jsr $BA1B	; Erase file

;----------------------------------------------------------

	lda #$08	; Erase sound
	sta $EB

	jmp main_menu_return

;----------------------------------------------------------

menu_copy_file:
	lda $11	; Copy slot
	jsr $BA6F	; Data pointers

	lda $08
	sta $20

	lda $09
	sta $21

	lda $0A
	sta $22

	lda $0B
	sta $23

;----------------------------------------------------------

	lda $10		; Erase slot
	jsr $BA6F

	lda $20
	sta $08

	lda $21
	sta $09

	lda $22
	sta $0A

	lda $23
	sta $0B

	jsr $BA1B	; New file

;----------------------------------------------------------

	lda #$08	; Erase sound
	sta $EB

	jmp main_menu_return

;----------------------------------------------------------

copy_erase_menu_draw:
	ldy $1B	; Active cursor
	jsr $B574

	lda #$36	; Print dolls
	ldy #$29
	jsr menu_draw_dolls

;----------------------------------------------------------

	jsr $B5B5	; Second Quest

	ldy #$39
	jsr menu_draw_triforce

;----------------------------------------------------------

	lda #$20	; Print names
	sta $00

	lda #$E7
	sta $01

	jsr $B529
	rts

;----------------------------------------------------------

menu_draw_dolls:
	ldx $1A		; Active slots
	stx $01	; $01, $02 = temp

	ldx #$00	; Slot No.
	stx $00

	ldx #$08

.loop1:
	pha

	sta $020C,x	; Ypos

	tya
	sta $020F,x	; Xpos

;----------------------------------------------------------

	lsr $01
	bcc .sword

.plain:
	dec $020C,x	; Adjust Ypos

	lda #$A8	; Plain doll
	sta $020D,x

	dec $020F,x	; Adjust Xpos

	bne .color

.sword:
	lda #$D0	; Sword doll
	sta $020D,x

;----------------------------------------------------------

.color:
	lda $10		; Erase slot
	eor $00
	beq .gray

	lda $11		; Copy slot
	eor $00
	beq .red

	bcs .faded	; Inactive slot

.green:
	lda #$00
	beq .next

.gray:
	lda #$03
	bne .next

.red:
	lda #$01
	bne .next

.faded:
	lda #$02

;----------------------------------------------------------

.next:
	sta $020E,x

	pla
	clc
	adc #$18

	inc $00

	dex
	dex
	dex
	dex
	bpl .loop1

	rts

	;nop #13

assert pc() <= $B4FD	; 0x1750D

;##########################################################

%org($B780,6)	; 0x1B790
main_menu_mode2_init:
	ldx #$A5

	ldy #$00	; Attribute 1-2

	lda $1A		; Saves active
	sta $00

.save1:
	lsr $00		; Save 1 disabled
	bcc .save2

	tya
	ora #$05
	tay

;----------------------------------------------------------

.save2:
	lsr $00		; Save 2 disabled
	bcc .attr12

	tya
	ora #$50
	tay

.attr12:
	lda #$27
	sta $7FA5+0

	lda #$D4
	sta $7FA5+1

	lda #$03
	sta $7FA5+2

	sty $7FA5+3
	sty $7FA5+4
	sty $7FA5+5

;----------------------------------------------------------

.save3:
	ldy #$00

	lsr $00		; Save 3 disabled
	bcc .attr3

	ldy #$50

.attr3:
	lda #$27
	sta $7FA5+6

	lda #$DC
	sta $7FA5+7

	lda #$03
	sta $7FA5+8

	sty $7FA5+9
	sty $7FA5+10
	sty $7FA5+11

	lda #$FF
	sta $7FA5+12

;==========================================================

	lda #$05	; Upload 7F00 code
	sta $0725

	;lda #$00	; Cursor default position
	;sta $19

	lda #$FF	; Reset copy, erase cursor
	sta $10
	sta $11
	
	jmp bank6_rts_bank5


;----------------------------------------------------------

bank6_jmp_bank5:
	txa		; PC
	pha

	tya
	pha


; Fall-through
bank6_rts_bank5:
	lda #$05	; Menu bank
	sta $0769

	jmp $FFC9	

;----------------------------------------------------------

main_menu_exit_check:
	lda $19		; Cursor select
	sta $13

.load:
	cmp #$03
	bcs .copy_erase

	tax		; Register = not created
	lda .file_active,x
	and $1A
	beq .exit

	lda #$01	; Okay sound
	sta $EB

	lda #$03
	sta $19

	bne .exit

;----------------------------------------------------------

.copy_erase:
	lda #$01	; Okay sound
	sta $EB

	lda #$04	; Copy / Erase
	sta $19

;----------------------------------------------------------

.exit:
	lda #$00
	sta $073E
	sta $073B

	jmp bank6_rts_bank5

.file_active:
	db $01,$02,$04

;----------------------------------------------------------

register_name_menu:
	ldy $073E
	dey
	bne .mode2

	jmp register_menu_init


;=========================================================

.mode2:
	lda #$00	; Enable screen
	sta $0726


	lda $F5		; Joypad 1 = start
	and #$10
	beq .draw_cursor1

	lda #$08	; Create sound
	sta $EB

	ldy $19
	ldx .name_slot,y
	ldy #$08	; Blank name

.loop2:
	lda $0300,x
	cmp #$F4
	bne .exit1

	dex
	dey
	bne .loop2

	lda #$04	; Quit sound
	sta $EB

.exit1:
	lda #$00
	sta $073E

	inc $073B
	jmp bank6_rts_bank5

.name_slot:
	db $0C,$17,$22

;----------------------------------------------------------

.draw_cursor1:
	ldx $19		; Fairy
	lda .cursor_ypos1,x
	sta $1B

	lda #$1C	; Xpos
	sta $4D

	ldx.b #(register_menu_draw>>8)
	ldy.b #((register_menu_draw-1)>>0)

	jmp bank6_jmp_bank5

;----------------------------------------------------------

.cursor_ypos1:
	db $36,$4E,$66

;----------------------------------------------------------

copy_erase_menu:
	ldy $073E	; Submode
	bne .mode0

	jmp copy_erase_menu_init

;----------------------------------------------------------

.mode0:
	lda $13		; Copy or erase
	cmp #$03
	beq .copy_mode0

	jmp .erase_mode0

;----------------------------------------------------------

.copy_mode0:
	dey
	bne .copy_mode1

	ldx.b #(.menu_end-.menu-1)

.loop3:
	lda .menu,x
	sta $7F00,x

	dex
	bpl .loop3

	lda #$05	; Vram $7F00 copy
	sta $0725

	inc $73E

	jmp bank6_rts_bank5

;----------------------------------------------------------

.menu:
	db $20,$4A,$0B," COPY SAVE "
	db $22,$A8,$10,"COPY WHICH SAVE",$B9

	db $3F,$0C,$04,$0F,$16,$06,$16	; Red
	db $3F,$1C,$04,$0F,$00,$30,$10	; Gray

	db $FF

.menu_end:

;----------------------------------------------------------

.copy_mode1:
	lda #$00	; Enable screen
	sta $0726

	dey
	bne .copy_mode2

	jmp .input_menu1

;----------------------------------------------------------

.copy_mode2:
	dey
	bne .copy_mode3

	ldx.b #(.menu1_end-.menu1-1)

.loop4:
	lda .menu1,x
	sta $7F00,x

	dex
	bpl .loop4


;----------------------------------------------------------

	ldy $19		; Copy slot
	ldx.b #(.menu1_attr-.menu1)

	lda $1A		; Active slot
	sta $00

	lda .red1,y
	lsr $00
	bcc .attr1

	ora #$50	; Faded


.attr1:
	sta $7F03,x

	lda .red2,y
	lsr $00
	bcc .attr2

	ora #$50	; Faded

.attr2:
	sta $7F07,x

	lda .red3,y
	lsr $00
	bcc .attr3

	ora #$05	; Faded

.attr3:
	sta $7F0B,x

;----------------------------------------------------------

	lda $19		; Copy slot
	sta $11

	lda #$05	; Vram $7F00 copy
	sta $0725

	lda #$00	; Reset cursor
	sta $19

	inc $073E
	jmp .draw_sprites

;----------------------------------------------------------

.menu1:
	db $22,$A8,$10,"TO WHICH SLOT",$B9,"  "

.menu1_attr:
	db $23,$C9,$07|$40,$00	; Save 1
	db $23,$D1,$07|$40,$00	; Save 2
	db $23,$D9,$07|$40,$00	; Save 3

	db $FF

.menu1_end:

;----------------------------------------------------------

.red1:
	db $F0,$00,$00
.red2:
	db $0F,$F0,$00
.red3:
	db $00,$00,$FF

;----------------------------------------------------------

.copy_mode3:
	dey
	bne .copy_mode4

	ldx $19		; Skip copy slot
	cpx $11
	bne .exit2

	inx
	cpx #$03
	bne .exit2

	ldx #$00

.exit2:
	stx $19

	jmp .input_menu3

;----------------------------------------------------------

.copy_mode4:
	dey
	beq .init0

	jmp .copy_mode5

.init0:
	ldx.b #(.menu2_end-.menu2)

.loop5:
	lda .menu2-1,x
	sta $7F00-1,x

	dex
	bne .loop5

;----------------------------------------------------------

	ldx.b #(.menu2_attr-.menu2)

	lda $1A		; Active slot
	sta $00

;----------------------------------------------------------

.save11:
	lsr $00

	ldy $19		; Erase slot
	lda .gray_attr+0,y

	ldy $11		; Copy slot
	ora .red_attr+0,y
	bne .attr11


	lda #$50	; Inactive slot
	bcc .save22


.attr11:
	sta $7F03,x

;----------------------------------------------------------

.save22:
	lsr $00

	ldy $19		; Erase slot
	lda .gray_attr+3,y

	ldy $11		; Copy slot
	ora .red_attr+3,y
	bne .attr22


	lda #$50	; Inactive slot
	bcc .save33

.attr22:
	sta $7F07,x

;----------------------------------------------------------

.save33:
	lsr $00

	ldy $19		; Erase slot
	lda .gray_attr+6,y

	ldy $11		; Copy slot
	ora .red_attr+6,y
	bne .attr33

	lda #$05	; Inactive slot
	bcc .exit3

.attr33:
	sta $7F0B,x

;----------------------------------------------------------

.exit3:
	lda $19		; Erase slot
	sta $10

	clc
	adc #($D0+1)
	sta $7F12

	lda $11		; Copy slot
	adc #($D0+1)
	sta $7F0D

	lda #$05	; Vram $7F00 copy
	sta $0725

	lda #$00	; Reset cursor
	sta $19

	inc $073E
	jmp .draw_sprites

;----------------------------------------------------------

.menu2:
	db $22,$A8,$11,"COPY FROM 1 TO 2",$B9

	db $22,$EB,$04,"OKAY"
	db $23,$2B,$04,"QUIT"

	; From (red), to (gray-blue)
	db $23,$EB,$03,$0F,$0F,$05

.menu2_attr:
	db $23,$C9,$07|$40,$00	; Save 1
	db $23,$D1,$07|$40,$00	; Save 2
	db $23,$D9,$07|$40,$00	; Save 3

	db $FF

.menu2_end:

;----------------------------------------------------------

.red_attr:
	db $F0,$00,$00
	db $0F,$F0,$00
	db $00,$00,$FF

.gray_attr:
	db $A0,$00,$00
	db $0A,$A0,$00
	db $00,$00,$AA

;----------------------------------------------------------

.copy_mode5:
	jmp .input_menu2

;----------------------------------------------------------

.erase_mode0:
	dey
	bne .erase_mode1

	ldx.b #(.menu3_end-.menu3-1)

.loop6:
	lda .menu3,x
	sta $7F00,x

	dex
	bpl .loop6

	lda #$05	; Vram $7F00 copy
	sta $0725

	inc $073E

	jmp bank6_rts_bank5

;----------------------------------------------------------

.menu3:
	db $20,$4A,$0C," ERASE SAVE "
	db $22,$A8,$11,"ERASE WHICH SAVE",$B9

	db $3F,$0C,$04,$0F,$16,$06,$16	; Red
	db $3F,$14,$04,$0F,$02,$27,$30	; Blue
	db $3F,$1C,$04,$0F,$00,$30,$10	; Gray

	db $FF

.menu3_end:

;==========================================================

.erase_mode1:
	lda #$00	; Enable screen
	sta $0726

	dey
	bne .erase_mode2

	jmp .input_menu1

;==========================================================

.erase_mode2:
	dey
	beq .init1

	jmp .erase_mode3

.init1:
	ldx.b #(.menu4_end-.menu4)

.loop7:
	lda .menu4-1,x
	sta $7F00-1,x

	dex
	bne .loop7

;----------------------------------------------------------

	ldy $19		; Erase slot
	ldx.b #(.menu4_attr-.menu4)

	lda $1A		; Active slot
	sta $00

	lda .gray1,y
	lsr $00
	bcc .attr111

	ora #$50	; Faded

.attr111:
	sta $7F03,x

	lda .gray2,y
	lsr $00
	bcc .attr222

	ora #$50	; Faded

.attr222:
	sta $7F07,x

	lda .gray3,y
	lsr $00
	bcc .attr333

	ora #$05	; Faded

.attr333:
	sta $7F0B,x

;----------------------------------------------------------

	lda $19		; Erase slot
	sta $10

	clc
	adc #($D0+1)
	sta $7F10

	lda #$05	; Vram $7F00 copy
	sta $0725

	lda #$00	; Reset cursor
	sta $19


	inc $073E
	jmp .draw_sprites

;----------------------------------------------------------

.menu4:
	db $22,$A8,$11,"ERASE PLAYER 1",$B9,"  "

	db $22,$EB,$04,"OKAY"
	db $23,$2B,$04,"QUIT"

	; Player x (red)
	db $23,$EB,$03,$0C,$0F,$03

.menu4_attr:
	db $23,$C9,$07|$40,$00	; Save 1
	db $23,$D1,$07|$40,$00	; Save 2
	db $23,$D9,$07|$40,$00	; Save 3

	db $FF

.menu4_end:

;----------------------------------------------------------

.gray1:
	db $A0,$00,$00
.gray2:
	db $0A,$A0,$00
.gray3:
	db $00,$00,$AA


;==========================================================
;==========================================================

.erase_mode3:
	jmp .input_menu2

;==========================================================
;==========================================================

.quit:
	lda #$00
	sta $073E
	sta $073B

	lda #$00	; Main menu
	sta $0736

	jmp bank6_rts_bank5

;----------------------------------------------------------

.draw_sprites:

.copy_cursor:
	ldx $11
	bmi .erase_cursor

	lda .cursor_ypos2,x
	sta $02F4

	lda #$6A
	sta $02F5

	lda #$01	; Red
	sta $02F6

	lda #$1C
	sta $02F7

;----------------------------------------------------------

.erase_cursor:
	ldx $10
	bmi .exit4

	lda .cursor_ypos2,x
	sta $02F0

	lda #$68
	sta $02F1

	lda #$03	; Grey
	sta $02F2

	lda #$1C
	sta $02F3

;----------------------------------------------------------

.exit4:
	ldx.b #((copy_erase_menu_draw-1)>>8)
	ldy.b #((copy_erase_menu_draw-1)>>0)

	jmp bank6_jmp_bank5

.cursor_ypos2:
	db $36, $4E, $66

;----------------------------------------------------------

.input_menu1:
	ldy $19
	ldx $F5		; Joypad 1
	txa

;----------------------------------------------------------

.start1:
	and #$10
	beq .down_cursor1

	cpy #$03	; Quit
	beq .abort

	lda #$01	; Okay sound
	sta $EB

	inc $073E
	jmp .draw_menu

.abort:
	lda #$00	; Reset cursor
	sta $19

	lda #$04	; Cancel
	sta $EB

	jmp .quit

;----------------------------------------------------------

.down_cursor1:
	txa
	and #($04|$20)
	beq .up_cursor1


.loop8:
	iny
	bne .move_cursor1

;----------------------------------------------------------

.up_cursor1:
	txa
	and #$08
	beq .draw_menu

	lda #$02	; Move sound
	sta $20

	dey

;----------------------------------------------------------

.move_cursor1:
	tya
	and #$03

	sta $19
	tay		; Skip disabled slot
	lda .save_active1,y
	and $1A
	bne .input_menu1

	lda #$02	; Move sound
	sta $EB

;----------------------------------------------------------

.draw_menu:
	ldx $19
	lda .cursor_ypos3,x
	sta $1B

	lda #$1C	; Xpos
	sta $4D

	jmp .draw_sprites

;----------------------------------------------------------

.cursor_ypos3:
	db $36,$4E,$66,$7C

.save_active1:
	db $01,$02,$04,$00


;----------------------------------------------------------
;----------------------------------------------------------

.input_menu2:
	ldy $19
	ldx $F5		; Joypad 1
	txa

.start2:
	and #$10
	beq .down_cursor2

	tya
	bne .quit1

	lda #$01	; Okay sound
	sta $EB

	lda $13		; Copy or erase
	cmp #$03
	beq .copy

	jmp .erase_save

.copy:
	jmp .copy_save

.quit1:
	lda $10		; Reset cursor
	sta $19

	lda #$04	; Cancel
	sta $EB

	jmp .quit

;----------------------------------------------------------

.down_cursor2:
	txa
	and #($04|$20)
	beq .up_cursor2

	iny
	bne .move_cursor2

;----------------------------------------------------------

.up_cursor2:
	txa
	and #$08
	beq .draw_cursor2

	dey

;----------------------------------------------------------

.move_cursor2:
	lda #$02	; Move sound
	sta $EB


	tya
	and #$01

	sta $19

;----------------------------------------------------------

.draw_cursor2:
	ldx $19
	lda .cursor_ypos4,x
	sta $1B

	lda #$4C	; Xpos
	sta $4D

	jmp .draw_sprites

.cursor_ypos4:
	db $B4,$C4

;----------------------------------------------------------
;----------------------------------------------------------

.input_menu3:
	ldy $19
	ldx $F5		; Joypad 1
	txa

;----------------------------------------------------------

.start3:
	and #$10
	beq .down_cursor3

	cpy #$03	; Quit
	beq .abort1

	lda #$01	; Okay sound
	sta $EB

	inc $073E
	jmp .draw_menu1

.abort1:
	lda $11		; Reset cursor
	sta $19

	lda #$04	; Quit sound
	sta $EB

	jmp .quit

;----------------------------------------------------------

.down_cursor3:
	txa
	and #($04|$20)
	beq .up_cursor

	iny
	bne .move_cursor3

;----------------------------------------------------------

.up_cursor:
	txa
	and #$08
	beq .draw_menu1

	dey

;----------------------------------------------------------

.move_cursor3:
	tya
	and #$03

	sta $19

	cpy $11		; Skip copy slot
	beq .input_menu3

	lda #$02	; Move sound
	sta $EB

;----------------------------------------------------------

.draw_menu1:
	ldx $19
	lda .cursor_ypos5,x
	sta $1B

	lda #$1C	; Xpos
	sta $4D

	jmp .draw_sprites

;----------------------------------------------------------

.cursor_ypos5:
	db $36,$4E,$66,$7C

.save_active2:
	db $01,$02,$04,$00


;----------------------------------------------------------
;----------------------------------------------------------

.copy_save:
	lda #$08	; Erase sound
	sta $EB

	lda $10		; Save slot
	sta $19

	ldx.b #(menu_copy_file>>8)
	ldy.b #((menu_copy_file-1)>>0)

	jmp bank6_jmp_bank5
;==========================================================
;==========================================================

.erase_save:
	lda $10		; Erase slot
	sta $19

	ldx.b #(menu_erase_file>>8)
	ldy.b #((menu_erase_file-1)>>0)

	jmp bank6_jmp_bank5

;----------------------------------------------------------
;----------------------------------------------------------

copy_erase_menu_init:
	ldx.b #(.menu_end-.menu)

.loop9:
	lda .menu-1,x
	sta $7F00-1,x

	dex
	bne .loop9

;----------------------------------------------------------

	lda $1A		; Active saves
	sta $1F

.save1:
	lsr $1F
	bcs .save1_off

	ldx #$00
	ldy.b #(.menu_stats+0-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+0-.menu)
	jsr menu_print_deaths

	jmp .save2


.save1_off:
	lda #$50

	ldx.b #(.menu_attr+0-.menu)
	sta $7F03,x

;----------------------------------------------------------

.save2:
	lsr $1F
	bcs .save2_off

	ldx #$32
	ldy.b #(.menu_stats+14-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+6-.menu)
	jsr menu_print_deaths

	jmp .save3


.save2_off:
	lda #$50

	ldx.b #(.menu_attr+4-.menu)
	sta $7F03,x

;----------------------------------------------------------

.save3:
	lsr $1F
	bcs .save3_off


	ldx #$64
	ldy.b #(.menu_stats+28-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+12-.menu)
	jsr menu_print_deaths

	jmp .start_cursor

.save3_off:
	lda #$05

	ldx.b #(.menu_attr+8-.menu)
	sta $7F03,x

;----------------------------------------------------------

.start_cursor:
	ldx #$00	; Initial cursor

	lda $1A		; Save 1
	lsr
	bcc .exit
	inx		; Save 2
	lsr
	bcc .exit

	inx		; Save 3
	lsr
	bcc .exit

	inx		; Quit

;----------------------------------------------------------

.exit:
	stx $19		; Initial cursor

	lda #$05	; Vram $7F00 copy
	sta $0725

	lda #$08	; Flag copy, erase mode
	ora $1A
	sta $1A

	lda #$FF	; Reset copy, erase cursor
	sta $10
	sta $11

	inc $073E

	jmp bank6_rts_bank5


;----------------------------------------------------------
;----------------------------------------------------------

.menu:
	; Title bar
	db $20,$43,$5A,$CB

	; Text box
	db $22,$66,$01,$CA
	db $22,$67,$13|$40,$CB
	db $22,$7A,$01,$CA

	db $22,$86,$07|$C0,$CC
	db $22,$9A,$07|$C0,$CC

	db $23,$66,$01,$CA
	db $23,$67,$13|$40,$CB
	db $23,$7A,$01,$CA

	db $20,$A7,$06,"-NAME-"
	db $20,$B2,$07,"-LEVEL-"
	db $22,$05,$04,"QUIT"

.menu_stats:
	db $20,$F0,$0B
	db $C9,$BA,$F4,$F4,$FA,$BA,$F4,$F4,$F8,$BA,$F4
	db $21,$50,$0B
	db $C9,$BA,$F4,$F4,$FA,$BA,$F4,$F4,$F8,$BA,$F4
	db $21,$B0,$0B
	db $C9,$BA,$F4,$F4,$FA,$BA,$F4,$F4,$F8,$BA,$F4

.menu_deaths:
	db $21,$09,$03,$F4,$F4,$F4
	db $21,$69,$03,$F4,$F4,$F4
	db $21,$C9,$03,$F4,$F4,$F4

.menu_attr:
	db $23,$C9,$07|$40,$00
	db $23,$D1,$07|$40,$00
	db $23,$D9,$07|$40,$00

	db $FF

.menu_end:

;----------------------------------------------------------
;----------------------------------------------------------

register_menu_init:
	ldx.b #(.menu_end-.menu)

.loop10:
	lda .menu-1,x
	sta $7F00-1,x

	dex
	bne .loop10

;----------------------------------------------------------

	lda $1A		; Active saves
	sta $1F

.save1:
	lsr $1F
	bcs .save1_off

	ldx #$00
	ldy.b #(.menu_stats+0-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+0-.menu)
	jsr menu_print_deaths

	jmp .save2

.save1_off:
	lda #$F0	; Creation save

	ldx $13
	beq .save1_attr

	lda #$50

.save1_attr:
	ldx.b #(.menu_attr+0-.menu)
	sta $7F03,x

;----------------------------------------------------------

.save2:
	lsr $1F
	bcs .save2_off

	ldx #$32
	ldy.b #(.menu_stats+14-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+6-.menu)
	jsr menu_print_deaths

	jmp .save3

.save2_off:
	lda #$F0	; Creation save

	ldx $13
	cpx #$01
	beq .save2_attr

	lda #$50	; Faded

.save2_attr:
	ldx.b #(.menu_attr+4-.menu)
	sta $7F03,x

;----------------------------------------------------------

.save3:
	lsr $1F
	bcs .save3_off

	ldx #$64
	ldy.b #(.menu_stats+28-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+12-.menu)
	jsr menu_print_deaths

	jmp .exit

.save3_off:
	lda #$0F	; Creation save

	ldx $13
	cpx #$02
	beq .save3_attr

	lda #$05	; Faded

.save3_attr:
	ldx.b #(.menu_attr+8-.menu)
	sta $7F03,x

;----------------------------------------------------------

.exit:
	lda $13		; Initial cursor
	sta $19

	lda #$05	; Vram $7f00 copy
	sta $0725

	lda #$08	; Flag copy, erase mode
	ora $1A
	sta $1A

	lda #$FF	; Reset copy, erase cursor
	sta $10
	sta $11

	inc $073E

	jmp bank6_rts_bank5

;----------------------------------------------------------
;----------------------------------------------------------

.menu:
	; New title bar
	db $20,$43,$18
	db $CB,$CB," REGISTER YOUR NAME ",$CB,$CB

	; Old title bar
	db $20,$63,$5A,$F4

	db $20,$A7,$06,"-NAME-"
	db $20,$B2,$07,"-LEVEL-"

	db $3F,$0C,$04,$0F,$2A,$0A,$2A	; Green

.menu_stats:
	db $20,$F0,$0B
	db $C9,$BA,$F4,$F4,$FA,$BA,$F4,$F4,$F8,$BA,$F4
	db $21,$50,$0B
	db $C9,$BA,$F4,$F4,$FA,$BA,$F4,$F4,$F8,$BA,$F4
	db $21,$B0,$0B
	db $C9,$BA,$F4,$F4,$FA,$BA,$F4,$F4,$F8,$BA,$F4

.menu_deaths:
	db $21,$09,$03,$F4,$F4,$F4
	db $21,$69,$03,$F4,$F4,$F4
	db $21,$C9,$03,$F4,$F4,$F4

.menu_attr:
	db $23,$C9,$07|$40,$00
	db $23,$D1,$07|$40,$00
	db $23,$D9,$07|$40,$00

	db $FF

.menu_end:


;----------------------------------------------------------
;----------------------------------------------------------

menu_print_stats:
	lda $6002,x	; Attack
	ora #$D0
	sta $7F05,y

	lda $6003,x	; Magic
	ora #$D0
	sta $7F09,y

	lda $6004,x	; Life
	ora #$D0
	sta $7F0D,y

	rts

;----------------------------------------------------------
;----------------------------------------------------------

menu_print_deaths:
	sta $02

	lda #$00
	sta $00

	lda $6002,x
	jsr .print_number


	ldx $02
	sta $7F05,x

	tya
	sta $7F04,x

	lda $00
	sta $7F03,x

	rts

;==========================================================
;==========================================================

.print_number:
	lda #$00


	ldy #$D0	; 0-9 Tile No.

.loop11:
	iny
	sec
	sbc #$E8
	bcs .loop11_next

	dec $00

.loop11_next:
	dec $00
	dec $00
	dec $00
	bpl .loop11

	clc
	adc #$E8
	bcc .digit1

	inc $00

.digit1:
	inc $00
	inc $00
	inc $00

	dey
	sty $01

;----------------------------------------------------------

	ldy #$D0

.loop12:
	iny
	sec
	sbc #$64
	bcs .loop12

	dec $00
	bpl .loop12

	adc #$64	; X--
	dey
	sty $00

;----------------------------------------------------------

	ldy #$D0

.loop13:
	iny
	sec
	sbc #$0A
	bcs .loop13

	adc #$DA	; --X
	dey		; -X-
	rts

assert pc() <= $BF70	; 0x17F80

;##########################################################
;##########################################################

; Bugfix for the alphabet cursor covering the box line
%org($B759,5)	; 0x17769 (Name)
	lda #$C7	; LDA #$FF

%org($B86C,5)	; 0x1787C (Letters Box)
	lda #$C7	; LDA #$FF	

; File Selection Palettes for Link
%org($BC08,5)	; 0x17C18
	db $0F,$07,$37,$2A	; Originally 0F 18 36 2A

; File Selection Text and Tiles/Sprites
%org($BC3B,5)	; 0x17C4B
	db $20,$C7,$06
	db "-NAME-"
	db $20,$D2,$07
	db "-LEVEL-"
	db $21,$10,$0B
	db $C9,"-0 ",$FA,"-0 ",$F8,"-0"
	db $21,$70,$0B
	db $C9,"-0 ",$FA,"-0 ",$F8,"-0"
	db $21,$D0,$0B
	db $C9,"-0 ",$FA,"-0 ",$F8,"-0"

; Rename REGISTER YOUR NAME to COPY SAVE
%org($BC78,5)	; 0x17C88
	db $22,$45,$12
	db "COPY SAVE         "	; Rewrite "REGISTER YOUR NAME"


; Rename ELIMINATION MODE to ERASE SAVE FILE
%org($BC9F,5)	; 0x17CAF
	db $22,$A5,$10
	db "ERASE SAVE      "	; Rewrite "ELIMINATION MODE"

; Change "-" to dash "/" in REGISTER NAME
%org($BD3B,5)	; 0x17D4B
	db $CE


; Change "-" to dash "/" in ELIMINATION MODE
%org($BD8F,5)	; 0x17D9F
	db $CE

