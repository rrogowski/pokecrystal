; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
UnlockQuest::
  ld b, 0
  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  ld d, 0
  ld e, QUEST_STRUCT_IS_UNLOCKED
  add hl, de

  ld a, 1
  ld [hl], a
  ret
