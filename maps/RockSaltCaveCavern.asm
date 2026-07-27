	object_const_def
	const ROCK_SALT_CAVE_CAVERN_MONSTER
	const ROCK_SALT_CAVE_CAVERN_YOUNGSTER
	const ROCK_SALT_CAVE_CAVERN_PROF
	const ROCK_SALT_CAVE_CAVERN_JADE

RockSaltCaveCavern_MapScripts:
	def_scene_scripts
	scene_script SceneSetup_RockSaltCavernNoop, SCENE_YOUNGSTER_CALLS_FOR_HELP
	scene_script SceneSetup_RockSaltCavernNoop, SCENE_ROCK_SALT_CAVERN_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CallbackObjects_RockSaltCavern

CallbackObjects_RockSaltCavern:
	scall SpriteSetup_RockSaltCavern
	endcallback

SpriteSetup_RockSaltCavern:
	setquestgoal QUEST_A_CRY_FOR_HELP, 1

	scall SpriteSetup_RockSaltCavernMonster
	scall SpriteSetup_RockSaltCavernYoungster
	scall SpriteSetup_RockSaltCavernJade
	scall SpriteSetup_RockSaltCavernProf
	end

SpriteSetup_RockSaltCavernMonster:
	canturninquest QUEST_A_CRY_FOR_HELP
	iffalse .case1
	sjump .default
.case1
	appear ROCK_SALT_CAVE_CAVERN_MONSTER
	end
.default
	disappear ROCK_SALT_CAVE_CAVERN_MONSTER
	end

SpriteSetup_RockSaltCavernYoungster:
	canturninquest QUEST_A_CRY_FOR_HELP
	iffalse .case1
	sjump .default
.case1
	appear ROCK_SALT_CAVE_CAVERN_YOUNGSTER
	end
.default
	disappear ROCK_SALT_CAVE_CAVERN_YOUNGSTER
	end

SpriteSetup_RockSaltCavernProf:
	disappear ROCK_SALT_CAVE_CAVERN_PROF
	end

SpriteSetup_RockSaltCavernJade:
	disappear ROCK_SALT_CAVE_CAVERN_JADE
	end

SceneSetup_RockSaltCavernNoop:
	end

Script_YoungsterCallsForHelp:
	opentext
	writetext .Text_Help
	waitbutton
	closetext
	setscene SCENE_ROCK_SALT_CAVERN_NOOP
	end

.Text_Help:
	text "YOUNGSTER: Help!"

	para "I can't get away!"

	para "I don't think"
	line "it'll let me pass!"

	para "Watch out!"

	para "That #MON is"
	line "really strong!"

	done

Script_RockSaltCavernMonster:
	faceplayer
	opentext
	cry NIDORINO
	writetext .Text_Cry
	waitsfx
	waitbutton
	closetext

	loadwildmon NIDORINO, 7
	encountermusic
	startbattle
	disappear ROCK_SALT_CAVE_CAVERN_MONSTER
	reloadmapafterbattle
	advancequest QUEST_A_CRY_FOR_HELP
	pause 10

	applymovement ROCK_SALT_CAVE_CAVERN_YOUNGSTER, .Movement_YoungsterWalksToYou
	opentext
	writetext .Text_ThankGoodness
	waitbutton
	closetext

	appear ROCK_SALT_CAVE_CAVERN_PROF
	applymovement ROCK_SALT_CAVE_CAVERN_PROF, .Movement_StepUp
	appear ROCK_SALT_CAVE_CAVERN_JADE
	follow ROCK_SALT_CAVE_CAVERN_PROF, ROCK_SALT_CAVE_CAVERN_JADE
	applymovement ROCK_SALT_CAVE_CAVERN_PROF, .Movement_ProfWalksUpToYou
	stopfollow
	applymovement ROCK_SALT_CAVE_CAVERN_JADE, .Movement_JadeWalksUpToYou

	turnobject PLAYER, LEFT
	opentext
	writetext .Text_JadePart1
	waitbutton
	turnobject PLAYER, DOWN
	writetext .Text_ProfPart1
	waitbutton
	turnobject PLAYER, LEFT
	writetext .Text_JadePart2
	waitbutton
	turnobject PLAYER, DOWN
	writetext .Text_ProfPart2
	waitbutton
	closetext

	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	setmapscene ROCK_SALT_CAVE_1F, SCENE_ROCK_SALT_CAVE_1F_UNOWN_ENCOUNTER
	setmapscene ROCK_SALT_LAB, SCENE_ROCK_SALT_LAB_RECEIVE_DEX
	warp ROCK_SALT_LAB, 4, 5

	end

.Text_Cry:
	text "GYYAAAHHHH!"
	done

.Text_ThankGoodness:
	text "Thank goodness!"

	para "I thought I was"
	line "stuck here"
	cont "forever!"

	para "Thanks for"
	line "saving me!"

	done

.Movement_YoungsterWalksToYou:
	step LEFT
	step_end

.Movement_StepUp:
	step UP
	step_end

.Movement_ProfWalksUpToYou:
	step UP
	step UP
	step UP
	step_end

.Movement_JadeWalksUpToYou:
	step LEFT
	step UP
	step UP
	turn_head RIGHT
	step_end

.Text_JadePart1:
	text "JADE: <PLAYER>!"
	line "You're okay!"
	done

.Text_ProfPart1:
	text "CARAWAY: Excellent"
	line "work."

	para "I was worried when"
	line "I heard what"
	cont "happened."

	para "You handled the"
	line "situation calmly."

	para "That's exactly"
	line "what a researcher"
	cont "should do."

	done

.Text_JadePart2
	text "JADE: It was"
	line "amazing..."

	para "You really worked"
	line "with your #MON."

	para "I still have a"
	line "lot to learn."

	done

.Text_ProfPart2:
	text "CARAWAY: Let's"
	line "return to the lab."

	para "There is much we"
	line "need to discuss."

	done

RockSaltCaveCavernHiddenSuperRepel:
	hiddenitem SUPER_REPEL, EVENT_ROCK_SALT_CAVE_CAVERN_HIDDEN_SUPER_REPEL

RockSaltCaveCavern_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, ROCK_SALT_CAVE_1F, 4

	def_coord_events
	coord_event 3, 3, SCENE_YOUNGSTER_CALLS_FOR_HELP, Script_YoungsterCallsForHelp
	coord_event 4, 3, SCENE_YOUNGSTER_CALLS_FOR_HELP, Script_YoungsterCallsForHelp

	def_bg_events
	bg_event 6, 2, BGEVENT_ITEM, RockSaltCaveCavernHiddenSuperRepel

	def_object_events
	object_event 5, 2, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_RockSaltCavernMonster, EVENT_ROCK_SALT_CAVERN_MONSTER
	object_event 6, 2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_CAVERN_YOUNGSTER
	object_event  4,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_CAVERN_PROF
	object_event  4,  7, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_CAVERN_JADE
