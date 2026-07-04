	object_const_def
    const ROCK_SALT_TOWN_OLD_MAN
    const ROCK_SALT_TOWN_WOMAN_BLOCKING_CAVE
    const ROCK_SALT_TOWN_MEOWTH
		const ROCK_SALT_TOWN_SENTRET
    const ROCK_SALT_TOWN_EEVEE
    const ROCK_SALT_TOWN_TAUROS_1
    const ROCK_SALT_TOWN_TAUROS_2
    const ROCK_SALT_TOWN_TAUROS_3
    const ROCK_SALT_TOWN_TAUROS_4
    const ROCK_SALT_TOWN_TAUROS_5
    const ROCK_SALT_TOWN_TAUROS_6
    const ROCK_SALT_TOWN_FRUIT_TREE
    const ROCK_SALT_TOWN_YOUNGSTER
	const ROCK_SALT_TOWN_GARDENER


RockSaltTown_MapScripts:
	def_scene_scripts
	scene_script RockSaltTownNoopScene, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	scene_script RockSaltTownNoopScene, SCENE_ROCK_SALT_TOWN_NOOP

	def_callbacks

RockSaltTownNoopScene:
	end

RockSaltTown_OldManStopsYouScene:
	faceplayer
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

	checkevent EVENT_CHOSE_STARTER
	iffalse .NoStarter

	opentext
	writetext Text_RockSaltTownOldManHasStarter
	waitbutton
	closetext
	end
    
.NoStarter:
	opentext 
	writetext Text_RockSaltTownOldManNoStarter
	waitbutton
	closetext
	end

Text_RockSaltTownOldManHasStarter:
    text "That's a mighty"
    line "fine #MON you've"
    cont "got there!"

    para "NOW you're ready"
    line "to take on the"
    cont "tall grass!"
    done

Text_RockSaltTownOldManNoStarter:
    text "You need a #MON"
    line "to be safe out"
    cont "there!"
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

RockSaltTownMeowthScript:
	faceplayer
	opentext
	writetext Text_Meowth
	cry MEOWTH
	waitbutton
	closetext
	reanchormap
	pokepic MEOWTH
	waitbutton
	closepokepic
	closetext

	checkevent EVENT_CHOSE_STARTER
	iftrue CantChooseAnotherStarterScript

	opentext
	getmonname STRING_BUFFER_3, MEOWTH
	writetext Text_ChooseStarter
	yesorno
	closetext
	iffalse DidntPickStarterScript

	getmonname STRING_BUFFER_3, MEOWTH
	opentext
	writetext Text_ReceivedStarter
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke MEOWTH, 5, BERRY
	closetext

	disappear ROCK_SALT_TOWN_MEOWTH
	setevent EVENT_CHOSE_STARTER
	setscene SCENE_ROCK_SALT_TOWN_NOOP

	end

Text_Meowth:
	text "MEOWTH: Mee Owth!"
	done

RockSaltTownSentretScript:
	faceplayer
	opentext
	writetext Text_Sentret
	cry SENTRET
	waitbutton
	closetext
	reanchormap
	pokepic SENTRET
	waitbutton
	closepokepic
	closetext

	checkevent EVENT_CHOSE_STARTER
	iftrue CantChooseAnotherStarterScript

	opentext
	getmonname STRING_BUFFER_3, SENTRET
	writetext Text_ChooseStarter
	yesorno
	closetext
	iffalse DidntPickStarterScript

	getmonname STRING_BUFFER_3, SENTRET
	opentext
	writetext Text_ReceivedStarter
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke SENTRET, 5, BERRY
	closetext

	disappear ROCK_SALT_TOWN_SENTRET
	setevent EVENT_CHOSE_STARTER
	setscene SCENE_ROCK_SALT_TOWN_NOOP

	end

Text_Sentret:
	text "SENTRET: Screech!"
	done

RockSaltTownEeveeScript:
	faceplayer
	opentext
	writetext Text_Eevee
	cry EEVEE
	waitbutton
	closetext
	reanchormap
	pokepic EEVEE
	waitbutton
	closepokepic
	closetext

	checkevent EVENT_CHOSE_STARTER
	iftrue CantChooseAnotherStarterScript

	opentext
	getmonname STRING_BUFFER_3, EEVEE
	writetext Text_ChooseStarter
	yesorno
	closetext
	iffalse DidntPickStarterScript

	getmonname STRING_BUFFER_3, EEVEE
	opentext
	writetext Text_ReceivedStarter
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke EEVEE, 5, BERRY
	closetext

	disappear ROCK_SALT_TOWN_EEVEE
	setevent EVENT_CHOSE_STARTER
	setscene SCENE_ROCK_SALT_TOWN_NOOP

	end

Text_Eevee:
	text "EEVEE: Ee-vee?"
	done

Text_ChooseStarter:
	text "Do you want the"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

Text_ReceivedStarter:
	text "<PLAYER> received"
	line "the @"
	text_ram wStringBuffer3
	text "!"
	done

CantChooseAnotherStarterScript:
	end

DidntPickStarterScript:
	closetext
	end

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

RockSaltTownGardenerScript:
	faceplayer
	opentext
	writetext RockSaltTownGardenerText
	waitbutton
	closetext
	end

RockSaltTownGardenerText:
	text "I feel most at"
	line "peace when I'm"
	cont "gardening."
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
    jumptext RockSaltTownRivalsHouseSigntText

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
	object_event 10,  6, SPRITE_DAISY, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RockSaltTown_WomanBlockingCaveScene, -1
	object_event 22, 1, SPRITE_MONSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownMeowthScript, EVENT_CHOSE_STARTER_MEOWTH
	object_event 33, 2, SPRITE_MONSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownSentretScript, EVENT_CHOSE_STARTER_SENTRET
	object_event 39, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownEeveeScript, EVENT_CHOSE_STARTER_EEVEE
	object_event 21,  4, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 23,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 37,  6, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 35,  5, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 30,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 32,  4, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 24, 11, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownFruitTree, -1
    object_event 22,  12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RockSaltTownYoungsterScript, -1
	object_event 29, 10, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RockSaltTownGardenerScript, -1