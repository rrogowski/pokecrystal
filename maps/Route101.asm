	object_const_def
	const ROUTE_101_JADE

Route101_MapScripts:
	def_scene_scripts
	scene_script Route101NoopScene, SCENE_ROUTE_101_JADE_GIVES_SKETCHPAD
	scene_script Route101NoopScene, SCENE_ROUTE_101_NOOP

	def_callbacks

Route101_JadeGivesSketchpadScene:
	; wait for landmark name to disappear
	wait 20

	applymovement ROUTE_101_JADE, .Movement_JadeRunsUpToYou

	opentext
	writetext .Text_DidYouSeeThat
	waitbutton
	closetext

	showemote EMOTE_SHOCK, ROUTE_101_JADE, 15

	opentext
	writetext .Text_TakeThisSketchpad
	waitbutton
	closetext

	turnobject PLAYER, UP
	pause 40
	showemote EMOTE_QUESTION, ROUTE_101_JADE, 30

	opentext
	writetext .Text_LetMeSee
	waitbutton
	closetext

	turnobject PLAYER, DOWN
	pause 10
	sketchunown UNOWN_L
	opensketchpad

	opentext
	writetext .Text_IveNeverSeenThis
	waitbutton
	closetext

	opentext
	verbosegiveitem SKETCHPAD
	closetext

	applymovement ROUTE_101_JADE, .Movement_JadeLeavesRoute
	disappear ROUTE_101_JADE
	unlockquest QUEST_INTO_THE_UNOWN
	setquestgoal QUEST_INTO_THE_UNOWN, 26

	setscene SCENE_ROUTE_101_NOOP

	end

.Movement_JadeRunsUpToYou:
	step UP
	step UP
	step LEFT
	step LEFT
	step UP
	step_end

.Movement_JadeLeavesRoute:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

.Text_DidYouSeeThat:
	text "Did you see that?"
	done

.Text_TakeThisSketchpad:
	text "Draw it!"
	done

.Text_LetMeSee:
	text "Let me see!"
	done

.Text_IveNeverSeenThis:
	text "I've never seen..."
	done

Route101NoopScene:
	end

Route101_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 5, ROCK_SALT_CAVE_1F, 3

	def_coord_events
	coord_event 4, 6, SCENE_ROUTE_101_JADE_GIVES_SKETCHPAD, Route101_JadeGivesSketchpadScene

	def_bg_events

	def_object_events
	object_event 6, 10, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, -1, EVENT_RECEIVED_SKETCHPAD
