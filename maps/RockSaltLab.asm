	object_const_def
    const ROCK_SALT_LAB_PROF
    const ROCK_SALT_LAB_AIDE_IN_FRONT
    const ROCK_SALT_LAB_AIDE_IN_BACK
    const ROCK_SALT_LAB_JADE_IN_FRONT
    const ROCK_SALT_LAB_JADE_IN_BACK
    const ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    const ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    const ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    const ROCK_SALT_LAB_CYNDAQUIL
    const ROCK_SALT_LAB_TOTODILE
    const ROCK_SALT_LAB_CHIKORITA

RockSaltLab_MapScripts:
	def_scene_scripts
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_PROF_GONE
    scene_script SceneSetup_MeetProf, SCENE_MEET_PROF
    scene_script SceneSetup_RockSaltLabNoop, SCENE_CHOOSE_STARTER
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_PROF_AND_AIDE_GONE
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_NOOP
    scene_script SceneSetup_RockSaltLabNoop, SCENE_TROUBLE_WITH_TAUROS_REWARD
    scene_script RockSaltLab_ReceiveDexScene, SCENE_ROCK_SALT_LAB_RECEIVE_DEX

    def_callbacks
    callback MAPCALLBACK_OBJECTS, Callback_RockSaltLabMoveObjects

Callback_RockSaltLabMoveObjects:
    checkscene
    ifequal SCENE_ROCK_SALT_LAB_PROF_GONE, .Callback_ProfGone
    ifequal SCENE_MEET_PROF, .Callback_MeetProf
    ifequal SCENE_CHOOSE_STARTER, .Callback_ChooseStarter
    ifequal SCENE_ROCK_SALT_LAB_PROF_AND_AIDE_GONE, .Callback_ProfAndAideGone
    sjump .Callback_Noop

.Callback_ProfGone:
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    endcallback

.Callback_ProfAndAideGone:
    endcallback

.Callback_MeetProf:
    appear ROCK_SALT_LAB_PROF
    appear ROCK_SALT_LAB_JADE_IN_FRONT
    appear ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    appear ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    appear ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    endcallback

.Callback_ChooseStarter:
    appear ROCK_SALT_LAB_JADE_IN_BACK
    appear ROCK_SALT_LAB_PROF
    appear ROCK_SALT_LAB_CYNDAQUIL
    appear ROCK_SALT_LAB_TOTODILE
    appear ROCK_SALT_LAB_CHIKORITA
    endcallback

.Callback_Noop:
    appear ROCK_SALT_LAB_PROF
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    endcallback

SceneSetup_RockSaltLabNoop:
    end

SceneSetup_MeetProf:
    sdefer Script_MeetProf
    end

RockSaltLab_ReceiveDexScene:
    sdefer RockSaltLab_ReceiveDexScript
    end

Script_MeetProf:
    turnobject PLAYER, RIGHT
    turnobject ROCK_SALT_LAB_JADE_IN_FRONT, LEFT
    pause 20
    follow PLAYER, ROCK_SALT_LAB_JADE_IN_FRONT
    applymovement PLAYER, .Movement_WalkToProf
    stopfollow

    ; avoid object synchronization issues after scene
    appear ROCK_SALT_LAB_JADE_IN_BACK

    turnobject ROCK_SALT_LAB_PROF, RIGHT
    opentext
    writetext .Text_Introductions
    waitbutton
    closetext

    ; avoid object synchronization issues after scene
    disappear ROCK_SALT_LAB_JADE_IN_FRONT

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
    disappear ROCK_SALT_LAB_AIDE_IN_BACK

    opentext
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    turnobject PLAYER, LEFT
    writetext .Text_LetsPause
    waitbutton
    closetext

    turnobject PLAYER, DOWN
    pause 20
    turnobject PLAYER, LEFT
    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF, 30

    opentext
    writetext .Text_WaitNoPokemon
    promptbutton
    writetext Text_WeWillContinueLater
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToCyndaquil
    disappear ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    appear ROCK_SALT_LAB_CYNDAQUIL
    cry CYNDAQUIL
    waitsfx
    pause 15

    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToTotodile
    disappear ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    appear ROCK_SALT_LAB_TOTODILE
    cry TOTODILE
    waitsfx
    pause 15

    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToChikorita
    disappear ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    appear ROCK_SALT_LAB_CHIKORITA
    cry CHIKORITA
    waitsfx
    pause 15

    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfReturnsToDesk

    turnobject PLAYER, RIGHT
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, RIGHT
    pause 15

    opentext
	writetext .Text_JadeInAwe
	waitbutton
	closetext
	pause 15

    turnobject PLAYER, DOWN
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, UP
    opentext
	writetext .Text_IveStudiedForYears
	waitbutton
	closetext

    turnobject PLAYER, RIGHT
    applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeLooksAtEachStarter

    turnobject PLAYER, DOWN
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, UP
    setscene SCENE_CHOOSE_STARTER
    jumptext Text_CanYouChooseFirst

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

.Movement_ProfWalksToCyndaquil:
    step UP
    step UP
    step RIGHT
    step RIGHT
    step RIGHT
    turn_head DOWN
    step_end

.Movement_ProfWalksToTotodile:
    step RIGHT
    turn_head DOWN
    step_end

.Movement_ProfWalksToChikorita:
    step RIGHT
    turn_head DOWN
    step_end

.Movement_ProfReturnsToDesk:
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step DOWN
    step DOWN
    step_end

.Movement_JadeLooksAtEachStarter:
    step RIGHT
    step RIGHT
    step UP
	step_sleep 25

	step RIGHT
	turn_head UP
	step_sleep 25

	step RIGHT
	turn_head UP
	step_sleep 25

    step DOWN
    step LEFT
    step LEFT
    step LEFT
    step LEFT

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

.Text_JadeInAwe:
	text "Wow..."

	para "They're amazing."

	done

.Text_IveStudiedForYears:
	text "I've studied"
	line "#MON for"
	cont "years..."

	para "But I've never"
	line "worked with one."

	done

Text_WeWillContinueLater:
    text "We'll continue our"
    line "conversation when"
    cont "we're done."

    para "For now..."

    para "Let's get to work!"

    done

Script_JadeAsksYouToChooseFirst:
    jumptextfaceplayer Text_CanYouChooseFirst

Text_CanYouChooseFirst:
	text "Can you choose"
	line "first?"

	para "I think I'm a"
	line "little nervous..."

	done

Script_CantLeaveLab1:
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, DOWN
    opentext
    writetext Text_YouCantLeave
    waitbutton
    closetext
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, RIGHT
    applymovement PLAYER, .Movement_StepUp
    end

.Movement_StepUp:
    step UP
    step_end

Script_CantLeaveLab2:
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, UP
    opentext
    writetext Text_YouCantLeave
    waitbutton
    closetext
    applymovement PLAYER, .Movement_StepDown
    end

.Movement_StepDown:
    step DOWN
    step_end

Text_YouCantLeave:
    text "Wait!"

    para "We need a #MON"
    line "to help!"

    para "Choose one soon!"

    para "The TAUROS won't"
    line "wait!"

    done

starter_script CYNDAQUIL, TOTODILE

.Movement_JadeWalksToTOTODILE:
	step RIGHT
    step RIGHT
    step RIGHT
	step UP
	step_end

.Movement_JadeExitsLabFromTOTODILE:
    step DOWN
    step LEFT
    step LEFT
	step DOWN
	step DOWN
    step DOWN
    step DOWN
	step DOWN
	step_end

.Movement_ProfWalksToYouCYNDAQUIL:
    step RIGHT
    step RIGHT
    step_end

.Movement_ProfWalksToHealingMachineCYNDAQUIL:
    step LEFT
    step UP
    step LEFT
    step LEFT
    step_end

.String_DefaultNickname:
	db "CYNDAQUIL@"

starter_script TOTODILE, CHIKORITA

.Movement_JadeWalksToCHIKORITA:
	step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
	step UP
	step_end

.Movement_JadeExitsLabFromCHIKORITA:
    step DOWN
	step LEFT
    step LEFT
    step LEFT
	step DOWN
    step DOWN
    step DOWN
	step DOWN
	step DOWN
	step_end

.Movement_ProfWalksToYouTOTODILE:
    step RIGHT
    step RIGHT
    step RIGHT
    step_end

.Movement_ProfWalksToHealingMachineTOTODILE:
    step LEFT
    step LEFT
    step UP
    step LEFT
    step LEFT
    step_end

.String_DefaultNickname:
	db "TOTODILE@"

starter_script CHIKORITA, CYNDAQUIL

.Movement_JadeWalksToCYNDAQUIL:
	step RIGHT
    step RIGHT
	step UP
	step_end

.Movement_JadeExitsLabFromCYNDAQUIL:
	step LEFT
	step DOWN
	step DOWN
    step DOWN
    step DOWN
	step DOWN
	step DOWN
	step_end

.Movement_ProfWalksToYouCHIKORITA:
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step_end

.Movement_ProfWalksToHealingMachineCHIKORITA:
    step LEFT
    step LEFT
    step LEFT
    step UP
    step LEFT
    step LEFT
    step_end

.String_DefaultNickname:
	db "CHIKORITA@"

Script_CantGetAGoodLookAtStarter:
    jumptext .Text_CantGetAGoodLook

.Text_CantGetAGoodLook:
    text "You can't get a"
    line "good look at it"
    cont "from this angle!"
    done

Movement_ProfLeavesLab:
    step DOWN
    step RIGHT
    step RIGHT
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step_end

Text_ConfirmStarterChoice:
	text "Do you want the"
	line "@"
	text_ram wStringBuffer3
	text "?"
	done

Text_ItSeemsToLikeYou:
	text "It seems to like"
	line "you!"
	done

Text_ItChoseYou:
	text "It chose you!"

	para "That's amazing..."

	done

Text_IllChoseThisOne:
	text "I'll choose this"
	line "one."

	para "We should work"
	line "well together!"

	done

Text_PlayerReceivedStarter:
	text "<PLAYER> received"
	line "the @"
	text_ram wStringBuffer3
	text "!"
	done

Text_JadeReceivedStarter:
	text "JADE received"
	line "the @"
	text_ram wStringBuffer3
	text "!"
	done

Text_Hurry:
    text "Hurry <PLAYER>!"
    done

Text_NeedToHeal:
    text "Need to heal?"
    done

Text_UseThatMachine:
    text "Use the machine"
    line "over there."
    done

Text_ItWillRestoreYourMon:
    text "It'll restore"
    line "your #MON."

    para "Don't forget it!"

    done

Text_FollowMe:
    text "<PLAYER>, please"
    line "follow me."
    done

RockSaltLab_ReceiveDexScript:
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, LEFT
    turnobject PLAYER, LEFT

    opentext
    writetext .Text_HelpWithProject
    promptbutton

    turnobject ROCK_SALT_LAB_JADE_IN_BACK, DOWN
    turnobject PLAYER, UP

    writetext .Text_WhatDoYouThink
    promptbutton

    turnobject ROCK_SALT_LAB_JADE_IN_BACK, LEFT
    turnobject PLAYER, LEFT

    writetext .Text_WeWillDoIt
    promptbutton

    writetext .Text_ReceiveDex
    playsound SFX_ITEM
    waitsfx
    promptbutton
    setflag ENGINE_POKEDEX

    turnobject ROCK_SALT_LAB_JADE_IN_BACK, DOWN
    turnobject PLAYER, UP

    writetext .Text_LetsGetStarted
    waitbutton
    closetext

    applymovement PLAYER, .Movement_PlayerMovesOutOfWay
    applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeStepsDown
    follow ROCK_SALT_LAB_JADE_IN_BACK, PLAYER
    applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeWalksToExit
    stopfollow

    opentext
    writetext .Text_AideCallsOut
    waitbutton
    closetext

    playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_LAB_JADE_IN_BACK
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
    warp_event 4, 11, ROCK_SALT_TOWN, 3
    warp_event 5, 11, ROCK_SALT_TOWN, 3
    warp_event 4, 0, ROCK_SALT_TOWN, 6
    warp_event 5, 0, ROCK_SALT_TOWN, 7

	def_coord_events
	coord_event  4,  6, SCENE_CHOOSE_STARTER, Script_CantLeaveLab1
	coord_event  5,  6, SCENE_CHOOSE_STARTER, Script_CantLeaveLab1
    coord_event  4,  0, SCENE_CHOOSE_STARTER, Script_CantLeaveLab2
	coord_event  5,  0, SCENE_CHOOSE_STARTER, Script_CantLeaveLab2

	def_bg_events
    bg_event  2,  1, BGEVENT_READ, Script_HealingMachine

	def_object_events
    object_event 3, 4, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Prof, EVENT_ROCK_SALT_LAB_PROF
    object_event 2, 9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_AideInLab, EVENT_ROCK_SALT_LAB_AIDE_IN_FRONT
    object_event 4, 0, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_AIDE_IN_BACK
    object_event 5, 11, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_JadeAsksYouToChooseFirst, EVENT_ROCK_SALT_LAB_JADE_IN_FRONT
    object_event 4, 5, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_JadeAsksYouToChooseFirst, EVENT_ROCK_SALT_LAB_JADE_IN_BACK
    object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    object_event  6,  3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_ChooseStarter_CYNDAQUIL, EVENT_ROCK_SALT_LAB_CYNDAQUIL
	object_event  7,  3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_ChooseStarter_TOTODILE, EVENT_ROCK_SALT_LAB_TOTODILE
	object_event  8,  3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_ChooseStarter_CHIKORITA, EVENT_ROCK_SALT_LAB_CHIKORITA
