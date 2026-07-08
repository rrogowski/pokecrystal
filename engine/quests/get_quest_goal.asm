; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
; OUTPUTS
;   e = quest goal
GetQuestGoal:
  ld b, 0
  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  ld d, 0
  ld e, QUEST_STRUCT_GOAL
  add hl, de

  ld e, [hl]
  ret
