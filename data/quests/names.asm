QuestNames:
; entries correspond to item ids (see constants/quest_constants.asm)
	table_width 2
	dw .IntoTheUnownName
	dw .TroubleWithTaurosName
	assert_table_length NUM_QUESTS

.IntoTheUnownName:
	db "Into the Unown@"

.TroubleWithTaurosName:
  db "Trouble w/ Tauros@"
