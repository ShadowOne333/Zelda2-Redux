;****************************************************************
;    Change Blue Tunic to Red Tunic at Level 7 instead of 5
;****************************************************************

%org($AAC0,0)	; 0x02AD0
	lda $0779	; Load Life level
	cmp #$07	; Check if Life/Defense level = 7
