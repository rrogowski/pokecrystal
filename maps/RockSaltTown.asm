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
	scene_script SceneSetup_TaurosLoose, SCENE_TAUROS_LOOSE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Callback_RockSaltTownMoveObjects

Callback_RockSaltTownMoveObjects:
	checkscene
	ifequal SCENE_MEET_AIDE_OUT_BACK, .Callback_MeetAideOutBack
	ifequal SCENE_TAUROS_LOOSE, .Callback_TaurosLoose
	endcallback

.Callback_MeetAideOutBack:
	moveobject ROCK_SALT_TOWN_JADE, 28, 6
	scall .Callback_TaurosLoose
	endcallback

.Callback_TaurosLoose:
.check_tauros_1
	checkflag ENGINE_DEFEATED_TAUROS_1
	iftrue .check_tauros_2
	; near flowers in front of oak's lab
	moveobject ROCK_SALT_TOWN_TAUROS_1, 32, 15
.check_tauros_2
	checkflag ENGINE_DEFEATED_TAUROS_2
	iftrue .check_tauros_3
	; in front of player's house
	moveobject ROCK_SALT_TOWN_TAUROS_2, 29, 20	
.check_tauros_3
	checkflag ENGINE_DEFEATED_TAUROS_3
	iftrue .add_other_tauros
	; drinking water south of old man's house
	moveobject ROCK_SALT_TOWN_TAUROS_3, 22, 19
.add_other_tauros
	; in front of jade's house
	moveobject ROCK_SALT_TOWN_TAUROS_4, 21, 14
	; in front of old man's house
	moveobject ROCK_SALT_TOWN_TAUROS_5, 17, 18
	; in front of bookworm's house
	moveobject ROCK_SALT_TOWN_TAUROS_6, 35, 18
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
.done
	end

SceneSetup_TaurosLoose:
	turnobject ROCK_SALT_TOWN_JADE, UP
	turnobject ROCK_SALT_TOWN_AIDE, UP
	end

Script_OldManStopsYouFromLeaving:
	faceplayer
	opentext
	writetext .Text_StopRightThere
	waitbutton
	closetext

	follow PLAYER, ROCK_SALT_TOWN_OLD_MAN
	applymovement PLAYER, .Movement_OldManWalksYouBack
	stopfollow
	turnobject ROCK_SALT_TOWN_OLD_MAN, RIGHT

	opentext
	writetext Text_ItsDangerousAhead
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_OLD_MAN, .Movement_OldManReturnsToStartingLocation

	end

.Movement_OldManWalksYouBack:
	step RIGHT
	turn_head LEFT
	step_end

.Movement_OldManReturnsToStartingLocation:
	step UP
	turn_head DOWN
	step_end

.Text_StopRightThere:
	text "Stop right there!"
	done

Text_ItsDangerousAhead:
	text "The grass ahead is"
	line "dangerous."

	para "Wild #MON"
	line "won't hold back."

	para "Get yourself a"
	line "#MON first!"
	
	done

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
	writetext Text_ItsDangerousAhead
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

Script_MeetAideOutBack1:
	scall Script_AideCallsToPlayer
	applymovement PLAYER, .Movement_WalkToAide1
	sjump Script_MeetAideOutBack

.Movement_WalkToAide1:
	step UP
	step RIGHT
	step UP
	step_end

Script_MeetAideOutBack2:
	scall Script_AideCallsToPlayer
	applymovement PLAYER, .Movement_WalkToAide2
	sjump Script_MeetAideOutBack

.Movement_WalkToAide2:
	step UP
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
	disappear ROCK_SALT_TOWN_AIDE
	turnobject ROCK_SALT_TOWN_JADE, UP
	pause 15

	opentext
	writetext .Text_JadeInAwe
	waitbutton
	closetext
	pause 10

	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeWalksToYou1
	turnobject PLAYER, LEFT
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
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement_JadeWalksToYou1:
	step DOWN
	turn_head RIGHT
	step_end

.Movement_JadeStepsUp:
	step UP
	step_end

.Movement_JadeLooksAtEachStarter
	step UP	
	step_sleep 25
	step LEFT
	step LEFT
	turn_head UP
	step_sleep 25
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_sleep 25
	step_end

.Movement_JadeWalksToYou2:
	step LEFT
	step DOWN
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
	end

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

Script_Tauros1:
	checkscene
	ifnotequal SCENE_TAUROS_LOOSE, Script_TaurosMoo

	checkflag ENGINE_DEFEATED_TAUROS_1
	iftrue .already_defeated

	opentext
	writetext Text_TaurosAttacked
	waitbutton
	closetext
	loadwildmon TAUROS, 2
	startbattle
	setflag ENGINE_DEFEATED_TAUROS_1
	advancequest QUEST_TROUBLE_WITH_TAUROS
	reloadmapafterbattle
	special FadeOutToBlack
	disappear ROCK_SALT_TOWN_TAUROS_1
	moveobject ROCK_SALT_TOWN_TAUROS_1, 23, 10
	appear ROCK_SALT_TOWN_TAUROS_1
	special FadeInFromBlack
	opentext
	writetext Text_TaurosCalmedDown
	waitbutton
	closetext
	canturninquest QUEST_TROUBLE_WITH_TAUROS
	iftrue Script_WarpPlayerBackToLab

.already_defeated
	end

Script_Tauros2:
	checkscene
	ifnotequal SCENE_TAUROS_LOOSE, Script_TaurosMoo

	checkflag ENGINE_DEFEATED_TAUROS_2
	iftrue .already_defeated

	opentext
	writetext Text_TaurosAttacked
	waitbutton
	closetext
	loadwildmon TAUROS, 2
	startbattle
	setflag ENGINE_DEFEATED_TAUROS_2
	advancequest QUEST_TROUBLE_WITH_TAUROS
	reloadmapafterbattle
	special FadeOutToBlack
	disappear ROCK_SALT_TOWN_TAUROS_2
	moveobject ROCK_SALT_TOWN_TAUROS_2, 32, 9
	appear ROCK_SALT_TOWN_TAUROS_2
	special FadeInFromBlack
	opentext
	writetext Text_TaurosCalmedDown
	waitbutton
	closetext
	canturninquest QUEST_TROUBLE_WITH_TAUROS
	iftrue Script_WarpPlayerBackToLab

.already_defeated
	end

Script_Tauros3:
	checkscene
	ifnotequal SCENE_TAUROS_LOOSE, Script_TaurosMoo

	checkflag ENGINE_DEFEATED_TAUROS_3
	iftrue .already_defeated

	opentext
	writetext Text_TaurosAttacked
	waitbutton
	closetext
	loadwildmon TAUROS, 2
	startbattle
	setflag ENGINE_DEFEATED_TAUROS_3
	advancequest QUEST_TROUBLE_WITH_TAUROS
	reloadmapafterbattle
	special FadeOutToBlack
	disappear ROCK_SALT_TOWN_TAUROS_3
	moveobject ROCK_SALT_TOWN_TAUROS_3, 37, 11
	appear ROCK_SALT_TOWN_TAUROS_3
	special FadeInFromBlack
	opentext
	writetext Text_TaurosCalmedDown
	waitbutton
	closetext
	canturninquest QUEST_TROUBLE_WITH_TAUROS
	iftrue Script_WarpPlayerBackToLab

.already_defeated
	end

Text_TaurosAttacked:
	text "The rampaging"
	line "TAUROS attacked!"
	done

Text_TaurosCalmedDown:
	text "The TAUROS"
	line "calmed down!"

	para "It returned to"
	line "its herd."

	done

Script_Tauros4To6:
	checkscene
	ifnotequal SCENE_TAUROS_LOOSE, Script_TaurosMoo
	jumptext .Text_Rampaging
	
.Text_Rampaging:
	text "The TAUROS is"
	line "rampaging!"
	done

Script_TaurosMoo:
	opentext
	writetext .Text_Moo
	cry TAUROS
	waitbutton
	closetext
	end

.Text_Moo:
    text "TAUROS: Moo!"
    done

Script_WarpPlayerBackToLab:
	setscene SCENE_ROCK_SALT_TOWN_NOOP
	setmapscene ROCK_SALT_LAB, SCENE_TROUBLE_WITH_TAUROS_REWARD
	warp ROCK_SALT_LAB, 4, 4
	turnobject PLAYER, LEFT
	end

starter_script CYNDAQUIL, TOTODILE

.Movement_JadeWalksToTOTODILE:
	step LEFT
	step UP
	step_end

.Movement_JadeWalksToLabFromTOTODILE:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.String_DefaultNickname:
	db "CYNDAQUIL@"

starter_script TOTODILE, CHIKORITA

.Movement_JadeWalksToCHIKORITA:
	step RIGHT
	step UP
	step_end

.Movement_JadeWalksToLabFromCHIKORITA:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

.String_DefaultNickname:
	db "TOTODILE@"

starter_script CHIKORITA, CYNDAQUIL

.Movement_JadeWalksToCYNDAQUIL:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_end

.Movement_JadeWalksToLabFromCYNDAQUIL:
	step DOWN
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step_end

.String_DefaultNickname:
	db "CHIKORITA@"

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
	moveobject ROCK_SALT_TOWN_AIDE, 32, 10
	appear ROCK_SALT_TOWN_AIDE
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideReturns
	turnobject PLAYER, DOWN
	turnobject ROCK_SALT_TOWN_JADE, DOWN
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
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

.Movement_AideWalksToLab:
	step DOWN
	step DOWN
	step DOWN
	step_end

.Text_TheFenceIsFixed:
	text "The fence is"
	line "fixed!"

	done

Script_JadeStopsYouFromLeaving1:
	turnobject ROCK_SALT_TOWN_JADE, LEFT
	scall Script_JadeCallsYouBack
	applymovement PLAYER, .Movement_WalkRight
	end

.Movement_WalkRight:
	step RIGHT
	step_end

Script_JadeStopsYouFromLeaving2:
	turnobject ROCK_SALT_TOWN_JADE, DOWN
	scall Script_JadeCallsYouBack
	applymovement PLAYER, .Movement_WalkUp
	end

.Movement_WalkUp:
	step UP
	step_end

Script_JadeStopsYouFromLeaving3:
	turnobject ROCK_SALT_TOWN_JADE, RIGHT
	scall Script_JadeCallsYouBack
	applymovement PLAYER, .Movement_WalkLeft
	end

.Movement_WalkLeft:
	step LEFT
	step_end

Script_JadeCallsYouBack:
	jumptext .Text_JadeCallsYouBack

.Text_JadeCallsYouBack:
	text "Wait!"

	para "We need a Pokemon"
	line "to help!"

	para "Choose one soon!"

	para "The Tauros won't"
	line "wait!"

	done
	
Script_Youngster:
    faceplayer
    opentext
    writetext .Text_YoureNewHereRight
    waitbutton
    closetext
    end

.Text_YoureNewHereRight:
    text "You're new here,"
    line "right?"
    
    para "Have you seen the"
    line "cave at the edge"
    cont "of town?"

		para "They say a really"
		line "strong #MON"
		cont "lives inside!"

		para "I wanna see it"
		line "someday!"
		
    done

Script_Gardener:
	faceplayer
	opentext
	writetext .Text_ILoveWatchingThingsGrow
	waitbutton
	closetext
	end

.Text_ILoveWatchingThingsGrow:
	text "I love watching"
	line "things grow!"

	para "Plants, #MON..."

	para "Everything needs"
	line "care and time."

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
	text "You're <PLAYER>,"
	line "right?"

	para "I'm JADE!"

	para "PROF. CARAWAY"
	line "hired me as a"
	cont "researcher!"

	para "Looks like we'll"
	line "be working"
	cont "together!"

	para "I was sketching"
	line "#MON nearby."

	para "I almost forgot"
	line "the time!"

	para "I'm heading home"
	line "now."

	para "Stop by before you"
	line "go to the lab!"

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
	coord_event 14, 19, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU, Script_OldManStopsYouFromLeaving
	coord_event 25, 5, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving1
	coord_event 25, 6, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving1
	coord_event 25, 7, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving1
	coord_event 28, 8, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving2
	coord_event 29, 8, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving2
	coord_event 30, 8, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving2
	coord_event 31, 6, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving3
	coord_event 31, 7, SCENE_CHOOSE_STARTER, Script_JadeStopsYouFromLeaving3

	def_bg_events
	bg_event 26, 14, BGEVENT_READ, RockSaltTownLabSign
	bg_event 27, 19, BGEVENT_READ, RockSaltTownPlayersHouseSign
	bg_event 23, 15, BGEVENT_READ, RockSaltTownJadesHouseSign

	def_object_events
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockSaltTownOldManScript, -1
	object_event 24, 20, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownJade, EVENT_JADE_IN_ROCK_SALT_TOWN
	object_event 29,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownAide, EVENT_AIDE_IN_ROCK_SALT_TOWN
	object_event 26,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownCYNDAQUIL, EVENT_CYNDAQUIL_IN_ROCK_SALT_TOWN
	object_event 28,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownTOTODILE, EVENT_TOTODILE_IN_ROCK_SALT_TOWN
	object_event 30,  4, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownCHIKORITA, EVENT_CHIKORITA_IN_ROCK_SALT_TOWN
	object_event 23, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros1, -1
	object_event 32,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros2, -1
	object_event 37, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros3, -1
	object_event 39, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros4To6, -1
	object_event 34, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros4To6, -1
	object_event 25,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros4To6, -1
	object_event 26, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownFruitTree, -1
	object_event 22, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_Youngster, -1
	object_event 31, 16, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_Gardener, -1
