; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
; OUTPUTS
;   de = pointer to quest name (see data/quests/names.asm)
; FARCALL
;   wStringBuffer1 = copy of quest name
GetQuestName::
  ; caller may have used hlcoord prior to calling this function
  push hl

  ld b, 0
  ld hl, QuestNames

rept 2
  add hl, bc
endr

  ld e, [hl]
	inc hl
	ld d, [hl]

  push de
  ld h, d
  ld l, e
	ld de, wStringBuffer1
	ld bc, STRING_BUFFER_LENGTH
	call CopyBytes
  pop de

  pop hl
  ret
