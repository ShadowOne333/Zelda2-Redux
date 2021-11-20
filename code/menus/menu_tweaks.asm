//***************************************************************
// File Select changes (by DarkSamus993, D-man and Cyneprepou4uk)
// -  Code should be used only for educational, documentation and modding purposes
//***************************************************************

//****************************************
// 	Table file
//****************************************
table code/text/text.tbl

//----------------------------------------

bank 5;
org $B281	// 0x17291
	ldx.b #((main_menu_mode2_init-1)>>8)
	ldy.b #((main_menu_mode2_init-1)>>0)

	jmp bank5_jmp_bank6

//warnpc $B28B

//----------------------------------------------------------

org $B296	// 0x172A6
	ldx.b #((main_menu_exit_check-1)>>8)
	ldy.b #((main_menu_exit_check-1)>>0)

	jsr bank5_jmp_bank6
	nop

//warnpc $b29e

//----------------------------------------------------------

org $B303	// 0x17313
main_menu_cursor:
	ldx.b $19	// Cursor position

.down_cursor:
	lda.b $F5	// Joypad 1
	and.b #$24	// Down, Select
	beq .up_cursor

	inx
	cpx.b #$05
	bne .move_cursor

	ldx.b #$00
	beq .move_cursor

//----------------------------------------------------------

.up_cursor:
	lda.b $F5	// Joypad 1
	and.b #$08
	beq .draw_cursor

	dex
	bpl .move_cursor

	ldx.b #$04

//----------------------------------------------------------

.move_cursor:
	stx.b $19

	lda.b #$02	// Move sound
	sta.b $EB

.draw_cursor:
	ldy.w .cursor_ypos,x
	sty.b $1B

	lda.b #$1C	// Xpos
	sta.b $4D

	jsr $B574	// Draw fairy

//----------------------------------------------------------

	lda #$3E	// Ypos
	ldy #$29	// Xpos
	jsr menu_draw_dolls

	jsr $B5B5	// Second Quest

	ldy.b #$41
	jsr menu_draw_triforce

	lda.b #$21	// Draw names
	sta.b $00

	lda.b #$07
	sta.b $01

	jsr $B529
	rts

//----------------------------------------------------------

.cursor_ypos:
	db $3E,$56,$6E,$8C,$A4

//----------------------------------------------------------

menu_draw_triforce:
	ldx.b #$08

.loop:
	lsr.b $02
	bcc .next

	tya
	sta.w $0218,x

	lda.b #$D2
	sta.w $0219,x

	lda.b #$01
	sta.w $021A,x

	lda.b #$31
	sta.w $021B,x

.next:
	tya
	clc
	adc.b #$18
	tay

	dex
	dex
	dex
	dex
	bpl .loop

	rts

//----------------------------------------------------------

register_menu_dolls:
	jsr menu_draw_dolls

	ldx.b $19	// Current name
	lda.w .palette_pos,x
	tax

	lda.b #$00	// Bright palette
	sta.w $0200,x

	rts

.palette_pos:
	db $0E+8,$0E+4,$0E+0

	//nop #10

//warnpc $B3CF

//##########################################################

org $B692	// 0x176A2
register_menu_mode:
	ldx.b #(register_name_menu>>8)
	ldy.b #((register_name_menu-1)>>0)

	jmp bank5_jmp_bank6

//----------------------------------------------------------

register_menu_draw:
	ldy.b $1B	// Active cursor
	jsr $B574

	jsr $B5B5	// Second Quest

	ldy.b #$39
	jsr menu_draw_triforce

	lda.b #$36	// Print dolls
	ldy.b #$29
	jsr register_menu_dolls

	jmp $B700
	//nop #80

//warnpc $B700

//----------------------------------------------------------

org $B727	// 0x17737
	lda.b #$38	// Name cursor Xpos

org $B750	// 0x17760
	inc.w $0204	// Name cursor Ypos

//==========================================================

org $B8C4	// 0x178D4
	lda.b #$20	// Name location
	sta.b $00

	lda.b #$E7
	sta.b $01

	jmp $B529

//warnpc $b8cf

//----------------------------------------------------------

org $BCDA	// 0x17CEA
	// Register your name
	db $21,$ED,$03,"   "


	// Alphabet box
	db $22,$04,$01,$CA
	db $22,$05,$57,$CB
	db $22,$1C,$01,$CA

	db $22,$24,$C9,$CC
	db $22,$3C,$C9,$CC

	db $23,$44,$01,$CA
	db $23,$45,$57,$CB
	db $23,$5C,$01,$CA

//##########################################################

org $B596	// 0x175A6
	jmp menu_draw_dolls

//----------------------------------------------------------

bank5_jmp_bank6:
	lda.b #$06
	sta.w $0769

	txa	// PC
	pha

	tya
	pha

	jmp $FFC9

//----------------------------------------------------------

main_menu_return:
	lda.b #$00
	sta.w $073E
	sta.w $073B

	lda.b #$00
	sta.w $0736

	rts

	//nop #18

//warnpc $B5B5

//----------------------------------------------------------

org $BBF5	// 0x17C05
	// Main menu palette
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

//warnpc $BC19

//##########################################################

org $B425	// 0x17435
	ldx.b #((copy_erase_menu-1)>>8)
	ldy.b #((copy_erase_menu-1)>>0)

	jmp bank5_jmp_bank6

//----------------------------------------------------------

menu_erase_file:
	lda.b $19	// Data pointers
	jsr $BA6F

	lda.b #$BA	// Clear data
	sta.b $09

	lda.b #$E3
	sta.b $08

	lda.b $07
	sta.b $0B

	lda.b $06
	sta.b $0A

	jsr $BA1B	// Erase file

//----------------------------------------------------------

	lda.b #$08	// Erase sound
	sta.b $EB

	jmp main_menu_return

//----------------------------------------------------------

menu_copy_file:
	lda.b $11	// Copy slot
	jsr $BA6F	// Data pointers

	lda.b $08
	sta.b $20

	lda.b $09
	sta.b $21

	lda.b $0A
	sta.b $22

	lda.b $0B
	sta.b $23

//----------------------------------------------------------

	lda.b $10	// Erase slot
	jsr $BA6F

	lda.b $20
	sta.b $08

	lda.b $21
	sta.b $09

	lda.b $22
	sta.b $0A

	lda.b $23
	sta.b $0B

	jsr $BA1B	// New file

//----------------------------------------------------------

	lda.b #$08	// Erase sound
	sta.b $EB

	jmp main_menu_return

//----------------------------------------------------------

copy_erase_menu_draw:
	ldy.b $1B	// Active cursor
	jsr $B574

	lda.b #$36	// Print dolls
	ldy.b #$29
	jsr menu_draw_dolls

//----------------------------------------------------------

	jsr $B5B5	// Second Quest

	ldy.b #$39
	jsr menu_draw_triforce

//----------------------------------------------------------

	lda.b #$20	// Print names
	sta.b $00

	lda.b #$E7
	sta.b $01

	jsr $B529
	rts

//----------------------------------------------------------

menu_draw_dolls:
	ldx.b $1A	// Active slots
	stx.b $01	// $01, $02 = temp

	ldx.b #$00	// Slot No.
	stx.b $00

	ldx.b #$08

.loop1:
	pha

	sta.w $020C,x	// Ypos

	tya
	sta.w $020F,x	// Xpos

//----------------------------------------------------------

	lsr.b $01
	bcc .sword

.plain:
	dec.w $020C,x	// Adjust Ypos

	lda.b #$A8	// Plain doll
	sta.w $020D,x

	dec.w $020F,x	// Adjust Xpos

	bne .color

.sword:
	lda.b #$D0	// Sword doll
	sta.w $020D,x

//----------------------------------------------------------

.color:
	lda.b $10	// Erase slot
	eor.b $00
	beq .gray

	lda.b $11	// Copy slot
	eor.b $00
	beq .red

	bcs .faded	// Inactive slot

.green:
	lda.b #$00
	beq .next

.gray:
	lda.b #$03
	bne .next

.red:
	lda.b #$01
	bne .next

.faded:
	lda.b #$02

//----------------------------------------------------------

.next:
	sta $020E,x

	pla
	clc
	adc.b #$18

	inc.b $00

	dex
	dex
	dex
	dex
	bpl .loop1

	rts

	//nop #13

//warnpc $B4FD

//##########################################################

bank 6;
org $B780	// 0x1B790

main_menu_mode2_init:
	ldx.b #$A5

	ldy.b #$00	// Attribute 1-2

	lda.b $1A	// Saves active
	sta.b $00

.save1:
	lsr.b $00	// Save 1 disabled
	bcc .save2

	tya
	ora.b #$05
	tay

//----------------------------------------------------------

.save2:
	lsr.b $00	// Save 2 disabled
	bcc .attr12

	tya
	ora.b #$50
	tay

.attr12:
	lda.b #$27
	sta.w $7FA5+0

	lda.b #$D4
	sta.w $7FA5+1

	lda.b #$03
	sta.w $7FA5+2

	sty.w $7FA5+3
	sty.w $7FA5+4
	sty.w $7FA5+5

//----------------------------------------------------------

.save3:
	ldy.b #$00

	lsr.b $00	// Save 3 disabled
	bcc .attr3

	ldy.b #$50

.attr3:
	lda.b #$27
	sta.w $7FA5+6

	lda.b #$DC
	sta.w $7FA5+7

	lda.b #$03
	sta.w $7FA5+8

	sty.w $7FA5+9
	sty.w $7FA5+10
	sty.w $7FA5+11

	lda.b #$FF
	sta.w $7FA5+12

//==========================================================

	lda.b #$05	// Upload 7F00 code
	sta.w $0725

	//lda.b #$00	// Cursor default position
	//sta.b $19

	lda.b #$FF	// Reset copy, erase cursor
	sta.b $10
	sta.b $11
	
	jmp bank6_rts_bank5


//----------------------------------------------------------

bank6_jmp_bank5:
	txa		// PC
	pha

	tya
	pha


// Fall-through
bank6_rts_bank5:
	lda.b #$05	// Menu bank
	sta.w $0769

	jmp $FFC9	

//----------------------------------------------------------

main_menu_exit_check:
	lda.b $19	// Cursor select
	sta.b $13

.load:
	cmp.b #$03
	bcs .copy_erase

	tax		// Register = not created
	lda.w .file_active,x
	and.b $1A
	beq .exit

	lda.b #$01	// Okay sound
	sta.b $EB

	lda.b #$03
	sta.b $19

	bne .exit

//----------------------------------------------------------

.copy_erase:
	lda.b #$01	// Okay sound
	sta.b $EB

	lda.b #$04	// Copy / Erase
	sta.b $19

//----------------------------------------------------------

.exit:
	lda.b #$00
	sta.w $073E
	sta.w $073B

	jmp bank6_rts_bank5

.file_active:
	db $01,$02,$04

//----------------------------------------------------------

register_name_menu:
	ldy.w $073E
	dey
	bne .mode2

	jmp register_menu_init


//=========================================================

.mode2:
	lda.b #$00	// Enable screen
	sta.w $0726


	lda.b $F5	// Joypad 1 = start
	and.b #$10
	beq .draw_cursor1

	lda.b #$08	// Create sound
	sta.b $EB

	ldy.b $19
	ldx.w .name_slot,y
	ldy.b #$08	// Blank name

.loop2:
	lda.w $0300,x
	cmp.b #$F4
	bne .exit1

	dex
	dey
	bne .loop2

	lda.b #$04	// Quit sound
	sta.b $EB

.exit1:
	lda.b #$00
	sta.w $073E

	inc.w $073B
	jmp bank6_rts_bank5

.name_slot:
	db $0C,$17,$22

//----------------------------------------------------------

.draw_cursor1:
	ldx.b $19	// Fairy
	lda.w .cursor_ypos1,x
	sta.b $1B

	lda.b #$1C	// Xpos
	sta.b $4D

	ldx.b #(register_menu_draw>>8)
	ldy.b #((register_menu_draw-1)>>0)

	jmp bank6_jmp_bank5

//----------------------------------------------------------

.cursor_ypos1:
	db $36,$4E,$66

//----------------------------------------------------------

copy_erase_menu:
	ldy.w $073E	// Submode
	bne .mode0

	jmp copy_erase_menu_init

//----------------------------------------------------------

.mode0:
	lda.b $13	// Copy or erase
	cmp.b #$03
	beq .copy_mode0

	jmp .erase_mode0

//----------------------------------------------------------

.copy_mode0:
	dey
	bne .copy_mode1

	ldx.b #(.menu_end-.menu-1)

.loop3:
	lda .menu,x
	sta.w $7F00,x

	dex
	bpl .loop3

	lda.b #$05	// Vram $7F00 copy
	sta.w $0725

	inc.w $73E

	jmp bank6_rts_bank5

//----------------------------------------------------------

.menu:
	db $20,$4A,$0B," COPY SAVE "
	db $22,$A8,$10,"COPY WHICH SAVE",$B9

	db $3F,$0C,$04,$0F,$16,$06,$16	// Red
	db $3F,$1C,$04,$0F,$00,$30,$10	// Gray

	db $FF

.menu_end:

//----------------------------------------------------------

.copy_mode1:
	lda.b #$00	// Enable screen
	sta.w $0726

	dey
	bne .copy_mode2

	jmp .input_menu1

//----------------------------------------------------------

.copy_mode2:
	dey
	bne .copy_mode3

	ldx.b #(.menu1_end-.menu1-1)

.loop4:
	lda .menu1,x
	sta.w $7F00,x

	dex
	bpl .loop4


//----------------------------------------------------------

	ldy.b $19	// Copy slot
	ldx.b #(.menu1_attr-.menu1)

	lda.b $1A	// Active slot
	sta.b $00

	lda.w .red1,y
	lsr.b $00
	bcc .attr1

	ora.b #$50	// Faded


.attr1:
	sta.w $7F03,x

	lda.w .red2,y
	lsr.b $00
	bcc .attr2

	ora.b #$50	// Faded

.attr2:
	sta.w $7F07,x

	lda.w .red3,y
	lsr.b $00
	bcc .attr3

	ora.b #$05	// Faded

.attr3:
	sta.w $7F0B,x

//----------------------------------------------------------

	lda.b $19	// Copy slot
	sta.b $11

	lda.b #$05	// Vram $7F00 copy
	sta.w $0725

	lda.b #$00	// Reset cursor
	sta.b $19

	inc.w $073E
	jmp .draw_sprites

//----------------------------------------------------------

.menu1:
	db $22,$A8,$10,"TO WHICH SLOT",$B9,"  "

.menu1_attr:
	db $23,$C9,$07|$40,$00	// Save 1
	db $23,$D1,$07|$40,$00	// Save 2
	db $23,$D9,$07|$40,$00	// Save 3

	db $FF

.menu1_end:

//----------------------------------------------------------

.red1:
	db $F0,$00,$00
.red2:
	db $0F,$F0,$00
.red3:
	db $00,$00,$FF

//----------------------------------------------------------

.copy_mode3:
	dey
	bne .copy_mode4

	ldx.b $19	// Skip copy slot
	cpx.b $11
	bne .exit2

	inx
	cpx.b #$03
	bne .exit2

	ldx.b #$00

.exit2:
	stx.b $19

	jmp .input_menu3

//----------------------------------------------------------

.copy_mode4:
	dey
	beq .init

	jmp .copy_mode5

.init:
	ldx.b #(.menu2_end-.menu2)

.loop5:
	lda.w .menu2-1,x
	sta.w $7F00-1,x

	dex
	bne .loop5

//----------------------------------------------------------

	ldx.b #(.menu2_attr-.menu2)

	lda.b $1A	// Active slot
	sta.b $00

//----------------------------------------------------------

.save11:
	lsr.b $00

	ldy.b $19	// Erase slot
	lda.w .gray_attr+0,y

	ldy.b $11	// Copy slot
	ora.w .red_attr+0,y
	bne .attr11


	lda.b #$50	// Inactive slot
	bcc .save22


.attr11:
	sta.w $7F03,x

//----------------------------------------------------------

.save22:
	lsr.b $00

	ldy.b $19	// Erase slot
	lda.w	.gray_attr+3,y

	ldy.b $11	// Copy slot
	ora.w	.red_attr+3,y
	bne .attr22


	lda.b #$50	// Inactive slot
	bcc .save33

.attr22:
	sta.w $7F07,x

//----------------------------------------------------------

.save33:
	lsr.b $00

	ldy.b $19	// Erase slot
	lda.w	.gray_attr+6,y

	ldy.b $11	// Copy slot
	ora.w	.red_attr+6,y
	bne .attr33

	lda.b #$05	// Inactive slot
	bcc .exit3

.attr33:
	sta.w $7F0B,x

//----------------------------------------------------------

.exit3:
	lda.b $19	// Erase slot
	sta.b $10

	clc
	adc.b #($D0+1)
	sta.w $7F12

	lda.b $11	// Copy slot
	adc.b #($D0+1)
	sta.w $7F0D

	lda.b #$05	// Vram $7F00 copy
	sta.w $0725

	lda.b #$00	// Reset cursor
	sta.b $19

	inc.w $073E
	jmp .draw_sprites

//----------------------------------------------------------

.menu2:
	db $22,$A8,$11,"COPY FROM 1 TO 2",$B9

	db $22,$EB,$04,"OKAY"
	db $23,$2B,$04,"QUIT"

	// From (red), to (gray-blue)
	db $23,$EB,$03,$0F,$0F,$05

.menu2_attr:
	db $23,$C9,$07|$40,$00	// Save 1
	db $23,$D1,$07|$40,$00	// Save 2
	db $23,$D9,$07|$40,$00	// Save 3

	db $FF

.menu2_end:

//----------------------------------------------------------

.red_attr:
	db $F0,$00,$00
	db $0F,$F0,$00
	db $00,$00,$FF

.gray_attr:
	db $A0,$00,$00
	db $0A,$A0,$00
	db $00,$00,$AA

//----------------------------------------------------------

.copy_mode5:
	jmp .input_menu2

//----------------------------------------------------------

.erase_mode0:
	dey
	bne .erase_mode1

	ldx.b #(.menu3_end-.menu3-1)

.loop6:
	lda .menu3,x
	sta.w $7F00,x

	dex
	bpl .loop6

	lda.b #$05	// Vram $7F00 copy
	sta.w $0725

	inc.w $073E

	jmp bank6_rts_bank5

//----------------------------------------------------------

.menu3:
	db $20,$4A,$0C," ERASE SAVE "
	db $22,$A8,$11,"ERASE WHICH SAVE",$B9

	db $3F,$0C,$04,$0F,$16,$06,$16	// Red
	db $3F,$14,$04,$0F,$02,$27,$30	// Blue
	db $3F,$1C,$04,$0F,$00,$30,$10	// Gray

	db $FF

.menu3_end:

//==========================================================

.erase_mode1:
	lda.b #$00	// Enable screen
	sta.w $0726

	dey
	bne .erase_mode2

	jmp .input_menu1

//==========================================================

.erase_mode2:
	dey
	beq .init1

	jmp .erase_mode3

.init1:
	ldx.b #(.menu4_end-.menu4)

.loop7:
	lda.w .menu4-1,x
	sta.w $7F00-1,x

	dex
	bne .loop7

//----------------------------------------------------------

	ldy.b $19	// Erase slot
	ldx.b #(.menu4_attr-.menu4)

	lda.b $1A	// Active slot
	sta.b $00

	lda.w	.gray1,y
	lsr.b $00
	bcc .attr111

	ora.b #$50	// Faded

.attr111:
	sta.w $7F03,x

	lda.w	.gray2,y
	lsr.b $00
	bcc .attr222

	ora.b #$50	// Faded

.attr222:
	sta.w $7F07,x

	lda.w	.gray3,y
	lsr.b $00
	bcc .attr333

	ora.b #$05	// Faded

.attr333:
	sta.w $7F0B,x

//----------------------------------------------------------

	lda.b $19	// Erase slot
	sta.b $10

	clc
	adc.b #($D0+1)
	sta.w $7F10

	lda.b #$05	// Vram $7F00 copy
	sta.w $0725

	lda.b #$00	// Reset cursor
	sta.b $19


	inc.w $073E
	jmp .draw_sprites

//----------------------------------------------------------

.menu4:
	db $22,$A8,$11,"ERASE PLAYER 1",$B9,"  "

	db $22,$EB,$04,"OKAY"
	db $23,$2B,$04,"QUIT"

	// Player x (red)
	db $23,$EB,$03,$0C,$0F,$03

.menu4_attr:
	db $23,$C9,$07|$40,$00	// Save 1
	db $23,$D1,$07|$40,$00	// Save 2
	db $23,$D9,$07|$40,$00	// Save 3

	db $FF

.menu4_end:

//----------------------------------------------------------

.gray1:
	db $A0,$00,$00
.gray2:
	db $0A,$A0,$00
.gray3:
	db $00,$00,$AA


//==========================================================
//==========================================================

.erase_mode3:
	jmp .input_menu2

//==========================================================
//==========================================================

.quit:
	lda.b #$00
	sta.w $073E
	sta.w $073B

	lda.b #$00	// Main menu
	sta.w $0736

	jmp bank6_rts_bank5

//----------------------------------------------------------

.draw_sprites:

.copy_cursor:
	ldx.b $11
	bmi .erase_cursor

	lda .cursor_ypos2,x
	sta.w $02F4

	lda.b #$6A
	sta.w $02F5

	lda.b #$01	// Red
	sta.w $02F6

	lda.b #$1C
	sta.w $02F7

//----------------------------------------------------------

.erase_cursor:
	ldx.b $10
	bmi .exit4

	lda .cursor_ypos2,x
	sta.w $02F0

	lda.b #$68
	sta.w $02F1

	lda.b #$03	// Grey
	sta.w $02F2

	lda.b #$1C
	sta.w $02F3

//----------------------------------------------------------

.exit4:
	ldx.b #((copy_erase_menu_draw-1)>>8)
	ldy.b #((copy_erase_menu_draw-1)>>0)

	jmp bank6_jmp_bank5

.cursor_ypos2:
	db $36, $4e, $66

//----------------------------------------------------------

.input_menu1:
	ldy.b $19
	ldx.b $F5	// Joypad 1
	txa

//----------------------------------------------------------

.start:
	and.b #$10
	beq .down_cursor1

	cpy.b #$03	// Quit
	beq .abort

	lda.b #$01	// Okay sound
	sta.b $EB

	inc.w $073E
	jmp .draw_menu

.abort:
	lda.b #$00	// Reset cursor
	sta.b $19

	lda.b #$04	// Cancel
	sta.b $EB

	jmp .quit

//----------------------------------------------------------

.down_cursor1:
	txa
	and.b #($04|$20)
	beq .up_cursor1


.loop8:
	iny
	bne .move_cursor1

//----------------------------------------------------------

.up_cursor1:
	txa
	and.b #$08
	beq .draw_menu

	lda.b #$02	// Move sound
	sta.b $20

	dey

//----------------------------------------------------------

.move_cursor1:
	tya
	and.b #$03

	sta.b $19
	tay		// Skip disabled slot
	lda.w .save_active,y
	and.b $1A
	bne .input_menu1

	lda.b #$02	// Move sound
	sta.b $EB

//----------------------------------------------------------

.draw_menu:
	ldx.b $19
	lda.w .cursor_ypos3,x
	sta.b $1B

	lda.b #$1C	// Xpos
	sta.b $4D

	jmp .draw_sprites

//----------------------------------------------------------

.cursor_ypos3:
	db $36,$4E,$66,$7C

.save_active:
	db $01,$02,$04,$00


//----------------------------------------------------------
//----------------------------------------------------------

.input_menu2:
	ldy.b $19
	ldx.b $F5	// Joypad 1
	txa

.start:
	and.b #$10
	beq .down_cursor2

	tya
	bne .quit1

	lda.b #$01	// Okay sound
	sta.b $EB

	lda.b $13	// Copy or erase
	cmp.b #$03
	beq .copy

	jmp .erase_save

.copy:
	jmp .copy_save

.quit1:
	lda.b $10	// Reset cursor
	sta.b $19

	lda.b #$04	// Cancel
	sta.b $EB

	jmp .quit

//----------------------------------------------------------

.down_cursor2:
	txa
	and.b #($04|$20)
	beq .up_cursor2

	iny
	bne .move_cursor2

//----------------------------------------------------------

.up_cursor2:
	txa
	and.b #$08
	beq .draw_cursor2

	dey

//----------------------------------------------------------

.move_cursor2:
	lda.b #$02	// Move sound
	sta.b $EB


	tya
	and.b #$01

	sta.b $19

//----------------------------------------------------------

.draw_cursor2:
	ldx.b $19
	lda.w .cursor_ypos4,x
	sta.b $1B

	lda.b #$4C	// Xpos
	sta.b $4D

	jmp .draw_sprites

.cursor_ypos4:
	db $B4,$C4

//----------------------------------------------------------
//----------------------------------------------------------

.input_menu3:
	ldy.b $19
	ldx.b $F5	// Joypad 1
	txa

//----------------------------------------------------------

.start:
	and.b #$10
	beq	.down_cursor3

	cpy.b #$03	// Quit
	beq .abort1

	lda.b #$01	// Okay sound
	sta.b $EB

	inc.w $073E
	jmp .draw_menu1

.abort1:
	lda.b $11	// Reset cursor
	sta.b $19

	lda.b #$04	// Quit sound
	sta.b $EB

	jmp .quit

//----------------------------------------------------------

.down_cursor3:
	txa
	and.b #($04|$20)
	beq .up_cursor

	iny
	bne .move_cursor3

//----------------------------------------------------------

.up_cursor:
	txa
	and.b #$08
	beq .draw_menu1

	dey

//----------------------------------------------------------

.move_cursor3:
	tya
	and.b #$03

	sta.b $19

	cpy.b $11	// Skip copy slot
	beq .input_menu3

	lda.b #$02	// Move sound
	sta.b $EB

//----------------------------------------------------------

.draw_menu1:
	ldx.b $19
	lda.w .cursor_ypos5,x
	sta.b $1B

	lda.b #$1C	// Xpos
	sta.b $4D

	jmp .draw_sprites

//----------------------------------------------------------

.cursor_ypos5:
	db $36,$4E,$66,$7C

.save_active:
	db $01,$02,$04,$00


//----------------------------------------------------------
//----------------------------------------------------------

.copy_save:
	lda.b #$08	// Erase sound
	sta.b $EB

	lda.b $10	// Save slot
	sta.b $19

	ldx.b #(menu_copy_file>>8)
	ldy.b #((menu_copy_file-1)>>0)

	jmp bank6_jmp_bank5
//==========================================================
//==========================================================

.erase_save:
	lda.b $10	// Erase slot
	sta.b $19

	ldx.b #(menu_erase_file>>8)
	ldy.b #((menu_erase_file-1)>>0)

	jmp bank6_jmp_bank5

//----------------------------------------------------------
//----------------------------------------------------------

copy_erase_menu_init:
	ldx.b #(.menu_end-.menu)

.loop9:
	lda.w .menu-1,x
	sta.w $7F00-1,x

	dex
	bne .loop9

//----------------------------------------------------------

	lda.b $1A	// Active saves
	sta.b $1F

.save1:
	lsr.b $1F
	bcs .save1_off

	ldx.b #$00
	ldy.b #(.menu_stats+0-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+0-.menu)
	jsr menu_print_deaths

	jmp .save2


.save1_off:
	lda.b #$50

	ldx.b #(.menu_attr+0-.menu)
	sta.w $7F03,x

//----------------------------------------------------------

.save2:
	lsr.b $1F
	bcs .save2_off

	ldx.b #$32
	ldy.b #(.menu_stats+14-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+6-.menu)
	jsr menu_print_deaths

	jmp .save3


.save2_off:
	lda.b #$50

	ldx.b #(.menu_attr+4-.menu)
	sta.w $7F03,x

//----------------------------------------------------------

.save3:
	lsr.b $1F
	bcs .save3_off


	ldx.b #$64
	ldy.b #(.menu_stats+28-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+12-.menu)
	jsr menu_print_deaths

	jmp .start_cursor

.save3_off:
	lda.b #$05

	ldx.b #(.menu_attr+8-.menu)
	sta.w $7F03,x

//----------------------------------------------------------

.start_cursor:
	ldx.b #$00	// Initial cursor

	lda.b $1A	// Save 1
	lsr
	bcc .exit
	inx		// Save 2
	lsr
	bcc .exit

	inx		// Save 3
	lsr
	bcc .exit

	inx		// Quit

//----------------------------------------------------------

.exit:
	stx.b $19	// Initial cursor

	lda.b #$05	// Vram $7F00 copy
	sta.w $0725

	lda.b #$08	// Flag copy, erase mode
	ora.b $1A
	sta.b $1A

	lda.b #$FF	// Reset copy, erase cursor
	sta.b $10
	sta.b $11

	inc.w $073E

	jmp bank6_rts_bank5


//----------------------------------------------------------
//----------------------------------------------------------

.menu:
	// Title bar
	db $20,$43,$5A,$CB

	// Text box
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

//----------------------------------------------------------
//----------------------------------------------------------

register_menu_init:
	ldx.b #(.menu_end-.menu)

.loop10:
	lda.w .menu-1,x
	sta.w $7F00-1,x

	dex
	bne .loop10

//----------------------------------------------------------

	lda.b $1A	// Active saves
	sta.b $1F

.save1:
	lsr.b $1F
	bcs .save1_off

	ldx.b #$00
	ldy.b #(.menu_stats+0-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+0-.menu)
	jsr menu_print_deaths

	jmp .save2

.save1_off:
	lda.b #$F0	// Creation save

	ldx.b $13
	beq .save1_attr

	lda.b #$50

.save1_attr:
	ldx.b #(.menu_attr+0-.menu)
	sta.w $7F03,x

//----------------------------------------------------------

.save2:
	lsr.b $1F
	bcs .save2_off

	ldx.b #$32
	ldy.b #(.menu_stats+14-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+6-.menu)
	jsr menu_print_deaths

	jmp .save3

.save2_off:
	lda.b #$F0	// Creation save

	ldx.b $13
	cpx.b #$01
	beq .save2_attr

	lda.b #$50	// Faded

.save2_attr:
	ldx.b #(.menu_attr+4-.menu)
	sta.w $7F03,x

//----------------------------------------------------------

.save3:
	lsr.b $1F
	bcs .save3_off

	ldx.b #$64
	ldy.b #(.menu_stats+28-.menu)
	jsr menu_print_stats

	lda.b #(.menu_deaths+12-.menu)
	jsr menu_print_deaths

	jmp .exit

.save3_off:
	lda.b #$0F	// Creation save

	ldx.b $13
	cpx.b #$02
	beq .save3_attr

	lda.b #$05	// Faded

.save3_attr:
	ldx.b #(.menu_attr+8-.menu)
	sta.w $7F03,x

//----------------------------------------------------------

.exit:
	lda.b $13	// Initial cursor
	sta.b $19

	lda.b #$05	// Vram $7f00 copy
	sta.w $0725

	lda.b #$08	// Flag copy, erase mode
	ora.b $1A
	sta.b $1A

	lda.b #$FF	// Reset copy, erase cursor
	sta.b $10
	sta.b $11

	inc.w $073E

	jmp bank6_rts_bank5

//----------------------------------------------------------
//----------------------------------------------------------

.menu:
	// New title bar
	db $20,$43,$18
	db $CB,$CB," REGISTER YOUR NAME ",$CB,$CB

	// Old title bar
	db $20,$63,$5A,$F4

	db $20,$A7,$06,"-NAME-"
	db $20,$B2,$07,"-LEVEL-"

	db $3F,$0C,$04,$0F,$2A,$0A,$2A	// Green

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


//----------------------------------------------------------
//----------------------------------------------------------

menu_print_stats:
	lda.w $6002,x	// Attack
	ora.b #$D0
	sta.w $7F05,y

	lda.w $6003,x	// Magic
	ora.b #$D0
	sta.w $7F09,y

	lda.w $6004,x	// Life
	ora.b #$D0
	sta.w $7F0D,y

	rts

//----------------------------------------------------------
//----------------------------------------------------------

menu_print_deaths:
	sta.b $02

	lda.b #$00
	sta.b $00

	lda.w $6002,x
	jsr .print_number


	ldx.b $02
	sta.w $7F05,x

	tya
	sta.w $7F04,x

	lda.b $00
	sta.w $7F03,x

	rts

//==========================================================
//==========================================================

.print_number:
	lda.b #$00


	ldy.b #$D0	// 0-9 Tile No.

.loop11:
	iny
	sec
	sbc.b #$E8
	bcs .loop11_next

	dec.b $00

.loop11_next:
	dec.b $00
	dec.b $00
	dec.b $00
	bpl .loop11

	clc
	adc.b #$E8
	bcc .digit1

	inc.b $00

.digit1:
	inc.b $00
	inc.b $00
	inc.b $00

	dey
	sty.b $01

//----------------------------------------------------------

	ldy.b #$D0

.loop12:
	iny
	sec
	sbc.b #$64
	bcs .loop12

	dec.b $00
	bpl .loop12

	adc.b #$64	// X--
	dey
	sty.b $00

//----------------------------------------------------------

	ldy.b #$D0

.loop13:
	iny
	sec
	sbc.b #$0A
	bcs .loop13

	adc.b #$DA	// --X
	dey		// -X-
	rts

//warnpc $BF70

//##########################################################
//##########################################################

// Bugfix for the alphabet cursor covering the box line
bank 5;
org $B759	// 0x17769 (Name)
	lda.b #$C7	// LDA #$FF

org $B86C	// 0x1787C (Letters Box)
	lda.b #$C7	// LDA #$FF	

// File Selection Palettes for Link
org $BC08	// 0x17C18
	db $0F,$07,$37,$2A	// Originally 0F 18 36 2A

// File Selection Text and Tiles/Sprites
org $BC3B	// 0x17C4B
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

// Rename REGISTER YOUR NAME to COPY SAVE
org $BC78	// 0x17C88
	db $22,$45,$12
	db "COPY SAVE         "	// Rewrite "REGISTER YOUR NAME"


// Rename ELIMINATION MODE to ERASE SAVE FILE
org $BC9F	// 0x17CAF
	db $22,$A5,$10
	db "ERASE SAVE      "	// Rewrite "ELIMINATION MODE"

// Change "-" to dash "/" in REGISTER NAME
org $BD3B	// 0x17D4B
	db $CE


// Change "-" to dash "/" in ELIMINATION MODE
org $BD8F	// 0x17D9F
	db $CE

