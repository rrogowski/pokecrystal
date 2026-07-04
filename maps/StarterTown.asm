	object_const_def

StarterTown_MapScripts:
	def_scene_scripts
	scene_script StarterTownNoopScene, SCENE_STARTER_TOWN_OLD_MAN_STOPS_YOU

	def_callbacks

StarterTownNoopScene:
	end

StarterTown_OldManStopsYouScene:
	opentext
	writetext Text_Wait
	closetext
	end

Text_Wait:
	text " Wait! <PLAYER>!"

	para "It's dangerous to"
	line "go out without a"
	cont "#MON!"
	prompt

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
	coord_event 12, 13, SCENE_STARTER_TOWN_OLD_MAN_STOPS_YOU, StarterTown_OldManStopsYouScene

	def_bg_events
    bg_event 24,  8, BGEVENT_READ, StarterTownLabSign 

	def_object_events