	object_const_def
    const ROCK_SALT_LAB_PROF
    const ROCK_SALT_LAB_AIDE
    const ROCK_SALT_LAB_JADE

RockSaltLab_MapScripts:
	def_scene_scripts
    scene_script SceneSetup_RockSaltLabDefault, SCENE_ROCK_SALT_LAB_DEFAULT
    scene_script SceneSetup_MeetProf, SCENE_MEET_PROF
    scene_script SceneSetup_RockSaltLabDefault, SCENE_CANT_LEAVE_LAB
    scene_script RockSaltLab_ReceiveDexScene, SCENE_ROCK_SALT_LAB_RECEIVE_DEX

    def_callbacks
    callback MAPCALLBACK_OBJECTS, Callback_MoveObjects

Callback_MoveObjects:
    checkscene
    ifequal SCENE_MEET_PROF, .Callback_MeetProf

.Callback_Default
    disappear ROCK_SALT_LAB_JADE
    endcallback

.Callback_MeetProf:
    appear ROCK_SALT_LAB_JADE

    moveobject ROCK_SALT_LAB_AIDE, 4, 0
    turnobject ROCK_SALT_LAB_AIDE, DOWN

    endcallback

SceneSetup_RockSaltLabDefault:
    checkevent EVENT_VISITED_JADES_HOUSE
    iffalse .SceneSetup_RemoveProf
    end

.SceneSetup_RemoveProf
    disappear ROCK_SALT_LAB_PROF
    end

SceneSetup_MeetProf:
    sdefer Script_MeetProf
    end

RockSaltLab_ReceiveDexScene:
    sdefer RockSaltLab_ReceiveDexScript
    end

Script_MeetProf:
    disappear ROCK_SALT_LAB_AIDE
    turnobject PLAYER, RIGHT
    turnobject ROCK_SALT_LAB_JADE, LEFT
    pause 20
    follow PLAYER, ROCK_SALT_LAB_JADE
    applymovement PLAYER, .Movement_WalkToProf
    stopfollow
    turnobject ROCK_SALT_LAB_PROF, RIGHT

    opentext
    writetext .Text_Introductions
    waitbutton
    closetext

    playsound SFX_ENTER_DOOR
	waitsfx
    appear ROCK_SALT_LAB_AIDE

    opentext
    writetext .Text_AideExclaims
    waitbutton
    closetext

    turnobject PLAYER, UP
    turnobject ROCK_SALT_LAB_PROF, UP
    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF, 30
    applymovement ROCK_SALT_LAB_AIDE, .Movement_AideWalksToProf

    opentext
    writetext .Text_TheresTrouble
    promptbutton
    writetext .Text_AreTheyHurt
    promptbutton
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    turnobject PLAYER, LEFT
    writetext .Text_WeNeedYourHelp
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_AIDE, .Movement_AideWalksToBackExit
    playsound SFX_ENTER_DOOR
	waitsfx
    disappear ROCK_SALT_LAB_AIDE

    applymovement ROCK_SALT_LAB_JADE, .Movement_JadeWalksToBackExit
    playsound SFX_ENTER_DOOR
	waitsfx
    disappear ROCK_SALT_LAB_JADE

    setevent EVENT_MET_PROF
    setscene SCENE_CANT_LEAVE_LAB
    end

.Movement_WalkToProf:
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    step UP
    turn_head LEFT
    step_end

.Movement_AideWalksToProf:
    step DOWN
    step DOWN
    step LEFT
    step DOWN
    step_end

.Movement_AideWalksToBackExit:
    step UP
    step RIGHT
    step UP
    step UP
    step_end

.Movement_JadeWalksToBackExit:
    step RIGHT
    step UP
    step UP
    step UP
    step UP
    step UP
    step_end

.Text_Introductions:
    text "Ah!"

    para "You must be"
    line "<PLAYER>!"

    done

.Text_AideExclaims:
    text "Professor!"
    done

.Text_TheresTrouble:
    text "There's trouble!"
    done

.Text_AreTheyHurt:
    text "Are they hurt?"
    done

.Text_WeNeedYourHelp:
    text "We need your help!"
    done

Script_CantLeaveLab:
    opentext
    writetext .Text_YouCantLeave
    waitbutton
    closetext
    applymovement PLAYER, .Movement_StepUp
    end

.Movement_StepUp:
    step UP
    step_end

.Text_YouCantLeave
    text "<PLAYER>! Wait!"

    para "You can't leave"
    line "right now!"
    done

RockSaltLab_ReceiveDexScript:
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    turnobject ROCK_SALT_LAB_JADE, LEFT
    turnobject PLAYER, LEFT

    opentext
    writetext .Text_HelpWithProject
    promptbutton

    turnobject ROCK_SALT_LAB_JADE, DOWN
    turnobject PLAYER, UP

    writetext .Text_WhatDoYouThink
    promptbutton

    turnobject ROCK_SALT_LAB_JADE, LEFT
    turnobject PLAYER, LEFT

    writetext .Text_WeWillDoIt
    promptbutton

    writetext .Text_ReceiveDex
    playsound SFX_ITEM
    waitsfx
    promptbutton
    setflag ENGINE_POKEDEX

    turnobject ROCK_SALT_LAB_JADE, DOWN
    turnobject PLAYER, UP

    writetext .Text_LetsGetStarted
    waitbutton
    closetext

    applymovement PLAYER, .Movement_PlayerMovesOutOfWay
    applymovement ROCK_SALT_LAB_JADE, .Movement_JadeStepsDown
    follow ROCK_SALT_LAB_JADE, PLAYER
    applymovement ROCK_SALT_LAB_JADE, .Movement_JadeWalksToExit
    stopfollow

    opentext
    writetext .Text_AideCallsOut
    waitbutton
    closetext

    playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_LAB_JADE
    pause 10

    applymovement ROCK_SALT_LAB_AIDE, .Movement_AideWalksToYou
    turnobject PLAYER, LEFT

    opentext
    writetext .Text_ResearchCensus
    promptbutton
    getitemname STRING_BUFFER_4, POKE_BALL
	scall .Script_ReceiveBalls
	giveitem POKE_BALL, 5
    writetext .Text_SomethingToHelp
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_AIDE, .Movement_AideWalksBack
    ; prevent aide from immediately spinning after walking back
    pause 15

    setscene SCENE_ROCK_SALT_LAB_DEFAULT
    end

.Script_ReceiveBalls:
    jumpstd ReceiveItemScript

.Text_HelpWithProject:
    text "Help with project"
    done

.Text_WhatDoYouThink:
    text "What say you?"
    done

.Text_WeWillDoIt:
    text "We'll do it!"
    done

.Text_ReceiveDex:
    text "<PLAYER> received"
    line "#DEX!"
    done

.Text_LetsGetStarted:
    text "Let's get started!"
    done

.Text_AideCallsOut:
    text "<PLAYER>, wait!"
    done

.Text_ResearchCensus:
    text "Research census..."

    para "Here!"
    done

.Text_SomethingToHelp:
    text "Something to help"
    line "get you started."
    cont "See ya 'round!"
    done

.Movement_PlayerMovesOutOfWay:
    step RIGHT
    turn_head LEFT
    step_end

.Movement_JadeStepsDown:
    step DOWN
    step_end

.Movement_JadeWalksToExit:
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step_end

.Movement_AideWalksToYou:
    step DOWN
    step RIGHT
    step_end

.Movement_AideWalksBack:
    step LEFT
    step UP
    turn_head DOWN
    step_end

RockSaltLabJadeScript:
    end

RockSaltLabProfScript:
    faceplayer

    checkevent EVENT_CHOSE_STARTER_MEOWTH
    iftrue .SoYouChoseMeowth

    checkevent EVENT_CHOSE_STARTER_SENTRET
    iftrue .SoYouChoseSentret

    checkevent EVENT_CHOSE_STARTER_EEVEE
    iftrue .SoYouChoseEevee

    checkevent EVENT_TALKED_TO_PROF
    iftrue .YouCanPickOne

    opentext
    writetext Text_WhatBringsYouHere
    waitbutton
    closetext

    turnobject ROCK_SALT_LAB_PROF, DOWN

    opentext
    writetext Text_ImJustAnOldMan
    waitbutton
    closetext

    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF, 15

    faceplayer
    opentext
    writetext Text_IveGotIt
    waitbutton
    closetext

.YouCanPickOne
    opentext
    writetext Text_YouCanPickOne
    waitbutton
    closetext
    turnobject ROCK_SALT_LAB_PROF, DOWN
    
    setevent EVENT_TALKED_TO_PROF

    end

.SoYouChoseMeowth:
    opentext
    getmonname STRING_BUFFER_3, MEOWTH
    writetext Text_SoYouChose
    waitbutton
    closetext

    end

.SoYouChoseSentret:
    opentext
    getmonname STRING_BUFFER_3, SENTRET
    writetext Text_SoYouChose
    waitbutton
    closetext

    end

.SoYouChoseEevee:
    opentext
    getmonname STRING_BUFFER_3, EEVEE
    writetext Text_SoYouChose
    waitbutton
    closetext

    end

Text_SoYouChose:
    text "So! You chose"
    line "@"
    text_ram wStringBuffer3
    text "!"

    para "Aww, it looks like"
    line "@"
    text_ram wStringBuffer3
    text " likes you!"

    para "That's great,"
    line "<PLAYER>! Take"
    cont "good care of it!"

    done

Text_WhatBringsYouHere:
    text "<PLAYER>! What "
    line "brings you here?"
    
    para "... An adventure"
    line "you say? And you"
    cont "need my help?"

    done

Text_ImJustAnOldMan:
    text "Me? I'm just an"
    line "old man now."
    cont "What could I do?"

    done

Text_IveGotIt:
    text "I've got it! I'll"
    line "lend you one of my"
    cont "#MON as a com-"
    cont "panion for your"
    cont "journey!"

    done

Text_YouCanPickOne:
    text "You can head out"
    line "back and pick one!"

    done

RockSaltLabHealingMachineScript:
	checkevent EVENT_CHOSE_STARTER
	iffalse .CantHeal

    special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	end

.CantHeal:
	opentext
    writetext Text_IfIHadAPokemon
    waitbutton
	closetext
	end

Text_IfIHadAPokemon:
	text "If I had a #MON"
    line "I could heal them"
    cont "with this machine!"
	done

RockSaltLabAideScript:
    faceplayer
    opentext
    writetext .Text_Aide
    waitbutton
    closetext
    end

.Text_Aide:
    text "I am an aide."
    done

RockSaltLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event 4, 11,ROCK_SALT_TOWN, 3
    warp_event 5, 11, ROCK_SALT_TOWN, 3
    warp_event 4, 0, ROCK_SALT_TOWN, 6
    warp_event 5, 0, ROCK_SALT_TOWN, 6

	def_coord_events
	coord_event  4,  6, SCENE_CANT_LEAVE_LAB, Script_CantLeaveLab
	coord_event  5,  6, SCENE_CANT_LEAVE_LAB, Script_CantLeaveLab

	def_bg_events
    bg_event  2,  1, BGEVENT_READ, RockSaltLabHealingMachineScript

	def_object_events
    object_event 3, 4, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltLabProfScript, -1
    object_event 2, 9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltLabAideScript, -1
    object_event 5, 11, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, -1, EVENT_MET_PROF
