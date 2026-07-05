	object_const_def
	const ROCK_SALT_CAVE_1B_SAGE
	; const ROCK_SALT_CAVE_1B_POKEFAN_F_RILEY
	; const ROCK_SALT_CAVE_1B_COOLTRAINER_F_TATIANA
	; const ROCK_SALT_CAVE_1B_LASS_BAILEY
	; const ROCK_SALT_CAVE_1B_FISHER_JAKE
	; const ROCK_SALT_CAVE_1B_POKE_BALL_1

RockSaltCave1B_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltCave1BSageScript:
	opentext
	writetext RockSaltCave1BSageText
	waitbutton
	closetext
	end

RockSaltCave1BSageText:
	text "..."
	done

RockSaltCave1B_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3 , 3, ROCK_SALT_CAVE_1F, 1
	warp_event 11,  3, ROCK_SALT_CAVE_1F, 2
	warp_event  7, 11, ROCK_SALT_CAVE_2B, 1
	warp_event  9, 23, ROCK_SALT_CAVE_2B, 2
	warp_event 15, 29, ROCK_SALT_CAVE_1F, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8, 27, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RockSaltCave1BSageScript, -1 ; EVENT_*
	; object_event	  16, 5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, RockSaltCave1BPokefanFRileyScript, -1
	; object_event	  8, 8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, RockSaltCave1BCooltrainerFTatianaScript, -1
	; object_event	4, 	17,	SPRITE_LASS,	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, RockSaltCave1BLassBaileyScript, -1
	; object_event	4,	31,	SPRITE_FISHER,	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, RockSaltCave1BFisherJakeScript, -1
	; object_event    16, 2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1BTMSwiftScript, EVENT_ROCK_SALT_CAVE_1B_TM_SWIFT