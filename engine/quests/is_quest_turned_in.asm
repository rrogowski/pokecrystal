; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
; OUTPUTS
;   a = 1 if quest is turned in, 0 otherwise
IsQuestTurnedIn::
  ld b, 0
  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  ld d, 0
  ld e, QUEST_STRUCT_IS_TURNED_IN
  add hl, de

  ld a, [hl]
  ret
