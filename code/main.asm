//****************************************************************
//	Main assembly file for Zelda 2 Redux
// All of the assembly files get linked together and compiled here.
//****************************************************************

//****************************************
//	Rom info
//****************************************
arch nes.cpu		// set processor architecture (NES)
banksize $4000		// set the size of each bank
header			// rom has a header

//****************************************
//	iNES Header
//****************************************
	db $4E,$45,$53,$1A	// Header (NES $1A)
	db $08			// 8 x 16k PRG banks
	db $10			// 0 x 8k CHR banks
	db %00010010		// ROM Settings
	//  |||||||^--- Mirroring: Vertical
	//  ||||||^--- SRAM: Yes
	//  |||||^--- 512k Trainer: Not used
	//  ||||^--- 4 Screen VRAM: Not used
	//  ^^^^--- Mapper: 1
	db %00000000		// RomType: NES
	db $00,$00,$00,$00	// iNES Tail
	db $00,$00,$00,$00

//****************************************
//	Redux changes
//****************************************
incsrc code/redux.asm			// Main ASM code for Redux

//****************************************
//	Gameplay changes
//****************************************
incsrc code/gameplay/enemies.asm	// Enemy attributes and HPs changes
incsrc code/gameplay/misc.asm		// Miscellaneous hacks
incsrc code/gameplay/palaces.asm	// Palaces (and Great Palace) modifications
incsrc code/gameplay/restart_palace.asm	// Restart at Palace entrance on Game Over (by njosro)
incsrc code/gameplay/tunic.asm		// Make Shield spell change tunic to Blue and Red
incsrc code/menus/file_select.asm	// Modifications to the File Select menus
incsrc code/sound/battle_theme.asm	// FDS Battle Theme in East Hyrule

//****************************************
//	Text changes
//****************************************
incsrc code/text/script.asm		// Relocalization of the game's script
incsrc code/text/story.asm		// Rewrite of the game's story and intro texts
incsrc code/text/credits.asm		// Rewrite of the game's credits sequences
incsrc code/text/textmisc.asm		// Various changes to text-related code

//****************************************
//	Visual changes
//****************************************
incsrc code/gfx/graphics.asm		// Sprite/graphic changes
incsrc code/gfx/hud_hearts.asm		// Life Meter with Hearts in HUD
incsrc code/gfx/hud_tiles.asm		// HUD layout modifications
incsrc code/gfx/palettes.asm		// Several palette changes
incsrc code/gfx/title_screen.asm	// Title screen changes
incsrc code/menus/menus.asm		// Character or tile changes for Menus
incsrc code/menus/panes.asm		// Changes to the Pause and Level-Up panes

//****************************************
//	Optional patches
// Uncomment the desired Optional patches
//****************************************

// Include optional patches
// Uncomment desired patches inside "optional.asm" for them to compile
incsrc code/optional.asm

