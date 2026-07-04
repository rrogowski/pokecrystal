	object_const_def

StarterTown_MapScripts:
	def_scene_scripts

	def_callbacks

StarterTownLabSign:
	jumptext StarterTownLabSignText

StarterTownLabSignText:
	text "SALT #LAB"
	done

StarterTown_MapEvents:
	db 0, 0 ; filler


	def_warp_events
	warp_event  29, 13, STARTER_TOWN_PLAYERS_HOUSE, 1
	

	def_coord_events

	def_bg_events
    bg_event 24,  8, BGEVENT_READ, StarterTownLabSign 

	def_object_events