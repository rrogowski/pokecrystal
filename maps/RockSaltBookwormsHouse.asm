	object_const_def
  const ROCK_SALT_BOOKWORM
  const ROCK_SALT_BOOKWORMS_HOOTHOOT
	
RockSaltBookwormsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltBookwormScript:
  faceplayer

  checkflag ENGINE_RECEIVED_QUESTS_LOG
  iffalse .Script_NoQuestsLog

  isquestunlocked QUEST_COVER_TO_COVER
  iffalse .Script_OfferQuest

  isquestturnedin QUEST_COVER_TO_COVER
  iftrue .Script_QuestComplete

  canturninquest QUEST_COVER_TO_COVER
  iffalse .Script_QuestActive

  turninquest QUEST_COVER_TO_COVER
  opentext
  writetext .Text_YouDidIt
  verbosegiveitem EXP_JAR
  closetext

  end

.Text_YouDidIt:
  text "Wow! You really"
  line "read every one!"

  para "Most people just"
  line "skim the covers."

  para "Here! You earned"
  line "this!"
  
  prompt

.Script_NoQuestsLog:
  jumptext .Text_AGoodBook

.Text_AGoodBook:
  text "A good book can"
  line "take you anywhere!"
  done

.Script_OfferQuest:
  opentext
  writetext .Text_LikeToRead
  yesorno

  iffalse .Script_DeclineQuest

  writetext .Text_IveReadEveryBook
  waitbutton
  closetext

  unlockquest QUEST_COVER_TO_COVER
  setquestgoal QUEST_COVER_TO_COVER, 8
  end

.Text_LikeToRead:
  text "Say... Do you like"
  line "to read?"
  done

.Text_IveReadEveryBook:
  text "I've read every"
  line "book in this"
  cont "house!"

  para "Think you can do"
  line "the same?"

  para "Read them all,"
  line "then come talk to"
  cont "me!"

  done

.Script_QuestActive:
  jumptext .Text_StillReading

.Text_StillReading:
  text "Still reading?"

  para "Every bookshelf"
  line "has something to"
  cont "teach you!"

  para "Don't skip any!"
  line "Even the little"
  cont "books are worth"
  cont "reading!"

  done

.Script_QuestComplete:
  jumptext .Text_FinishedAnother

.Text_FinishedAnother:
  text "Finished another"
  line "book?"

  para "There's always"
  line "something new"
  cont "to learn!"

  done

.Script_DeclineQuest:
  writetext .Text_ThatsOkay
  waitbutton
  closetext
  end

.Text_ThatsOkay:
  text "That's OK!"
  line "Everyone starts"
  cont "somewhere!"
  done

RockSaltBookwormsHoothootScript:
  jumptextfaceplayer Text_BookwormsHoothoot

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
  warp_event 4, 7, ROCK_SALT_TOWN, 4
  warp_event 5, 7, ROCK_SALT_TOWN, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event 3, 5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltBookwormScript, -1
	object_event 7, 5, SPRITE_BIRD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltBookwormsHoothootScript, -1
