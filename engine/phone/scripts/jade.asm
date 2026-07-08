JadePhoneCalleeScript:
	end

JadePhoneCallerScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_JADE_CALL_TO_ACTION, .CallToAction
	end

.CallToAction
	farwritetext .Text_CallToAction
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_JADE_CALLED_PLAYER_TO_ACTION
	end

.Text_CallToAction
  text "Yo, <PLAYER>! What"
  line "are you up to?"

  para "I've got something"
  line "cool to show you!"

  para "Come swing by my"
  line "house whenever you"
  cont "get a second."

  done

