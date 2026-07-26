QuestDescriptions:
; entries correspond to item ids (see constants/quest_constants.asm)
	table_width 2
	dw .TroubleWithTaurosDescription
  dw .ACryForHelpDescription
	dw .IntoTheUnownDescription
	dw .BuggingOutDescription
	dw .MorningMoonDescription
	dw .CoverToCoverDescription
	assert_table_length NUM_QUESTS

.TroubleWithTaurosDescription:
  text "Defeat all escaped"
  line "Tauros. Turn in to"
  cont "PROF. CARAWAY in"
  cont "Rock Salt Town."
  prompt

.ACryForHelpDescription:
  text "Find the source of"
  line "the cry inside"
  cont "Rock Salt Cave."
  cont "Turn in to"
  cont "YOUNGSTER in Rock"
  cont "Salt Town."
  prompt

.IntoTheUnownDescription:
	text "Sketch all unown"
  line "variants. Turn in"
  cont "to JADE in Rock"
  cont "Salt Town."
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
