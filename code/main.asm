;****************************************************************
;	Main assembly file for Zelda 2 Redux
; All of the assembly files get linked together and compiled here.
;****************************************************************

;****************************************
;	Rom info
;****************************************
norom			; Change to 'norom' for 6502 (NES) addresses
!headersize = $10	; NES header size
optimize dp always	; Always use optimized label values 
dpbase 0		; Set the dp base to 0 for 8bit labels

;----------------------------------------
;	Macros and iNES Header
;----------------------------------------

; Include our macros and the custom iNES header for Metroid Redux
incsrc "code/macros.asm"
incsrc "code/header.asm"

;****************************************
;	Gameplay changes
;****************************************
incsrc code/gameplay/enemies.asm	; Enemy attributes and HPs changes
incsrc code/gameplay/manual_save.asm	; Save manually by pressing Pause and then Up+A (Button combo can be modified)
incsrc code/gameplay/misc.asm		; Miscellaneous hacks
incsrc code/gameplay/palaces.asm	; Palaces (and Great Palace) modifications
incsrc code/gameplay/permanent_dolls.asm	; Obtaining a Link Doll adds one life permanently to the Lives Counter
incsrc code/gameplay/restart_palace.asm	; Restart at Palace entrance on Game Over (by njosro)
incsrc code/gameplay/saria_bridge.asm	; Bridge at Saria draws automatically after showing the guard the letter for the 1st time
incsrc code/gameplay/tunic.asm		; Make Shield spell change tunic to Blue and Red
incsrc code/gameplay/overworld_animation.asm	; Code to allow for the extra CHR banks to be used for animation in the overworld
incsrc code/gameplay/overworld_pause.asm	; PAUSE message for the overworld (like in the GBA re-release)
incsrc code/sound/battle_theme.asm	; FDS Battle Theme in East Hyrule
incsrc code/gameplay/lagpatch.asm	; Needs modifications for compatibility with Redux

;****************************************
;	Text changes
;****************************************
incsrc code/text/script.asm		; Relocalization of the game's script
incsrc code/text/story.asm		; Rewrite of the game's story and intro texts
incsrc code/text/credits.asm		; Rewrite of the game's credits sequences
incsrc code/text/game_over.asm		; Rewrite of the game's story and intro texts
incsrc code/text/textmisc.asm		; Various changes to text-related code

;****************************************
;	Visual changes
;****************************************
incsrc code/gfx/graphics.asm		; Sprite/graphic changes
incsrc code/gfx/hud_hearts.asm		; Life Meter with Hearts in HUD
incsrc code/gfx/hud_tiles.asm		; HUD layout modifications
incsrc code/gfx/palettes.asm		; Several palette changes
incsrc code/gfx/title_screen.asm	; Title screen changes
incsrc code/menus/lives_counter.asm	; Change the Life Counter to cap out at 9 lives (RAM still counts up to 15 or $0F)
incsrc code/menus/menu_tiles.asm	; Character or tile changes for Menus
incsrc code/menus/menu_tweaks.asm	; Modifications to the File Select menus
incsrc code/menus/panes.asm		; Changes to the Pause and Level-Up panes

;****************************************
;	Optional patches
; Uncomment the desired Optional patches
;****************************************

; Include optional patches
; Uncomment desired patches inside "optional.asm" for them to compile
;incsrc code/optional.asm

