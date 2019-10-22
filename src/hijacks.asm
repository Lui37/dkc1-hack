@include

org hijack_level
		JSL every_igt_frame
		NOP
		
org hijack_lives
		JSL handle_displays
		
; install real 60Hz counter
org hijack_every_frame
		JMP end_bananas+1
org end_bananas+1
		LDA.l !counter_60hz
		INC
		STA.l !counter_60hz
		JMP ($001C)
		
org hijack_map
		JSL every_map_frame
		