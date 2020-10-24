//****************************************************************
// 	Zelda 2 Redux - Text data
//****************************************************************

//****************************************
// 	Table file
//****************************************
table code/text/text.tbl

//****************************************
// 	Control codes
//****************************************
define line  $FD  // line break
define delay $FE  // text delay
define end   $FF  // end

//****************************************
// Text pointers
//****************************************
bank 3;
org $AFBE  // 0x0EFCE
// West Hyrule Towns Text pointers
	dw text_00,text_01,text_02,text_03
	dw text_04,text_05,text_06,text_07
	dw text_08,text_09,text_10,text_11
	dw text_12,text_13,text_14,text_15
	dw text_16,text_17,text_18,text_19
	dw text_20,text_21,text_22,text_23
	dw text_24,text_25,text_26,text_27
	dw text_28,text_29,text_30,text_31
	dw text_32,text_33,text_34,text_35
	dw text_36,text_37,text_38,text_39
	dw text_40,text_41,text_42,text_43
	dw text_44,text_45,text_46,text_47
	dw text_48,text_49,text_50,text_51
org $B026	// 0x0F036
// East Hyrule Towns Text pointers
	dw text_52,text_53,text_54,text_55
	dw text_56,text_57,text_58,text_59
	dw text_60,text_61,text_62,text_63
	dw text_64,text_65,text_66,text_67
	dw text_68,text_69,text_70,text_71
	dw text_72,text_73,text_74,text_75
	dw text_76,text_77,text_78,text_79
	dw text_80,text_81,text_82,text_83
	dw text_84,text_85,text_86,text_87
	dw text_88,text_89,text_90,text_91
	dw text_92,text_93,text_94,text_95
	dw text_96,text_97

//****************************************
//	Dialogue
//****************************************

// Starting address for Text
bank 3;
org $A380	// 0x0E390

//----------------------------------------
//	WEST HYRULE TOWNS TEXT
//----------------------------------------

text_00:
	db "WON'T YOU",	$FD
	db "COME IN?",	$FF

//----------------------------------------

text_01:
	db "...",	{line}
	db "I WILL",	{line}
	db "RESTORE",	{line}
	db "YOUR LIFE.",{end}

//----------------------------------------

text_02:
	db "COME AND",	{line}
	db "REST HERE.",{end}

//----------------------------------------

text_03:
	db "I WILL",	{line}
	db "RESTORE",	{line}
	db "YOUR MAGIC.",{delay}
	db "COME BACK",	{line}
	db "ANYTIME.",	{end}

//----------------------------------------

text_04:
	db "I AM A",	{line}
	db "LITTLE",	{line}
	db "BUSY TO",	{line}
	db "TALK TO A",	{line}
	db "STRANGER.",	{line}
	db "GOODBYE.",	{end}

//----------------------------------------

text_05:
	db "HELLO!",	{end}

//----------------------------------------

text_06:
	db "HELLO",	{line}
	db "THERE",	{line}
	db "YOUNG",	{line}
	db "FELLOW.",	{end}

//----------------------------------------

text_07:
	db "I DON'T",	{line}
	db "KNOW,",	{line}
	db "SORRY.",	{end}

//----------------------------------------

text_08:
	db "EACH TOWN",	{line}
	db "HAS A SAGE.",{line}
	db "GO SEE HIM",{line}
	db "AND HE'LL",	{line}
	db "TEACH YOU",	{line}
	db "MAGIC!",	{end}

//----------------------------------------

text_09:
	db "THERE'S A",	{line}
	db "HEART",	{line}
	db "CONTAINER",	{line}
	db "SOUTH OF",	{line}
	db "PARAPA",	{line}
	db "TEMPLE.",	{end}

//----------------------------------------

text_10:
	db "ONLY WITH",	{line}
	db "A HAMMER",	{line}
	db "YOU CAN",	{line}
	db "BREAK ROCKS",{line}
	db "BLOCKING",	{line}
	db "THE WAY...",{end}

//----------------------------------------

text_11:
	db "WELCOME TO",{line}
	db "RAURU.",	{end}

//----------------------------------------

text_12:	// Repoint 1, 0xEFE6
	db "GO WEST TO",{line}
	db "RUTO AFTER",{line}
	db "YOU FIND",	{line}
	db "THE CANDLE",{line}
	db "IN PARAPA",	{line}
	db "TEMPLE.",	{end}

//----------------------------------------

text_13:
	db "GORIYA OF",	{line}
	db "TANTARI",	{line}
	db "DESERT",	{line}
	db "STOLE THE",	{line}
	db "GODDESS",	{line}
	db "STATUE.",	{end}

//----------------------------------------

text_14:
	db "OH!",	{delay}
	db "THAT'S THE",{line}
	db "GODDESS",	{line}
	db "STATUE!",	{delay}
	db "GO SEE",	{line}
	db "GRANDPA!",	{end}

//----------------------------------------

text_15:
	db "USE THIS",	{line}
	db "MAGIC TO",	{line}
	db "SURVIVE",	{line}
	db "THE TEMPLE",{line}
	db "IN PARAPA",	{line}
	db "DESERT.",	{end}

//----------------------------------------

text_16:	// Repoint 2, 0xEFEE
	db "I DON'T",	{line}
	db "HAVE MORE",	{line}
	db "TO TEACH",	{line}
	db "YOU. GO,",	{line}
	db "AND TAKE",	{line}
	db "CARE.",	{end}

//----------------------------------------

text_17:
	db "THERE'S A",	{line}
	db "HAMMER AT",	{line}
	db "DEATH",	{line}
	db "MOUNTAIN'S",{line}
	db "SPECTACLE",	{line}
	db "ROCK...",	{end}

//----------------------------------------

text_18:
	db "DON'T GO",	{line}
	db "SOUTH",	{line}
	db "WITHOUT A",	{line}
	db "CANDLE.",	{line}
	db "IT'S VERY",	{line}
	db "DANGEROUS!",{end}

//----------------------------------------

text_19:
	db "THERE'S A",	{line}
	db "MAGIC",	{line}
	db "CONTAINER",	{line}
	db "IN A CAVE",	{line}
	db "SOUTH OF",	{line}
	db "THE CASTLE.",{end}

//----------------------------------------

text_20:
	db "TOWN OF",	{line}
	db "RUTO.",	{end}

//----------------------------------------

text_21:
	db "YOU FOUND",	{line}
	db "A MIRROR",	{line}
	db "UNDER THE",	{line}
	db "TABLE.",	{end}

//----------------------------------------

text_22:
	db "I LOST",	{line}
	db "MY MIRROR.",{end}

//----------------------------------------

text_23:
	db "OH! THAT'S",{line}
	db "MY MIRROR!",{line}
	db "FOLLOW ME",	{line}
	db "TO MY",	{line}
	db "HOUSE.",	{end}

//----------------------------------------

text_24:	// Repoint 3, 0xEFFE
	db "WITH THIS",	{line}
	db "SPELL, YOU",{line}
	db "CAN JUMP",	{line}
	db "VERY HIGH.",{end}

//----------------------------------------

text_25:
	db "I AM",	{line}
	db "ERROR.",	{end}

//----------------------------------------

text_26:
	db "THERE'S A",	{line}
	db "TUNNEL TO",	{line}
	db "THE TEMPLE",{line}
	db "SOUTH OF",	{line}
	db "THE KING'S",{line}
	db "TOMB.",	{end}

//----------------------------------------

text_27:
	db "THE TEMPLE",{line}
	db "IN MIDORO",	{line}
	db "SWAMP HAS",	{line}
	db "A PAIR OF",	{line}
	db "SACRED",	{line}
	db "GLOVES.",	{end}

//----------------------------------------

text_28:
	db "GANON'S",	{line}
	db "MINIONS",	{line}
	db "HAVE",	{line}
	db "SLIPPED",	{line}
	db "INTO TOWN",	{line}
	db "CROWDS.",	{end}

//----------------------------------------

text_29:
	db "WATER TOWN",{line}
	db "OF SARIA.",	{end}

//----------------------------------------

text_30:
	db "BALANCE",	{line}
	db "THE THREE",	{line}
	db "LEVELS",	{line}
	db "AND TRUE",	{line}
	db "POWER WILL",{line}
	db "BE YOURS!",	{end}

//----------------------------------------

text_31:	// Repoint 4, 0xF00C
	db "THE HERO,",	{line}
	db "ERDRICK,",	{line}
	db "LIES HERE.",{end}

//----------------------------------------

text_32:
	db "RETURN THE",{line}
	db "CRYSTAL TO",{line}
	db "THE TEMPLE",{line}
	db "IN PARAPA",	{line}
	db "DESERT. GO",{line}
	db "NORTHEAST.",{end}

//----------------------------------------

text_33:	// Repoint 5, 0xF010
	db "USE KEYS IN",{line}
	db "THE TEMPLES",{line}
	db "WHERE THEY",{line}
	db "ARE FOUND.",{end}

//----------------------------------------

text_34:
	db "BEFORE",	{line}
	db "LEAVING,",	{line}
	db "COME TO",	{line}
	db "MY HOUSE",	{line}
	db "AND SEE",	{line}
	db "GRANDPA.",	{end}

//----------------------------------------

text_35:
	db "I'LL TEACH",{line}
	db "YOU THE",	{line}
	db "MAGIC TO",	{line}
	db "RESTORE",	{line}
	db "LIFE.",	{end}

//----------------------------------------

text_36:	// Repoint 6, 0xF016
	db "ONLY SARIA",{line}
	db "TOWNSFOLK",	{line}
	db "MAY CROSS",	{line}
	db "THIS RIVER.",{end}

//----------------------------------------

text_37:
	db "A FRIEND",	{line}
	db "OF BUG, EH!",{line}
	db "IN THAT",	{line}
	db "CASE, YOU",	{line}
	db "MAY CROSS",	{line}
	db "THE BRIDGE.",{end}

//----------------------------------------

text_38:
	db "THE CHURCH",{line}
	db "IN TOWN HAS",{line}
	db "NO PRIEST,",{line}
	db "BUT THE",	{line}
	db "BELL DOES",	{line}
	db "TOLL...",	{end}

//----------------------------------------

text_39:
	db "THE RAFT",	{line}
	db "IS IN THE",	{line}
	db "ISLE TEMPLE",{line}
	db "TO THE",	{line}
	db "SOUTH.",	{end}

//----------------------------------------

text_40:
	db "A CAVE IN",	{line}
	db "THE MORUGE",{line}
	db "SWAMP HAS",	{line}
	db "A SACRED",	{line}
	db "WATER THAT",{line}
	db "HEALS ALL.",{end}

//----------------------------------------

text_41:
	db "HARBOR",	{line}
	db "TOWN OF",	{line}
	db "MIDO.",	{end}

//----------------------------------------

text_42:
	db "THE DOOR",	{line}
	db "WILL NOT",	{line}
	db "OPEN. IT",	{line}
	db "IS EERILY",	{line}
	db "QUIET...",	{end}

//----------------------------------------

text_43:
	db "PLEASE, MY",{line}
	db "DAUGHTER",	{line}
	db "IS ILL...",	{delay}
	db "SHE IS AT",	{line}
	db "DEATH'S",	{line}
	db "DOOR!",	{end}

//----------------------------------------

text_44:
	db "THE SACRED",{line}
	db "WATER!",	{line}
	db "MY DAUGHTER",{line}
	db "IS SAVED!",	{line}
	db "COME TO",	{line}
	db "MY HOUSE.",	{end}

//----------------------------------------

text_45:
	db "ERROR, WHO",{line}
	db "LIVES IN",	{line}
	db "RUTO, HAS",	{line}
	db "TO KNOW",	{line}
	db "ABOUT THE",	{line}
	db "TEMPLES!",	{end}

//----------------------------------------

text_46:
	db "BORROW THE",{line}
	db "POWER OF",	{line}
	db "THE FAIRIES",{line}
	db "WITH THIS",	{line}
	db "SPELL.",	{end}

//----------------------------------------

text_47:
	db "WHEN YOU",	{line}
	db "JUMP, PRESS",{line}
	db "DOWN TO",	{line}
	db "PERFORM A",	{line}
	db "DOWNTHRUST.",{end}

//----------------------------------------

text_48:	// Repoint 7, 0xF02E
	db "MY NAME IS",{line}
	db "BUG. SHOW",	{line}
	db "THIS LETTER",{line}
	db "TO THE",	{line}
	db "FERRYMAN",	{line}
	db "IN SARIA.",	{end}

//----------------------------------------

text_49:
	db "ZZZ...",	{end}

//----------------------------------------

text_50:
	db "LET ME BE!",{line}
	db "THE HOUSE",	{line}
	db "MASTER IS",	{line}
	db "IN A FOREST",{line}
	db "NORTH OF",	{line}
	db "THE RIVER.",{end}

//----------------------------------------

text_51:
	db "THIS IS",	{line}
	db "THE KING'S",{line}
	db "TOMB.",	{end}


//----------------------------------------
//	EAST HYRULE TOWNS TEXT
//----------------------------------------

text_52:
	db "WON'T YOU",	{line}
	db "COME IN?",	{end}

//----------------------------------------

text_53:
	db "...",	{line}
	db "AH! YOU'RE",{line}
	db "REVIVED!",	{end}

//----------------------------------------

text_54:
	db "COME AND",	{line}
	db "REST.",	{end}

//----------------------------------------

text_55:
	db "WHAT DO",	{line}
	db "YOU THINK?",{line}
	db "IT'S MY",	{line}
	db "SPECIAL",	{line}
	db "MEDICINE!",	{end}

//----------------------------------------

text_56:
	db "I DON'T",	{line}
	db "KNOW",	{line}
	db "ANYTHING.",	{end}

//----------------------------------------

text_57:
	db "PLEASE,",	{line}
	db "SAVE OUR",	{line}
	db "TOWN!",	{end}

//----------------------------------------

text_58:
	db "YOU MUST",	{line}
	db "SAVE",	{line}
	db "HYRULE!",	{end}

//----------------------------------------

text_59:
	db "I CAN'T",	{line}
	db "HELP YOU.",	{end}

//----------------------------------------

text_60:
	db "A MONSTER",	{line}
	db "EATS THOSE",{line}
	db "THAT SETTLE",{line}
	db "DOWN BY THE",{line}
	db "RIVER...",	{end}

//----------------------------------------

text_61:
	db "GOING TO",	{line}
	db "THE TEMPLE?",{line}
	db "DON'T BE",	{line}
	db "AFRAID TO",	{line}
	db "JUMP INTO",	{line}
	db "A HOLE!",	{end}

//----------------------------------------

text_62:
	db "WELCOME TO",{line}
	db "NABOORU.",	{end}

//----------------------------------------

text_63:	// Repoint 8, 0xF04C
	db "YOU DREW",	{line}
	db "SOME WATER",{line}
	db "FROM THE",	{line}
	db "FOUNTAIN.",	{end}

//----------------------------------------

text_64:
	db "SEE THE",	{line}
	db "SAGE AT",	{line}
	db "DARUNIA",	{line}
	db "BEFORE YOU",{line}
	db "GO TO MAZE",{line}
	db "ISLAND.",	{end}

//----------------------------------------

text_65:
	db "I AM",	{line}
	db "THIRSTY.",	{end}

//----------------------------------------

text_66:
	db "I SEE YOU",	{line}
	db "HAVE WATER.",{line}
	db "YOU SHOULD",{line}
	db "COME TO",	{line}
	db "MY HOUSE.",	{end}

//----------------------------------------

text_67:
	db "IF YOU HAVE",{line}
	db "THE SACRED",{line}
	db "BOOTS, YOU",{line}
	db "CAN WALK ON",{line}
	db "THE OCEAN.",{end}

//----------------------------------------

text_68:
	db "A HEART",	{line}
	db "CONTAINER",	{line}
	db "IS BY THE",	{line}
	db "SHORE EAST",{line}
	db "OF THREE",	{line}
	db "EYE ROCK.",	{end}

//----------------------------------------

text_69:
	db "I WON'T",	{line}
	db "TEACH YOU",	{line}
	db "UNTIL YOU",	{line}
	db "ARE READY.",{end}

//----------------------------------------

text_70:
	db "THIS MAGIC",{line}
	db "WILL MAKE",	{line}
	db "YOUR SWORD",{line}
	db "SHOOT FIRE.",{end}
//----------------------------------------

text_71:
	db "I DON'T",	{line}
	db "HAVE MORE",	{line}
	db "TO TEACH",	{line}
	db "YOU. GO,",	{line}
	db "AND TAKE",	{line}
	db "CARE.",	{end}

//----------------------------------------

text_72:	// Repoint 9, 0xF05E
	db "THE RIVER",	{line}
	db "MONSTER",	{line}
	db "HATES ALL",	{line}
	db "NOISE.",	{end}

//----------------------------------------

text_73:
	db "A POWERFUL",{line}
	db "SWORDSMAN",	{line}
	db "LIVES IN",	{line}
	db "THIS TOWN.",{end}

//----------------------------------------

text_74:
	db "THE MAGIC",	{line}
	db "KEY, IT",	{line}
	db "READS...",	{delay}
	db "TREASURE",	{line}
	db "OF KASUTO.",{end}

//----------------------------------------

text_75:
	db "THERE ARE",	{line}
	db "FALSE WALLS",{line}
	db "IN THE",	{line}
	db "TEMPLE!",	{end}

//----------------------------------------
// Fill out remaining space before pointers
	fillto $AFBD,$FF
// Continue at free space for remaining text
	org $B810	// 0x0F820

//----------------------------------------

text_76:
	db "MOUNTAIN",	{line}
	db "TOWN OF",	{line}
	db "DARUNIA.",	{end}

//----------------------------------------

text_77:
	db "THE WALL",	{line}
	db "READS...",	{delay}
	db "A TEMPLE",	{line}
	db "LIES TO THE",{line}
	db "FAR EAST",	{line}
	db "OF NABOORU.",{end}

//----------------------------------------

text_78:
	db "???",	{delay}
	db "THERE ARE",	{line}
	db "SIGNS OF",	{line}
	db "SOMEONE",	{line}
	db "BEHIND",	{line}
	db "THE DOOR.",	{end}

//----------------------------------------

text_79:	// Repoint 10, 0xF06C
	db "MY CHILD IS",{line}
	db "CAPTURED",	{line}
	db "ON MAZE",	{line}
	db "ISLAND!",	{delay}
	db "PLEASE,",	{line}
	db "RESCUE HIM!",{end}

//----------------------------------------

text_80:
	db "YOU ARE A",	{line}
	db "HERO FOR",	{line}
	db "SAVING MY",	{line}
	db "CHILD.",	{delay}
	db "PLEASE,",	{line}
	db "FOLLOW ME.",{end}

//----------------------------------------

text_81:
	db "THIS MAGIC",{line}
	db "WILL ALLOW",{line}
	db "YOUR SHIELD",{line}
	db "TO DEFLECT",{line}
	db "ATTACKS!",	{end}

//----------------------------------------

text_82:
	db "WHEN YOU",	{line}
	db "JUMP,",	{line}
	db "PRESS UP TO",{line}
	db "PERFORM AN",{line}
	db "UPTHRUST.",	{end}

//----------------------------------------

text_83:	// Repoint 11, 0xF074
	db "EVERYONE",	{line}
	db "FLED FROM",	{line}
	db "KASUTO WHEN",{line}
	db "THE MINIONS",{line}
	db "OF GANON",	{line}
	db "ATTACKED.",	{end}

//----------------------------------------

text_84:
	db "THE OLD MAN",{line}
	db "WHO REMAINS",{line}
	db "IN KASUTO",	{line}
	db "IS ONE OF",	{line}
	db "THE GREAT",	{line}
	db "SAGES!",	{end}

//----------------------------------------

text_85:
	db "...",	{end}

//----------------------------------------

text_86:
	db "SECRET",	{line}
	db "TOWN OF",	{line}
	db "KASUTO.",	{end}

//----------------------------------------

text_87:
	db "HUH?!",	{delay}
	db "LOOKS LIKE",{line}
	db "YOU CAN",	{line}
	db "GET IN THE",{line}
	db "FIREPLACE!",{end}

//----------------------------------------

text_88:
	db "CALL TO",	{line}
	db "THE TEMPLE",{line}
	db "AT THE",	{line}
	db "THREE EYE",	{line}
	db "ROCK IN",	{line}
	db "THE DESERT.",{end}

//----------------------------------------

text_89:
	db "THE HOLE",	{line}
	db "IN THE",	{line}
	db "TEMPLE IS A",{line}
	db "BOTTOMLESS",{line}
	db "PIT.",	{end}

//----------------------------------------

text_90:
	db "RETURN WHEN",{line}
	db "YOU HAVE",	{line}
	db "SEVEN MAGIC",{line}
	db "CONTAINERS.",{end}

//----------------------------------------

text_91:
	db "I WILL",	{line}
	db "GIVE YOU",	{line}
	db "SOMETHING",	{line}
	db "GOOD.",	{line}
	db "FOLLOW ME.",{end}

//----------------------------------------

text_92:
	db "THERE IS",	{line}
	db "A SECRET",	{line}
	db "ON THE",	{line}
	db "OUTSKIRTS",	{line}
	db "OF TOWN.",	{end}

//----------------------------------------

text_93:	// Repoint 12, 0xF088
	db "THIS SPELL",{line}
	db "HAS SOME",	{line}
	db "MYSTERIOUS",{line}
	db "ORIGINS.",	{end}

//----------------------------------------

text_94:
	db "KASUTO...",	{delay}
	db "STRANGE...",{delay}
	db "THERE IS",	{line}
	db "NO SIGN",	{line}
	db "OF ANYONE!",{end}

//----------------------------------------

text_95:
	db "KASUTO IS",	{line}
	db "RUINED. THE",{line}
	db "PEOPLE FLED",{line}
	db "TO A HIDDEN",{line}
	db "TOWN IN THE",{line}
	db "EAST WOODS.",{end}

//----------------------------------------

text_96:
	db "I WILL",	{line}
	db "TEACH YOU",	{line}
	db "THE MOST",	{line}
	db "POWERFUL",	{line}
	db "MAGIC.",	{end}

//----------------------------------------

text_97:
	db "YOU ARE",	{line}
	db "STUBBORN!",	{delay}
	db "I SAW A",	{line}
	db "HEART OVER",{line}
	db "THE OCEAN!",{end}

//----------------------------------------
