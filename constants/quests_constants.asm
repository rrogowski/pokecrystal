const_def
	const QUEST_INTO_THE_UNOWN
	const QUEST_TROUBLE_WITH_TAUROS

DEF NUM_QUESTS EQU const_value

DEF QUEST_NAME_MAX_LENGTH EQU (17 + 1) ; extra character for string terminator

; quest_struct members (see macros/ram.asm)
rsreset
	DEF QUEST_STRUCT_IS_UNLOCKED rb
	DEF QUEST_STRUCT_PROGRESS rb
	DEF QUEST_STRUCT_GOAL rb
	DEF QUEST_STRUCT_IS_TURNED_IN rb
DEF QUEST_STRUCT_LENGTH EQU _RS
