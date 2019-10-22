@include

org end_bananas
		RTS
		
org dec_lives_1
		BRA + : NOP : +
		
org dec_lives_2
		BRA + : NOP : +

; skip clearing 7E:1F00-2000 area
org wram_clear_2
		LDX #$1F00
		