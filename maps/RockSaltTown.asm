	object_const_def
    const ROCK_SALT_TOWN_OLD_MAN
    const ROCK_SALT_TOWN_JADE
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

	checkevent EVENT_TALKED_TO_PROF_HALITE
	iffalse CantChooseStarter

	checkevent EVENT_CHOSE_STARTER
	iftrue CantChooseStarter

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

	checkevent EVENT_TALKED_TO_PROF_HALITE
	iffalse CantChooseStarter

	checkevent EVENT_CHOSE_STARTER
	iftrue CantChooseStarter

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

	checkevent EVENT_TALKED_TO_PROF_HALITE
	iffalse CantChooseStarter

	checkevent EVENT_CHOSE_STARTER
	iftrue CantChooseStarter

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

CantChooseStarter:
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

RockSaltTownJadeScript:
	faceplayer

	opentext
	writetext Text_CantEnterCave
	yesorno
	closetext
	
	iftrue .TooDangerous

	showemote EMOTE_QUESTION, ROCK_SALT_TOWN_JADE, 15
	opentext
	writetext Text_AreYouSure
	yesorno
	closetext

	iftrue .TooDangerous

	turnobject ROCK_SALT_TOWN_JADE, UP
	pause 40
	showemote EMOTE_SHOCK, ROCK_SALT_TOWN_JADE, 15
	faceplayer
	
	opentext
	writetext Text_JadeBattle
	waitbutton
	closetext

	winlosstext Text_JadeBeaten, 0
	loadtrainer JADE, JADE1
	startbattle
	reloadmapafterbattle

	opentext
	writetext Text_FollowMe
	waitbutton
	closetext

	playsound SFX_ENTER_DOOR
	applymovement ROCK_SALT_TOWN_JADE, Movement_JadeEntersCave
	waitsfx
	disappear ROCK_SALT_TOWN_JADE
	
	end

.TooDangerous:
	opentext
	writetext Text_TooDangerous
	waitbutton
	closetext

	end

Text_JadeBeaten:
	text "You... beat me."
	done

Text_CantEnterCave:
	text "What? You want to"
	line "enter this cave?"
	
	para "I'm sorry, but I"
	line "can't allow you"
	cont "inside."

	para "Why? ... Because"
	line "there's a terrible"
	cont "creature inside."

	para "Spooky, huh?"

	done

Text_AreYouSure:
	text "You're really not"
	line "scared? Not even"
	cont "a little?"

	done

Text_TooDangerous:
	text "That's what I"
	line "thought! It's too"
	cont "dangerous!"

	done

Text_JadeBattle:
	text "Hmm..."

	para "You're ready to"
	line "face what's inside,"
	cont "are you?"

	para "Okay! But you're"
	line "gonna have to get"
	cont "through me first!"

	done

Text_FollowMe:
	text "Ugh. Follow me."
	done

Movement_JadeEntersCave:
	step UP
	step_end

RockSaltTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27, 13, ROCK_SALT_PLAYERS_HOUSE, 1
	warp_event 19,  7, ROCK_SALT_RIVALS_HOUSE, 1
	warp_event 26,  7, ROCK_SALT_LAB, 1
	warp_event 33, 11, ROCK_SALT_BOOKWORMS_HOUSE, 1
	warp_event 15, 11, ROCK_SALT_OLD_MANS_HOUSE, 1
	warp_event 26, 3, ROCK_SALT_LAB, 3
	warp_event 27, 3, ROCK_SALT_LAB, 3

	def_coord_events
	coord_event 12, 13, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU, RockSaltTown_OldManStopsYouScene

	def_bg_events
	bg_event 24,  8, BGEVENT_READ, RockSaltTownLabSign
	bg_event 25, 13, BGEVENT_READ, RockSaltTownPlayersHouseSign
    bg_event 21,  9, BGEVENT_READ, RockSaltTownRivalsHouseSign

	def_object_events
	object_event 12, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockSaltTownOldManScript, -1
	object_event 10,  6, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RockSaltTownJadeScript, EVENT_BEAT_JADE_IN_ROCK_SALT_TOWN
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