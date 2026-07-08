OpenSketchpad:
	call .InitGFX
	call .LoadUnownFont
	call .PrintBorder
	call .PrintUnowns
	call JoyWaitAorB
	call .RestorePackGFX
	ret

.InitGFX:
	call LoadStandardMenuHeader
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	ld b, SCGB_POKEDEX_UNOWN_MODE
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	ret

.RestorePackGFX:
	call ClearBGPalettes
	call CloseWindow
	farcall Pack_InitGFX
	farcall Pack_InitColors
	ret

.LoadUnownFont:
	ld a, BANK(sScratch)
	call OpenSRAM
	ld hl, UnownFont
	; sScratch + $188 was the address of sDecompressBuffer in pokegold
	ld de, sScratch + $188
	ld bc, 39 tiles
	ld a, BANK(UnownFont)
	call FarCopyBytes
	ld hl, sScratch + $188
	ld bc, (NUM_UNOWN + 1) tiles
	ld de, sScratch + $188
	ld hl, vTiles2 tile FIRST_UNOWN_CHAR
	lb bc, BANK(Pokedex_LoadUnownFont), NUM_UNOWN + 1
	call Request2bpp
	call CloseSRAM
	ret

.PrintBorder:
	hlcoord 4, 1
	ld b, 13
	ld c, 11
	call Textbox
	ret

.PrintUnowns:
	ld hl, wUnownDex
	; b = index
	ld b, 0
.loop
	; a = next discovered unown letter (one-indexed)
	ld a, [hli]
	and a
	ret z

	; hl = coordinates of unown letter (i.e. alphabetical order, NOT in discovered order)
	push hl
	ld hl, .Coords
	ld d, 0
	ld e, a
	dec e ; coords are zero-indexed!
rept 2
	add hl, de
endr
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	
	; store unown letter in coordinates
	add FIRST_UNOWN_CHAR - 1
	ld [hl], a
	pop hl

	inc b
	ld a, b
	cp NUM_UNOWN
	jr c, .loop
	ret

.Coords:
	dwcoord 5, 2 ; A
	dwcoord 8, 2 ; B
	dwcoord 11, 2 ; C
	dwcoord 14, 2 ; D
	dwcoord 5, 4 ; E
	dwcoord 8, 4 ; F
	dwcoord 11, 4 ; G
	dwcoord 14, 4 ; H
	dwcoord 5, 6 ; I
	dwcoord 8, 6 ; J
	dwcoord 11, 6 ; K
	dwcoord 14, 6 ; L
	dwcoord 5, 8 ; M
	dwcoord 8, 8 ; N
	dwcoord 11, 8 ; O
	dwcoord 14, 8 ; P
	dwcoord 5, 10 ; Q
	dwcoord 8, 10 ; R
	dwcoord 11, 10 ; S
	dwcoord 14, 10 ; T
	dwcoord 5, 12 ; U
	dwcoord 8, 12 ; V
	dwcoord 11, 12 ; W
	dwcoord 14, 12 ; X
	dwcoord 8, 14 ; Y
	dwcoord 11, 14 ; Z
