	object_const_def

RockSaltPlayersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

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

RockSaltPlayersHouseFridgeScript:
	jumptext Text_Cabbage

Text_Cabbage:
	text "There's only a"
	line "head of cabbage in"
	cont "here!"
	done

RockSaltPlayersHouseN64Script:
	jumptext Text_N64

Text_N64:
	text "<PLAYER> played"
	line "the N64 for a bit."
	
	para "Okay, time to go!"
	
	done

RockSaltPlayersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 7, ROCK_SALT_TOWN, 1
	warp_event 5, 7, ROCK_SALT_TOWN, 1

	def_coord_events

	def_bg_events
  bg_event  0,  2, BGEVENT_READ, RockSaltPlayersHouseBedScript
  bg_event  0,  3, BGEVENT_READ, RockSaltPlayersHouseBedScript
	bg_event  1,  1, BGEVENT_READ, RockSaltPlayersHouseDresserScript
  bg_event  2,  1, BGEVENT_UP, RockSaltPlayersHousePCScript
	bg_event  8,  1, BGEVENT_READ, RockSaltPlayersHouseFridgeScript
	bg_event  9,  5, BGEVENT_READ, RockSaltPlayersHouseN64Script

	def_object_events
