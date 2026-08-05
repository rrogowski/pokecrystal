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

TrainerPokefanFRiley2:
	trainer POKEFANF, RILEY2, EVENT_BEAT_POKEFANF_RILEY2, PokefanFRiley2SeenText, PokefanFRiley2BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext PokefanFRiley2AfterText
	waitbutton
	closetext
	end

PokefanFRiley2SeenText:
	text "We locked eyes!"
	line "That means we"
	cont "have to battle!"
	done

PokefanFRiley2BeatenText:
	text "Ugh, I can't"
	line "believe I lost..."
	done

PokefanFRiley2AfterText:
	text "I should have just"
	line "pretended like I"
	cont "didn't see you."
	done

TrainerLassTatiana:
	trainer LASS, TATIANA, EVENT_BEAT_LASS_TATIANA, LassTatianaSeenText, LassTatianaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext LassTatianaAfterText
	waitbutton
	closetext
	end

LassTatianaSeenText:
	text "Hold on just"
	line "a second!"

	para "Where are you"
	line "headed in such"
	cont "a hurry?"
	done

LassTatianaBeatenText:
	text "You shouldn't"
	line "battle if you're"
	cont "running so late."
	done

LassTatianaAfterText:
	text "Don't you have"
	line "somewhere you need"
	cont "to be?"
	done

TrainerLassBailey2:
	trainer LASS, BAILEY2, EVENT_BEAT_LASS_BAILEY2, LassBailey2SeenText, LassBailey2BeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext LassBailey2AfterText
	waitbutton
	closetext
	end

LassBailey2SeenText:
	text "Hey! Are you"
	line "lost, too?"
	done

LassBailey2BeatenText:
	text "Aw, man..."
	line "I only wanted to"
	cont "ask for directions."
	done

LassBailey2AfterText:
	text "Don't worry!"
	line "I'll find my own"
	cont "way out of here."
	done

TrainerFisherJake2:
	trainer FISHER, JAKE2, EVENT_BEAT_FISHER_JAKE2, FisherJake2SeenText, FisherJake2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJake2AfterText
	waitbutton
	closetext
	end

FisherJake2SeenText:
	text "Hey! Watch it!"
	line "I'm trying to"
	cont "fish here!"
	done

FisherJake2BeatenText:
	text "Wow! Those are"
	line "some cool moves!"
	done

FisherJake2AfterText:
	text "Can I get back"
	line "to fishing now?"
	done

RockSaltCave1BTMSwift:
	itemball SWIFT

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
	object_event	  16, 5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPokefanFRiley2, -1
	; object_event	  8, 8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassTatiana, -1
	; object_event	4, 	17,	SPRITE_LASS,	SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassBailey2, -1
	; object_event	4,	31,	SPRITE_FISHER,	SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerFisherJake2, -1
	; object_event    16, 2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1BTMSwift, EVENT_ROCK_SALT_CAVE_1B_TM_SWIFT