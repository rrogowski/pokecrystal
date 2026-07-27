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
    const ROCK_SALT_LAB_CYNDAQUIL_WANDERING
    const ROCK_SALT_LAB_TOTODILE_WANDERING
    const ROCK_SALT_LAB_CHIKORITA_WANDERING
    const ROCK_SALT_LAB_DEX

RockSaltLab_MapScripts:
	def_scene_scripts
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_PROF_GONE
    scene_script SceneSetup_MeetProf, SCENE_MEET_PROF
    scene_script SceneSetup_RockSaltLabNoop, SCENE_CHOOSE_STARTER
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_PROF_AND_AIDE_GONE
    scene_script SceneSetup_RockSaltLabNoop, SCENE_ROCK_SALT_LAB_NOOP
    scene_script SceneSetup_RockSaltLabNoop, SCENE_TROUBLE_WITH_TAUROS_REWARD
    scene_script Scene_ReceiveDex, SCENE_RECEIVE_DEX

    def_callbacks
    callback MAPCALLBACK_OBJECTS, CallbackObjects_RockSaltLab

CallbackObjects_RockSaltLab:
    scall SpriteSetup_RockSaltLab
    endcallback

SpriteSetup_RockSaltLab:
    checkscene
    scall SpriteSetup_RockSaltLabProf
    scall SpriteSetup_RockSaltLabAideInFront
    scall SpriteSetup_RockSaltLabAideInBack
    scall SpriteSetup_RockSaltLabJadeInFront
    scall SpriteSetup_RockSaltLabJadeInBack
    scall SpriteSetup_RockSaltLabMon
    scall SpriteSetup_RockSaltLabMonInPokeball
    scall SpriteSetup_RockSaltLabMonWandering
    scall SpriteSetup_RockSaltLabDex
    end

SpriteSetup_RockSaltLabProf:
    ifequal SCENE_ROCK_SALT_LAB_PROF_GONE, .case1
    ifequal SCENE_ROCK_SALT_LAB_PROF_AND_AIDE_GONE, .case1
    ifequal SCENE_TROUBLE_WITH_TAUROS_REWARD, .case2
    ifequal SCENE_RECEIVE_DEX, .case2
    sjump .default
.case1
    disappear ROCK_SALT_LAB_PROF
    end
.case2
    moveobject ROCK_SALT_LAB_PROF, 4, 4
    appear ROCK_SALT_LAB_PROF
    end
.default
    appear ROCK_SALT_LAB_PROF
    end

SpriteSetup_RockSaltLabAideInFront:
    ifequal SCENE_MEET_PROF, .case1
    ifequal SCENE_CHOOSE_STARTER, .case1
    ifequal SCENE_ROCK_SALT_LAB_PROF_AND_AIDE_GONE, .case1
    sjump .default
.case1
    disappear ROCK_SALT_LAB_AIDE_IN_FRONT
    end
.default
    appear ROCK_SALT_LAB_AIDE_IN_FRONT
    end

SpriteSetup_RockSaltLabAideInBack:
    disappear ROCK_SALT_LAB_AIDE_IN_BACK
    end

SpriteSetup_RockSaltLabJadeInFront:
    ifequal SCENE_MEET_PROF, .case1
    sjump .default
.case1
    appear ROCK_SALT_LAB_JADE_IN_FRONT
    end
.default
    disappear ROCK_SALT_LAB_JADE_IN_FRONT
    end

SpriteSetup_RockSaltLabJadeInBack:
    ifequal SCENE_CHOOSE_STARTER, .case1
    ifequal SCENE_TROUBLE_WITH_TAUROS_REWARD, .case1
    ifequal SCENE_RECEIVE_DEX, .case1
    sjump .default
.case1
    appear ROCK_SALT_LAB_JADE_IN_BACK
    end
.default
    disappear ROCK_SALT_LAB_JADE_IN_BACK
    end

SpriteSetup_RockSaltLabMonInPokeball:
    ifequal SCENE_MEET_PROF, .case1
    sjump .default
.case1
    appear ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    appear ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    appear ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    end
.default
    disappear ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
    disappear ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
    disappear ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    end

SpriteSetup_RockSaltLabMon:
    ifequal SCENE_ROCK_SALT_LAB_PROF_GONE, .case1
    ifequal SCENE_MEET_PROF, .case1

    canturninquest QUEST_TROUBLE_WITH_TAUROS
    iffalse .case1

    sjump .default
.case1
    disappear ROCK_SALT_LAB_CYNDAQUIL
    disappear ROCK_SALT_LAB_TOTODILE
    disappear ROCK_SALT_LAB_CHIKORITA
    end
.default
    checkevent EVENT_CHOSE_STARTER_CYNDAQUIL
    iftrue .chose_cyndaquil

    checkevent EVENT_CHOSE_STARTER_TOTODILE
    iftrue .chose_totodile

    checkevent EVENT_CHOSE_STARTER_TOTODILE
    iftrue .chose_chikorita

    sjump .chose_none
.chose_cyndaquil
    appear ROCK_SALT_LAB_CHIKORITA
    sjump .done
.chose_totodile
    appear ROCK_SALT_LAB_CYNDAQUIL
    sjump .done
.chose_chikorita
    appear ROCK_SALT_LAB_TOTODILE
    sjump .done
.chose_none
    appear ROCK_SALT_LAB_CHIKORITA
    appear ROCK_SALT_LAB_CYNDAQUIL
    appear ROCK_SALT_LAB_TOTODILE
    sjump .done
.done
    checkscene
    end

SpriteSetup_RockSaltLabMonWandering:
    canturninquest QUEST_TROUBLE_WITH_TAUROS
    iffalse .case1

    sjump .default
.case1
    disappear ROCK_SALT_LAB_CYNDAQUIL_WANDERING
    disappear ROCK_SALT_LAB_TOTODILE_WANDERING
    disappear ROCK_SALT_LAB_CHIKORITA_WANDERING

.default
    checkevent EVENT_CHOSE_STARTER_CYNDAQUIL
    iftrue .chose_cyndaquil

    checkevent EVENT_CHOSE_STARTER_TOTODILE
    iftrue .chose_totodile

    checkevent EVENT_CHOSE_STARTER_TOTODILE
    iftrue .chose_chikorita

    sjump .done
.chose_cyndaquil
    appear ROCK_SALT_LAB_CHIKORITA_WANDERING
    sjump .done
.chose_totodile
    appear ROCK_SALT_LAB_CYNDAQUIL_WANDERING
    sjump .done
.chose_chikorita
    appear ROCK_SALT_LAB_TOTODILE_WANDERING
    sjump .done

.done
    checkscene
    end

SpriteSetup_RockSaltLabDex:
    ifequal SCENE_RECEIVE_DEX, .case1
    sjump .default
.case1
    appear ROCK_SALT_LAB_DEX
    end
.default
    disappear ROCK_SALT_LAB_DEX
    end

SceneSetup_RockSaltLabNoop:
    end

SceneSetup_MeetProf:
    sdefer Script_MeetProf
    end

Scene_ReceiveDex:
    sdefer Script_ReceiveDex
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

Script_ReceiveDex:
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    turnobject PLAYER, LEFT

    opentext
    writetext .Text_ProfSpeechPart1
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToDex
    pause 15
    playsound SFX_BUMP
    disappear ROCK_SALT_LAB_DEX
    waitsfx
    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfWalksToJade

    opentext
    writetext .Text_ProfSpeechPart2
    promptbutton
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    writetext .Text_ProfSpeechPart3
    promptbutton

    writetext .Text_ReceivedDex
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX

    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfStartsToWalkAway
    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF, 30
    applymovement ROCK_SALT_LAB_PROF, .Movement_ProfComesBack
    opentext
    writetext .Text_OneMoreThing
    waitbutton
    closetext

    ; turnobject ROCK_SALT_LAB_JADE_IN_BACK, LEFT
    ; turnobject PLAYER, LEFT

    ; writetext .Text_WeWillDoIt
    ; promptbutton

    ; turnobject ROCK_SALT_LAB_JADE_IN_BACK, DOWN
    ; turnobject PLAYER, UP

    ; writetext .Text_LetsGetStarted
    ; waitbutton
    ; closetext

    ; applymovement PLAYER, .Movement_PlayerMovesOutOfWay
    ; applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeStepsDown
    ; follow ROCK_SALT_LAB_JADE_IN_BACK, PLAYER
    ; applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeWalksToExit
    ; stopfollow

    ; opentext
    ; writetext .Text_AideCallsOut
    ; waitbutton
    ; closetext

    ; playsound SFX_ENTER_DOOR
	; waitsfx
	; disappear ROCK_SALT_LAB_JADE_IN_BACK
    ; pause 10

    ; applymovement ROCK_SALT_LAB_AIDE_IN_FRONT, .Movement_AideWalksToYou
    ; turnobject PLAYER, LEFT

    ; opentext
    ; writetext .Text_ResearchCensus
    ; promptbutton
    ; getitemname STRING_BUFFER_4, POKE_BALL
	; scall .Script_ReceiveBalls
	; giveitem POKE_BALL, 5
    ; writetext .Text_SomethingToHelp
    ; waitbutton
    ; closetext

    ; applymovement ROCK_SALT_LAB_AIDE_IN_FRONT, .Movement_AideWalksBack
    ; ; prevent aide from immediately spinning after walking back
    ; pause 15

    setscene SCENE_ROCK_SALT_LAB_NOOP
    end

.Script_ReceiveBalls:
    jumpstd ReceiveItemScript

.Movement_ProfWalksToDex:
    step LEFT
    step LEFT
    turn_head DOWN
    step_end

.Movement_ProfWalksToJade:
    step RIGHT
    step RIGHT
    turn_head DOWN
    step_end

.Movement_ProfStartsToWalkAway:
    slow_step LEFT
    step_end

.Movement_ProfComesBack:
    step RIGHT
    step_end

.Text_ProfSpeechPart1:
    text "Excellent work!"

    para "You both handled"
    line "yourselves well."

    para "Your knowledge of"
    line "#MON is already"
    cont "helping you adapt."

    para "Research is about"
    line "more than studying"
    cont "from a book."

    para "Sometimes, you"
    line "must experience"
    cont "the world"
    cont "yourself."

    para "Your mission will"
    line "take you across"
    cont "the region."

    para "Every discovery"
    line "helps us"
    cont "understand this"
    cont "region better."

    done

.Text_ProfSpeechPart2:
    text "This is called"
    line "a #DEX."

    para "It contains basic"
    line "information on the"
    cont "#MON found"
    cont "here."

    para "But the world is"
    line "always changing."

    para "New discoveries"
    line "are made every"
    cont "day."

    done

.Text_ProfSpeechPart3:
    text "Each year,"
    line "researchers"
    cont "conduct a"
    cont "regional census."

    para "That is where you"
    line "come in."

    para "You and JADE will"
    line "handle most of the"
    cont "field research."

    para "Observe #MON."

    para "Record findings."

    para "Help us discover"
    line "what is still"
    cont "unknown."

    para "Take good care of"
    line "this."

    para "It will be your"
    line "most important"
    cont "research tool."

    para "Together, you'll"
    line "help expand our"
    cont "knowledge of"
    cont "#MON."

    done

.Text_ReceivedDex:
    text "<PLAYER> received"
    line "the #DEX!"
    done

.Text_OneMoreThing:
    text "Oh!"

    para "There's one more"
    line "thing."

    para "I ordered a new"
    line "device for your"
    cont "field work."

    para "It's called the"
    line "#GEAR."

    para "It will help you"
    line "during your"
    cont "research."

    para "It can store"
    line "important data..."

    para "And connect you"
    line "with others while"
    cont "traveling."

    para "The shipment has"
    line "already arrived."

    para "But it is waiting"
    line "in Peppercorn."

    para "Peppercorn is"
    line "just beyond"
    cont "Rock Salt Cave."

    para "When you have"
    line "the chance..."

    para "Be sure to pick"
    line "it up."

    para "It will be a"
    line "valuable tool for"
    cont "your journey."

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
    checkscene
    ifequal SCENE_CHOOSE_STARTER, .Script_ChooseStarter
    jumptextfaceplayer .Text_PreparingNextAssignment

.Script_ChooseStarter:
    jumptextfaceplayer Text_WeWillContinueLater

.Text_PreparingNextAssignment:
    text "I'm preparing"
    line "for your next"
    cont "assignment."

    para "I'll let you know"
    line "when it's ready."

    done

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
    writetext .Text_ThisMonNeedsSomeone
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

.Text_ThisMonNeedsSomeone:
    text "This #MON"
    line "needs someone,"
    cont "too."

    para "I'll make sure"
    line "it's happy."

    done

Script_TroubleWithTaurosReward1:
    applymovement PLAYER, .Movement_WalkToProf
    sjump Script_TroubleWithTaurosReward

.Movement_WalkToProf:
    step RIGHT
    step UP
    step UP
    step_end

Script_TroubleWithTaurosReward2:
    applymovement PLAYER, .Movement_WalkToProf
    sjump Script_TroubleWithTaurosReward

.Movement_WalkToProf:
    step UP
    step UP
    step_end

Script_TroubleWithTaurosReward:
    turnobject PLAYER, LEFT
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    opentext
    writetext .Text_WelcomeBack
    promptbutton
    turnobject ROCK_SALT_LAB_PROF, DOWN
    writetext .Text_ThankYouBoth
    promptbutton
    turnobject ROCK_SALT_LAB_PROF, RIGHT
    writetext .Text_Impressed
    promptbutton
    turnobject ROCK_SALT_LAB_PROF, DOWN
    writetext .Text_KeepThem
    waitbutton
    closetext

    showemote EMOTE_SHOCK, ROCK_SALT_LAB_JADE_IN_BACK, 30
    opentext
    writetext .Text_JadeThanksProf
    waitbutton
    closetext

	opentext
	special Nickname
	closetext
    pause 15

    turnobject ROCK_SALT_LAB_PROF, RIGHT
    opentext
    writetext .Text_SpendTimeWithThem
    promptbutton
    writetext .Text_BuildTrust
    promptbutton
    turnobject ROCK_SALT_LAB_PROF, DOWN
    writetext .Text_TallGrass
    waitbutton
    closetext

    opentext
    writetext .Text_JadeAgrees
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeWalksToYou
    turnobject PLAYER, DOWN
    turnobject ROCK_SALT_LAB_JADE_IN_BACK, UP
    opentext
    writetext .Text_LetsDoOurBest
    waitbutton
    closetext

    applymovement ROCK_SALT_LAB_JADE_IN_BACK, .Movement_JadeExitsLab
    disappear ROCK_SALT_LAB_JADE_IN_BACK
    turninquest QUEST_TROUBLE_WITH_TAUROS

    setscene SCENE_ROCK_SALT_LAB_NOOP
    setmapscene ROCK_SALT_TOWN, SCENE_YOUNGSTER_MISSING
    end

.Movement_WalkToProf:
    step UP
    step UP
    step_end

.Movement_JadeWalksToYou:
    step RIGHT
    step_end

.Movement_JadeExitsLab:
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step_end

.Text_WelcomeBack:
    text "Welcome back!"

    para "I heard the"
    line "TAUROS are safe."

    done

.Text_ThankYouBoth:
    text "Thank you both."

    para "You handled"
    line "yourselves well."

    done

.Text_Impressed:
    text "That brings me to"
    line "something else..."

    para "You borrowed those"
    line "#MON to help"
    cont "today."

    para "I think they've"
    line "made their choice."

    para "They seem quite"
    line "comfortable with"
    cont "both of you."

    done

.Text_KeepThem:
    text "So..."

    para "Why don't you"
    line "keep them?"

    para "They'll make"
    line "excellent research"
    cont "partners."

    done

.Text_JadeThanksProf:
    text "JADE: Really?"

    para "Thank you,"
    line "Professor!"

    para "I'll take good"
    line "care of it!"

    done

.Text_SpendTimeWithThem:
    text "CARAWAY: Before"
    line "we begin our"
    cont "research..."

    para "Spend some time"
    line "with your"
    cont "partners."

    para "You've only just"
    line "met, after all."

    done

.Text_TallGrass:
    text "The tall grass"
    line "outside town is"
    cont "full of #MON."

    para "It's the perfect"
    line "place to start."

    para "I'll have more"
    line "work for you"
    cont "soon enough."

    done

.Text_JadeAgrees:
    text "JADE: Sounds good!"

    para "I've read so much"
    line "about #MON..."

    para "But now I finally"
    line "get to experience"
    cont "it myself!"

    done

.Text_LetsDoOurBest:
    text "Let's both do"
    line "our best!"

    para "I'll see you"
    line "around!"

    done

.Text_BuildTrust:
    text "The best way to"
    line "build trust..."
    cont "is to travel"
    cont "together."

    para "And to battle"
    line "together."

    done

Script_WanderingCyndaquil:
    faceplayer
    reanchormap
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
    jumptext Text_ItLooksHappy

Script_WanderingTotodile:
    faceplayer
    reanchormap
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
    jumptext Text_ItLooksHappy

Script_WanderingChikorita:
    faceplayer
    reanchormap
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
    jumptext Text_ItLooksHappy

Text_ItLooksHappy:
    text "It looks happy."
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
    coord_event  4,  6, SCENE_TROUBLE_WITH_TAUROS_REWARD, Script_TroubleWithTaurosReward1
	coord_event  5,  6, SCENE_TROUBLE_WITH_TAUROS_REWARD, Script_TroubleWithTaurosReward2

	def_bg_events
    bg_event  2,  1, BGEVENT_READ, Script_HealingMachine

	def_object_events
    object_event 3, 4, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_Prof, EVENT_ROCK_SALT_LAB_PROF
    object_event 2, 9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Script_AideInLab, EVENT_ROCK_SALT_LAB_AIDE_IN_FRONT
    object_event 4, 0, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_AIDE_IN_BACK
    object_event 5, 11, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_JADE_IN_FRONT
    object_event 4, 5, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_JadeAsksYouToChooseFirst, EVENT_ROCK_SALT_LAB_JADE_IN_BACK
    object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_CYNDAQUIL_IN_POKEBALL
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_TOTODILE_IN_POKEBALL
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_CHIKORITA_IN_POKEBALL
    object_event  6,  3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_ChooseStarter_CYNDAQUIL, EVENT_ROCK_SALT_LAB_CYNDAQUIL
	object_event  7,  3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_ChooseStarter_TOTODILE, EVENT_ROCK_SALT_LAB_TOTODILE
	object_event  8,  3, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_ChooseStarter_CHIKORITA, EVENT_ROCK_SALT_LAB_CHIKORITA
    object_event  2, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Script_WanderingCyndaquil, EVENT_ROCK_SALT_LAB_CYNDAQUIL_WANDERING
	object_event  2, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Script_WanderingTotodile, EVENT_ROCK_SALT_LAB_TOTODILE_WANDERING
	object_event  2, 10, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Script_WanderingChikorita, EVENT_ROCK_SALT_LAB_CHIKORITA_WANDERING
	object_event  2, 5, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROCK_SALT_LAB_DEX
