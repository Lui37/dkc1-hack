@include

handle_displays:
		LDA !timer_started
		BNE .active
		LDA !accept_inputs
		BEQ .start
		STZ !timer_disp_frames
		STZ !timer_disp_seconds
		STZ !timer_disp_minutes
		BRA .draw
		
	.start:
		INC !timer_started
		BRA .update
		
	.active:
		LDA !fade_type
		AND #$0080
		BNE .draw
		
	.update:
		LDA !timer_frames
		STA !timer_disp_frames
		LDA !timer_seconds
		STA !timer_disp_seconds
		LDA !timer_minutes
		STA !timer_disp_minutes
		
	.draw:
		; starting x position
		LDX #!timer_x
		; starting y position
		LDA #!timer_y
		STA $4C
		; properties
		LDA #$3000
		STA $4E
		
		LDA !timer_disp_minutes
		JSR draw_digit
		TXA
		CLC
		ADC #$000A
		TAX
		; tens
		LDA !timer_disp_seconds
		LSR #4
		JSR draw_digit
		TXA
		CLC
		ADC #$0008
		TAX
		; units
		LDA !timer_disp_seconds
		AND #$000F
		JSR draw_digit
		TXA
		CLC
		ADC #$000A
		TAX
		; tens
		LDA !timer_disp_frames
		LSR #4
		JSR draw_digit
		TXA
		CLC
		ADC #$0008
		TAX
		; units
		LDA !timer_disp_frames
		AND #$000F
		JSR draw_digit
		
draw_dropped_frames:
		; starting x position
		LDX #!dropped_frames_x
		; starting y position
		LDA #!dropped_frames_y
		STA $4C
		
		; check hundreds
		LDA !dropped_frames
		CMP #$0999
		BCC .no_cap
		LDA #$0009
		JSR draw_digit
		LDA #$0009
		JSR draw_digit
		LDA #$0009
		BRA .last
		
	.no_cap:
		; hundreds
		XBA
		AND #$00FF
		JSR draw_digit
		TXA
		CLC
		ADC #$0008
		TAX
		; tens
		LDA !dropped_frames
		LSR #4
		AND #$000F
		JSR draw_digit
		TXA
		CLC
		ADC #$0008
		TAX
		; units
		LDA !dropped_frames
		AND #$000F
	.last:
		JSR draw_digit
		RTL
		