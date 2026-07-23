	object_const_def
	const ROCK_SALT_CAVE_CAVERN_MONSTER
	const ROCK_SALT_CAVE_CAVERN_YOUNGSTER
	const ROCK_SALT_CAVE_CAVERN_PROF
	const ROCK_SALT_CAVE_CAVERN_JADE

RockSaltCaveCavern_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltCaveCavernMonsterScript:
	faceplayer
	opentext
	cry NIDORINO
	writetext RockSaltCaveCavernMonsterText
	waitsfx
	waitbutton
	closetext

	loadwildmon NIDORINO, 12
	encountermusic
	startbattle
	disappear ROCK_SALT_CAVE_CAVERN_MONSTER
	appear ROCK_SALT_CAVE_CAVERN_PROF
	appear ROCK_SALT_CAVE_CAVERN_JADE
	reloadmapafterbattle
	pause 10
	
	sjump RockSaltCaveCavernJadeAndProfEnterScript

RockSaltCaveCavernMonsterText:
	text "GYYAAAHHHH!"
	done

RockSaltCaveCavernJadeAndProfEnterScript:
	follow ROCK_SALT_CAVE_CAVERN_PROF, ROCK_SALT_CAVE_CAVERN_JADE
	applymovement ROCK_SALT_CAVE_CAVERN_PROF, .Movement_ProfWalksUpToYou
	stopfollow
	applymovement ROCK_SALT_CAVE_CAVERN_JADE, .Movement_JadeWalksUpToYou

	opentext
	writetext .Text_OakAndJadeSpeech
	waitbutton
	closetext

	playsound SFX_EXIT_BUILDING
	special FadeOutToWhite
	waitsfx
	disappear ROCK_SALT_CAVE_CAVERN_YOUNGSTER
	disappear ROCK_SALT_CAVE_CAVERN_PROF
	disappear ROCK_SALT_CAVE_CAVERN_JADE
	setmapscene ROCK_SALT_LAB, SCENE_ROCK_SALT_LAB_RECEIVE_DEX
	warp ROCK_SALT_LAB, 4, 5

	end

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

.Text_OakAndJadeSpeech:
	text "Dialogue..."
	done

RockSaltCaveCavernHiddenSuperRepel:
	hiddenitem SUPER_REPEL, EVENT_ROCK_SALT_CAVE_CAVERN_HIDDEN_SUPER_REPEL

RockSaltCaveCavern_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, ROCK_SALT_CAVE_1F, 4

	def_coord_events

	def_bg_events
	bg_event 6, 2, BGEVENT_ITEM, RockSaltCaveCavernHiddenSuperRepel

	def_object_events
	object_event 5, 2, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltCaveCavernMonsterScript, EVENT_BEAT_ROCK_SALT_CAVE_MONSTER
	object_event 6, 2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, -1, EVENT_RESCUED_YOUNGSTER
	object_event 4, 6, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, -1, EVENT_RETURNED_TO_LAB_AFTER_ROCK_SALT_CAVE_MONSTER
	object_event 4, 7, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, -1, EVENT_RETURNED_TO_LAB_AFTER_ROCK_SALT_CAVE_MONSTER
	