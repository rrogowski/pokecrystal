; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
; OUTPUTS
;   a = 1 if quest can be turned in, 0 otherwise
; FARCALL
;   [wScriptVar] = 1 if quest can be turned in, 0 otherwise
CanTurnInQuest::
  ld b, 0
  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  ld d, 0
  ld e, QUEST_STRUCT_PROGRESS
  add hl, de
  ld a, [hl]

  ld hl, wQuests

rept QUEST_STRUCT_LENGTH
  add hl, bc
endr

  ld d, 0
  ld e, QUEST_STRUCT_GOAL
  add hl, de
  ld b, [hl]

  cp b
  ld a, 0
  ld [wScriptVar], a
  ret nz

  inc a
  ld [wScriptVar], a
  ret
