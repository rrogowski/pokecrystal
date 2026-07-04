	object_const_def
    const STARTER_TOWN_OLD_MAN
    ; const STARTER_TOWN_WOMAN_BLOCKING_CAVE
    const STARTER_TOWN_TAUROS_1
    const STARTER_TOWN_TAUROS_2
    const STARTER_TOWN_TAUROS_3
    const STARTER_TOWN_TAUROS_4
    const STARTER_TOWN_TAUROS_5
    const STARTER_TOWN_TAUROS_6
    const STARTER_TOWN_FRUIT_TREE


StarterTown_MapScripts:
	def_scene_scripts
	scene_script StarterTownNoopScene, SCENE_STARTER_TOWN_OLD_MAN_STOPS_YOU
	scene_script StarterTownNoopScene, SCENE_STARTER_TOWN_NOOP

	def_callbacks

StarterTownNoopScene:
	end

StarterTown_OldManStopsYouScene:
	opentext
	writetext Text_Wait
	closetext

	follow PLAYER, STARTER_TOWN_OLD_MAN
	applymovement PLAYER, StarterTown_OldManWalksYouBack
	stopfollow
	turnobject STARTER_TOWN_OLD_MAN, RIGHT

	opentext
	writetext Text_ItsDangerous
	closetext

	applymovement STARTER_TOWN_OLD_MAN, StarterTown_OldManReturnsToStartingLocation

	end

StarterTown_OldManWalksYouBack:
	step RIGHT
	turn_head LEFT
	step_end

StarterTown_OldManReturnsToStartingLocation:
	step UP
	turn_head DOWN
	step_end

Text_Wait:
	text "Wait! <PLAYER>!"
	prompt

Text_ItsDangerous:
	text "It's dangerous to"
	line "go out without a"
	cont "#MON!"
	prompt

StarterTownOldManScript:
    faceplayer
    opentext 
    writetext StarterTownOldManText
    waitbutton
    closetext
    end

StarterTownOldManText:
    text "That's a mighty"
    line "fine #MON you've"
    cont "got there!"

    para "NOW you're ready"
    line "to take on the"
    cont "tall grass!"
    done 

StarterTownFruitTree:
   fruittree FRUITTREE_STARTER_TOWN

StarterTownTauros:
    opentext
	writetext StarterTownTaurosText
	cry TAUROS
	waitbutton
	closetext
	end

StarterTownTaurosText:
    text "TAUROS: Moo!"
    done

StarterTownLabSign:
	jumptext StarterTownLabSignText

StarterTownLabSignText:
	text "SALT #LAB"
	done

StarterTownPlayersHouseSign:
    jumptext StarterTownPlayersHouseSignText

StarterTownPlayersHouseSignText:
    text "<PLAYER>'s HOUSE"
    done

StarterTownRivalsHouseSign:
    jumptext StarterTownPlayersHouseSignText

StarterTownRivalsHouseSigntText:
    text "<RIVAL>'s HOUSE"
    done

StarterTown_WomanBlockingCaveScene:
	jumptext Text_WomanBlockingCave

Text_WomanBlockingCave:
	text "You can't go in"
	line "here just yet!"
	done

StarterTown_MapEvents:
	db 0, 0 ; filler


	def_warp_events
	warp_event 27, 13, STARTER_TOWN_PLAYERS_HOUSE, 1
	warp_event 33, 11, STARTER_TOWN_BOOKWORMS_HOUSE, 1
	

	def_coord_events
	coord_event 12, 13, SCENE_STARTER_TOWN_OLD_MAN_STOPS_YOU, StarterTown_OldManStopsYouScene

	def_bg_events
	bg_event 24,  8, BGEVENT_READ, StarterTownLabSign
	bg_event 25, 13, BGEVENT_READ, StarterTownPlayersHouseSign
    bg_event 21,  9, BGEVENT_READ, StarterTownRivalsHouseSign

	def_object_events
	object_event 12, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StarterTownOldManScript, -1
	object_event 10,  6, SPRITE_DAISY, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTown_WomanBlockingCaveScene, -1
	object_event 21,  4, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownTauros, -1
	object_event 23,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownTauros, -1
	object_event 37,  6, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownTauros, -1
	object_event 35,  5, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownTauros, -1
	object_event 30,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownTauros, -1
	object_event 32,  4, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownTauros, -1
	object_event 24, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, StarterTownFruitTree, -1
    ; object_event 