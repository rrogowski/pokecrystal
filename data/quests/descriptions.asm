QuestDescriptions:
; entries correspond to item ids (see constants/quest_constants.asm)
	table_width 2
	dw .IntoTheUnownDescription
	dw .TroubleWithTaurosDescription
	dw .BuggingOutDescription
	dw .MorningMoonDescription
	dw .CoverToCoverDescription
	assert_table_length NUM_QUESTS

.IntoTheUnownDescription:
	text "Sketch all unown"
  line "variants. Turn in"
  cont "to Jade in Rock"
  cont "Salt Town."
  prompt

.TroubleWithTaurosDescription:
  text "Defeat all escaped"
  line "Tauros. Turn in to"
  cont "Prof. Caraway in"
  cont "Rock Salt Town."
  prompt

.BuggingOutDescription:
  text "..."
  prompt

.MorningMoonDescription:
  text "..."
  prompt

.CoverToCoverDescription:
  text "Read all books in"
  line "Bookworm's house."
  cont "Turn in to"
  cont "Bookworm in Rock"
  cont "Salt Town."
  prompt
