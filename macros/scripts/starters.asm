MACRO starter_script
  ; \1 =  your choice (see constants/pokemon_constants.asm)
  ; \2 = jade's choice (see constants/pokemon_constants.asm)
Script_RockSaltTown\1:
  faceplayer
	reanchormap
	pokepic \1
	waitbutton
	closepokepic
	closetext

	checkevent EVENT_CHOSE_STARTER
	iftrue .Script_AlreadyChoseStarter

	getmonname STRING_BUFFER_3, \1
	opentext
	writetext Text_ConfirmStarterChoice
	yesorno
	closetext
	iftrue .Script_ChooseStarter

.Script_AlreadyChoseStarter
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
	givepoke \1, 5, BERRY
	closetext
	disappear ROCK_SALT_TOWN_\1
	setevent EVENT_CHOSE_STARTER
	setevent EVENT_CHOSE_STARTER_\1

	pause 15
	turnobject ROCK_SALT_TOWN_JADE, UP
	opentext
	writetext Text_ItChoseYou
	waitbutton
	closetext

	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeWalksTo\2
	opentext
	writetext Text_IllChoseThisOne
	promptbutton
	getmonname STRING_BUFFER_3, \2
	writetext Text_JadeReceivedStarter
	playsound SFX_CAUGHT_MON
	waitsfx
	waitbutton
	closetext
	disappear ROCK_SALT_TOWN_\2

	scall Script_AideFinishesFixingFence

	faceobject ROCK_SALT_TOWN_JADE, PLAYER
	faceobject PLAYER, ROCK_SALT_TOWN_JADE
	opentext
	writetext Text_Hurry
	waitbutton
	closetext
	
	applymovement ROCK_SALT_TOWN_JADE, .Movement_JadeWalksToLabFrom\2
	playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_TOWN_JADE

	unlockquest QUEST_TROUBLE_WITH_TAUROS
	setquestgoal QUEST_TROUBLE_WITH_TAUROS, 3

	setscene SCENE_TAUROS_LOOSE
	setmapscene ROCK_SALT_LAB, SCENE_ROCK_SALT_LAB_NOOP
	end
ENDM