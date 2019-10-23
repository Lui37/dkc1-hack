@include

every_map_frame:
		STZ !dropped_frames
		STZ !real_frames_elapsed
		STZ !timer_frames
		STZ !timer_seconds
		STZ !timer_minutes
		STZ !timer_started
		LDA !counter_60hz
		INC
		STA !previous_60hz
		JSR draw_prev_time
		JML read3(hijack_map+1)
		
		
draw_prev_time:
		; starting x position
		LDX #!map_time_x
		; starting y position
		LDA #!map_time_y
		STA $4C
		
		LDA !timer_disp_minutes
		JSR draw_map_digit
		
	if !rom_revision < !j0
			LDA #!map_single_quote
			JSR draw_map_char
	else
			INX
			INX
	endif
		
		LDA !timer_disp_seconds
		LSR #4
		JSR draw_map_digit
		
		LDA !timer_disp_seconds
		AND #$000F
		JSR draw_map_digit
		
	if !rom_revision < !j0
			LDA #!map_double_quotes
			JSR draw_map_char
	else
			INX
			INX
	endif
		
		LDA !timer_disp_frames
		LSR #4
		JSR draw_map_digit
		
		LDA !timer_disp_frames
		AND #$000F
		JMP draw_map_digit
		
		
draw_map:
	.digit:
		CLC
		ADC #!map_numbers_offset
	.char:
		ORA #!map_props_mask
		LDY $8E
		STA $0002,y
		TXA
		ORA $4C
		STA $0000,y
		TYA
		CLC
		ADC #$0008
		STA $8E
		TXA
		CLC
		ADC #$0008
		TAX
		RTS

		