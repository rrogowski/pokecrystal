_Nickname:
	ld hl, .Text_GiveNickname
	call PrintText
	call YesNoBox
	jp c, .done

  ; select first mon in party
  xor a
  ld [wCurPartyMon], a
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a

  ; ; load the new nickname into wStringBuffer2
	xor a ; PARTYMON
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	ld [wCurSpecies], a
	call GetBaseData
	ld b, NAME_MON
	ld de, wStringBuffer2
	farcall _NamingScreen

  ; if the new name is empty, treat it as unchanged
	farcall IsNewNameEmpty
	jr c, .done

  ; ; copy the new name from wStringBuffer2
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wStringBuffer2
	ld bc, MON_NAME_LENGTH
	call CopyBytes

.done
	ret

.Text_GiveNickname:
  text "Would you to give"
	line "your #MON a"
  cont "nickname?"
  done
