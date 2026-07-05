	object_const_def
    const   ROCK_SALT_CAVE_1F_POKEFAN_M_WARNING
    ; const   ROCK_SALT_CAVE_1F_LASS_CASEY
    ; const   ROCK_SALT_CAVE_1F_FISHER_PAUL
    ; const   ROCK_SALT_CAVE_1F_POKEFAN_M_MICHAEL
    ; const   ROCK_SALT_CAVE_1F_SCIENTIST_AUSTIN
    ; const   ROCK_SALT_CAVE_1F_SCIENTIST_TRENT
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_1
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_2
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_3
    ; const   ROCK_SALT_CAVE_1F_POKEBALL_4

RockSaltCave1F_MapScripts:
	def_scene_scripts

	def_callbacks

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
	warp_event 25,  6, TOWN_2, 1
	warp_event 13, 17, ROCK_SALT_CAVE_CAVERN, 1
	warp_event 19, 31, ROCK_SALT_CAVE_1B, 5
	warp_event 11, 38, ROCK_SALT_TOWN, 8

	def_coord_events

	def_bg_events

	def_object_events
    object_event    21, 18, SPRITE_POKEFAN_M,   SPRITEMOVEDATA_STANDING_LEFT,   0,  0,  -1, -1, PAL_NPC_BROWN,  OBJECTTYPE_SCRIPT,  0,  RockSaltCave1FPokefanMWarningScript,   -1  ;   EVENT_ROCK_SALT_CAVE_QUEST
    ; object_event    11, 28, SPRITE_LASS,        SPRITEMOVEDATA_STANDING_DOWN,   0,  0,  -1, -1, PAL_NPC_RED,    OBJECTTYPE_TRAINER, 4,  RockSaltCave1FLassCaseyScript,    -1  ;   
    ; object_event    06, 18, SPRITE_FISHER,      SPRITEMOVEDATA_STANDING_LEFT,   0,  0,  -1, -1, 0,    OBJECTTYPE_TRAINER, 0,  RockSaltCave1FFisherPaulScript,   -1  ;
    ; object_event    13, 22, SPRITE_POKEFAN_M,        SPRITEMOVEDATA_STANDING_UP,     0,    0,  -1, -1, PAL_NPC_BLUE, 0, OBJECTTYPE_TRAINER, 2, RockSaltCave1FPokefanMichaelScript, -1 ; 
    ; object_event    21, 34, SPRITE_SCIENTIST,    SPRITEMOVEDATA_STANDING_DOWN,  0,    0,  -1, -1, 0, OBJECTTYPE_TRAINER, 3, RockSaltCave1FScientistAustinScript, -1   ;
    ; object_event    21, 34, SPRITE_SCIENTIST,    SPRITEMOVEDATA_STANDING_RIGHT,  0,    0,  -1, -1, 0, OBJECTTYPE_TRAINER, 3, RockSaltCave1FScientistTrentScript, -1   ;
    ; object_event    14, 32, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FPotionScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_POTION
    ; object_event    19, 12, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FPokeBallScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_POKEBALL
    ; object_event    7, 13, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FTMSpikesScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_TM_SPIKES
    ; object_event    17, 24, SPRITE_POKE_BALL,     SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_ITEMBALL, 0, RockSaltCave1FNuggetScript, -1 ; EVENT_ROCK_SALT_CAVE_1F_NUGGET
    
    