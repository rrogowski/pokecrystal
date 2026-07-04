	object_const_def

StarterTownPlayersHouse_MapScripts:
	def_scene_scripts

	def_callbacks

StarterTownPlayersHousePCScript:
	opentext
	special PlayersHousePC
	closetext
	end

StarterTownPlayersHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4, 7, STARTER_TOWN, 1
	warp_event 5, 7, STARTER_TOWN, 1

	def_coord_events

	def_bg_events
  bg_event  2,  1, BGEVENT_UP, StarterTownPlayersHousePCScript

	def_object_events
