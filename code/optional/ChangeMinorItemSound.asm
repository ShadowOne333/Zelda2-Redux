;****************************************************************
;    Change the Sound that plays when grabbing a minor item
;****************************************************************

; Sound for Items already available in-ground inside Temples
%org($E79A,7)	; 0x1E7AA
	lda #$02	; Originally LDA #$08
	sta $EC	; Originally STA $EF, SFX Type 4
; Changed SFX Type from 4 to 1

; Sound for Items already available in-ground in Overworld
%org($E802,7)	; 0x1E812
	lda #$02	; Originally LDA #$08
	sta $EC	; Originally STA $EF, SFX Type 4

; Sound for Item drops from enemies
%org($E847,7)	; 0x1E857
	lda #$02	; Originally LDA #$08
	sta $EC	; Originally STA $EF, SFX Type 4
