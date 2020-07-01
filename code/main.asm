//********************************************************************************
// Main assembly file.
// All of the assembly files get linked together and compiled here.
//********************************************************************************
//****************************************
// Rom info
//****************************************
arch nes.cpu		// set processor architecture (NES)
banksize $4000		// set the size of each bank
header			// rom has a header

//****************************************
// Redux changes
//****************************************
incsrc code/misc.asm			// Main ASM code for Redux

//****************************************
// Gameplay changes
//****************************************
incsrc code/bombs.asm			// Increase initial max bombs and upgrades to 10
incsrc code/automap.asm			// Disassembly of the Automap Plus hack by snarfblam

//****************************************
// Text changes
//****************************************
incsrc code/text.asm			// Relocalization of the game's script
incsrc code/story.asm			// Rewrite of the game's story and intro texts
incsrc code/credits.asm			// Rewrite of the game's credits sequences

//****************************************
// Visual changes
//****************************************
incsrc code/graphics.asm		// Sprite/graphic changes
incsrc code/title_screen.asm		// Title screen visual changes
incsrc code/tunic_colors.asm		// Make blue tunic more vivid


//****************************************
// Optional patches
// Uncomment the desired Optional patches
//****************************************

// Famicom Disk System version King's Tomb layout
//incsrc code/optional/FDSKingsTomb.asm

// Keep Experience Points after Game Over
//incsrc code/optional/KeepExpAtGameOver.asm

// New Graphics based on Rev Edition & New Link hacks
//incsrc code/optional/NewGFX.asm

// New Experience system
//incsrc code/optional/NewExp.asm

// Original Zelda 2 enemy attributes (Exp, HP, Respawn)
//incsrc code/optional/OriginalEnemyAttributes.asm

// Original Zelda 2 enemy drops (Kill 6 enemies for an item drop)
//incsrc code/optional/OriginalEnemyDrops.asm

// Original Zelda 2 behaviour when obtaining Link Dolls
//incsrc code/optional/OriginalLinkDolls.asm

// Original Zelda 2 behaviour when getting a Game Over 
//incsrc code/optional/OriginalRestartAtGameOver.asm

// Original Zelda 2 magic consumption
//incsrc code/optional/OriginalSpellMagicConsumption.asm

// Original Zelda 2 title screen
//incsrc code/optional/OriginalTitleScreen.asm

// Reduce lag in-game - Reduces number of enemies on-screen
//incsrc code/optional/ReduceLag.asm

// Remove the low health beeping
//incsrc code/optional/RemoveLowHealthBeep.asm

// Restart on the same screen after a Game Over
//incsrc code/optional/RestartSameScreenAtGameOver.asm

// Secret... ???
//incsrc code/optional/Secret.asm

// Static experience points while placing each Palace Crystal
//incsrc code/optional/StaticExpAtPalaceCrystal.asm
