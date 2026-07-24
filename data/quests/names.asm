QuestNames:
; entries correspond to item ids (see constants/quest_constants.asm)
	table_width 2
	dw .TroubleWithTaurosName
	dw .ACryForHelpName
	dw .IntoTheUnownName
	dw .BuggingOutName
	dw .MorningMoonName
	dw .CoverToCoverName
	assert_table_length NUM_QUESTS

.TroubleWithTaurosName:
  db "Trouble w/ Tauros@"

.ACryForHelpName:
	db "A Cry For Help@"

.IntoTheUnownName:
	db "Into the Unown@"

.BuggingOutName:
  db "Bugging Out@"

.MorningMoonName:
  db "Morning Moon@"

.CoverToCoverName:
  db "Cover To Cover@"
