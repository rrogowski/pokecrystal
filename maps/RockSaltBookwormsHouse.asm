	object_const_def
  const ROCK_SALT_BOOKWORM
  const ROCK_SALT_BOOKWORMS_HOOTHOOT
	
RockSaltBookwormsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

RockSaltBookwormScript:
  faceplayer

  isquestturnedin QUEST_TROUBLE_WITH_TAUROS
  iffalse .Script_DontOfferQuest

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

.Script_DontOfferQuest:
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

RockSaltBookwormsHouseBookshelfScript1:
  opentext
  writetext .Text_Book1
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_1
  iffalse .Script_AdvanceQuestBook1
  end

.Script_AdvanceQuestBook1:
  setflag ENGINE_READ_BOOKWORM_BOOK_1
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book1:
  text "Book 1..."
  done

RockSaltBookwormsHouseBookshelfScript2:
  opentext
  writetext .Text_Book2
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_2
  iffalse .Script_AdvanceQuestBook2
  end

.Script_AdvanceQuestBook2:
  setflag ENGINE_READ_BOOKWORM_BOOK_2
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book2:
  text "Book 2..."
  done

RockSaltBookwormsHouseBookshelfScript3:
  opentext
  writetext .Text_Book3
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_3
  iffalse .Script_AdvanceQuestBook3
  end

.Script_AdvanceQuestBook3:
  setflag ENGINE_READ_BOOKWORM_BOOK_3
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book3:
  text "Book 3..."
  done

RockSaltBookwormsHouseBookshelfScript4:
  opentext
  writetext .Text_Book4
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_4
  iffalse .Script_AdvanceQuestBook4
  end

.Script_AdvanceQuestBook4:
  setflag ENGINE_READ_BOOKWORM_BOOK_4
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book4:
  text "Book 4..."
  done

RockSaltBookwormsHouseBookshelfScript5:
  opentext
  writetext .Text_Book5
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_5
  iffalse .Script_AdvanceQuestBook5
  end

.Script_AdvanceQuestBook5:
  setflag ENGINE_READ_BOOKWORM_BOOK_5
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book5:
  text "Book 5..."
  done

RockSaltBookwormsHouseBookshelfScript6:
  opentext
  writetext .Text_Book6
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_6
  iffalse .Script_AdvanceQuestBook6
  end

.Script_AdvanceQuestBook6:
  setflag ENGINE_READ_BOOKWORM_BOOK_6
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book6:
  text "Book 6..."
  done

RockSaltBookwormsHouseBookshelfScript7:
  opentext
  writetext .Text_Book7
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_7
  iffalse .Script_AdvanceQuestBook7
  end

.Script_AdvanceQuestBook7:
  setflag ENGINE_READ_BOOKWORM_BOOK_7
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book7:
  text "Book 7..."
  done

RockSaltBookwormsHouseBookshelfScript8:
  opentext
  writetext .Text_Book8
  waitbutton
  closetext

  checkflag ENGINE_READ_BOOKWORM_BOOK_8
  iffalse .Script_AdvanceQuestBook8
  end

.Script_AdvanceQuestBook8:
  setflag ENGINE_READ_BOOKWORM_BOOK_8
  advancequest QUEST_COVER_TO_COVER
  end

.Text_Book8:
  text "Book 8..."
  done

RockSaltBookwormsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
  warp_event 4, 7, ROCK_SALT_TOWN, 4
  warp_event 5, 7, ROCK_SALT_TOWN, 4

	def_coord_events

	def_bg_events
  bg_event  0,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript1
  bg_event  1,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript2
  bg_event  2,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript3
	bg_event  3,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript4
  bg_event  6,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript5
  bg_event  7,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript6
  bg_event  8,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript7
	bg_event  9,  1, BGEVENT_READ, RockSaltBookwormsHouseBookshelfScript8

	def_object_events
	object_event 3, 5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltBookwormScript, -1
	object_event 7, 5, SPRITE_BIRD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RockSaltBookwormsHoothootScript, -1
