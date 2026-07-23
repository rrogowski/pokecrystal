MACRO starter_script
  ; \1 =  your choice (see constants/pokemon_constants.asm)
  ; \2 = jade's choice (see constants/pokemon_constants.asm)
Script_ChooseStarter_\1:
	readvar VAR_FACING
	ifnotequal UP, Script_CantGetAGoodLookAtStarter

	reanchormap
	pokepic \1
	waitbutton
	closepokepic
	closetext

	checkevent EVENT_CHOSE_STARTER
	iftrue .done

	getmonname STRING_BUFFER_3, \1
	opentext
	writetext Text_ConfirmStarterChoice
	yesorno
	closetext
	iftrue .Script_ChooseStarter

.done
  end

.Script_ChooseStarter:
	cry \1
	getmonname STRING_BUFFER_3, \1
	opentext
	writetext Text_ItSeemsToLikeYou
	promptbutton
	writetext Text_PlayerReceivedStarter
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke \1, 5, BERRY, .String_DefaultNickname, wPlayerName, wPlayerID
	closetext
	disappear ROCK_SALT_LAB_\1
	setevent EVENT_CHOSE_STARTER
	setevent EVENT_CHOSE_STARTER_\1

	pause 15
	turnobject ROCK_SALT_LAB_JADE, RIGHT
	opentext
	writetext Text_ItChoseYou
	waitbutton
	closetext

	applymovement ROCK_SALT_LAB_JADE, .Movement_JadeWalksTo\2
	opentext
	writetext Text_IllChoseThisOne
	promptbutton
	getmonname STRING_BUFFER_3, \2
	writetext Text_JadeReceivedStarter
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	closetext
	disappear ROCK_SALT_LAB_\2

	faceobject ROCK_SALT_LAB_JADE, PLAYER
	faceobject PLAYER, ROCK_SALT_LAB_JADE
	opentext
	writetext Text_Hurry
	waitbutton
	closetext

	applymovement ROCK_SALT_LAB_JADE, .Movement_JadeExitsLabFrom\2
	playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_LAB_JADE

	unlockquest QUEST_TROUBLE_WITH_TAUROS
	setquestgoal QUEST_TROUBLE_WITH_TAUROS, 1

	applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToYou\1
	faceobject PLAYER, LEFT

	opentext
	writetext Text_FollowMe
	waitbutton
	closetext

	follow ROCK_SALT_LAB_PROF, PLAYER
	applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToHealingMachine\1
	stopfollow

	turnobject ROCK_SALT_LAB_PROF, RIGHT
	opentext
	writetext Text_NeedToHeal
	promptbutton
	turnobject PLAYER, UP
	turnobject ROCK_SALT_LAB_PROF, UP
	writetext Text_UseThatMachine
	promptbutton
	turnobject PLAYER, LEFT
	turnobject ROCK_SALT_LAB_PROF, RIGHT
	writetext Text_ItWillRestoreYourMon
	waitbutton
	closetext

	applymovement ROCK_SALT_LAB_PROF, Movement_ProfLeavesLab
	disappear ROCK_SALT_LAB_PROF

	setscene SCENE_ROCK_SALT_LAB_PROF_AND_AIDE_GONE
	setmapscene ROCK_SALT_TOWN, SCENE_TAUROS_LOOSE
	end
ENDM