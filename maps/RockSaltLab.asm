	object_const_def
    const ROCK_SALT_LAB_PROF_HALITE

RockSaltLab_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltProfHaliteScript:
    faceplayer
    opentext
    writetext RockSaltProfHaliteText1
    waitbutton
    closetext
    end

RockSaltProfHaliteText1:
    text "Hello, <PLAYER>!"
    done
    
RockSaltLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
    warp_event 4, 11,ROCK_SALT_TOWN, 3
    warp_event 5, 11, ROCK_SALT_TOWN, 3

	def_coord_events

	def_bg_events

	def_object_events
    object_event 4, 2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltProfHaliteScript, -1