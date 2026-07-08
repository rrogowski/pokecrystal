; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
;   e = quest goal
SetQuestGoal::
  ld b, 0
  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  push de
  ld d, 0
  ld e, QUEST_STRUCT_GOAL
  add hl, de
  pop de

  ld [hl], e
  ret
