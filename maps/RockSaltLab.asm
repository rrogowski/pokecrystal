	object_const_def
    const ROCK_SALT_LAB_PROF
    const ROCK_SALT_LAB_AIDE_IN_FRONT
    const ROCK_SALT_LAB_AIDE_IN_BACK
    const ROCK_SALT_LAB_JADE
    const ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    const ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    const ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    ; const ROCK_SALT_LAB_CYNDAQUIL_ON_TABLE
    ; const ROCK_SALT_LAB_TOTODILE_ON_TABLE
    ; const ROCK_SALT_LAB_CHIKORITA_ON_TABLE

RockSaltLab_MapScripts:
	def_scene_scripts
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_PROF_GONE
    scene_script SceneSetup_MeetProf, SCENE_MEET_PROF
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_NOOP
    scene_script SceneSetup_RockSaltLabNoop, SCENE_CANT_LEAVE_LAB
    scene_script SceneSetup_HealingMachineTutorial, SCENE_HEALING_MACHINE_TUTORIAL
    scene_script SceneSetup_RockSaltLabNoop, SCENE_TROUBLE_WITH_TAUROS_REWARD
    scene_script RockSaltLab_ReceiveDexScene, SCENE_ROCK_SALT_LAB_RECEIVE_DEX

    def_callbacks
    callback MAPCALLBACK_OBJECTS, Callback_RockSaltLabMoveObjects

Callback_RockSaltLabMoveObjects:
    checkscene
    ifequal SCENE_ROCK_SALT_LAB_PROF_GONE, .Callback_ProfGone
    ifequal SCENE_MEET_PROF, .Callback_MeetProf
    ifequal SCENE_HEALING_MACHINE_TUTORIAL, .Callback_HealingMachineTutorial
    sjump .Callback_Noop

.Callback_ProfGone:
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    endcallback

.Callback_Noop:
    appear ROCK_SALT_LAB_PROF
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    endcallback

.Callback_MeetProf:
    appear ROCK_SALT_LAB_PROF
    appear ROCK_SALT_LAB_JADE
    appear ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    appear ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    appear ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    endcallback

.Callback_HealingMachineTutorial:
    disappear ROCK_SALT_LAB_PROF
    endcallback

SceneSetup_RockSaltLabNoop:
    end

SceneSetup_MeetProf:
    sdefer Script_MeetProf
    end

SceneSetup_HealingMachineTutorial:
    readmem wXCoord
	ifequal 5, .position2
.position1
	sdefer Script_HealingMachineTutorial1
	end
.position2
	sdefer Script_HealingMachineTutorial2
	end

RockSaltLab_ReceiveDexScene:
    sdefer RockSaltLab_ReceiveDexScript
    end

Script_MeetProf:
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
    appear ROCK_SALT_LAB_AIDE_IN_BACK

    opentext
    writetext .Text_AideExclaims
    waitbutton
    closetext

    turnobject PLAYER, UP
    turnobject ROCK_SALT_LAB_PROF, UP
    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF, 30
    applymovement ROCK_SALT_LAB_AIDE_IN_BACK, .Movement_AideWalksToProf

    opentext
    writetext .Text_TheresTrouble
    promptbutton
    writetext .Text_YouGoAhead
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_AIDE_IN_BACK, .Movement_AideLeavesLab

    opentext
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    turnobject PLAYER, LEFT
    writetext .Text_LetsPause
    waitbutton
    closetext

    pause 20
    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF, 30

    opentext
    writetext .Text_WaitNoPokemon
    promptbutton
    writetext Text_WeWillContinueLater
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_AIDE_IN_BACK, .Movement_AideLeavesLab
    disappear ROCK_SALT_LAB_AIDE_IN_BACK

    applymovement ROCK_SALT_LAB_JADE, .Movement_JadeWalksToBackExit
    playsound SFX_ENTER_DOOR
	waitsfx
    disappear ROCK_SALT_LAB_JADE

    clearevent EVENT_CYNDAQUIL_IN_ROCK_SALT_TOWN
    clearevent EVENT_TOTODILE_IN_ROCK_SALT_TOWN
    clearevent EVENT_CHIKORITA_IN_ROCK_SALT_TOWN

    setscene SCENE_CANT_LEAVE_LAB
    setmapscene ROCK_SALT_TOWN, SCENE_MEET_AIDE_OUT_BACK
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

.Movement_AideLeavesLab:
    step RIGHT
    step RIGHT
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
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

    para "I'm PROF. CARAWAY."

    para "I'm glad you both"
    line "made it safely."

    para "Jade told me you"
    line "would be arriving."

    para "I was looking"
    line "forward to meeting"
    cont "my new assistants."

    para "There's much to"
    line "discuss about your"
    cont "research..."

    done

.Text_AideExclaims:
    text "AIDE: Professor!"
    done

.Text_TheresTrouble:
    text "There's trouble!"

    para "Several TAUROS"
    line "have escaped!"
    done

.Text_YouGoAhead:
    text "CARAWAY: What?!"
    
    para "You go ahead!"

    para "I will join you"
    line "in a moment."

    done

.Text_LetsPause:
    text "Let's pause"
    line "for now."

    para "I'd like for you"
    line "two to help herd"
    cont "those TAUROS home."

    done

.Text_WaitNoPokemon:
    text "Wait..."

    para "You don't have"
    line "any #MON?"

    para "Of course..."

    para "You've spent your"
    line "time studying"
    cont "them."

    para "Not training them."

    para "JADE: Sorry..."
    
    para "I've read plenty"
    line "about #MON."

    para "But I've never"
    line "owned one."

    para "CARAWAY: No need"
    line "to apologize!"

    para "Look at the table."
    
    para "There are some"
    line "#MON there."

    para "You can borrow one"
    line "for now."

    para "They'll help you"
    line "with the Tauros."

    para "JADE, <PLAYER>..."

    done

Text_WeWillContinueLater:
    text "We'll continue our"
    line "conversation when"
    cont "we're done."

    para "For now..."

    para "Let's get to work!"

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

Script_HealingMachineTutorial1:
    disappear ROCK_SALT_LAB_AIDE_IN_FRONT
    moveobject ROCK_SALT_LAB_AIDE_IN_FRONT, 4, 5
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    sjump Script_HealingMachineTutorial

Script_HealingMachineTutorial2:
    disappear ROCK_SALT_LAB_AIDE_IN_FRONT
    moveobject ROCK_SALT_LAB_AIDE_IN_FRONT, 5, 5
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    sjump Script_HealingMachineTutorial

Script_HealingMachineTutorial:
    applymovement ROCK_SALT_LAB_AIDE_IN_FRONT, .Movement_AideWalksToYou
    opentext
    writetext .Text_NeedToHeal
    promptbutton
    turnobject ROCK_SALT_LAB_AIDE_IN_FRONT, LEFT
    writetext .Text_UseThatMachine
    promptbutton
    turnobject ROCK_SALT_LAB_AIDE_IN_FRONT, UP
    writetext .Text_ItWillRestoreYourMon
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_AIDE_IN_FRONT, .Movement_AideLeavesLab
    disappear ROCK_SALT_LAB_AIDE_IN_FRONT
    
    setscene SCENE_ROCK_SALT_LAB_NOOP
    end

.Movement_AideWalksToYou:
    step UP
    step UP
    step UP
    step UP
    step_end

.Movement_AideLeavesLab:
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step_end

.Text_NeedToHeal:
    text "Need to heal?"
    done

.Text_UseThatMachine:
    text "Use the machine"
    line "over there."
    done

.Text_ItWillRestoreYourMon:
    text "It'll restore"
    line "your #MON."

    para "Don't forget it!"

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

    applymovement ROCK_SALT_LAB_AIDE_IN_FRONT, .Movement_AideWalksToYou
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

    applymovement ROCK_SALT_LAB_AIDE_IN_FRONT, .Movement_AideWalksBack
    ; prevent aide from immediately spinning after walking back
    pause 15

    setscene SCENE_ROCK_SALT_LAB_NOOP
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

Script_Prof:
    jumptextfaceplayer Text_WeWillContinueLater

Script_HealingMachine:
    checkevent EVENT_CHOSE_STARTER
	iffalse .CantHeal

    special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE

    opentext
    writetext .Text_TheMachineHums
    promptbutton
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
    writetext .Text_FullyHealed
    waitbutton
    closetext

	end

.CantHeal:
	opentext
    writetext .Text_IfIHadAPokemon
    waitbutton
	closetext
	end

.Text_IfIHadAPokemon:
	text "If I had a #MON"
    line "I could heal them"
    cont "with this machine!"
	done

.Text_TheMachineHums:
    text "The machine hums."
    done

.Text_FullyHealed:
    text "Your #MON are"
    line "fully healed!"
    done

Script_AideInLab:
    checkscene
    ifequal SCENE_ROCK_SALT_LAB_PROF_GONE, .Script_ProfNotHere

    faceplayer
    opentext
    writetext .Text_Aide
    waitbutton
    closetext
    end

.Script_ProfNotHere:
    jumptextfaceplayer .Text_ProfNotHere

.Text_ProfNotHere:
    text "PROF. CARAWAY?"
    line "Here's not here."

    para "He's always busy"
    line "with research."

    para "He should return"
    line "shortly."

    done    

.Text_Aide:
    text "I am an aide."
    done

RockSaltLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event 4, 11,ROCK_SALT_TOWN, 3
    warp_event 5, 11, ROCK_SALT_TOWN, 3
    warp_event 4, 0, ROCK_SALT_TOWN, 6
    warp_event 5, 0, ROCK_SALT_TOWN, 7

	def_coord_events
	coord_event  4,  6, SCENE_CANT_LEAVE_LAB, Script_CantLeaveLab
	coord_event  5,  6, SCENE_CANT_LEAVE_LAB, Script_CantLeaveLab

	def_bg_events
    bg_event  2,  1, BGEVENT_READ, Script_HealingMachine

	def_object_events
    object_event 3, 4, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Prof, EVENT_ROCK_SALT_LAB_PROF
    object_event 2, 9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_AideInLab, EVENT_ROCK_SALT_LAB_AIDE_IN_FRONT
    object_event 4, 0, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_AIDE_IN_BACK
    object_event 5, 11, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, -1, EVENT_ROCK_SALT_LAB_JADE
    object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL

