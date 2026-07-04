	object_const_def
  const ROCK_SALT_BOOKWORM
  const ROCK_SALT_BOOKWORMS_HOOTHOOT
	
RockSaltBookwormsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltBookwormScript:
  opentext
  writetext Text_CallMeIshmael
  closetext

  faceplayer
  opentext
  writetext Text_Sorry
  closetext

  end


RockSaltBookwormsHoothootScript:
  jumptextfaceplayer Text_BookwormsHoothoot

Text_CallMeIshmael:
  text "“Call me Ishmael."
  line "Some years ago--"
  cont "never mind how"
  cont "long precisely--"
  cont "having little or"
  cont "no money in my"
  cont "purse”--"
  prompt

Text_Sorry:
  text "Sorry, I was just"
  line "reading my favo-"
  cont "rite book!"

  para "It's about an"
  line "obsessed captain"
  cont "hunting down the"
  cont "legendary white"
  cont "WAILORD!"
  prompt

Text_BookwormsHoothoot:
  text "HOOTHOOT: Hoot!"
  line "Hoot!"
  done

RockSaltBookwormsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
  warp_event 4, 7, ROCK_SALT_TOWN, 2
  warp_event 5, 7, ROCK_SALT_TOWN, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event 3, 5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltBookwormScript, -1
	object_event 7, 5, SPRITE_BIRD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltBookwormsHoothootScript, -1
