	object_const_def

RockSaltPlayersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltPlayersHousePCScript:
	opentext
	special PlayersHousePC
	closetext
	end

RockSaltPlayersHouse_MapEvents:
	db 0, 0 ; filler


	def_warp_events
	warp_event 4, 7, ROCK_SALT_TOWN, 1
	warp_event 5, 7, ROCK_SALT_TOWN, 1

	def_coord_events

	def_bg_events
  bg_event  2,  1, BGEVENT_UP, RockSaltPlayersHousePCScript

	def_object_events
