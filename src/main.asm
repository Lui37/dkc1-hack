hirom

; 0 for u1.0
; tbd
!rom_revision ?= 0

incsrc "defines.asm"

incsrc "edits.asm"
incsrc "hijacks.asm"

org freerom_B8
incsrc "level.asm"
incsrc "map.asm"
incsrc "hud.asm"

warnpc $B8FFFF
