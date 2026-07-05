	object_const_def
    const ROCK_SALT_CAVE_CAVERN_MONSTER

RockSaltCaveCavern_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltCaveCavernMonsterScript:
    faceplayer
    opentext
    writetext RockSaltCaveCavernMonsterText
    waitbutton
    closetext
    end

RockSaltCaveCavernMonsterText:
    text "GYYAAAHHHH"
    done

RockSaltCaveCavern_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 15, ROCK_SALT_CAVE_1F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 5, 3, SPRITE_MONSTER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltCaveCavernMonsterScript, -1 ;EVENT_BEAT_ROCK_SALT_CAVE_CAVERN_MONSTER
