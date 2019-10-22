@include

org end_bananas
		RTS

; skip clearing 7E:1F00-2000 area
org wram_clear_2
		LDX #$1F00
		