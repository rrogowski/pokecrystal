; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
; OUTPUTS
;   a = 1 if quest is unlocked, 0 otherwise
; FARCALL
;   [wScriptVar] = 1 if quest is unlocked, 0 otherwise
IsQuestUnlocked::
  ld b, 0
  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  ld d, 0
  ld e, QUEST_STRUCT_IS_UNLOCKED
  add hl, de

  ld a, [hl]
  ld [wScriptVar], a
  ret
