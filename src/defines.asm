@include

if !rom_revision == 0
	hijack_level = $8080F2
	hijack_lives = $80A1B5
	hijack_every_frame = $80A97D
	end_bananas = $80A3D2
	freerom_80 = $80A3D3
	hijack_map = $80E906
	draw_digit = $B88789
	wram_clear_2 = $B88278
	freerom_B8 = $B8F200
endif

; constants
!dropped_frames_x = $0008
!dropped_frames_y = $0900
!timer_x = $00CC
!timer_y = $0900
!map_time_x = $00B8
!map_time_y = $CC00
!map_double_quotes = $82
!map_single_quote = $87
!map_props_mask = $3400

; wram
!freeram = $1F00

!freeram_used = 0
macro def_freeram(id, size)
	!<id> := !freeram+!freeram_used
	!freeram_used #= !freeram_used+<size>
endmacro

!fade_type = $051B
!pause_flags = $0579
!accept_inputs = $1929


%def_freeram(counter_60hz, 2)
%def_freeram(previous_60hz, 2)

%def_freeram(dropped_frames, 2)
%def_freeram(real_frames_elapsed, 2)

%def_freeram(timer_frames, 2)
%def_freeram(timer_seconds, 2)
%def_freeram(timer_minutes, 2)

%def_freeram(timer_disp_frames, 2)
%def_freeram(timer_disp_seconds, 2)
%def_freeram(timer_disp_minutes, 2)

%def_freeram(timer_started, 2)


assert !freeram+!freeram_used < $2000, "exceeded freeram area"
