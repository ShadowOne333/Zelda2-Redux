;****************************************************************
;	Fix for the Fairy not being able to pass through doors
;			    by Trax
;****************************************************************

; Changes a branch on carry set
%org($E4F5,7)	; 0x1E505
	bcs $00	; Originally BCS $58

%org($E54F,7)	; 0x1E45F
	lda $A8,x	; Enemy state
	and #$EF	; Keep bits XXX. XXXX
	sta $A8,x
	rts
