//****************************************************************
//	Fix for the Fairy not being able to pass through doors
//			    by Trax
//****************************************************************

bank 7;
org $E4F5	// 0x1E505
// Changes a branch on carry set
	bcs $00	// Originally BCS $58

org $E54F	// 0x1E45F
	lda.b $A8,x	// Enemy state
	and.b #$EF	// Keep bits XXX. XXXX
	sta.b $A8,x
	rts
