	object_const_def
	const ROCK_SALT_TOWN_OLD_MAN
	const ROCK_SALT_TOWN_JADE
	const ROCK_SALT_TOWN_AIDE
	const ROCK_SALT_TOWN_CYNDAQUIL
	const ROCK_SALT_TOWN_TOTODILE
	const ROCK_SALT_TOWN_CHIKORITA
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
	scene_script SceneSetup_RockSaltTownNoop, SCENE_MEET_JADE
	scene_script SceneSetup_RockSaltTownNoop, SCENE_ROCK_SALT_TOWN_NOOP
	scene_script SceneSetup_RockSaltTownNoop, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	scene_script SceneSetup_MeetAideOutBack, SCENE_MEET_AIDE_OUT_BACK
	scene_script SceneSetup_RockSaltTownNoop, SCENE_CHOOSE_STARTER

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Callback_RockSaltTownMoveObjects

Callback_RockSaltTownMoveObjects:
    checkscene
    ifequal SCENE_MEET_AIDE_OUT_BACK, .Callback_MeetAideOutBack
		ifequal SCENE_CHOOSE_STARTER, .Callback_ChooseStarter
    endcallback

.Callback_MeetAideOutBack:
    appear ROCK_SALT_TOWN_AIDE

    moveobject ROCK_SALT_TOWN_JADE, 29, 6
		appear ROCK_SALT_TOWN_JADE

    endcallback

.Callback_ChooseStarter:
    moveobject ROCK_SALT_TOWN_AIDE, 25, 12
		moveobject ROCK_SALT_TOWN_JADE, 28, 6

		endcallback

SceneSetup_RockSaltTownNoop:
	end

SceneSetup_MeetAideOutBack:
	readmem wPlayerMapX
	ifequal 29, .position2
.position1
	sdefer Script_MeetAideOutBack1
	end
.position2
	sdefer Script_MeetAideOutBack2
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

Script_MeetAideOutBack1:
	scall Script_AideCallsToPlayer
	applymovement PLAYER, .Movement_WalkToAide1
	sjump Script_MeetAideOutBack

.Movement_WalkToAide1:
	step UP
	step UP
	step_end

Script_MeetAideOutBack2:
	scall Script_AideCallsToPlayer
	applymovement PLAYER, .Movement_WalkToAide2
	sjump Script_MeetAideOutBack

.Movement_WalkToAide2:
	step UP
	step LEFT
	step UP
	step_end

Script_AideCallsToPlayer:
	opentext
	writetext .Text_OverHere
	waitbutton
	closetext
	end

.Text_OverHere:
	text "Over here!"
	done

Script_MeetAideOutBack:
	opentext
	writetext .Text_ReferToPokemon
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideWalksToFence
	turnobject ROCK_SALT_TOWN_JADE, UP
	pause 15

	opentext
	writetext .Text_JadeInAwe
	waitbutton
	closetext
	pause 10

	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeWalksToYou1
	turnobject PLAYER, RIGHT
	opentext
	writetext .Text_IveStudiedForYears
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeStepsUp
	turnobject PLAYER, UP
	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeLooksAtEachStarter
	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeWalksToYou2

	setscene SCENE_CHOOSE_STARTER
	sjump Script_RockSaltTownJade

.Movement_AideWalksToFence:
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement_JadeStepsUp:
	step UP
	step_end

.Movement_JadeWalksToYou1:
	step DOWN
	turn_head LEFT
	step_end

.Movement_JadeLooksAtEachStarter
	step UP
	step_sleep 25
	step LEFT
	turn_head UP
	step_sleep 25
	step LEFT
	turn_head UP
	step_sleep 25
	step_end

.Movement_JadeWalksToYou2:
	step DOWN
	step RIGHT
	turn_head DOWN
	step_end

.Text_ReferToPokemon:
	text "These #MON are"
	line "here to help."
	done

.Text_JadeInAwe:
	text "Wow..."

	para "They're amazing."

	done

.Text_IveStudiedForYears:
	text "I've studied"
	line "#MON for"
	cont "years..."

	done

Script_RockSaltTownAide:
	checkscene
	ifequal SCENE_CHOOSE_STARTER, .Script_AideFixingFence
	end

.Script_AideFixingFence:
	jumptextfaceplayer .Text_FixingFence

.Text_FixingFence:
	text "I'm still fixing"
	line "the fence!"
	done

Script_RockSaltTownJade:
	checkscene
	ifequal SCENE_CHOOSE_STARTER, .Script_JadeWaitsForYouToChooseStarter
	end

.Script_JadeWaitsForYouToChooseStarter:
	jumptextfaceplayer .Text_CanYouChooseFirst

.Text_CanYouChooseFirst:
	text "Can you choose"
	line "first?"

	para "I think I'm a"
	line "little nervous..."

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

starter_script CYNDAQUIL, TOTODILE

.Movement_JadeWalksToTOTODILE:
	step UP
	step_end

.Movement_JadeWalksToLabFromTOTODILE:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

starter_script TOTODILE, CHIKORITA

.Movement_JadeWalksToCHIKORITA:
	step RIGHT
	step UP
	step_end

.Movement_JadeWalksToLabFromCHIKORITA:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

starter_script CHIKORITA, CYNDAQUIL

.Movement_JadeWalksToCYNDAQUIL:
	step LEFT
	step UP
	step_end

.Movement_JadeWalksToLabFromCYNDAQUIL:
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

Text_ConfirmStarterChoice:
	text "Do you want the"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

Text_ItSeemsToLikeYou:
	text "It seems to like"
	line "you!"
	done

Text_ItChoseYou:
	text "It chose you!"

	para "That's amazing..."

	done

Text_IllChoseThisOne:
	text "I'll choose this"
	line "one."

	para "We should work"
	line "well together!"

	done

Text_PlayerReceivedStarter:
	text "<PLAYER> received"
	line "the @"
	text_ram wStringBuffer3
	text "!"
	done

Text_JadeReceivedStarter:
	text "JADE received"
	line "the @"
	text_ram wStringBuffer3
	text "!"
	done

Text_Hurry:
	text "<PLAYER>, hurry!"
	done

Script_AideFinishesFixingFence:
	disappear ROCK_SALT_TOWN_AIDE
	moveobject ROCK_SALT_TOWN_AIDE, 25, 9
	turnobject ROCK_SALT_TOWN_AIDE, UP
	appear ROCK_SALT_TOWN_AIDE
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideReturns
	opentext
	writetext .Text_TheFenceIsFixed
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideWalksToLab
	playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_TOWN_AIDE
	end

.Movement_AideReturns:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

.Movement_AideWalksToLab:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

.Text_TheFenceIsFixed:
	text "The fence is"
	line "fixed!"

	done

Script_AlreadyChoseStarter:
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
    text "<PLAYER>'S HOUSE"
    done

RockSaltTownJadesHouseSign:
    jumptext RockSaltTownJadesHouseSigntText

RockSaltTownJadesHouseSigntText:
    text "JADE'S HOUSE"
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

Script_MeetJade:
	opentext
	writetext .Text_JadeCallsOut
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeApproachesYou
	turnobject PLAYER, LEFT

	opentext
	writetext .Text_JadeIntro
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeGoesHome
	disappear ROCK_SALT_TOWN_JADE
	setscene SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	end

.Movement_JadeApproachesYou:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Movement_JadeGoesHome:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step LEFT
	step_end

.Text_JadeCallsOut:
	text "<PLAYER>!"
	done

.Text_JadeIntro:
	text "TODO"
	done

RockSaltTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 19, ROCK_SALT_PLAYERS_HOUSE, 1
	warp_event 21, 13, ROCK_SALT_JADES_HOUSE, 1
	warp_event 28, 13, ROCK_SALT_LAB, 1
	warp_event 35, 17, ROCK_SALT_BOOKWORMS_HOUSE, 1
	warp_event 17, 17, ROCK_SALT_OLD_MANS_HOUSE, 1
	warp_event 28,  9, ROCK_SALT_LAB, 3
	warp_event 29,  9, ROCK_SALT_LAB, 4
	warp_event 12, 11, ROCK_SALT_CAVE_1F, 6

	def_coord_events
	coord_event 29, 20, SCENE_MEET_JADE, Script_MeetJade
	coord_event 14, 19, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU, RockSaltTown_OldManStopsYouScene

	def_bg_events
	bg_event 26, 14, BGEVENT_READ, RockSaltTownLabSign
	bg_event 27, 19, BGEVENT_READ, RockSaltTownPlayersHouseSign
	bg_event 23, 15, BGEVENT_READ, RockSaltTownJadesHouseSign

	def_object_events
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockSaltTownOldManScript, -1
	object_event 24, 20, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownJade, EVENT_JADE_IN_ROCK_SALT_TOWN
	object_event 28,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownAide, EVENT_AIDE_IN_ROCK_SALT_TOWN
	object_event 27,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownCYNDAQUIL, EVENT_CYNDAQUIL_IN_ROCK_SALT_TOWN
	object_event 28,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownTOTODILE, EVENT_TOTODILE_IN_ROCK_SALT_TOWN
	object_event 29,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownCHIKORITA, EVENT_CHIKORITA_IN_ROCK_SALT_TOWN
	object_event 23, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 25,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 39, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 37, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 32,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 34, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownTaurosScript, -1
	object_event 26, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownFruitTree, -1
	object_event 22, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RockSaltTownYoungsterScript, -1
	object_event 31, 16, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RockSaltTownGardenerScript, -1
