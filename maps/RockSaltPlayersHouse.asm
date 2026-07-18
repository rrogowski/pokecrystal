	object_const_def

RockSaltPlayersHouse_MapScripts:
	def_scene_scripts
	scene_script RockSaltPlayersHouseTvFinishDialogueScene, SCENE_ROCK_SALT_PLAYERS_HOUSE_TV_FINISH_DIALOGUE
	scene_script RockSaltPlayersHouseNoopScene, SCENE_ROCK_SALT_PLAYERS_HOUSE_NOOP

	def_callbacks

RockSaltPlayersHouseTvFinishDialogueScene:
	turnobject PLAYER, UP

	opentext
	writetext Text_ThatsEnoughTv
	waitbutton
	closetext

	turnobject PLAYER, RIGHT
	setscene SCENE_ROCK_SALT_PLAYERS_HOUSE_NOOP

	end

.Text_FinishTVDialogue:
	text "In this episode we"
	line "will explore<……>"
	
	para "That's enough TV"
	line "for now!"
	
	done

RockSaltPlayersHouseNoopScene:
	end

RockSaltPlayersHousePCScript:
	opentext
	special PlayersHousePC
	closetext
	end

RockSaltPlayersHouseDresserScript:
	jumptext Text_LotsOfSocks

Text_LotsOfSocks:
	text "Lots of socks and"
	line "underwear."
	done

RockSaltPlayersHouseBedScript:
	jumptext Text_LooksComfy

Text_LooksComfy:
	text "Looks comfy!"
	done

RockSaltPlayersHouseTvScript:
	jumptext Text_ThatsEnoughTv

Text_ThatsEnoughTv:
	text "That's enough TV"
	line "for now!"
	done

RockSaltPlayersHouseFridgeScript:
	jumptext Text_Cabbage

Text_Cabbage:
	text "There's only a"
	line "head of cabbage in"
	cont "here!"
	done

Script_PlayersN64:
	jumptext .Text_N64

.Text_N64:
	text "<PLAYER> played"
	line "The Legend of"
	cont "Zelda for a bit."
	
	para "Okay, time to go!"
	
	done

RockSaltPlayersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 7, ROCK_SALT_TOWN, 1
	warp_event 5, 7, ROCK_SALT_TOWN, 1

	def_coord_events

	def_bg_events
  bg_event  0,  1, BGEVENT_READ, RockSaltPlayersHouseTvScript
  bg_event  0,  2, BGEVENT_READ, RockSaltPlayersHouseBedScript
  bg_event  0,  3, BGEVENT_READ, RockSaltPlayersHouseBedScript
	bg_event  1,  1, BGEVENT_READ, RockSaltPlayersHouseDresserScript
  bg_event  2,  1, BGEVENT_UP, RockSaltPlayersHousePCScript
	bg_event  8,  1, BGEVENT_READ, RockSaltPlayersHouseFridgeScript
	bg_event  9,  5, BGEVENT_READ, Script_PlayersN64

	def_object_events
