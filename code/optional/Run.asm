;*************************************
;	Link Run hack by suloku
;*************************************
; Holding A or B button will make Link's run, allowing for faster traversal in the sidescrolling sections.
; The additional inertia also allows for a longer horizontal jump, but as far as I know this doesn't introduce any skips.
; Note: jump, slash and hold the slash button to be able to jump and run at the same time.
;-------------------------------------
;93FD - Links_Acceleration_Routine Original
%org($93FD,0)	; 0x0140D
	jmp New_Acceleration_Routine	; Jump to new acceleration routine
	nop #23

;9458 - Change the pointer to the delay between animations table to the new one to account for extra speed
%org($9458,0)	; 0x01468
	;lda $93B7,Y	; Original
	lda Animations_Delay,y

;AD09 - New code (right after a routine from Saria bridge's asm 
%org($AD09,0)	; 0x02D19
Run_Max_Velocity:
;	db $22
;	db $DE	; +34 (run right), -34 (run left)
	db $30
	db $D0	; +48 (run right), -48 (run left)

;Table for Delay between animation frames when accelerating (7 bytes) 
Animations_Delay:
	db $08
	db $07
	db $05
	db $04
	db $03
	db $02
	db $02	; Using 01 is too fast
;	db $01

;AD12
New_Acceleration_Routine:
	cpy #$00
	bne left
;=================================================
; RIGHT (y=0)
;=================================================
right:
	lda $F7
	;and #$40 ; Check B button
	and #$C0	; Check A button or B button
	beq right_walk
	lda $70
	cmp Run_Max_Velocity,y
	jmp right_test
right_walk:
	lda $70
	cmp $93B3,y
right_test:
	beq store_same
	bmi accel	; A < max (signed) -> still below max, accelerate
	jmp decel	; A > max (signed) -> overshoot, bleed off
;=================================================
; LEFT (y=1)
;=================================================
left:
	lda $F7
	;and #$40 ; Check B button
	and #$C0	; Check A button or B button
	beq left_walk
	lda $70
	cmp Run_Max_Velocity,y
	jmp left_test
left_walk:
	lda $70
	cmp $93B3,y
left_test:
	beq store_same
	bpl accel	; A > max (signed, ie less negative) -> still approaching, accelerate
	jmp decel	; A < max (signed, ie more negative) -> overshot, bleed off
;=================================================
accel:
	clc
	adc $93b1,y
	jmp store
decel:
	sec
	sbc $93b1,y
	jmp store
store_same:
	lda $70
store:
	sta $70
	iny
	cpy $5F
	beq done
	dey
;=================================================
; opposite-direction double-step check (same signed logic)
;=================================================
	cpy #$00
	bne left2
right2:
	lda $F7
	;and #$40 ; Check B button
	and #$C0	; Check A button or B button
	beq right_walk2
	lda $70
	cmp Run_Max_Velocity,y
	jmp right_test2
right_walk2:
	lda $70
	cmp $93B3,y
right_test2:
	beq done
	bmi accel2
	jmp decel2
left2:
	lda $F7
	;and #$40 ; Check B button
	and #$C0	; Check A button or B button
	beq left_walk2
	lda $70
	cmp Run_Max_Velocity,y
	jmp left_test2
left_walk2:
	lda $70
	cmp $93B3,y
left_test2:
	beq done
	bpl accel2
	jmp decel2
accel2:
	clc
	adc $93b1,y
	jmp store2
decel2:
	sec
	sbc $93b1,y
store2:
	sta $70
done:
	jmp $9419
