	object_const_def
	const ROCK_SALT_JADES_HOUSE_JADE

RockSaltJadesHouse_MapScripts:
	def_scene_scripts
	scene_script SceneSetup_VisitJadesHouse, SCENE_VISIT_JADES_HOUSE
	scene_script SceneSetup_RockSaltJadesHouseDefault, SCENE_ROCK_SALT_JADES_HOUSE_DEFAULT

	def_callbacks

SceneSetup_VisitJadesHouse:
	sdefer Script_VisitJadesHouse
	end

SceneSetup_RockSaltJadesHouseDefault:
	end

Script_VisitJadesHouse:
	showemote EMOTE_HAPPY, ROCK_SALT_JADES_HOUSE_JADE, 30
	turnobject ROCK_SALT_JADES_HOUSE_JADE, LEFT
	showemote EMOTE_SHOCK, ROCK_SALT_JADES_HOUSE_JADE, 30

	opentext
	writetext .Text_Welcome
	waitbutton
	closetext

	applymovement PLAYER, .Movement_WalkUpToJade

	opentext
	writetext .Text_ThisIsMyNewHouse
	promptbutton
	verbosegiveitem QUEST_LOG
	writetext .Text_IGrabbedTwo
	waitbutton
	closetext

	applymovement ROCK_SALT_JADES_HOUSE_JADE, .Movement_JadeWalksToExit
	playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_JADES_HOUSE_JADE

	setscene SCENE_ROCK_SALT_JADES_HOUSE_DEFAULT
	setmapscene ROCK_SALT_LAB, SCENE_MEET_PROF
	end

.Movement_WalkUpToJade:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Movement_JadeWalksToExit:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

.Text_Welcome:
	text "Oh, <PLAYER>!"
	line "Come on in!"
	done

.Text_ThisIsMyNewHouse:
	text "What do you think"
	line "of my new digs?"
	done

.Text_IGrabbedTwo:
	text "I grabbed two!"
	done

Script_JadesN64:
	jumptext .Text_N64

.Text_N64:
	text "Looks like JADE"
	line "was playing"
	cont "#MON Snap."
	
	done

RockSaltJadesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event 4, 7, ROCK_SALT_TOWN, 2
    warp_event 5, 7, ROCK_SALT_TOWN, 2

	def_coord_events

	def_bg_events
	bg_event  9,  5, BGEVENT_READ, Script_JadesN64

	def_object_events
	object_event 9, 6, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, 0, EVENT_JADE_IN_ROCK_SALT_JADES_HOUSE
