MACRO setinitialevent
  ; \1 = EVENT_* (see constants/event_flags.asm)
	ld de, \1
	ld b, SET_FLAG
	call EventFlagAction
ENDM
