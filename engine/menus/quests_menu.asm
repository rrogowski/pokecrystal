QuestsMenu:
	call ClearBGPalettes
	farcall LoadStatsScreenPageTilesGFX
	
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox
	
	ld a, QUEST_INTO_THE_UNOWN
	ld [wCurQuest], a
	call .PrintQuest

	ld a, QUEST_TROUBLE_WITH_TAUROS
	ld [wCurQuest], a
	call .PrintQuest

	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	
	call JoyWaitAorB
	ret

; INPUTS
;   [wCurQuest] = QUEST_* (see constants/quest_constants.asm)
.PrintQuest
	ld hl, wCurQuest
	ld c, [hl]
	call IsQuestUnlocked
	and a
	jp z, .PrintLockedQuest

	ld hl, wCurQuest
	ld c, [hl]
	call IsQuestTurnedIn

	push af
	ld de, .TurnedInCoords
	call .HLCoords
	pop af

	cp 1
	jr z, .TurnedIn

	ld hl, wCurQuest
	ld c, [hl]
	call CanTurnInQuest

	push af
	ld de, .TurnedInCoords
	call .HLCoords
	pop af

	cp 1
	jr z, .CanTurnIn

	jp .NameAndProgress

.TurnedIn
	ld a, '⁂'
	ld [hl], a
	jp .NameAndProgress

.CanTurnIn
	ld a, '!'
	ld [hl], a
	jp .NameAndProgress

.NameAndProgress
	ld hl, wCurQuest
	ld c, [hl]
	call GetQuestName

	push de
	ld de, .NameCoords
	call .HLCoords
	pop de
	call PlaceString

	ld hl, wCurQuest
	ld c, [hl]
	call GetQuestProgress

	push de
	ld de, .ProgressCoords
	call .HLCoords
	pop de
	; NOTE: assumes e < 10
	; this will NOT work for 2-digit values
	call .PrintNumber

	inc hl
	inc hl
	ld a, '/'
	ld [hl], a

	ld hl, wCurQuest
	ld c, [hl]
	call GetQuestGoal

	push de
	ld de, .GoalCoords
	call .HLCoords
	pop de
	call .PrintNumber

	ret

; INPUTS
;   de = pointer to coords
;   [wCurQuest] = QUEST_* (see constants/quest_constants.asm)
; OUTPUTS
;   hl = coords
.HLCoords:
	push de
	ld hl, wCurQuest
	ld d, 0
	ld e, [hl]
	pop hl
	
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ret

; INPUTS
;   HL = coords
;   e = number
.PrintNumber:
	ld a, e
	cp 10
	jr c, .PrintOneDigitNumber
	jp .PrintTwoDigitNumber

.PrintOneDigitNumber:
	ld a, ' '
	ld [hli], a

	ld a, '0'
	add a, e
	ld [hl], a

	ret

.PrintTwoDigitNumber:
	ld a, '0'
	ld b, a
	ld a, e
.tens
	cp 10
	jr c, .ones
	sub 10
	inc b
	jr .tens
.ones
	push af
	ld a, b
	ld [hli], a
	pop af

	add a, '0'
	ld [hl], a
	ret

.PrintLockedQuest
	ld de, .NameCoords
	call .HLCoords
	ld de, .Text_LockedQuest
	call PlaceString
	ret

.TurnedInCoords:
	dwcoord 1, 2
	dwcoord 1, 5
	dwcoord 1, 8
	dwcoord 1, 11

.NameCoords:
	dwcoord 2, 2
	dwcoord 2, 5
	dwcoord 2, 8
	dwcoord 2, 11

.ProgressCoords:
	dwcoord 2, 3
	dwcoord 2, 6
	dwcoord 2, 9
	dwcoord 2, 12

.GoalCoords:
	dwcoord 7, 3
	dwcoord 7, 6
	dwcoord 7, 9
	dwcoord 7, 12

.Text_Progress:
	db "-- / --@"

.Text_IntoTheUnown:
	db " 1 / 26@"

.Text_LockedQuest:
	db "???<LF>"
	db " - /  -@"