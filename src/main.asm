hirom

!u0 = 0
!u1 = 1
!u2 = 2
!j0 = 3
!j1 = 4
!rom_revision ?= !u0

incsrc "defines.asm"

incsrc "edits.asm"
incsrc "hijacks.asm"

org freerom_B8
incsrc "level.asm"
incsrc "map.asm"
incsrc "hud.asm"

warnpc $B8FFFF
