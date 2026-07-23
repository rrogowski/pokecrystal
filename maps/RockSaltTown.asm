	object_const_def
	const ROCK_SALT_TOWN_OLD_MAN
	const ROCK_SALT_TOWN_JADE_INTRO
	const ROCK_SALT_TOWN_JADE_BEHIND_LAB
	const ROCK_SALT_TOWN_JADE_BATTLING_TAUROS
	const ROCK_SALT_TOWN_TAUROS_1
	const ROCK_SALT_TOWN_TAUROS_2
	const ROCK_SALT_TOWN_TAUROS_3
	const ROCK_SALT_TOWN_TAUROS_4
	const ROCK_SALT_TOWN_FRUIT_TREE
	const ROCK_SALT_TOWN_YOUNGSTER
	const ROCK_SALT_TOWN_GARDENER

RockSaltTown_MapScripts:
	def_scene_scripts
	scene_script SceneSetup_RockSaltTownNoop, SCENE_MEET_JADE
	scene_script SceneSetup_RockSaltTownNoop, SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	scene_script SceneSetup_RockSaltTownNoop, SCENE_ROCK_SALT_TOWN_NOOP
	scene_script SceneSetup_RockSaltTownNoop, SCENE_TAUROS_LOOSE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Callback_RockSaltTownMoveObjects

Callback_RockSaltTownMoveObjects:
	checkscene
	ifequal SCENE_MEET_JADE, .Callback_MeetJade
	ifequal SCENE_TAUROS_LOOSE, .Callback_TaurosLoose
	endcallback

.Callback_MeetJade:
	appear ROCK_SALT_TOWN_JADE_INTRO
	endcallback

.Callback_TaurosLoose:
.add_players_tauros
	checkevent EVENT_CALMED_RAMPAGING_TAUROS
	iftrue .add_jades_tauros_and_jade
	; drinking water south of old man's house
	moveobject ROCK_SALT_TOWN_TAUROS_2, 23, 19
.add_jades_tauros_and_jade
	; in front of old man's house
	moveobject ROCK_SALT_TOWN_TAUROS_3, 20, 17
	endcallback

SceneSetup_RockSaltTownNoop:
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

Script_PlayersRampagingTauros:
	checkscene
	ifnotequal SCENE_TAUROS_LOOSE, Script_TaurosMoo

	opentext
	writetext Text_TaurosAttacked
	waitbutton
	closetext
	loadwildmon TAUROS, 2
	startbattle
	setevent EVENT_CALMED_RAMPAGING_TAUROS
	advancequest QUEST_TROUBLE_WITH_TAUROS
	disappear ROCK_SALT_TOWN_TAUROS_2
	reloadmapafterbattle
	opentext
	writetext Text_TaurosCalmedDown
	waitbutton
	closetext

	setscene SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	setmapscene ROCK_SALT_LAB, SCENE_TROUBLE_WITH_TAUROS_REWARD
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

Script_JadesRampagingTauros:
	checkscene
	ifnotequal SCENE_TAUROS_LOOSE, Script_TaurosMoo
	jumptext .Text_Rampaging

.Text_Rampaging:
	text "The TAUROS is"
	line "rampaging!"
	done

Script_Tauros:
	faceplayer
	sjump Script_TaurosMoo

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

Script_JadeBattlingTauros:
	jumptextfaceplayer .Text_ICanHandleThisOne

.Text_ICanHandleThisOne:
	text "I can handle"
	line "this one!"
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

	showemote EMOTE_QUESTION, ROCK_SALT_TOWN_JADE_BEHIND_LAB, 15
	opentext
	writetext Text_AreYouSure
	yesorno
	closetext

	iftrue .TooDangerous

	turnobject ROCK_SALT_TOWN_JADE_BEHIND_LAB, UP
	pause 40
	showemote EMOTE_SHOCK, ROCK_SALT_TOWN_JADE_BEHIND_LAB, 15
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
	applymovement ROCK_SALT_TOWN_JADE_BEHIND_LAB, Movement_JadeEntersCave
	waitsfx
	disappear ROCK_SALT_TOWN_JADE_BEHIND_LAB

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

Movement_JadeEntersCave:
	step UP
	step_end

Script_MeetJade:
	opentext
	writetext .Text_JadeCallsOut
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_JADE_INTRO, .Movement_JadeApproachesYou

	opentext
	writetext .Text_JadeIntro
	waitbutton
	closetext

	turnobject PLAYER, LEFT
	applymovement ROCK_SALT_TOWN_JADE_INTRO, .Movement_JadeGoesHome
	disappear ROCK_SALT_TOWN_JADE_INTRO
	setscene SCENE_ROCK_SALT_TOWN_OLD_MAN_STOPS_YOU
	end

.Movement_JadeApproachesYou:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head UP
	step_end

.Movement_JadeGoesHome:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
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
	def_bg_events
	bg_event 26, 14, BGEVENT_READ, RockSaltTownLabSign
	bg_event 27, 19, BGEVENT_READ, RockSaltTownPlayersHouseSign
	bg_event 23, 15, BGEVENT_READ, RockSaltTownJadesHouseSign

	def_object_events
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RockSaltTownOldManScript, -1
	object_event 35, 21, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_TOWN_JADE_INTRO
	object_event 28, 6, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_RockSaltTownJade, EVENT_JADE_BEHIND_LAB_IN_ROCK_SALT_TOWN
	object_event 20, 19, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_JadeBattlingTauros, EVENT_ROCK_SALT_TOWN_JADE_BATTLING_TAUROS
	object_event 23, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros, -1
	object_event 39, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_PlayersRampagingTauros, -1
	object_event 34, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_JadesRampagingTauros, -1
	object_event 25,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros, -1
	object_event 26, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownFruitTree, -1
	object_event 22, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_Youngster, -1
	object_event 31, 16, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_Gardener, -1
