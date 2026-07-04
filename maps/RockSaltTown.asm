	object_const_def
    const ROCK_SALT_TOWN_OLD_MAN
    ; const ROCK_SALT_TOWN_WOMAN_BLOCKING_CAVE
    const ROCK_SALT_TOWN_TAUROS_1
    const ROCK_SALT_TOWN_TAUROS_2
    const ROCK_SALT_TOWN_TAUROS_3
    const ROCK_SALT_TOWN_TAUROS_4
    const ROCK_SALT_TOWN_TAUROS_5
    const ROCK_SALT_TOWN_TAUROS_6
    const ROCK_SALT_TOWN_FRUIT_TREE
    const ROCK_SALT_TOWN_YOUNGSTER


RockSaltTown_MapScripts:
	def_scene_scripts
	scene_script RockSaltTownNoopScene, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	scene_script RockSaltTownNoopScene, SCENE_ROCK_SALT_TOWN_NOOP

	def_callbacks

RockSaltTownNoopScene:
	end

RockSaltTown_OldManStopsYouScene:
	opentext
	writetext Text_Wait
	closetext

	follow PLAYER, ROCK_SALT_TOWN_OLD_MAN
	applymovement PLAYER, RockSaltTown_OldManWalksYouBack
	stopfollow
	turnobject ROCK_SALT_TOWN_OLD_MAN, RIGHT

	opentext
	writetext Text_ItsDangerous
	closetext

	applymovement ROCK_SALT_TOWN_OLD_MAN, RockSaltTown_OldManReturnsToStartingLocation

	end

RockSaltTown_OldManWalksYouBack:
	step RIGHT
	turn_head LEFT
	step_end

RockSaltTown_OldManReturnsToStartingLocation:
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

RockSaltTownOldManScript:
    faceplayer
    opentext 
    writetext RockSaltTownOldManText
    waitbutton
    closetext
    end

RockSaltTownOldManText:
    text "That's a mighty"
    line "fine #MON you've"
    cont "got there!"

    para "NOW you're ready"
    line "to take on the"
    cont "tall grass!"
    done 

RockSaltTownFruitTree:
   fruittree FRUITTREE_ROCK_SALT_TOWN

RockSaltTownTaurosScript:
    opentext
	writetext RockSaltTownTaurosText
	cry TAUROS
	waitbutton
	closetext
	end

RockSaltTownTaurosText:
    text "TAUROS: Moo!"
    done

RockSaltTownYoungsterScript:
    faceplayer
    opentext
    writetext RockSaltTownYoungsterText
    waitbutton
    closetext
    end

RockSaltTownYoungsterText:
    text "My dad said a"
    line "really strong"
    
    para "#mon lives in"
    line "the cave just"
    cont "outside of town!"
    done

RockSaltTownLabSign:
	jumptext RockSaltTownLabSignText

RockSaltTownLabSignText:
	text "ROCK SALT #LAB"
	done

RockSaltTownPlayersHouseSign:
    jumptext RockSaltTownPlayersHouseSignText

RockSaltTownPlayersHouseSignText:
    text "<PLAYER>'s HOUSE"
    done

RockSaltTownRivalsHouseSign:
    jumptext RockSaltTownPlayersHouseSignText

RockSaltTownRivalsHouseSigntText:
    text "<RIVAL>'s HOUSE"
    done

RockSaltTown_WomanBlockingCaveScene:
	jumptext Text_WomanBlockingCave

Text_WomanBlockingCave:
	text "You can't go in"
	line "here just yet!"
	done

RockSaltTown_MapEvents:
	db 0, 0 ; filler


	def_warp_events
	warp_event 27, 13, ROCK_SALT_PLAYERS_HOUSE, 1
	warp_event 19,  7, ROCK_SALT_RIVALS_HOUSE, 1
	warp_event 26,  7, ROCK_SALT_LAB, 1
	warp_event 33, 11, ROCK_SALT_BOOKWORMS_HOUSE, 1
	warp_event 15, 11, ROCK_SALT_OLD_MANS_HOUSE, 1
	

	def_coord_events
	coord_event 12, 13, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU, RockSaltTown_OldManStopsYouScene

	def_bg_events
	bg_event 24,  8, BGEVENT_READ, RockSaltTownLabSign
	bg_event 25, 13, BGEVENT_READ, RockSaltTownPlayersHouseSign
    bg_event 21,  9, BGEVENT_READ, RockSaltTownRivalsHouseSign

	def_object_events
	object_event 12, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockSaltTownOldManScript, -1
	object_event 10,  6, SPRITE_DAISY, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTown_WomanBlockingCaveScene, -1
	object_event 21,  4, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 23,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 37,  6, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 35,  5, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 30,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 32,  4, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 24, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownFruitTree, -1
    object_event 22,  12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RockSaltTownYoungsterScript, -1