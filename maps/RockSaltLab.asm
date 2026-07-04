	object_const_def
    const ROCK_SALT_LAB_PROF_HALITE

RockSaltLab_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltProfHaliteScript:
    faceplayer

    checkevent EVENT_CHOSE_STARTER_MEOWTH
    iftrue .SoYouChoseMeowth

    checkevent EVENT_CHOSE_STARTER_SENTRET
    iftrue .SoYouChoseSentret

    checkevent EVENT_CHOSE_STARTER_EEVEE
    iftrue .SoYouChoseEevee

    checkevent EVENT_TALKED_TO_PROF_HALITE
    iftrue .YouCanPickOne

    opentext
    writetext Text_WhatBringsYouHere
    waitbutton
    closetext

    turnobject ROCK_SALT_LAB_PROF_HALITE, DOWN

    opentext
    writetext Text_ImJustAnOldMan
    waitbutton
    closetext

    showemote EMOTE_SHOCK, ROCK_SALT_LAB_PROF_HALITE, 15

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
    turnobject ROCK_SALT_LAB_PROF_HALITE, DOWN
    
    setevent EVENT_TALKED_TO_PROF_HALITE

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

RockSaltLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event 4, 11,ROCK_SALT_TOWN, 3
    warp_event 5, 11, ROCK_SALT_TOWN, 3
    warp_event 4, 0, ROCK_SALT_TOWN, 6
    warp_event 5, 0, ROCK_SALT_TOWN, 6

	def_coord_events

	def_bg_events

	def_object_events
    object_event 3, 4, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltProfHaliteScript, -1