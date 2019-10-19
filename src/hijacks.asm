@include

org hijack_level
		JSL every_igt_frame
		NOP
		
org hijack_lives
		JSL handle_displays
		
org hijack_map
		JSL every_map_frame
		