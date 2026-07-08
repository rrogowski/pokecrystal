QuestsMenu:
	call ClearBGPalettes
	
	hlcoord 0, 0
	ld b, SCREEN_HEIGHT - 2
	ld c, SCREEN_WIDTH - 2
	call Textbox

	hlcoord 1, 2
	ld de, .Text_TroubleWithTauros
	call PlaceString

	hlcoord 1, 5
	ld de, .Text_UnknownQuest
	call PlaceString

	hlcoord 1, 8
	ld de, .Text_IntoTheUnown
	call PlaceString

	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	call JoyWaitAorB
	ret

.Text_TroubleWithTauros:
	db " Trouble w/ Tauros<LF>"
	db "  0 /  5@"

.Text_IntoTheUnown:
	db " Into the Unown<LF>"
	db "  1 / 26@"

.Text_UnknownQuest:
	db " ???<LF>"
	db "  - /  -@"