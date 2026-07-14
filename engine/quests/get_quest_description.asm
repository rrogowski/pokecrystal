; INPUTS
;   c = QUEST_* (see constants/quests_constants.asm)
; OUTPUTS
;   hl = pointer to quest description (see data/quests/descriptions.asm)
GetQuestDescription::
  ld b, 0
  ld hl, QuestDescriptions

rept 2
  add hl, bc
endr

  ld a, [hli]
	ld h, [hl]
	ld l, a

  ret
