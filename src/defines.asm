@include

if !rom_revision == !u0
	hijack_level = $8080F2
	hijack_lives = $80A1B5
	hijack_every_frame = $80A97D
	end_bananas = $80A3D2
	hijack_map = $80E906
	dec_lives_1 = $B6A85F
	draw_digit = $B88789
	wram_clear_2 = $B88278
	freerom_B8 = $B8F200
	dec_lives_2 = $BEE474
elseif !rom_revision == !u1
	hijack_level = $8080F0
	hijack_lives = $80A1B0
	hijack_every_frame = $80A974
	end_bananas = $80A3C9
	hijack_map = $80E907
	dec_lives_1 = $B6A861
	draw_digit = $B8878C
	wram_clear_2 = $B88278
	freerom_B8 = $B8F260
	dec_lives_2 = $BEE474
elseif !rom_revision == !u2
	hijack_level = $8080F0
	hijack_lives = $80A1C3
	hijack_every_frame = $80A98B
	end_bananas = $80A3DC
	hijack_map = $80E8B7
	dec_lives_1 = $B6A871
	draw_digit = $B888BC
	wram_clear_2 = $B883A8
	freerom_B8 = $B8F680
	dec_lives_2 = $BEE47B
elseif !rom_revision == !j0
	hijack_level = $8080E4
	hijack_lives = $80A1EC
	hijack_every_frame = $80A9A7
	end_bananas = $80A3FC
	hijack_map = $80E8E7
	dec_lives_1 = $B6A939
	draw_digit = $B889B7
	wram_clear_2 = $B884A3
	freerom_B8 = $B8F680
	dec_lives_2 = $BEE528
elseif !rom_revision == !j1
	hijack_level = $8080E4
	hijack_lives = $80A1EC
	hijack_every_frame = $80A9A7
	end_bananas = $80A3FC
	hijack_map = $80E8EC
	dec_lives_1 = $B6A939
	draw_digit = $B889B7
	wram_clear_2 = $B884A3
	freerom_B8 = $B8DE60
	dec_lives_2 = $BEE3A9
endif

; constants
!dropped_frames_x = $0008
!dropped_frames_y = $0900
!timer_x = $00CC
!timer_y = $0900
!map_time_x = $00B8
!map_time_y = $CC00
!map_props_mask = $3400

if !rom_revision < !j0
	; u
	!map_numbers_offset = $0090
	!map_double_quotes = $0082
	!map_single_quote = $0087
else
	; j
	!map_numbers_offset = $00A0
	!map_time_x := !map_time_x+12
endif

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
