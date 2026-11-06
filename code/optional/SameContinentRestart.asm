;*************************************
;	Same Continent Restart
;	hack by suloku
;*************************************
; When Link runs out of lives, instead of always respawning at Zelda's Palace, he will respawn on the same continent he died:
;	* Die in the Western Continent: respawn at Zelda's Palace
;	* Die in Death Mountain area: respawn at the westernmost screen of Saria.
;	* Die in the Eastern Continent: respawn at Nabooru
;	* Die in the Maze Island: respan at Nabooru
;	* Die in the Great Palace's Path of Fire (check "PathOfFire.png"): respawn at deserted Kasuto as long as you have the Thunder spell or have read the signpost at deserted Kasuto. If those conditions don't apply, respawn at Nabooru.
;-------------------------------------
;// Original code at AA08
%org($AA08,0)	; 0x02A18
startup_init_begin_game:
;	sta $0738	; 0x2a18 $AA08 8D 38 07	;
;	sta $0706	; 0x2a1b $AA0B 8D 06 07	; Current Region
;	sta $0707	; 0x2a1e $AA0E 8D 07 07	; Current World
;	sta $0561	; 0x2a21 $AA11 8D 61 05	; Area Code
;	sta $0748	; 0x2a24 $AA14 8D 48 07	; Area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
;	sta $073F	; 0x2a27 $AA17 8D 3F 07	;
;	sta $075C	; 0x2a2a $AA1A 8D 5C 07	; Position code when entering area (0-3)
;	sta $0701	; 0x2a2d $AA1D 8D 01 07	; Facing direction when entering area

;Since everything is initialized to zero, modified order to save a couple bytes

	sta $0738	; 0x2a18 $AA08 8D 38 07	; ???
	sta $073F	; 0x2a27 $AA17 8D 3F 07	; ???
;	sta $0706	; 0x2a1b $AA0B 8D 06 07	; Current Region
;	sta $0707	; 0x2a1e $AA0E 8D 07 07	; Current World
	jmp Restart_Same_Continent	; Jump to patch function

Continue_Zelda_Palace_Init:
	sta $0707	; 0x2a1e $AA0E 8D 07 07	; Current World
	sta $0561	; 0x2a21 $AA11 8D 61 05	; Area Code
	sta $0748	; 0x2a24 $AA14 8D 48 07	;; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
	sta $075C	; 0x2a2a $AA1A 8D 5C 07	; Position code when entering area (0-3)
	sta $0701	; 0x2a2d $AA1D 8D 01 07	; Facing direction when entering area

;;;;;;;;;;;;;;;;;;;;;;;;;;

;ADE6 - Moved to ADB0, right after the end of the Run asm optional code
%org($ADB0,0)	; 0x02DC0
Restart_Same_Continent:
	lda $706	; Current world
	cmp #$00
	beq Zelda_Palace_respawn
	cmp #$01
	beq Check_MazeIsland
	jmp Great_Palace_Trail

Zelda_Palace_respawn:
	;Set A to zero again
	ldx #$00	; 0x1d2a3 $D293 A2 00	; X = 00
	txa
	sta $0706	; 0x2a1b $AA0B 8D 06 07	; Current Region
	jmp $AA11	; Continue_Zelda_Palace_Init

 East_Hyrule_Nabooru_Respawn:
	; Spawn at Nabooru (we need to set 0701, 0706, 0707, 0561, 056B, 056C, 0748 and 075C
	lda #$01
	sta $0701	; Facing direction when entering area, how Link enters the screen	0=left, 1=right

	lda #$02
	sta $0706	; overworld index (0=west hyrule, 1=death mtn/maze island, 2=east hyrule)
	sta $0707	; "world" (0=caves, enemy encounters...; 1=west hyrule towns; 2=east hyrule towns; 3=palace 1,2,5 ; 4=palace 3,4,6 ; 5=great palace)

	lda #$0E	; For Nabooru 0x0E = Rightmost screen (normal enter location), 0x0C = Leftmost screen
	sta $0561	; scene layout index (doesn't affect location)	; Area Code

	lda #$04
	sta $056B	; Town Code	;used by wise man to pick magic to give?

	lda #$F8
	sta $056C	; Palace Code

	lda #$2C
	sta $0748	; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View

	lda #$03
	sta $075C	; start this many 'pages' into the scene	0	1	2	3		;4 = middle?	; Position code when entering area (0-3) (can be 4)

	jmp $AA20	; Continue startup
Check_MazeIsland:
	; When in Sidescrolling, OW X/Y coordinates are saved to SRAM
	ldy $0748	; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
	;lda $6A00,y	; Area Byte 0 (Y Position)
	lda $6A3F,y	; Area Byte 1 (X Position)
	cmp #$28
	bcs East_Hyrule_Nabooru_Respawn ; If X overworld position is >= $28 we are at Maze Island
	; Fallthrough if we are at Death Mountain

; Respawn at Saria's westernmost screen
	; (we need to set 0701, 0706, 0707, 0561, 056B, 056C, 0748 and 075C
	lda #$00
	sta $0701	; Facing direction when entering area, how Link enters the screen	0=left, 1=right
	sta $0706	; overworld index (0=west hyrule, 1=death mtn/maze island, 2=east hyrule)
	sta $075C	; start this many 'pages' into the scene	0	1	2	3		;4 = middle?	; Position code when entering area (0-3) (can be 4)

	lda #$01
	sta $0707	; "world" (0=caves, enemy encounters...; 1=west hyrule towns; 2=east hyrule towns; 3=palace 1,2,5 ; 4=palace 3,4,6 ; 5=great palace)

	lda #$06	; For Nabooru 0x0E = Rightmost screen (normal enter location), 0x0C = Leftmost screen
	sta $0561	; scene layout index (doesn't affect location)	; Area Code

	lda #$02
	sta $056B	; Town Code	;used by wise man to pick magic to give?

	lda #$FC
	sta $056C	; Palace Code

	lda #$30
	sta $0748	; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View

	jmp $AA20	; Continue startup

Great_Palace_Trail:
	; Y > 0x47
	; X < 0x0f
	ldy $0748	; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View
	lda $6A00,y	; Area Byte 0 (Y Position)
	cmp #$48
	bcc East_Hyrule_Nabooru_Respawn	; if Y position is < 48, we are not in the Great Palace trail
	lda $6A3F,y	; Area Byte 1 (X Position)
	cmp #$0f
	bcs East_Hyrule_Nabooru_Respawn	; If X overworld position is >= $f we are not in the Great Palace trail
	lda $0782	; Have thunder spell
	cmp #$01
	beq Old_Kasuto_Respawn
	lda $079E
	and #$01	; Flag for having read the signpost at Old Kasuto
	beq East_Hyrule_Nabooru_Respawn
	
; Respawn at Old Kasuto
Old_Kasuto_Respawn:
	; Spawn at Nabooru (we need to set 0701, 0706, 0707, 0561, 056B, 056C, 0748 and 075C
	lda #$01
	sta $0701	; Facing direction when entering area, how Link enters the screen	0=left, 1=right

	lda #$02
	sta $0706	; overworld index (0=west hyrule, 1=death mtn/maze island, 2=east hyrule)
	sta $0707	; "world" (0=caves, enemy encounters...; 1=west hyrule towns; 2=east hyrule towns; 3=palace 1,2,5 ; 4=palace 3,4,6 ; 5=great palace)

	lda #$17	; For Nabooru 0x0E = Rightmost screen (normal enter location), 0x0C = Leftmost screen
	sta $0561	; scene layout index (doesn't affect location)	; Area Code

	lda #$07
	sta $056B	; Town Code	;used by wise man to pick magic to give?

	lda #$FE
	sta $056C	; Palace Code

	lda #$32
	sta $0748	; area location index (the index of the spot on the overworld that pulled you into the sideview)	; Overworld Area out of Side View

	lda #$03
	sta $075C	; start this many 'pages' into the scene	0	1	2	3		;4 = middle?	; Position code when entering area (0-3) (can be 4)

	jmp $AA20	; Continue startup
