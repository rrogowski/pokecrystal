	object_const_def
	const ROCK_SALT_JADES_HOUSE_JADE
	const ROCK_SALT_JADES_HOUSE_CHIKORITA
	const ROCK_SALT_JADES_HOUSE_PLAYER_FACING_LEFT
	const ROCK_SALT_JADES_HOUSE_PLAYER_FACING_UP

RockSaltJadesHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltJadesHouseJadeScript:
	faceplayer

	opentext
	writetext .Text_LetsGo
	waitbutton
	closetext

	readmem wLastFacingDirection
	ifequal FACE_UP, .PlayerFacingUp

.PlayerFacingLeft:
	applymovement ROCK_SALT_JADES_HOUSE_JADE, .Movement_LeaveHousePart1
	scall .JadeTurnAround
	appear ROCK_SALT_JADES_HOUSE_PLAYER_FACING_LEFT
	applymovement PLAYER, .Movement_HidePlayerAndPanDown
	scall .CallChikorita
	applymovement PLAYER, .Movement_PanUpAndShowPlayerFacingLeft
	disappear ROCK_SALT_JADES_HOUSE_PLAYER_FACING_LEFT
	end

.PlayerFacingUp:
	applymovement ROCK_SALT_JADES_HOUSE_JADE, .Movement_LeaveHousePart1WalkAroundPlayer
	scall .JadeTurnAround
	appear ROCK_SALT_JADES_HOUSE_PLAYER_FACING_UP
	applymovement PLAYER, .Movement_HidePlayerAndPanDown
	scall .CallChikorita
	applymovement PLAYER, .Movement_PanUpAndShowPlayerFacingUp
	disappear ROCK_SALT_JADES_HOUSE_PLAYER_FACING_UP
	end

.JadeTurnAround:
	turnobject ROCK_SALT_JADES_HOUSE_JADE, UP
	end

.CallChikorita:
	opentext
	writetext .Text_CmonChikorita
	waitbutton
	closetext

	applymovement ROCK_SALT_JADES_HOUSE_CHIKORITA, .Movement_ChikoritaWalksToJade
	follow ROCK_SALT_JADES_HOUSE_JADE, ROCK_SALT_JADES_HOUSE_CHIKORITA
	applymovement ROCK_SALT_JADES_HOUSE_JADE, .Movement_JadeLeavesHouse
	stopfollow
	playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_JADES_HOUSE_JADE

	applymovement ROCK_SALT_JADES_HOUSE_CHIKORITA, .Movement_ChikoritaLeavesHouse
	playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_JADES_HOUSE_CHIKORITA

	end

.Text_LetsGo:
	text "Let's go!"
	done

.Text_CmonChikorita:
	text "C'mon, Chikorita!"
	done

.Movement_LeaveHousePart1:
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step_end

.Movement_LeaveHousePart1WalkAroundPlayer:
	step RIGHT
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step DOWN
	step_end

.Movement_HidePlayerAndPanDown:
	hide_object
	slow_step DOWN
	slow_step DOWN
	step_end

.Movement_ChikoritaWalksToJade:
	step DOWN
	step DOWN
	step_end

.Movement_JadeLeavesHouse:
	step DOWN
	step DOWN
	step_end

.Movement_ChikoritaLeavesHouse:
	step DOWN
	step_end

.Movement_PanUpAndShowPlayerFacingLeft:
	slow_step UP
	slow_step UP
	turn_head LEFT
	show_object
	step_end

.Movement_PanUpAndShowPlayerFacingUp:
	slow_step UP
	slow_step UP
	show_object
	step_end

RockSaltJadesHouseChikoritaScript:
	faceplayer
	opentext
	cry CHIKORITA
	writetext .Text_Chikorita
	waitbutton
	showemote EMOTE_HEART, ROCK_SALT_JADES_HOUSE_CHIKORITA, 15
	closetext
	reanchormap
	pokepic CHIKORITA
	waitbutton
	closepokepic
	closetext
	end

.Text_Chikorita:
	text "CHIKORITA: Chika!"
	done

RockSaltJadesHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event 4, 7, ROCK_SALT_TOWN, 2
    warp_event 5, 7, ROCK_SALT_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 6, 2, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RockSaltJadesHouseJadeScript, EVENT_JADE_LEFT_HOUSE
	object_event 5, 2, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RockSaltJadesHouseChikoritaScript, EVENT_JADE_LEFT_HOUSE
	object_event 7, 2, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_JADES_HOUSE_PLAYER_FACING_LEFT
	object_event 6, 3, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_JADES_HOUSE_PLAYER_FACING_UP
