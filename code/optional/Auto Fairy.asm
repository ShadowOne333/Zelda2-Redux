;*************************************
;	Auto Fairy hack by suloku
;*************************************
; When Link falls into lava/water, as long as there is enough magic available, the Fairy spell will be cast, avoiding certain death.
; Note: this patch is more useful in the Redux version, since the spell costs are reduced, thus the chances of the spell triggering when you need it are higher.
;------------------------------------
; Original code at E0A4
%org($E0A4,7)	; 0x1E0B4
bank7_Link_touched_Lava_Water:
;	lda #$01	; 0x1e0b4 $E0A4 A9 01	; A = 01
;	sta $E9		; 0x1e0b6 $E0A6 85 E9	;
	jsr $FFC5	; SwapToPRG0
	jsr Auto_Fairy_fall	; Jump to new function in bank 0
	lda $0773	; If magic is set to zero, then link falls into the lava/water
	bne Collision_Logic	; Run collision logic again
IsZero:
	rts ; All the logic has already been run in bank 0

%org($E079,7)	; 0x1E089
Collision_Logic:

;------------------------------------
;ADAA (2DAA0 - Moved to $s2C10 since that's where the free space begins
%org($AC10,0)	; 0x02C20
Auto_Fairy_fall:
	lda $077E	; Fairy Spell flag
	beq Cant_Use_Fairy_Spell
	lda $076f	; Magic status flags
	and #$08	; Check Fairy Flag
	bne Cant_Use_Fairy_Spell ; Fairy Spell already in use
	; If we are here link has the fairy spell
	lda #$03	; Fairy spell index
	sta $0749	; Current position of Magic selector
	
	; Cast fairy spell using the game's code (since we are already in bank 0 and the function is there)
	jsr $8DDC	; Call Spell_Casting_Routine just after the game checks if SELECT has been pressed
	
	; Check if Fairy Spell was cast
	lda $076f	; Magic status flags
	and #$08	; Check Fairy Flag
	beq Cant_Use_Fairy_Spell ; Fairy Spell wasn't cast (flag is unset, probably due to not enough magic)
	
Change_Link_Position:
	lda $0029	; Link's Y position
	sec
	sbc #$0A	; Substract 10 pixels to ensure link won't be touching lava/water
	sta $0029	; Write Y position
	jmp Bank_Switch_Back	; Continue code as if bank7_Link_touched_Lava_Water was never jumped to

Cant_Use_Fairy_Spell:
	lda #$00	; Set magic to 0 (will be used as flag to know link is in the lava/water, since this will be reset after dying anyways)
	sta $0773

	; Original bank7_Link_touched_Lava_Water routine
	lda #$01	; 0x1e0b4 $E0A4 A9 01	; A = 01
	sta $E9		; 0x1e0b6 $E0A6 85 E9	;
	lda #$10	; 0x1e0b8 $E0A8 A9 10	; A = 10
	sta $050C
	inc $B5		; 0x1e0bd $E0AD E6 B5	;;2 will make link die in lava	;3 move right like when win game at dark link
Bank_Switch_Back: ; Switches back to bank 1, which was loaded when the original function was being executed
	lda #$01	; 0x1c1d1 $C1C1 A9 06	; A = 06
	jmp $FFCC	;SwapPRG
