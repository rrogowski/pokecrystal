	object_const_def
    const ROCK_SALT_CAVE_1F_POKEFAN_M_WARNING
    const ROCK_SALT_CAVE_1F_JADE
    ; const   ROCK_SALT_CAVE_1F_LASS_CASEY
    ; const   ROCK_SALT_CAVE_1F_FISHER_PAUL
    ; const   ROCK_SALT_CAVE_1F_POKEFAN_M_MICHAEL
    ; const   ROCK_SALT_CAVE_1F_SCIENTIST_AUSTIN
    ; const   ROCK_SALT_CAVE_1F_SCIENTIST_TRENT
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_1
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_2
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_3
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_4
    const ROCK_SALT_CAVE_1F_UNOWN

RockSaltCave1F_MapScripts:
	def_scene_scripts
    scene_script Script_RockSaltCave1FJadeFollows, SCENE_ROCK_SALT_CAVE_1F_JADE_FOLLOWS
    scene_script SceneSetup_RockSaltCave1FNoop, SCENE_ROCK_SALT_CAVE_1F_JADE_SCARED
	scene_script SceneSetup_RockSaltCave1FNoop, SCENE_ROCK_SALT_CAVE_1F_UNOWN_ENCOUNTER
	scene_script SceneSetup_RockSaltCave1FNoop, SCENE_ROCK_SALT_CAVE_1F_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CallbackObjects_RockSaltCave1F

CallbackObjects_RockSaltCave1F:
	scall SpriteSetup_RockSaltCave1F
	endcallback

SpriteSetup_RockSaltCave1F:
	checkscene
	scall SpriteSetup_RockSaltCave1FJade
	end

SpriteSetup_RockSaltCave1FJade:
	ifequal SCENE_ROCK_SALT_CAVE_1F_JADE_SCARED, .case1
	sjump .default
.case1
	appear ROCK_SALT_CAVE_1F_JADE
	end
.default
	disappear ROCK_SALT_CAVE_1F_JADE
	end

SceneSetup_RockSaltCave1FJadeFollows:
    sdefer Script_RockSaltCave1FJadeFollows
    end

SceneSetup_RockSaltCave1FNoop:
	end

Script_RockSaltCave1FJadeFollows:
	setevent EVENT_ROCK_SALT_TOWN_JADE_OUTSIDE_CAVE
    applymovement PLAYER, .Movement_StepUp
    turnobject PLAYER, DOWN

    pause 30
    moveobject ROCK_SALT_CAVE_1F_JADE, 11, 37
    appear ROCK_SALT_CAVE_1F_JADE
    turnobject ROCK_SALT_CAVE_1F_JADE, UP
    playsound SFX_ENTER_DOOR
    waitsfx
    pause 30
    turnobject ROCK_SALT_CAVE_1F_JADE, DOWN
    dismisslandmark
    pause 30
    turnobject ROCK_SALT_CAVE_1F_JADE, UP

    follow PLAYER, ROCK_SALT_CAVE_1F_JADE
    applymovement PLAYER, .Movement_ProceedThroughCave
    stopfollow

    turnobject PLAYER, DOWN
    scall Script_RockSaltCave1FJadeScared
    setscene SCENE_ROCK_SALT_CAVE_1F_JADE_SCARED
    end

.Movement_StepUp:
    step UP
    step_end

.Movement_ProceedThroughCave:
    step UP
    step UP
    step_end

Script_RockSaltCave1FJadeScared:
    showemote EMOTE_SAD, ROCK_SALT_CAVE_1F_JADE, 30
    jumptextfaceplayer Text_JadeScared

Text_JadeScared:
    text "..."

    para "Go on, <PLAYER>!"
    line "I'll catch up!"

    done

RockSaltCave1F_UnownEncounterScene:
    cry UNOWN
    showemote EMOTE_SHOCK, ROCK_SALT_CAVE_1F_UNOWN, 15
    waitsfx

    applymovement ROCK_SALT_CAVE_1F_UNOWN, .Movement_UnownCirclesPlayerClockwise
    pause 10
    applymovement ROCK_SALT_CAVE_1F_UNOWN, .Movement_UnownCirclesPlayerCounterclockwise
    pause 10

    setval UNOWN_L
    writemem wUnownLetter
    reanchormap
	pokepic UNOWN
	cry UNOWN
    waitsfx
	waitbutton
	closepokepic

    opentext
    writetext .Text_DexError
    waitbutton
    closetext

    applymovement ROCK_SALT_CAVE_1F_UNOWN, .Movement_UnownCirclesPlayerClockwise
    applymovement ROCK_SALT_CAVE_1F_UNOWN, .Movement_UnownFleesCave
    playsound SFX_ENTER_DOOR
	waitsfx
	disappear ROCK_SALT_CAVE_1F_UNOWN

    setscene SCENE_ROCK_SALT_CAVE_1F_NOOP
	end

.Movement_UnownCirclesPlayerClockwise:
    fast_slide_step_right
    fast_slide_step_down
    fast_slide_step_down
    fast_slide_step_left
    fast_slide_step_left
    fast_slide_step_left
    fast_slide_step_up
    fast_slide_step_up
    fast_slide_step_right
    step_end

.Movement_UnownCirclesPlayerCounterclockwise
    fast_slide_step_left
    fast_slide_step_down
    fast_slide_step_down
    fast_slide_step_right
    fast_slide_step_right
    fast_slide_step_right
    fast_slide_step_up
    fast_slide_step_up
    fast_slide_step_left
    step_end

.Movement_UnownFleesCave:
    fast_slide_step_right
    fast_slide_step_right
    fast_slide_step_right
    fast_slide_step_right
    fast_slide_step_right
    fast_slide_step_right
    step_end

.Text_DexError:
    text "#DEX: Error!"
    line "Data not found!"
    done

RockSaltCave1FPokefanMWarningScript:
    faceplayer
    opentext
    writetext   RockSaltCave1FPokefanMWarningText
    waitbutton
    closetext
    end

RockSaltCave1FPokefanMWarningText:
    text "Woah there!"
    line "Hang on just a"
    cont "minute!"

    para "I don't know if"
    line "you've heard,"
    cont "but a there's a"
    line "dangerous wild"
    cont "#MON running"
    line "loose in this"
    cont "cave!"

    para "I'm afraid I can't"
    line "let you go any"
    cont "further until"
    line "things settle"
    cont "down in here."
    done


RockSaltCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 5, ROCK_SALT_CAVE_1B, 1
	warp_event  15, 5, ROCK_SALT_CAVE_1B, 2
	warp_event 25,  5, ROUTE_101, 1
	warp_event 13, 17, ROCK_SALT_CAVE_CAVERN, 1
	warp_event 19, 31, ROCK_SALT_CAVE_1B, 5
	warp_event 11, 37, ROCK_SALT_TOWN, 8

	def_coord_events
    coord_event 19, 6, SCENE_ROCK_SALT_CAVE_1F_UNOWN_ENCOUNTER, RockSaltCave1F_UnownEncounterScene
    coord_event 20, 6, SCENE_ROCK_SALT_CAVE_1F_UNOWN_ENCOUNTER, RockSaltCave1F_UnownEncounterScene

	def_bg_events

	def_object_events
	object_event 21, 18, SPRITE_POKEFAN_M,   SPRITEMOVEDATA_STANDING_LEFT,   0,  0,  -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_SCRIPT,  0,  RockSaltCave1FPokefanMWarningScript, EVENT_RESCUED_YOUNGSTER
    object_event 11, 35, SPRITE_DAISY,   SPRITEMOVEDATA_STANDING_UP,   0,  0,  -1, -1, PAL_NPC_GREEN,  OBJECTTYPE_SCRIPT,  0,  Script_RockSaltCave1FJadeScared, EVENT_ROCK_SALT_CAVE_1F_JADE
    ; object_event    11, 28, SPRITE_LASS,        SPRITEMOVEDATA_STANDING_DOWN,   0,  0,  -1, -1, PAL_NPC_RED,    OBJECTTYPE_TRAINER, 4,  RockSaltCave1FLassCaseyScript,    -1  ;
    ; object_event    06, 18, SPRITE_FISHER,      SPRITEMOVEDATA_STANDING_LEFT,   0,  0,  -1, -1, 0,    OBJECTTYPE_TRAINER, 0,  RockSaltCave1FFisherPaulScript,   -1  ;
    ; object_event    13, 22, SPRITE_POKEFAN_M,        SPRITEMOVEDATA_STANDING_UP,     0,    0,  -1, -1, PAL_NPC_BLUE, 0, OBJECTTYPE_TRAINER, 2, RockSaltCave1FPokefanMichaelScript, -1 ;
    ; object_event    21, 34, SPRITE_SCIENTIST,    SPRITEMOVEDATA_STANDING_DOWN,  0,    0,  -1, -1, 0, OBJECTTYPE_TRAINER, 3, RockSaltCave1FScientistAustinScript, -1   ;
    ; object_event    21, 34, SPRITE_SCIENTIST,    SPRITEMOVEDATA_STANDING_RIGHT,  0,    0,  -1, -1, 0, OBJECTTYPE_TRAINER, 3, RockSaltCave1FScientistTrentScript, -1   ;
    ; object_event    14, 32, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FPotionScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_POTION
    ; object_event    19, 12, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FPokeBallScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_POKEBALL
    ; object_event    7, 13, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FTMSpikesScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_TM_SPIKES
    ; object_event    17, 24, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FNuggetScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_NUGGET
    object_event 20, 5, SPRITE_UNOWN, SPRITEMOVEDATA_POKEMON, 0,  0,  -1, -1, 0,  OBJECTTYPE_SCRIPT, 0, -1, EVENT_UNOWN_FIRST_ENCOUNTERED
