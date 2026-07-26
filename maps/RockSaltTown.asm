	object_const_def
	const ROCK_SALT_TOWN_OLD_MAN
	const ROCK_SALT_TOWN_JADE_INTRO
	const ROCK_SALT_TOWN_JADE_BATTLING_TAUROS
	const ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE
	const ROCK_SALT_TOWN_TAUROS_1
	const ROCK_SALT_TOWN_TAUROS_2
	const ROCK_SALT_TOWN_TAUROS_3
	const ROCK_SALT_TOWN_TAUROS_4
	const ROCK_SALT_TOWN_TAUROS_RAMPAGING_AGAINST_JADE
	const ROCK_SALT_TOWN_TAUROS_RAMPAGING_AGAINST_PLAYER
	const ROCK_SALT_TOWN_FRUIT_TREE
	const ROCK_SALT_TOWN_YOUNGSTER
	const ROCK_SALT_TOWN_YOUNGSTER_TALKING_TO_OLD_MAN
	const ROCK_SALT_TOWN_GARDENER
	const ROCK_SALT_TOWN_AIDE

RockSaltTown_MapScripts:
	def_scene_scripts
	scene_script SceneSetup_RockSaltTownNoop, SCENE_MEET_JADE
	scene_script SceneSetup_RockSaltTownNoop, SCENE_OLD_MAN_STOPS_YOU
	scene_script SceneSetup_RockSaltTownNoop, SCENE_TAUROS_RAMPAGING
	scene_script SceneSetup_RockSaltTownNoop, SCENE_OLD_MAN_AND_YOUNGSTER_BLOCK_YOU
	scene_script SceneSetup_RockSaltTownNoop, SCENE_YOUNGSTER_MISSING

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CallbackObjects_RockSaltTown

CallbackObjects_RockSaltTown:
	scall SpriteSetup_RockSaltTown
	endcallback

SpriteSetup_RockSaltTown:
	checkscene
	scall SpriteSetup_JadeIntro
	scall SpriteSetup_JadeBattlingTauros
	scall SpriteSetup_Tauros
	scall SpriteSetup_TaurosRampaging
	scall SpriteSetup_Youngster
	scall SpriteSetup_YoungsterTalkingToOldMan
	scall SpriteSetup_Aide
	end

SpriteSetup_JadeIntro:
	ifequal SCENE_MEET_JADE, .case1
	sjump .default
.case1
	appear ROCK_SALT_TOWN_JADE_INTRO
	end
.default
	disappear ROCK_SALT_TOWN_JADE_INTRO
	end

SpriteSetup_JadeBattlingTauros:
	ifequal SCENE_TAUROS_RAMPAGING, .case1
	sjump .default
.case1
	appear ROCK_SALT_TOWN_JADE_BATTLING_TAUROS
	end
.default
	disappear ROCK_SALT_TOWN_JADE_BATTLING_TAUROS
	end

SpriteSetup_Tauros:
	ifequal SCENE_TAUROS_RAMPAGING, .case1
	sjump .default
.case1
	disappear ROCK_SALT_TOWN_TAUROS_1
	disappear ROCK_SALT_TOWN_TAUROS_2
	disappear ROCK_SALT_TOWN_TAUROS_3
	disappear ROCK_SALT_TOWN_TAUROS_4
	end
.default
	appear ROCK_SALT_TOWN_TAUROS_1
	appear ROCK_SALT_TOWN_TAUROS_2
	appear ROCK_SALT_TOWN_TAUROS_3
	appear ROCK_SALT_TOWN_TAUROS_4
	end

SpriteSetup_TaurosRampaging:
	ifequal SCENE_TAUROS_RAMPAGING, .case1
	sjump .default
.case1
	appear ROCK_SALT_TOWN_TAUROS_RAMPAGING_AGAINST_PLAYER
	appear ROCK_SALT_TOWN_TAUROS_RAMPAGING_AGAINST_JADE
	end
.default
	disappear ROCK_SALT_TOWN_TAUROS_RAMPAGING_AGAINST_PLAYER
	disappear ROCK_SALT_TOWN_TAUROS_RAMPAGING_AGAINST_JADE
	end

SpriteSetup_Youngster:
	ifequal SCENE_YOUNGSTER_MISSING, .case1
	ifequal SCENE_OLD_MAN_AND_YOUNGSTER_BLOCK_YOU, .case1
	sjump .default
.case1
	disappear ROCK_SALT_TOWN_YOUNGSTER
	end
.default
	appear ROCK_SALT_TOWN_YOUNGSTER
	end

SpriteSetup_YoungsterTalkingToOldMan:
	ifequal SCENE_OLD_MAN_AND_YOUNGSTER_BLOCK_YOU, .case1
	sjump .default
.case1
	appear ROCK_SALT_TOWN_YOUNGSTER_TALKING_TO_OLD_MAN
	end
.default
	disappear ROCK_SALT_TOWN_YOUNGSTER_TALKING_TO_OLD_MAN
	end

SpriteSetup_Aide:
	disappear ROCK_SALT_TOWN_AIDE
	end

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

Script_OldMan:
	checkscene
	ifequal SCENE_OLD_MAN_STOPS_YOU, .Script_ItsDangerousAhead
	ifequal SCENE_OLD_MAN_AND_YOUNGSTER_BLOCK_YOU, .Script_StayAway
	sjump ObjectEvent

.Script_StayAway:
	jumptextfaceplayer .Text_StayAway

.Script_ItsDangerousAhead:
	jumptextfaceplayer Text_ItsDangerousAhead

.Text_StayAway:
	text "Stay away from"
	line "Rock Salt Cave!"

	para "It's far too"
	line "dangerous!"

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
	opentext
	writetext Text_TaurosAttacked
	cry TAUROS
	waitbutton
	closetext
	loadwildmon TAUROS, 2
	loadvar VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	advancequest QUEST_TROUBLE_WITH_TAUROS
	setscene SCENE_OLD_MAN_AND_YOUNGSTER_BLOCK_YOU
	scall SpriteSetup_RockSaltTown
	reloadmapafterbattle
	opentext
	writetext Text_TaurosCalmedDown
	waitbutton
	closetext

	readvar VAR_FACING
	ifequal DOWN, .location2
	ifequal LEFT, .location3

.location1
	appear ROCK_SALT_TOWN_AIDE
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideWalksToYou1
	turnobject PLAYER, UP
	turnobject ROCK_SALT_TOWN_AIDE, DOWN
	scall .Script_AideThanksYou
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideLeaves1
	sjump .done

.location2
	moveobject ROCK_SALT_TOWN_AIDE, 18, 18
	appear ROCK_SALT_TOWN_AIDE
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideWalksToYou2
	turnobject PLAYER, LEFT
	scall .Script_AideThanksYou
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideLeaves2
	sjump .done

.location3
	moveobject ROCK_SALT_TOWN_AIDE, 19, 18
	appear ROCK_SALT_TOWN_AIDE
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideWalksToYou3
	turnobject PLAYER, UP
	turnobject ROCK_SALT_TOWN_AIDE, DOWN
	scall .Script_AideThanksYou
	applymovement ROCK_SALT_TOWN_AIDE, .Movement_AideLeaves3
	sjump .done

.done
	disappear ROCK_SALT_TOWN_AIDE
	setmapscene ROCK_SALT_LAB, SCENE_TROUBLE_WITH_TAUROS_REWARD
	end

.Script_AideThanksYou:
	jumptext .Text_NiceWork

.Movement_AideWalksToYou1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Movement_AideWalksToYou2:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Movement_AideWalksToYou3:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Movement_AideLeaves1:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Movement_AideLeaves2:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

.Movement_AideLeaves3:
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

.Text_NiceWork:
	text "Nice work!"

	para "The TAUROS are"
	line "all safe now."

	para "PROF. CARAWAY"
	line "wants to see you."

	para "JADE is already"
	line "back at the lab."

	para "Let's head back."

	done

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
	opentext
	writetext .Text_Rampaging
	cry TAUROS
	waitbutton
	closetext
	end

.Text_Rampaging:
	text "The TAUROS is"
	line "rampaging!"
	done

Script_Tauros:
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
	isquestturnedin QUEST_A_CRY_FOR_HELP
	iftrue .Script_AfterQuest

	canturninquest QUEST_A_CRY_FOR_HELP
	iftrue .Script_TurnInQuest

	jumptextfaceplayer .Text_YoureNewHereRight

.Script_AfterQuest:
	jumptextfaceplayer .Text_ICantBelieve

.Script_TurnInQuest:
	faceplayer
	opentext
	writetext .Text_ICantBelieve
	waitbutton
	closetext
	turninquest QUEST_A_CRY_FOR_HELP
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

.Text_ICantBelieve:
	text "I can't believe"
	line "that was only a"
	cont "NIDORINO..."

	para "So then..."

	para "What's the strong"
	line "#MON everyone"
	cont "talks about?"

	para "I kinda wanna"
	line "find out..."

	para "Maybe someday!"

	done

Script_YoungsterTalkingToOldMan:
	jumptextfaceplayer .Text_IfOnly

.Text_IfOnly:
	text "If only I had"
	line "a #MON"
	cont "of my own..."

	para "Then I could"
	line "have helped with"
	cont "the Tauros..."

	para "Wait!"

	para "I should search"
	line "Rock Salt Cave!"

	para "It's said that a"
	line "strong #MON"
	cont "lives there!"

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
	setscene SCENE_OLD_MAN_STOPS_YOU
	scall SpriteSetup_RockSaltTown
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

Script_JadeOutsideRockSaltCave:
	faceplayer
	opentext
	writetext .Text_Wait
	yesorno
	iffalse .no
	writetext .Text_ThankYou
	waitbutton
	closetext
	unlockquest QUEST_A_CRY_FOR_HELP
	setquestgoal QUEST_A_CRY_FOR_HELP, 1

	readvar VAR_FACING
	ifequal RIGHT, .case1
	ifequal LEFT, .case2
	sjump .case3
.case1
	applymovement ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, .Movement_StepRight
	turnobject ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, LEFT
	scall .Script_IllFollow
	applymovement PLAYER, .Movement_StepRight
	sjump .entercave
.case2
	applymovement ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, .Movement_StepLeft
	turnobject ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, RIGHT
	scall .Script_IllFollow
	applymovement PLAYER, .Movement_StepLeft
	sjump .entercave
.case3
	applymovement ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, .Movement_StepLeft
	turnobject ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, RIGHT
	scall .Script_IllFollow
	applymovement PLAYER, .Movement_StepUp
	sjump .entercave
	end

.entercave
	follow PLAYER, ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE
	applymovement PLAYER, .Movement_StepUp
	stopfollow
	warpcheck
	end

.no
	writetext .Text_SomethingIsWrong
	closetext
	turnobject ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE, UP
	end

.Script_IllFollow:
	opentext
	writetext .Text_IllFollow
	waitbutton
	closetext
	end

.Movement_StepRight:
	step RIGHT
	step_end

.Movement_StepLeft:
	step LEFT
	step_end

.Movement_StepUp:
	step UP
	step_end

.Text_Wait:
	text "<PLAYER>!"

	para "I heard a #MON"
	line "cry from inside"
	cont "the cave."

	para "It sounded like"
	line "it was in trouble."

	para "I wanted to"
	line "help..."

	para "But I couldn't"
	line "go in alone."

	para "Can you help me?"
	line "Please?"

	done

.Text_ThankYou:
	text "Thank you!"

	para "I knew I could"
	line "count on you."

	para "Let's find that"
	line "#MON."

	para "We have to hurry!"

	done

.Text_IllFollow:
	text "I'll follow"
	line "behind you."

	para "Be careful!"

	done

.Text_SomethingIsWrong:
	text "Something's wrong"
	line "inside the cave."

	para "I can't just"
	line "ignore it."

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
	coord_event 14, 19, SCENE_OLD_MAN_STOPS_YOU, Script_OldManStopsYouFromLeaving

	def_bg_events
	bg_event 26, 14, BGEVENT_READ, RockSaltTownLabSign
	bg_event 27, 19, BGEVENT_READ, RockSaltTownPlayersHouseSign
	bg_event 23, 15, BGEVENT_READ, RockSaltTownJadesHouseSign

	def_object_events
	object_event 14, 18, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Script_OldMan, -1
	object_event 35, 21, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_TOWN_JADE_INTRO
	object_event 20, 19, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_JadeBattlingTauros, EVENT_ROCK_SALT_TOWN_JADE_BATTLING_TAUROS
	object_event 12, 12, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_JadeOutsideRockSaltCave, EVENT_ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE
	object_event 23, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros, EVENT_ROCK_SALT_TOWN_TAUROS
	object_event 39, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros, EVENT_ROCK_SALT_TOWN_TAUROS
	object_event 34, 10, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros, EVENT_ROCK_SALT_TOWN_TAUROS
	object_event 25,  9, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Tauros, EVENT_ROCK_SALT_TOWN_TAUROS
	object_event 20, 18, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_JadesRampagingTauros, EVENT_ROCK_SALT_TOWN_TAUROS_RAMPAGING
	object_event 23, 19, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_PlayersRampagingTauros, EVENT_ROCK_SALT_TOWN_TAUROS_RAMPAGING
	object_event 26, 17, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltTownFruitTree, -1
	object_event 22, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_Youngster, EVENT_ROCK_SALT_TOWN_YOUNGSTER
	object_event 14, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_YoungsterTalkingToOldMan, EVENT_ROCK_SALT_TOWN_YOUNGSTER_TALKING_TO_OLD_MAN
	object_event 31, 16, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_Gardener, -1
	object_event 17, 18, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_TOWN_AIDE
