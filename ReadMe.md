
# THE LEGEND OF ZELDA 2: ADVENTURE OF LINK REDUX

----------------------------------------------------------------------------------

# **Index**

* [**Zelda 2 Redux Info**](#zelda-2-redux)

* [**Changelog**](#changelog)

* [**Optional Patches**](#optional-patches)

* [**Patching and Usage Instructions**](#instructions)

* [**Credits**](#credits)

* [**Project Licence**](#license)

-------------------

## Zelda 2 Redux

Have you always tried to play through Zelda II and finding out it was either excruciatingly difficulty, unbalanced, too tough or perhaps found that it just has so many quirks that doesn't make the game enjoyable?

This hack tries to address that by rebalancing the game, making some QoL changes and also some visual flare into the game, without compromising the original game's design. Be sure to check the full Changelog inside the ReadMe file for the full list of changes made to this hack, and also don't forget to check the optional patches too!

Want to see the full development of the hack?

Follow it on the Romhacking.net thread:
https://www.romhacking.net/forum/index.php?topic=26001.0


-------------------

## Changelog

* Changes to the Life Meter HUD: Should have hearts now instead of the old bars it had for a life meter
* Reworked HUD to be more in-line with other Zelda titles. It also looks much better to the eye now and is more streamlined
* Added 1/4 heart gauge by IcePenguin. Now the life meter is reduced by 1/4 parts instead of the original sliding bar, effectively letting you know exactly how much health (no longer will the meter show no life with Link still alive)
* Reworked title screen. Now the Sword in it is the same as the one in the original US boxart, and also the scrolling text of the title screen has been entirely rewritten to be more in-line with the canon story of Zelda II
* Manual Save Feature: You can now save the game by Pausing and then pressing Up+A on the Pause screen (both in side-scroll pause and overworld pause!)
* Manual saves no longer count towards the Death counter in the Selection screen! Now only Game Overs should increment that counter
* Implemented @njosro's Restart in Current Palace patch (as a bonus) :P
* Link now has a Blue and Red tunic! Upon using the Shield spell with a Defense level between 1-4, you'll get the Blue tunic. Once you get up to level 5-8 of Defense, you will get the Red tunic
* Text boxes now print 6 lines, giving much more space for more and detailed text
* All text has been repointed
* Script has been rewritten entirely and revised with a more proper translation according to the Japanese text
* Palaces renamed to Temples for consistency with the rest of the series
* Enemies no longer steal experience from you. (Don't confuse this with Magic, some still steal magic)
* Reduced the amount of HP the Bubble (and Giant Bubble) enemies have, as well as their Exp. Should now go down with like 10 Sword swings instead of a damn million (having FF in their lives was really something stupid for such a meaningless enemy), and they have also been made non-respawnable to avoid abusing grinding of these enemies, since their low EXP could still be abused
* Reduced the amount of magic consumption by half for all levels
* More common enemy drops
* All enemies give out Exp
* Enemies rebalanced according to their strength and annoyance factor (Those Modafokkas are no joke)
* Dragon Quest reference restored in the crosses of Saria Town (Erdrick lies here)
* Link's sprite has been edited slightly to better reflect his official artwork, without compromising his original design
* Overworld tile animation (includes water animation, grass, River Devil and others)
* Custom animation tiles for the lava in the path towards the Great Palace (Thanks IcePenguin!)
* "Spell" and "Life" spells renamed to "Enigma" and "Heal" spells respectively
* Reworked Pause Pane for the Spell menu and also for the Level Up Menu
* Changed the speed and range of the beam/fireball. Now it should have more use in-game, rather than being a slow and rather unused feature
* You can now cast whatever spell you have selected multiple times without having to open up the Spell menu everytime between screens
* Pausing the game on the Overworld now gives a "PAUSE!" message right above Link, like in the GBA port
* Picking up a Link Doll now adds a life to the total amount of lives you start the game with (restart), making the Link Dolls more useful instead of just having its benefits present until you hit a game over
* Life counter caps at 9, but you can still gather more lives via the 9000 Exp method, the counter simply won't go past 9
* Changed the font size to better accommodate the new changes
* Changed the "-" in the file select alphabet to "/"
* Cursor in the "Register Your Name" screen no longer covers portion of the text box
* Modified the flashes when Link dies and when you learn a spell to be closer to the NGC version. This was done so that photosensitive people can also enjoy this hack without having to worry about their health and well-being
* Rewritten Credits for all the Staff members, now you have the proper names of the developers that made Zelda II, instead of pseudonyms
* Saria brige now appears automatically after giving the Guard the letter for the first time. You no longer need to talk to him every time you want to cross over
* Moved the Basilisk in the cave North of Nabooru to the left, preventing it from doing that weird screen wrap upon entry
* Moved the Moa at the Path of Fire entrance up, preventing a forced hit on Link upon entering
* Moved a Red Iron Knuckle in Palace 4 that had a very high Y-position to the ground-level
* Added text to a sign with previously unpointed text in Old Kasuto
* Added windows to some rooms in the Maze and Hidden Palaces (Palaces 4 & 6), to add back the unused windows for those two
* FDS Battle Theme restored! The original NES battle theme will be used in West Hyrule overworld battles, while the new/restored FDS battle theme will be used in East Hyrule overworld battles (Thanks, IcePenguin!)
* The room with the hole in the Great Palace has been modified so it can now be accessed from all routes. You can now explore the Great Palace in any path you want, since now we have branching paths that intersect on said room. This means, you no longer have to take a required path to reach the end of the Great Palace, but can now choose at will and you will not be met with a dead end
* D-Pad Up and Down now control the cursor in the File Selection and Elimination mode menus


-------------------

## Optional patches

* **FDSKingsTomb.ips** 			- This patch restores the layout of the King's Tomb screen to resemble that of the Famicom release of Zelda II.

* **KeepExpAtGameOver.ips**			- Like its name says, this patch will make it so that even if you get a Game Over, you will keep the Exp you gained.

* **NewExp.ips**				- A completely revamped Exp system courtesy of IcePenguin! This system makes it so that you will no longer get the Level Up window prompt once you reach the required Exp for a new level. Instead, Experience points will now accumulate, and once you want to Level Up a certain ability, pressing Up+Start will automatically bring up the Level Up menu, even if you don't have enough Exp for a level up. In that case, the only available option will be "Cancel".

* **OriginalLinkDolls.ips**			- As the name implies, this restores the functionality of the Zelda II Link dolls to be the same as in the original Zelda II, meaning they won't be permanent lives anymore.

* **OriginalRestartAtGameOver.ips**			- Similar to the above patch, this one restores the original behaviour of Link getting a Game Over and starting all the way back at Zelda's Palace.

* **OriginalSpellMagicConsumption.ips**			- Restores the original magic consumption that each spell takes to that of the original Zelda II.

* **OriginalTitleScreen.ips**			- Restores back the original Title Screen from Zelda II.

* **ReduceLag.ips**			- Reduces the amount of enemies that the spawner can put on-screen from 5 to 2, so that the lag caused by the number of sprites is greatly reduced.

* **RemoveLowHealthBeep.ips**			- Removes the sound that starts playing constantly when Link is at low health.

* **RestartSameScreenAtGameOver.ips**	- This patch makes it so that when you get a Game Over, you restart in the same screen that you died on, instead of being brought back to the beginning of the current palace or Zelda's Palace in the case of the overworld.
This patch already includes the "KeepExpAtGameOver.ips" hack into it.

* **StaticExpAtPalaceCrystal.ips**		- At the end of each palace, where you put the crystal into it, you used to get an undefined amount of Exp, until you leveled up. This patch was made to prevent wasting Exp by placing the crystal, now each crystal put into a palace gives you a determined amount of Exp:

<p align="center">

|	Palace No.	|	Experience gained	|
|:--------------------:	|:----------------------------:	|
|	Palace 1	|	500 exp			|
|	Palace 2	|	1000 exp		|
|	Palace 3	|	1500 exp		|
|	Palace 4	|	2000 exp		|
|	Palace 5	|	2500 exp		|
|	Palace 6	|	3000 exp		|

</p>

* **Secret.ips**				- ???

-------------------

## Instructions

To play Zelda 2 Redux, the following is required:

* FCEUX 2.2.3 or above
* Zelda II NES ROM (Zelda II - The Adventure of Link (USA).nes, MD5: 764d36fa8a2450834da5e8194281035a)
* Lunar IPS
* Zelda2 Redux.ips patch

Grab the patches from inside the /patches/ folder from the GitHub page, or alternatively, download the .zip file from the Releases page (once a proper release is out) and apply the patch over your Zelda II ROM with Lunar IPS.
If you want to apply any of the optional patches, you can use each Optional patch individually from inside the /patches/optional folder depending on your liking over your already patched Zelda 2 Redux ROM, or you can either compile them manually from the source code, although this is not recommended if you are not familiar with compilations or 6502 assembly.

-------------------

## Credits

* **Trax** - For his amazing disassembly of Zelda 2, which helped with a ton of stuff, and also for a lot of feedback and help in the development of this hack.
* **njosro** - For his Zelda 2 editor and help towards some hacks for Redux, like the Restart in Palace hack and also the restoration of the Erdrick line.
* **IcePenguin** - For his incredible and consistent help with a lot of ASM hacks and other nifty stuff. He also helped with a bunch of the Optional patches.
* **DarkSamus993** - For his ASM dark magic regarding the Menus revamp for Redux.
* **JaSp** - For the animation on the overworld from Shadow of Night, which was reverse engineered by Trax for this hack.
* All other users that gave their feedback on possible ways to improve the game over the thread, and those that gave insightful ideas.

-------------------


## License

Zelda 2 Redux is a project licensed under the terms of the GPLv3, which means that you are given legal permission to copy, distribute and/or modify this project, as long as:

1) The source for the available modified project is shared and also available to the public without exception.
2) The modified project subjects itself different naming convention, to differentiate it from the main and licensed Zelda 2 Redux project.

You can find a copy of the license in the LICENSE file.
