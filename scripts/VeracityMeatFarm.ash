script <VMF>;
since r26135;

import <vprops.ash>;
import <vcon.ash>

// ***************************
// *        To Do            *
// ***************************

// If you have a whitelist to BAFH and have a VIP lounge key, go there
// to use all the furniture.
//
// Pantsgiving: pantsgiving_replacement can specify different pants to
// switch to after you've earned 5, 50, 500, 5000 combats. If so, eat a
// 1-full item after 5 combats, another after 50 combats, and then
// switch pants.
//
// KGB Briefcase buffs & free martinis
// Bird-A-Day Calendar?
// Chocolates?
//
// We only need Cold Resistance +1 to go to the Icy Peak
// Having an outfit for that is overkill
//      
// Bug: Verify that VMF.FamiliarEquipment is a universal item
// Bug: Require SOME mood to be set, at least
// Bug: Require SOME recovery to be set, at least
// Bug: Complete valid_wish();
// Bug: Don't suit up in cheat_deck or genie_wishes unless will fight a monster
//
// Voting Booth:
//    When fighting a voter, switch to item drop familiar
// 
// Configurable moods for:
// - L.O.V. Tunnel
// - Farming
// - Gingerbread City
// - Spacegate
// - Underwater
//
// Support for Underwater farming location (Mood, Outfit, Fishy, Familiar, etc.)
// Source Terminal: optionally Digitize monster we are copying
//     (add to putty_filter and also track digitized monster counter)
//     (adventure in shrine to fight the digitized monster)

// ***************************
// *      Requirements       *
// ***************************

// Hobo Monkey (or Leprechaun) (configurable)
// ittah bittah hookah (or universal familiar equpment of your choice) (configurable/optional)
// Preconfigured outfits (configurable)
//    "Barf Mountain" - for adventuring in Barf Mountain
//    "Deep Machine Tunnels" - for adventuring in The Deep Machine Tunnels
//    "Gingerbread City" - for adventuring in the Gingerbread City
//    "Neverending Party" - for adventuring in The Neverending Party
//    "Tunnel of LOVE" - for adventuring in the Tunnel of L.O.V.E.
//    "Icy Peak" - for adventuring in The Icy Peak
//    "Item Drop" - for adventuring where items are more important than Meat
//    "Meat Drop" - for adventuring anywhere else
//    "Velvet" - for collecting a reward from The Towering Inferno Discotheque
// CCS configured
// HP & MP restoration configured
// Mood configured
// Breakfast configured

// ***************************
// *     External Scripts    *
// ***************************

// Required scripts which are are installed automatically
//
// vprops			Veracity's property management library
//				https://kolmafia.us/showthread.php?21593
//				veracity0-vprops
// vcon				Veracity's consumable library
//				https://kolmafia.us/showthread.php?23145
//				veracity0-vcon
//
// The following scripts are optional. If they are installed and this
// script is configured to use them, they will be invoked as needed
//
// Here are the script name (as seen in the Script Manager), the forum
// thread describing it, and the repo in your "svn" directory
//
// Veracity scripts:
//
// Arrrbor Day			Veracity's Arrrbor Day
//				https://kolmafia.us/showthread.php?24900
//				veracity0-arrrbor-day
// Beach Comb			Veracity's BeachComber
//				https://kolmafia.us/showthread.php?23993
//				veracity0-beach
// Garden Harvester		Veracity's Garden Harvester
//				https://kolmafia.us/showthread.php?21651
//				veracity0-garden
// Gingerbread City		Veracity's Gingerbread City
//				https://kolmafia.us/showthread.php?21609
//				veracity0-gingerbread
// Shadow Rift			Veracity's ShadowRift
//				https://kolmafia.us/threads/shadowrift.28812
//				veracity0-shadow-rift
// Spacegate			Veracity's Spacegate
//				https://kolmafia.us/showthread.php?23335
//				veracity0-spacegate
//
// Loathing Associates Scripting Society scripts:
//
// Beach Comb			combo
//				https://github.com/Loathing-Associates-Scripting-Society/combo
//				Loathing-Associates-Scripting-Society-combo-branches-release
//
// Ezandora scripts:
//
// Bastille Battalion		Bastille
//				https://kolmafia.us/showthread.php?22957
//				Ezandora-Bastille-branches-Release
// Detective School		Detective Solver
//				https://kolmafia.us/showthread.php?20406
//				Ezandora-Detective-Solver-branches-Release
// TimeSpinner			Far Future
//				https://kolmafia.us/showthread.php?20575
//				Ezandora-Far-Future-branches-Release
// (soon)
// Kremlin's Greatest Briefcase	KGBriefcase
//				https://kolmafia.us/showthread.php?21892
//				Ezandora-Briefcase-branches-Release

// ***************************
//       Optional IOTMs      *
// ***************************

// Angry Jung Man
// --> Check for and obtain Jick jar
// Barrel Shrine 
// --> If Accordion Thief, pray for extra adventures from booze
// --> If Turtle Tamer, pray for extra adventures from food
// Bastille Battalion
// --> Get daily stats, accessory, effect, potion
// Beach Comb
// --> Will invoke Combo script (if installed)
// --> Will invoke BeachComber script (if installed)
// Boxing Daycare
// --> Will get an item, a buff, and perform other actions (configurable)
// Chateau Mantegna
// --> Will use up free rests for stats
// --> Will harvest desk
// Clan VIP Lounge key
// --> Will visit Mad Tea Party (configurable)
// --> Will use floundry (configurable)
// --> Will shower (configurable)
// --> Will swim in the swimming pool (configurable)
// --> Will use pool table (configurable)
// --> Will consult with fortune teller (configurable)
// Closed-circuit pay phone
// --> Will run (turn free) errands for Rufus (configurable/optional)
// Deck of Every Card
// --> Will cheat cards (configurable)
// Deluxe Fax Machine
// --> Will fax in a monster (configurable)
// Detective School
// --> Will invoke Ezandora's script (if installed)
// Dinseylandfill
// --> Will farm Barf Mountain
// --> Will grease tracks for 3 Fun Funds, if task is available
// Genie Bottle
// --> Will ask for wishes (configurable)
// Gingerbread City
// --> Will spend turns farming sprinkles (configurable/optional)
// God Lobster
// --> Will use daily free adventures
// --> Will acquire and use familiar equipment, as needed
// Grimstone Golem
// --> Will collect meat from spinning wheel
// Guzzlr tablet
// --> Will collect a Guzzlr coctail set
// Horsery Contract
// --> Will check out a horse for the day (configurable)
// Love Bugs
// --> Will use while busting ghosts
// Machine Elf
// --> Free fights in the Deep Machine Tunnels
// --> Will upgrade abstractions
// Manual of Numberology
// --> Will Calculate the Universe for result during spleening (configurable)
// Mayfly Bait Necklace
// --> Will use to get extra FunFunds in Barf Mountain
// Mayo Clinic
// --> Will use Mayoflex to get extra adventures from food
// Model Train Set
// --> Will use to collect Meat, if so-configured
// Mumming Trunk
// --> Augment farming familiar (configurable)
// Neverending Party
// --> Will use daily free adventures
// Pantsgiving
// --> Will get Pocket Crumbs
// --> Will use extra fullness
// Plastic Vampire Fangs
// --> Will Vamp Out in Seaside Town (configurable/optional)
// Potted Tea Tree
// --> Daily harvest (configurable)
// Protonic Accelerator Pack
// --> Will bust ghosts 
// --> Must have Talisman o' Namsilat
// --> At Icy Peak, will use first of: innate Cold Resistance +5, Slimesuit, eXtreme Cold-Weather Gear
// Rogue Program (Game Grid token)
// --> Check for defective Game Grid token
// Snojo
// --> Free fights with X-32-F Combat Training Snowman (configurable)
// SongBoom&trade; BoomBox
// --> Will play a song (configurable)
// --> Will sing along in combat
// Source Terminal
// --> Enhance meat drops (configurable)
// --> Extract Source Essence (configurable/optional)
// --> Extrude items (configurable/optional)
// Spacegate
// --> Will spend turns exploring an alien planet (configurable/optional)
// Space Jellyfish
// --> Daily sea jelly
// That 70s Volcano
// --> Visit The Towering Inferno Discotheque to gain 5 adventures (configurable)
// The Glaciest
// --> Will create a VYKEA companion (configurable/optional)
// Time-Spinner
// --> Will recall delicious meals
// --> Will invoke Ezandora's script to get an item (if installed) (configurable/optional)
// --> Will use excess minutes sending pranks to random friends (configurable)
// Trick or Treating Tot
// --> Will acquire and use li'l pirate costume
// --> Will acquire and use li'l ninja costume
// --> You should have li'l unicorn costume
// Tunnel of L.O.V.E.
// --> Will take a trip through the Tunnel of L.O.V.E. (configurable/optional)
// Voting Booth
// --> Will equip "I Voted" sticker to fight vote monters (configurable)
// Witchess Set
// --> Free fights with Witchess pieces (configurable)

// ***************************
// *     Configuration       *
// ***************************

typedef int [item] item_to_int_map;	// get_inventory(), etc.
typedef int [string] string_to_int_map;	// goldens, etc.

//-------------------------------------------------------------------------
// All of the configuration variables have default values, which apply
// to any character who does not override the variable using the
// appropriate property.
//
// You can edit the default here in the script and it will apply to all
// characters which do not override it.
//
// define_property( PROPERTY, TYPE, DEFAULT )
// define_property( PROPERTY, TYPE, DEFAULT, COLLECTION )
// define_property( PROPERTY, TYPE, DEFAULT, COLLECTION, DELIMITER )
//
// Otherwise, you can change the value for specific characters in the gCLI:
//
//     set PROPERTY=VALUE
//
// Both DEFAULT and a property VALUE will be normalized
//
// All properties used directly by this script start with "VMF."
//-------------------------------------------------------------------------

// Whether or not to exit after doing all the prep work and "free" actions.
// If you want to farm Crimbo, say, set this to false.

boolean run_turns = define_property( "VMF.RunTurns", "boolean", "true" ).to_boolean();

// What kind of farming are we doing?
//
// "meat"		Meat
// "items"		Items

string farm_type = define_property( "VMF.FarmType", "string", "meat" );

// Farming location. If "none", we will choose Barf Mountain (if
// available) or The Hidden Office Building (otherwise).

location farm_location = define_property( "VMF.FarmLocation", "location", "none" ).to_location();

// Should we use a one-day ticket to Dinseylandfill to farm Barf Mountain, if one is available?
boolean should_use_dinsey_ticket = define_property( "VMF.UseDinseylandfillTicket", "boolean", "true" ).to_boolean();

// Familiar to use for farming. If "none", we will choose one from those
// you have available.

familiar meat_familiar = define_property( "VMF.MeatFamiliar", "familiar", "none" ).to_familiar();

// Familiar to use for item drops in certain locations. If "none", we
// will choose one from those you have available.

familiar item_familiar = define_property( "VMF.ItemFamiliar", "familiar", "none" ).to_familiar();

// What "universal" familiar equipment your (non-Tot) familiar should wear.
// If "none", will leave familiar equipment alone

item default_famequip = define_property( "VMF.FamiliarEquipment", "item", "ittah bittah hookah" ).to_item();

// Consider using an amulet coin as familiar equipment in place of the above. This item provides both
// Familiar Weight +10 and Meat Drop +50
//
// Since it lasts only until rollover, you must have a Cornbeefadon and familiar jacks to obtain the item.
// If can't get the item, use the default item above.

boolean get_amulet_coin = define_property( "VMF.GetAmuletCoin", "boolean", "false" ).to_boolean();

// How to stasis with a Hobo Monkey. If "none", will pick an item.

item stasis_item = define_property( "VMF.StasisItem", "item", "none" ).to_item();

// Monsters worth Olfacting
//
// Garbage Tourist	Meat Drop: 250 + up to three bag of park garbage: usable for 150 Meat
// pygmy headhunter	Mwat Drop: 175 + briefcase: useable for 300 Meat or fat stacks of cash (worth 150 Meat)
// Knott Yeti		Meat Drop: 200

monster_set olfaction_targets = define_property( "VMF.OlfactionTargets", "monster", "Knott Yeti|Garbage Tourist|pygmy headhunter", "set" );

// Which Friars blessing to ask for:
//
// none			no blessing
// food			Brother Flying Burrito's Blessing: Food Drop +30
// booze		Brother Corsican's Blessing: Booze Drop +30
// familiar		Brother Smothers's Blessing: Familiar Experience +2

string blessing = define_property( "VMF.FriarsBlessing", "string", "none" );

// What to drink for a nightcap. If "" or "none", will not overdrink.

item nightcap = define_property( "VMF.Nightcap", "item", "Fog Murderer" ).to_item();

// Should we mallsell or autosell loot found in breakfast?

boolean should_sell_breakfast_loot = define_property( "VMF.SellBreakfastLoot", "boolean", "true" ).to_boolean();

// Certain activities require resources. Allow opting out.

boolean should_summon_demon = define_property( "VMF.SummonDemon", "boolean", "true" ).to_boolean();
boolean make_prismatic_wads = define_property( "VMF.MakePrismatic_Wads", "boolean", "true" ).to_boolean();

// Other optional non-IOTM activities

boolean fight_eldritch_tentacles = define_property( "VMF.FightEldritchTentacles", "boolean", "true" ).to_boolean();

// Breakfast
//
// This script will perform "breakfast" activities (at the end of running turns;
// some breakfasty activities, like spinning Meat from air using a spinning wheel
// in your workshed improve with level.
//
// KoLmafia's built-in breakfeast command is highly configurable on the Preferences panel.
// I am quite happy with it, for what it does, but there are other daily activities which
// could be done as well but will not be added to the built-in command.
//
// You can configre a "breakfast script" here. If you do not configure such a script,
// We will run the "breakfast" command. If you do configure such a script, we will run it,
// and it will be up to your sc ript to call the "breakfast" command, if desired.
//
// The built-in "breakfast" command sets the "breakfastCompleted"  property to true when
// it completes.  Even if your breakfast script does not invoke the built-in command,
// it should use that property to control whether or not the script is finished for the day.

string breakfast_script = define_property( "VMF.BreakfastScript", "string", "" );

// *** Breakfast Counter **

// Getting a muffin from the Breakfast Counter at the Monorail Station
// is a good choice, if you have an earthware muffin tin.
//
// muffins give lots of stats (150/150/150), grant 25 turns of a
// muffin-specific buff, and, if you eat the muffin as your first food,
// 10 turns of Started Your Day Right - Experience: +3, Muscle Percent:
// +25, Mysticality Percent: +25, Moxie Percent: +25
//
// blueberry muffin		All Blued Up	Meat Drop +60, MP Regen 2-3, HP Regen 5-10
// bran muffin			All Branned Up	Item Drop +60, MP Regen 5-7
// chocolate chip muffin	All Chipped Up	Meat Drop: +30, Item Drop: +20, MP Regen 4-5, HP Regen 3-6
// none				any of the above, chosen circularly

boolean should_eat_muffins = define_property( "VMF.EatMuffins", "boolean", "false" ).to_boolean();
item muffin_to_order = define_property( "VMF.MuffinToOrder", "item", "none" ).to_item();

// *** Semirare hunting ***
//
// As of Jan 1, 2022, KoL has eliminated semirares.
// Semirare hunting is dead. R.I.P.

// *** Holidays ***

// *** Arrrbor Day ******

// If you install the Arrrbor Day script, we will run it for you.
// Since it takes 3 turns to (eventually) get a potion which sells
// for at least 30,000, it is likely worth your while.

boolean celebrate_arrrbor_day = define_property( "VMF.CelebrateArrrborDay", "boolean", "true" ).to_boolean();

// *** Dependence Day ***

// You can shoot off one firework on Dependence Day.
//
// M-242	Adrenaline Rush			Muscle +100%
// snake	Sneaky Serpentine Subtlety	Moxie +100%
// sparkler	Sparkling Consciousness		Mysticalite +100%
// green rocket	3 ten-leaf clovers
//
// Only the last is likely to be useful, but now that ten-leaf clovers
// no longer give special adventures, perhaps clovers are a pass.
//
// It's configurable.

item dependence_day_firework = define_property( "VMF.DependenceDayFirework", "item", "none" ).to_item();

// *** IOTM Configuration ***

// *** Bastille Battalion ***

// Should we use the Bastille Battalion?
// (If you are trying to leaderboard and/or have a better script, perhaps not.)

boolean use_battalion = define_property( "VMF.UseBastilleBattalion", "boolean", "true" ).to_boolean();

// Barbican: stats
//
// muscle			Babar		250 Muscle substats
// mysticality			Barbecue	250 Mysticality substats
// moxie			Barbershop	250 Moxie substats
//
// mainstat			(your class's prime stat)

string battalion_stats = define_property( "VMF.BattalionStats", "string", "mainstat" );

// Drawbridge: accessory
//
// Brutal brogues		Brutalist	Muscle +50%, Weapon Damage +50%, +8 to Familiar Weight, +4 Muscle Stats
// Draftsman's driving gloves	Draftsman	Mysticality +50%, Spell Damage +50%, +8 Adventure, +4 Mysticality Stats Fight
// Nouveau nosering		Art Nouveau	Moxie +50%, +25% Item Drop, Maximum HP/MP +25, +4 Moxie Stats
//
// (default is +8 Adventure accessory)

item battalion_accessory = define_property( "VMF.BattalionAccessory", "item", "Draftsman's driving gloves" ).to_item();

// Murder hole: effect (100 turns)
//
// Bastille Budgeteer		Cannon		Muscle +25, +10% Critical, Regenerate 10-20 HP
// Bastille Bourgeoisie		Catapult	Mysticality +25, +10% Spell Critical, Regenerate 5-10 MP per Adventure
// Bastille Braggadocio		Gesture		Moxie +25, +25% Initiative, +25% Meat Drop
//
// (default is +25% Meat Drop effect)

effect battalion_effect = define_property( "VMF.BattalionEffect", "effect", "Bastille Braggadocio" ).to_effect();

// Moat: potion (1 turn)
//
// sharkfin gumbo		Sharks		+1 MA, +1 MD
// boiling broth		Lava		+1 CA, +1 CD
// interrogative elixir		Truth Serum	+1 PA, +1 PD
//
// random (a random potion)
// rarest (the potion you have the least of)

string battalion_potion = define_property( "VMF.BattalionPotion", "string", "rarest" );

// *** Beach Comb ************

// How to comb the beach
//
//     < 0	Do not comb the beach
//     = 0	Do only free combings
//     > 0	Do free combings + XXX turns of combings

int beach_comb_turns = define_property( "VMF.BeachCombTurns", "int", "0" ).to_int();

// Which Beach Comb script is to be used
//
//     BeachComber	Visits random sections of the beach and goes after uncombed
//			"sparkly" squares, assuming you've unlocked them via Grandpa
//			You can stumble upon whales and other rarities (I have), and
//			will not waste time on already combed squares, at least.
//     combo		Visits only "scarce" squares for best chance at rarities
//			Unfortunately, although there are more than 700 of them,
//			the more people who use this script, the more likely you'll
//			find them already combed. They do regenerate, slowly.

string beach_comb_script = define_property( "VMF.UseBeachCombScript", "string", "BeachComber" );

// *** Boxing Daycare ********

boolean boxing_daycare = define_property( "VMF.UseBoxingDaycare", "boolean", "true" ).to_boolean();

// Boxing Daydream - get an item once per day
//
// Boxing Daycare Spa - get a buff once per day
//
// Muddled		(muscle) Muscle Percent: +200, Monster Level: +15
// Ten out of Ten	(moxie) Moxie Percent: +200, Initiative: +50
// Uncucumbered		(mysticality) Mysticality Percent: +200, Item Drop: +25
// Flagrantly Fragrant	(regen) Maximum HP: +100, Maximum MP: +50, Damage Reduction: 25, MP Regen Min: 5, MP Regen Max: 10, HP Regen Min: 10, HP Regen Max: 20

string boxing_daycare_buff = define_property( "VMF.BoxingDaycareBuff", "string", "mysticality" );

// Boxing Daycare
// - scavenge equipment (free, 1, 2, 3 turns)
// - recruit toddlers (100 Meat)
// - spar (1 turn)

// Number of times to scavenge for equipment. 1st is free, so that's the default
int boxing_daycare_scavenge = define_property( "VMF.BoxingDaycareScavenge", "int", "1" ).to_int();

// Number of times to recruit toddlers. Cost increases geometrically: 100, 1000, 10,000, ...
int boxing_daycare_recruit = define_property( "VMF.BoxingDaycareRecruit", "int", "0" ).to_int();

// Sparring takes a turn. It gives you a small amount of stats. The first time also gives PVP fights.
// If you want fights, it is reasonable to spar once. Otherwise, don't spar
boolean boxing_daycare_spar = define_property( "VMF.BoxingDaycareSpar", "boolean", "false" ).to_boolean();

// *** Clan VIP Lounge *******

// Which Hatter buff to get from the Mad Tea Party
//
// Assaulted with Pepper		(4) Monster Level +20
// Three Days Slow			(6) Familiar Experience +3
// Cat-Alyzed				(7) Moxie +10
// Anytwo Five Elevenis?		(8) Muscle +10
// Coated Arms				(9) Weapon Damage +15
// Smoky Third Eye			(10) Mysticality +10
// Full Bottle in front of Me		(11) Spell Damage +30%
// Thick-Skinned			(12) Maximum HP +50
// 20-20 Second Sight			(13) Maximum MP +25
// Slimy Hands				(14) +10 Sleaze Damage
// Bottle in front of Me		(15) Spell Damage +15
// Fan-Cooled				(16 )+10 Cold Damage
// Ginger Snapped			(17) +10 Spooky Damage
// Egg on your Face			(18) +10 Stench Damage
// Pockets of Fire			(19) +10 Hot Damage
// Weapon of Mass Destruction		(20) Weapon Damage +30%
// Orchid Blood				(21) Regenerate 5-10 MP per Adventure
// Dances with Tweedles			(22) +40% Meat from Monsters
// Patched In				(23) Mysticality +20%
// You Can Really Taste the Dormouse	(24) +5 to Familiar Weight
// Turtle Titters			(25) +3 Stat Gains from Fights
// Cat Class, Cat Style			(26) Moxie +20%
// Surreally Buff			(27) Muscle +20%
// Quadrilled				(28) +20% Items from Monsters
// Coming Up Roses			(29) Regenerate 10-20 MP per Adventure
// Oleaginous Soles			(30) +40% Combat Initiative

effect hatter_buff = define_property( "VMF.HatterBuff", "effect", "Dances with Tweedles" ).to_effect();

// Which (lasts until rollover) item to get at the Clan Floundry
//
// carpe		Mysticality +50%, MP Regen 5-10, Meat Drop +50, Combat Rate: +10
// codpiece		Mysticality +100%, Maximum MP +100, Spell Damage +50, Combat Rate: -10
// troutsers		Moxie +50%, Pickpocket Chance +50, Prismatic Damage +11, Prismatic Resistance +5
// bass clarinet	Moxie +100%, Ranged Damage +50, Mana Cost -3, Combat Rate -10
// fish hatchet		Muscle +100%, Weapon Damage +50, Familiar Weight +5, Combat Rate: -10
// tunac		Muscle +50%, Monster Level +25, Item Drop +25, Combat Rate: +10

item floundry_item = define_property( "VMF.Floundry", "item", "" ).to_item();

// Which temperature to set the Clan Shower to:
//     cold (ice), cool (moxie), lukewarm (mysticality), warm (muscle), hot (mp)

string shower = define_property( "VMF.ShowerTemperature", "string", "ice" );

// Which pool table stance to take
//
// none			Don't use the pool table
// muscle		Billiards Belligerence (Weapon Damage +50%, Familiar Weight +5)
// mysticality		Mental A-cue-ity (Spell Damage +50%, MP Regen 10)
// moxie		Hustlin' (Initiative +50, Item Drop +10)

stat pool_table_stance = define_property( "VMF.PoolTableStance", "stat", "muscle" ).to_stat();

// Which fortune teller buff to request
//
// susie (familiar)		A Girl Named Sue (Familiar Weight: +5, Experience (familiar): +5, Familiar Damage: +10)
// hagnk (items)		There's No N in Love (Item Drop: +50, Food Drop: +50, Booze Drop: +50)
// meatsmith (meat)		Meet the Meat (Meat Drop: +100, Gear Drop: +50)
// gunther (muscle)		Gunther Than Thou (Experience (Muscle): +5, Muscle Percent: +100, Maximum HP Percent: +50)
// gorgonzola (mysticality)	Everybody Calls Him Gorgon (Experience (Mysticality): +5, Mysticality Percent: +100, Maximum MP Percent: +50)
// shifty (moxie)		They Call Him Shifty Because... (Experience (Moxie): +5, Moxie Percent: +100, Initiative: +50)
// none

string fortune_teller_npc = define_property( "VMF.FortuneTellerNPC", "string", "meat" );

// Go to Bonus Adventures From Hell and consult with CheeseFax
//
// You can get a "compatible" or an "incompatible" result for each attempt.
// 
// KoLmafia has settings to let you specify which words to use:
//
// clanFortuneWord1	default = pizza
// clanFortuneWord2	default = batman
// clanFortuneWord3	default = thick
//
// CheeseFax will always respond with "beer", "robin", and "thin"
// These are "compatible" responses to each word.
// If you want an "incompatible" prize, change the appropriate word

boolean consult_with_cheesefax = define_property( "VMF.ConsultWithCheeseFax", "boolean", "false" ).to_boolean();

// Which swimming pool effect to get
//
// none			Don't use the swimming pool
// Lapdog		Initiative +30, Stench Damage +25, Monster Level +20
// Silent Running	Combat Rate -5, targeted by fewer random PVP attacks

effect swimming_pool = define_property( "VMF.SwimmingPool", "effect", "" ).to_effect();

// *** closed-circuit pay phone ***

// If you want to perform daily tasks for Rufus every day -- up to 11 free combats and a reward -
// specify one or two commands to pass to Veracity's ShadowRift script.
//
// Try "ShadowRift help" to see your options.
//
// The script will maximize your equipment for item drop.
// You can specify additional required equipment or desired modifier
// parameters if you wish via a setting in the Shadow Rift script.
//
// You must set uo your CCS (via a consult script, perhaps) to handle
// any combats that you may encounter during your exploration.
//
// This script will invoke ShadowRift.ash up to three times:
//
// 1) ShadowRift check
// -> visits Rufus to see what he's looking for. ITEM <- the shadow items he wants
// 2) ShadowRift items ITEM waters onlyfree buy notallfree
// -> accepts the "items" quest and fulfills it using ITEM from inventory or the mall.
// -> You now have 11 turns of Shadow Affinity and 30 turns of Shadow Waters (Init/Meat/Items +100)
// 3) ShadowRift artifact ITEM forest onlyfree allfree
// -> Uses up 11 turns of Shadow Affinity.
// -> Possibly gain a shadow item from each free fight.
// -> Gains 2-3 of 3 different shadow items, including the one you spent.
//
// Net result: 10 free fights (stats/items/Meat), spent 3 items to gain 6-9 items, 30 turns of useful buff.
//
// Potential ways to customize:
//
// 1) No Shadow Rift automation? Set the two properties to "".
// 2) No buying items? Set the first property to "" and change ITEM in the second to "random" (or your choice of rift).
// 3) No items and get buff, not items? See 2, and also change "forest" to "waters".
// 4) Your CCS can reliably kill a shadow boss? Change "artifact" to "entity".

string shadow_rift_command1 = define_property( "VMF.ShadowRiftCommand1", "string", "items ITEM waters buy onlyfree notallfree" );
string shadow_rift_command2 = define_property( "VMF.ShadowRiftCommand2", "string", "artifact ITEM forest onlyfree allfree" );

// *** cosmic bowling ball ***

// Using the combat skill "Bowl Straight Up" removes the ball from
// inventory for a while but grants the effect "Cosmic Ball in the Air",
// which is Meat Drop +50% and Item Drop +25%.

// *** Deck of Every Card ****

// Which Deck of Every Card cards to cheat

string_list deck_cards = define_property( "VMF.DeckCards", "string", "Island|Ancestral Recall|1952 Mickey Mantle", "list" );

// *** Deluxe Fax Machine ****

// Which monster to fax in to a photocopied monster

monster fax_monster = define_property( "VMF.FaxMonster", "monster", "Knob Goblin Embezzler" ).to_monster();

// Items to use to make additional copies of faxed monster

boolean use_rain_doh = define_property( "VMF.UseRainDoh", "boolean", "true" ).to_boolean();
boolean use_spooky_putty = define_property( "VMF.UseSpookyPutty", "boolean", "true" ).to_boolean();

// Which familiar to equip while fighting a summoned (fax, deck, genie) monster
// If not specified, will use meat_familiar or item_familiar, depending on what you are farming

familiar copied_monster_familiar = define_property( "VMF.CopyFamiliar", "familiar", "" ).to_familiar();

// *** Genie Bottle *****

// Which wishes to request
//
// Default is to get pocket wishes, since you can alwyas use those to make a different wish

string_list genie_wishes = define_property( "VMF.GenieWishes", "string", "item pocket wish|item pocket wish|item pocket wish", "list" );

// *** Gingerbread City *****

// Although this script is for farming Meat, you (may) want to farm
// sprinkles also. If so, we will run up to a full day in The
// Gingerbread City, as configured by the Gingerbread City script

boolean use_gingerbread_city = define_property( "VMF.GingerbreadCity", "boolean", "false" ).to_boolean();

// *** Guzzlr tablet ********

// If you have made 36 or more Guzzler platinum deliveries, you've maxed
// out the MP regen from your tablet.  Accept a platinum delivery to get
// a Guzlr cocktail set. Abandon it.

boolean collect_guzzlr_cocktail_set = define_property( "VMF.GuzzlrCocktailSet", "boolean", "true" ).to_boolean();

// *** Machine Elf

// How to use the non-combat in the Deep Machine Tunnels
//
// abstractions			collection of random abstractions
// comprehension		abstraction: comprehension
// modern picture frame		item needed to make and publish abstract art
// ""				skip it

string dmt_choice = define_property( "VMF.DMTChoice", "string", "" );

// *** Manual of Numberology *

// Numberology goal to get
//
//     numberology 69 = 3 adventures
//     numberology 37 = 3 fites

int numberology_goal = define_property( "VMF.NumberologyGoal", "int", "69" ).to_int();

// *** mayfly bait necklace **

// With a mayfly bait necklace, you can summon 30 mayfly swarms per
// day. Once you are done, perhaps you'd reather equip a different
// accessry. Perhaps not; it does grant +10% Meat and Items.

item mayfly_bait_replacement = define_property( "VMF.MayflyReplacementAccessory", "item", "none" ).to_item();

// *** Mumming Trunk *********

// Costume to wear
//
// "none"				Don't wear a costume
//
// "muscle"				Saint Patrick - extra Muscle stats after combat
// "mysticality"			Oliver Cromwell - extra Mysticality stats after combat
// "moxie"				Miss Funny - extra Moxie stats after combat
// "mainstat"				(one of the above, based on your class's mainstat)
//
// "hp"					The Doctor - restore HP after combat
// "mp"					Beelzebub - restore mp after combat
// 
// "item" or "item drop"		Prince George - increase item drops
// "meat" or "meat drop"		The Captain - increase Meat Drops
//
// You can also use the costume name, if you wish

string mumming_costume = define_property( "VMF.MummingCostume", "string", "none" ).to_string();

// *** Pantsgiving **

// With Pantsgiving, you get an extra fullness after 5, 50, and 500
// combats.  Perhaps you'd like to earn 2 extra fullness and then switch
// pants. Perhaps not; Pantsgiving does grant +30% Meat and +15% Items.

item pantsgiving_replacement = define_property( "VMF.PantsgivingReplacement", "item", "none" ).to_item();

// *** Plastic Vampire Fangs *

// Whether to Vamp Out with plastic vampire fangs

boolean should_vamp_out = define_property( "VMF.VampOut", "boolean", "false" ).to_boolean();

// Where to Vamp Out in Seaside Town
//
// "Vlad"				30 turns of an effect
// "Isabella"				stats or meat
// "Masquerade"				item and optional effect
//
// Each Vamp Out costs a turn

string_set vamp_out_places = define_property( "VMF.VampOutPlaces", "string", "Vlad|Isabella|Masquerade", "set" );

// Vamping out at Vlad's takes a turn and provides thirty turns of one of three effects:
//
// Mistified				Damage Reduction 30
// Bat Attitude				Spell Damage +100%
// There Wolf				Weapon Damage +100%

effect vlad_reward = define_property( "VMF.VampOutAtVlad", "effect", "none" ).to_effect();

// Vamping out at Isabella's takes a turn and provides substats or a small amount of meat
//
// "mainstat"				(will choose based on your prime stat)
// "muscle"				4 * <mainstat> muscle, max 500
// "mysticality"			4 * <mainstat> mysticality, max 500
// "moxie" 				4 * <mainstat> moxie, max 500
// "meat"				111 Meat, lose 1-4 HP

string isabella_reward = define_property( "VMF.VampOutAtIsabella", "string", "mainstat" ).to_string();

// Vamping out at The Masquerade takes a turn and grants an item and (perhaps) an effect
//
// Interview With You (a Vampire)	Book that allows Vamping Out 
// your own black heart			Restore 100% HP/MP
// Sword of the Brouhaha Prince		Muscle +12% + 30 Prince of Seaside Town (all stats +100%)
// Sceptre of the Torremolinos Prince	Mysticality +12% + 30 Prince of Seaside Town (all stats +100%)
// Medallion of the Ventrilo Prince	Moxie +12% + 30 Prince of Seaside Town (all stats +100%)
// Chalice of the Malkovich Prince	All Stats +4% + 30 Prince of Seaside Town (all stats +100%)

item masquerade_reward = define_property( "VMF.VampOutAtMasquerade", "item", "your own black heart" ).to_item();

// *** Potted Tea Tree ***

// Which cuppa tea to shake

item desired_cuppa_tea = define_property( "VMF.CuppaTea", "item", "cuppa Royal tea" ).to_item();

// What to do with a cuppa Royal tea
//     use, mallsell, keep, or choose:
//
// if you don't have a Royal scepter, use
// else if you have a store in the mall, mallsell
// otherwise, keep

string royalty_choice = define_property( "VMF.RoyalTeaUsage", "string", "choose" );

// *** Robortender********

// There are several choices for what familiar item your Robortender should wear
//
// bartend			toggle switch (Bartend)
// bounce			toggle switch (Bounce)
// equipped			(whatever you manually equipped him with)
// default			(whatever your default familiar item is)

string robortender_item = define_property( "VMF.RobortenderEquipment", "string", "equipped" );

// You can feed your Robortender up to five drinks per day.  They are
// selected from the list of drinks made with ingedients the Robortender
// harvests itself when you fight various kids of creatures. Each
// ingredient can make a basic drink with a weak effect and a more
// powerful drink with a stronger effect of the same sort. The effects
// do not stack; if given both a weak and a strong drink of the same
// sort, only the strong effect counts.
//
// The following are the allowed drinks, the monster phylum that drops
// the raw ingredient, and the effect when fed to the Robortender
//
// literal grasshopper		(Bugs) +3 Muscle stats per combat
// eighth plague		(Bugs) +5 Muscle stats per combat
// double entendre		(Constellations) +0.5 Fairy
// single entendre		(Constellations) +1.0 Fairy
// Phlegethon		        (Demons) Hot Damage during combat
// reverse Tantalus		(Demons) Hot Damage during combat
// Siberian sunrise		(Elementals) Cold Damage during combat
// elemental caipiroska		(Elementals) Cold Damage during combat
// mentholated wine		(Elves) Grant random candy sometimes
// Feliz Navidad		(Elves) Grant random candy more often
// low tide martini		(Fish) Familiar can breathe underwater
// Bloody Nora		        (Fish) Familiar can breathe underwater w/ +10 Familiar Weight
// shroomtini		        (Goblins) +3 Moxie stats per combat
// moreltini		        (Goblins) +5 Moxe stats per combat
// morning dew                  (Hippies) MP Restore
// hell in a bucket		(Hippies) MP Restore
// whiskey squeeze		(Hobos) Grant item from Refusal sometimes
// Newark		        (Hobos) Grant item from Refusal more often
// great old fashioned		(Horrors) Spooky Damage during combat
// R'lyeh		        (Horrors) Spooky Damage during combat
// Gnomish sagngria		(Humanoids) Physical Damage during combat
// Gnollish sangria		(Humanoids) Physical Damage during combat
// vodka stinger		(Mer-kin) Stench Damage during combat
// vodka barracuda		(Mer-kin) Stench Damage during combat
// extremely slippery nipple	(Orcs) HP Restore
// Mysterious Island iced tea	(Orcs) HP Restore
// piscatini		        (Penguins) +0.5 Leprechaun
// drive-by shooting		(Penguins) +1.0 Leprechaun
// Churchill		        (Pirates) Sleaze Damage during combat
// gunner's daughter		(Pirates) Sleaze Damage during combat
// soilzerac		        (Plants) +3 Mysticality stats per combat
// dirt julep		        (Plants) +5 Mysticality stats per combat
// London frog		        (Slimes) Blocks like a potato
// Simepore slime		(Slimes) Blocks like a potato
// nothingtini		        (Weird) Delevel by weight/2 sometimes
// Phil Collins		        (Weird) Delevel by weight/2 always
//
// If the Robortender is your configured meat_familiar, you can specify
// up to five drinks from the above list, separated by "|", to feed it.
// (no duplicates, no more than one per phylum)

item_set robortender_drinks = define_property( "VMF.RoboDrinks", "item", "", "set" );

// *** Snojo *************

// Which mode to use for the X-32-F Combat Training Snowman
//
// none			Don't use free fights in the Snojo
// muscle		ancient medicinal herbs, training belt, training scroll:  Shattering Punch
// mysticality		ice rice, training legwarmers, training scroll:  Snokebomb
// moxie		iced plum wine, training helmet, training scroll:  Shivering Monkey Technique

stat snojo_mode = define_property( "VMF.SnojoMode", "stat", "moxie" ).to_stat();

// *** SongBoom&trade; Boombox ***

// Which song to play
//
// <keyword>		<Song Name>: <passive effect> / <Sing Along> / Item dropped every 11 combats
//
// spooky		Eye of the Giger: +<level> spooky damage / lose 5% max HP worth of HP & MP, gain 2-3 extra substats / Nightmare Fuel
// food			Food Vibrations: Food Drop +30, 3-5 MP regen / next spell deals more damage / Special Seasoning
// defense		Remainin' Alive: +<level> DR / delevel by 15% / Shielding Potion
// offense		Thse Fists Were Made for Punchin': +<level> Weapon Damage / deal <level> prismatic damage)/ Punching Potion
// meat			Total Eclipse of Your Meat: Meat Drop +30 / increase base meat drop by 25 / Gathered Meat-Clip
// none			Silence

string boombox_song = define_property( "VMF.BoomBoxSong", "string", "meat" ).to_string();
string_set boombox_sing_along_songs = define_property( "VMF.BoomBoxSingAlong", "string", "meat", "set" );

// *** Source Terminal *******

// Which Source Terminal enhancement to get
//
// critical.enh		Critical +10%, Spell Critical +10%
// damage.enh		Prismatic Damage +5
// init.enh		Initiative +50
// items.enh		Item Drop +30%
// meat.enh		Meat Drop +60%
// substats.enh		Experience +3

effect source_terminal_enhancement = define_property( "VMF.SourceTerminalEnhancement", "effect", "meat.enh" ).to_effect();

// Should we Extract Source essence in battle?

boolean should_extract = define_property( "VMF.SourceExtract", "boolean", "true" ).to_boolean();

// Which Source Terminal extrusions to create
//
// booze.ext		(10) hacked gibson - 4 fullness EPIC booze
// food.ext		(10) browser cookie - 4 fullness EPIC food
// goggles.ext		(100) Source shades - (non-tradable) accessory: Item Drop +10, improves Extract
// gram.ext		(100) Source terminal GRAM chip - (non-tradeable) Source Terminal upgrade (up to 10 usable)
// pram.ext		(100) Source terminal PRAM chip - (non-tradeable) Source Terminal upgrade (up to 10 usable)
// spam.ext		(100) Source terminal SPAM chip - (non-tradeable) Source Terminal upgrade (up to 10 usable)
// cram.ext		(1000) Source terminal CRAM chip - (non-tradeable) Source Terminal upgrade
// dram.ext		(1000) Source terminal DRAM chip - (non-tradeable) Source Terminal upgrade
// tram.ext		(1000) Source terminal TRAM chip - (non-tradeable) Source Terminal upgrade
// familiar.ext		(10000) software bug - familiar

string_list desired_extrusions = define_property( "VMF.SourceTerminalExtrusions", "string", "", "list" );

// ****** Spacegate **********

// If you want to explore a Spacegate planet every day, specify a
// command to be passed to the VeracitySpacegate script.
//
// Try "VeracitySpacegate help" to see your many options.
//
// Good choices for a daily run:
//
// random		Random coordinates; something new every day!
// random (A-L)		You can restrict the difficulty level if you wish
// ABCDEFG		(your choice of coordinates) If you are trying to "farm" a particular alien trophy
// procrastinator	(or space baby or space pirate) If you want to "farm" skill books
// animals		If you want to "farm" rare drops from anomalous animals
// plants		If you want to "farm" rare drops from anomalous plants
// animals, plants	If you want both anomalous animals and anomalous plants
//
// The script will maximize your equipment for item drop and include all
// required gear needed to mitigate environmental hazards. You can
// specify additional required equipment or desired modifier parameters
// if you wish via a setting in the VeracitySpacegate script.
//
// You must set uo your CCS (via a consult script, perhaps) to handle
// any combats that you may encounter during your exploration.

string spacegate_command = define_property( "VMF.SpacegateCommand", "string", "" );

// There are two strategies used both for picking an appropriate planet
// and make choice decisions.
//
// turns		maximize number of skippable choice adventures
// research		minimize combats, maximize rocks

string spacegate_strategy = define_property( "VMF.SpacegateStrategy", "string", "turns" );

// *** Sweet Synthesis *******

// Which Sweet Synthesis effect to use
//
// Each usage of the skill consumes two candies and one spleen and
// provides thirty turns of an effect.
//
// Tier 1: simple + simple
//
// Synthesis: Hot		Hot Resistance: +9
// Synthesis: Cold		Cold Resistance: +9
// Synthesis: Pungent		Stench Resistance: +9
// Synthesis: Scary		Spooky Resistance: +9
// Synthesis: Greasy		Sleaze Resistance: +9
// 
// Tier 2: simple + complex
//
// Synthesis: Strong		Muscle Percent: +300
// Synthesis: Smart		Mysticality Percent: +300
// Synthesis: Cool		Moxie Percent: +300
// Synthesis: Hardy		Maximum HP Percent: +300
// Synthesis: Energy		Maximum MP Percent: +300
//
// Tier 3: complex + complex
//
// Synthesis: Collection	Item Drop: +150
// Synthesis: Greed		Meat Drop: +300
// Synthesis: Learning		Experience Percent (Mysticality): +50
// Synthesis: Movement		Experience Percent (Muscle): +50
// Synthesis: Style		Experience Percent (Moxie): +50

effect synthesis_target = define_property( "VMF.SynthesisEffect", "effect", "Synthesis: Greed" ).to_effect();

// When selecting candies, is available amount more important than mall price?

boolean synthesis_prefers_available = define_property( "VMF.SynthesisPrefersAvailable", "boolean", "false" ).to_boolean();

// Should we always do one Item Drop synthesis so that it is in effect for free fights?

boolean synthesize_item_drop_for_free_fights = define_property( "VMF.SynthesizeItemDropForFreeFights", "boolean", "true" ).to_boolean();

// *** That 70s Volcano *****

// What to do in the Towering Inferno Discotheque:
//
// (1 velvet)	+100 all stats
// (2 velvet)	+100% Item Drops
// (3 velvet)	Travoltron
// (4 velvet)	-1 drunk
// (5 velvet)	5 turns
// (6 velvet)	Volcoino

int disco_goal = define_property( "VMF.DiscoGoal", "int", "5" ).to_int();

// *** The Glaciest ***

// VYKEA Companion to create.
//
// level X couch			physical, X * 10% Meat Drop
// level X lamp				hot, X * 10% Item Drop
// level X bookshelf			spooky
// level X ceiling fan			cold
// level X dishrack			stench
// level X dresser			sleaze
//
// The Meat or Item drop improvment will be useful, but the physical or
// elemental attack will shorten the time for Hobo Monkey stasis

vykea desired_vykea_companion = define_property( "VMF.VYKEACompanion", "vykea", "none" ).to_vykea();

// *** Time-Spinner ******

// Which Far Future item to acquire using the Time Spinner
//
// This takes 2 minutes, leaving 8 minutes for recalling food and time pranks
// If you set this to none, we can recall an additional food
//
// Riker's Search History	combat item: 900-1000 sleaze damage
// Shot of Kardashian Gin	EPIC 1 drunk booze, +3 PVP fights
// Unstable Pointy Ears		accessory disappears at rollover, +3 stats
// Memory Disk, Alpha		usable, allows access to The Far Future
// Tea, Earl Grey, Hot		EPIC 1 full food, 1000 MP and 1000 HP

item far_future_item = define_property( "VMF.FarFutureItem", "item", "none" ).to_item();

// *** Tome of Clip Art **

// Which Clip Art to create. You can specify up to three items,
// separated by "|". If you specify less than three or any item is
// "none", the (currently) most expensive item from the mall will be
// created for the unspecified item(s).

item_list clip_art = define_property( "VMF.ClipArt", "item", "", "list" );

// *** Tunnel of L.O.V.E. ***

// Whether to take a trip through the Tunnel of L.O.V.E.

boolean use_tunnel_of_love = define_property( "VMF.TunnelOfLOVE", "boolean", "true" ).to_boolean();

// Which monsters to fight.
//
// We will fight them using your CCS directly (no combat filter).
// Your CCS must be set up to do the right thing, if you want the rewards.
//
// LOV Enforcer		defeat using normal attacks to (maybe) get LOV Elixir #3
// LOV Engineer		defeat using spells to (maybe) get LOV Elixir #6
// LOV Equivocator	pickpocket to (maybe) get LOV Elixir #9
//
// LOV Elixir #3	(40 The Power of LOV) Muscle +40, Weapon Damage +50%, Critical Hit +15%
// LOV Elixir #6	(40 The Magic of LOV) Mysticality +25, Spell Damage +100%, Spell Critical Hit +15%
// LOV Elixir #9	(40 The Moxie of LOV) Moxie +25, Ranged Damage +50%, Initiative +50%

monster_set lov_enemies = define_property( "VMF.LOVEnemies", "monster", "LOV Enforcer|LOV Engineer|LOV Equivocator", "set" );

// Which piece of (lasts until rollover) equipment to collect.
//
// LOV Eardigan		shirt: Muscle Experience +25%, HP Regen 8-12, Monster Level: +25
// LOV Epaulettes	back item: Mysticality Experience +25%, MP Regen 4-6, Mana Cost (in combat) -3
// LOV Earrings		accessory: Moxie Experience +25%, Prismatic Resistance +3, Meat Drop +50

item lov_equipment = define_property( "VMF.LOVEquipment", "item", "none" ).to_item();

// Which (50 turns) effect to collect.
//
// Lovebotamy		 Experience: +10
// Open Heart Surgery	 Familiar Weight: +10
// Wandering Eye Surgery Item Drop: +50

effect lov_effect = define_property( "VMF.LOVEffect", "effect", "Wandering Eye Surgery" ).to_effect();

// Which gift item to collect.
//
// LOV Enamorang			combat item: copy appears 15 turns later
// LOV Emotionizer			curse item: 3 turns of a chat effect
// LOV Extraterrestrial Chocolate	chocolate: 3/2/1 adventures
// LOV Echinacea Bouquet		spleen item: stats, HP, MP
// LOV Elephant				offhand item: Damage Reduction 10
// toast				(if you own a Space Jellyfish) 2 pieces

item lov_endowment = define_property( "VMF.LOVEndowment", "item", "LOV Extraterrestrial Chocolate" ).to_item();

// *** Horsery Contract

// Which horse to rent.
//
// none					don't get a horse
// normal				initiative +10, HP/MP restore after fights
// dark					combat -5, +Meat after fights
// crazy				+/- 20% Muscle, +/- 20% Mysticality, +/- 20% Moxie, random stuff after fights
// pale					Slight Resistance to All Elements (+1), spooky damage during fights

string horsery_horse = define_property( "VMF.HorseryHorse", "string", "none" );

// *** Voting Booth ******

// If you have a "I Voted!" sticker, you voted today and might want to fight the wandering vote monsters.
//
// never		Never fight a vote monsetr
// free			Fight the first three monsters, which are free
// monsters		Fight the first free monsters and continue for listed monsters
// always		Fight every monster

string fight_voters = define_property( "VMF.FightVoteMonsters", "string", "free" );
monster_set vote_monsters = define_property( "VMF.WorthyVoteMonsters", "monster", "annoyed snake|angry ghost|government bureaucrat|slime blob|terrible mutant", "set" );

// *** Witchess Set ******

// Which Witchess monsters to fight. You can list up to five monsters,
// separated by "|". If you list none, no Witchess monsters will be
// fought. If you list fewer than five, the last one listed will be used
// for the remainder of your fights.
//
// Witchess Pawn	armored prawn: EPIC 1 toxicity spleen: 50 Initiative +50
// Witchess Knight	jumping horseradish: EPIC 1 full food: 50 Meat Drop +100
// Witchess Bishop	Sacramento wine: EPIC 1 drunk booze: 50 Item Drop +50
// Witchess Rook	Greek fire: potion: 25 Monster Level +25
// Witchess Ox		ox-head shield: offhand disappears at rollover, +8 PVP fights, etc
// Witchess King	dented scepter: 1h weapon disappears at rollover, +5 MUS stats, etc
// Witchess Witch	very pointy crown: hat disappears at rollover, +5 MOX stats, +5 advs, etc
// Witchess Queen	battle broom: accessory disappears at rollover, +5 MYS stats, etc

monster_list witchess_fights = define_property( "VMF.WitchessMonsters", "monster", "Witchess Knight", "list" );

// *** Workshed Items ****

// You can replace an item in your workshed once per day. Therefore you can benefit from two such
// items per day: the one you start with and the one you switch to. You can configure two items and
// we will cycle through them:
//
// Day 1: start with item 1
//        do stuff with it
//        switch to item 2
//        do stuff with it
// Day 2: start with item 2
//        do stuff with it
//        switch to item 1
//        do stuff with it
//
// What, exactly we "do" with each item, and when we "switch" depends on which two items we use.
//
// We know how to use the following workshed items:
//
//        model train set	~1,600 Meat every 8 turns (200 mpa)
//				This should be installed before running fights
//        spinning wheel 	level cubed (max 30 = 27,000) Meat once per day (<75 mpa)
//				This should be used immediately whenever it is in the workshed
//				It should be installed after turns have been run, since gaining
//				levels (until Level 30) will improve its yield
//        portable Mayo Clinic	Mayoflex = +1 adventure per food (10? extra turns)
//				This should be used for all eating before switching to a different
//				item. That implies it is usable only when you can have it in your
//				workshed before you eat: every other day with a model train set or
//				every day with a spinning wheel.
//
// Depending on your diet, fullness capacity, and expected MPA, Mayo Clinic is likely the weakest.
// I recommend the model train set and spinning wheel, but you may not have both of those.
// You may not have more than one workshed item - or even one.
//
// Therefore, the default configuration lists three items, and we will use the first two we find.
// If you have none (or only one), we will not swap workshed items.

item_list workshed_cycle = define_property( "VMF.WorkshedCycle", "item", "model train set|spinning wheel|portable Mayo Clinic", "list" );

// Use saved outfits rather than maximizer, since I am willing to give
// up Meat Drop in order to get special item drops from:
//
//    KoL Con 13 snowglobe
//    Pantsgiving
//    Camp Scout backpack
//    mayfly bait necklace
//    Mr. Cheeng's spectacles
//    Mr. Screege's spectacles

string barf_outfit = define_property( "VMF.BarfMountainOutfit", "string", "Barf Mountain" );
string icy_peak_outfit = define_property( "VMF.IcyPeakOutfit", "string", "Icy Peak" );
string dmt_outfit = define_property( "VMF.DMTOutfit", "string", "Deep Machine Tunnels" );
string lov_ensemble = define_property( "VMF.LOVEnsemble", "string", "Tunnel of LOVE" );
string nep_outfit = define_property( "VMF.NEPOutfit", "string", "Neverending Party" );
string velvet_outfit = define_property( "VMF.VelvetOutfit", "string", "Velvet" );
string farm_outfit = define_property( "VMF.DefaultOutfit", "string", "Meat Drop" );
string item_outfit = define_property( "VMF.ItemDropOutfit", "string", "Item Drop" );

// Cumulative records. Not configurable.

static string MEAT_SETTING = "VMF.TotalMeat";
static string TURN_SETTING = "VMF.TotalTurns";

// ***************************
// *   External Scripts      *
// ***************************

// Some scripts can be installed either via SVN or GIT.
// We don't care; we'll find it either way.

// *** Arrrbor Day ***********
static string_list arrrbor_day_scripts = {
    "veracity0-arrrbor-day"
};

// *** Beach Comb ************
static string_list [string] beach_comb_scripts = {
    "BeachComber" : {
	"veracity0-beach"
    },
    "combo" : {
	"Loathing-Associates-Scripting-Society-combo-release",
	"Loathing-Associates-Scripting-Society-combo-branches-release"
    }
};

// *** Garden Harvester ******
static string_list garden_harvester_scripts = {
    "veracity0-garden"
};

// *** Gingerbread City*******
static string_list gingerbread_scripts = {
    "veracity0-gingerbread"
};

// *** Shadow Rift ***********
static string_list shadow_rift_scripts = {
    "veracity0-shadow-rift"
};

// *** Spacegate  ************
static string_list spacegate_scripts = {
    "veracity0-spacegate"
};

// Ezandora's scripts

static string_list ezandora_far_future = {
    "Ezandora-Far-Future-branches-Release"
};

static string_list ezandora_bastille = {
    "Ezandora-Bastille-branches-Release"
};

static string_list ezandora_detective_solver = {
    "Ezandora-Detective-Solver-branches-Release"
};

boolean check_installed( string... scripts )
{
    foreach i, script in scripts {
	if ( git_exists( script ) || svn_exists( script ) ) {
	    return true;
	}
    }
    return false;
}

// ***************************
// *      Validation         *
// ***************************

static string_set farm_options = $strings[
    meat,
    items
];

static string_set friars_blessing_settings = $strings[
    none,
    food,
    booze,
    familiar
];

// *** Breakfast Counter **

static item_set valid_muffins = $items[ 
    blueberry muffin,
    bran muffin,
    chocolate chip muffin,
];

// *** Semirare Hunting ***

// Semirare hunting is dead. R.I.P.

// Keeping this for history.  Perhaps this script will eventually do
// something with the Lucky! effect and this will have some use?

static location_set known_semirare_locations = $locations[
    // *** Seaside Town
    The Copperhead Club,		// Flamin' Whatshisname (3)	
    The Haunted Billiards Room,		// +1-10 Pool Skill OR (combat - hustled spectre) cube of billiard chalk
    The Haunted Boiler Room,		// Bram's choker
    The Haunted Kitchen,		// freezerburned ice cube
    The Haunted Library,		// black eyedrops
    The Haunted Pantry,			// tasty tart (3)	
    The Haunted Storage Room,		// One of your equipped PvPable items
    The Sleazy Back Alley,		// distilled fortified wine (3)	
    // *** The Big Mountains
    The Goatlet,			// can of spinach
    Itznotyerzitz Mine,			// (combat - 7-Foot Dwarf Foreman) Mining Gear
    Lair of the Ninja Snowmen,		// bottle of antifreeze
    The Limerick Dungeon,		// cyclops eyedrops
    The Valley of Rof L'm Fao,		// (combat - Bad ASCII Art) ASCII shirt, 30669, 33398, and 2 334 scrolls	
    A-boo Peak,				// death blossom	
    Twin Peak,				// miniature boiler (before lighting peak)
    Oil Peak,				// unnatural gas	
    A Mob of Zeppelin Protesters,	// (Choice Adventure) pick non-combat to scare away protesters
    The Red Zeppelin,			// (The Red Fox - combat) red foxglove, Red Fox glove (rarely)
    // *** The Nearby Plains
    Battlefield (No Uniform),		// six-pack of New Cloaca-Cola
    Battlefield (Cloaca Uniform),	// six-pack of New Cloaca-Cola
    Battlefield (Dyspepsi Uniform),	// six-pack of New Cloaca-Cola
    The Batrat and Ratbat Burrow,	// Dogsgotnonoz pills
    The Castle in the Clouds in the Sky (Basement),	// Super Weight-Gain 9000
    The Castle in the Clouds in the Sky (Ground Floor),	// possibility potion
    The Castle in the Clouds in the Sky (Top Floor),	// Mick's IcyVapoHotness Inhaler
    Guano Junction,			// Eau de Guaneau
    Cobb's Knob Harem,			// scented massage oil (3)
    Cobb's Knob Barracks,		// (combat- Knob Goblin Elite Guard Captain) Knob Goblin Elite Guard Uniform
    Cobb's Knob Kitchens,		// (combat- Knob Goblin Elite Guard Captain) Knob Goblin Elite Guard Uniform
    Cobb's Knob Laboratory,		// bottle of Mystic Shell
    Cobb's Knob Menagerie\, Level 2,	// irradiated pet snacks
    The Unquiet Garves,			// poltergeist-in-the-jar-o
    The VERY Unquiet Garves,		// poltergeist-in-the-jar-o
    The Outskirts of Cobb's Knob,	// Knob Goblin lunchbox	
    Cobb's Knob Treasury,		// (combat - Knob Goblin Embezzler) meat stack (0-4), Knob Goblin visor (0-1), and 400-600 meat	
    // Desert Beach
    South of The Border,		// donkey flipbook
    // The Distant Woods
    Ye Olde Medievale Villagee,		//3 piles of straw, 3 lumps of clay, 3 piles of leather
    The Dark Elbow of the Woods,	// SPF 451 lip balm
    The Dark Heart of the Woods,	// SPF 451 lip balm
    The Dark Neck of the Woods,		// SPF 451 lip balm
    Pandamonium Slums,			// SPF 451 lip balm
    The Hidden Park,			// shrinking powder
    The Hidden Temple,			// (combat - Baa'baa'bu'ran) stone wool (1-3)
    The Fungus Plains,			// fire flower
    The Spooky Forest,			// fake blood
    Whitey's Grove,			// bag of lard
    // The Mysterious Island of Mystery
    Hippy Camp,				// teeny-tiny magic scroll
    Frat House,				// bottle of rhinoceros hormones
    The Obligatory Pirate's Cove,	// bottle of pirate juice
    // Hobopolis
    A Maze of Sewer Tunnels,		// (combat - C. H. U. M. chieftain) Filthy Crown (Clan Trophy)
    Burnbarrel Blvd.,			// jar of squeeze (5 hobo nickels)
    Exposure Esplanade,			// bowl of fishysoisse (5 hobo nickels)
    The Heap,				// concentrated garbage juice (5 hobo nickels)
    The Ancient Hobo Burial Ground,	// deadly lampshade (5 hobo nickels)
    The Purple Light District,		// lewd playing card (5 hobo nickels)
    // The Sea
    The Briny Deeps,			// 1-3 filets of beefy fish meat, filets of glistening fish meat, filets of slick fish meat	
    The Brinier Deepers,		// 50 turns of Fishy
    An Octopus's Garden,		// (combat - moister oyster) giant pearl	
    The Wreck of the Edgar Fitzsimmons,	// long-forgotten necklace	
    The Dive Bar,			// shavin' razor
    Madness Reef,			// 20 turns of Eyes of the Dragon
    The Mer-Kin Outpost,		// 15-20 sand dollars
    // Map to Vanya's Castle
    Vanya's Castle Chapel,		// pixel stopwatch
    // KoL High School
    Art Class,				// (combat - François Verte, Art Teacher) twisted piece of wire, angry inch, eraser nubbin, lump of clay
    Chemistry Class,			// (combat - Mrs. K, the Chemistry Teacher) chlorine crystal, ph balancer, mysterious chemical residue, nugget of sodium
    Shop Class,				// (combat - X-fingered Shop Teacher) jigsaw blade, wood screw, balsa plank, blob of wood glue	
    The Hallowed Halls,			// folder (KOLHS)
];

// *** Constants for Holidays ***

// *** Dependence Day ***

static item_set valid_fireworks = $items[
    M-242,
    snake,
    sparkler,
    green rocket,
];

// *** Constants for IOTMs ***

// *** Bastille Battalion ***

static string_set valid_battalion_stats = $strings[
    muscle,
    mysticality,
    moxie,
    mainstat,
];

static item BRUTAL_BROGUES = $item[ Brutal brogues ];
static item DRAFTSMANS_DRIVING_GLOVES = $item[ Draftsman's driving gloves ];
static item NOUVEAU_NOSERING = $item[ Nouveau nosering ];

static item_set valid_battalion_accessories = $items[
    Brutal brogues,
    Draftsman's driving gloves,
    Nouveau nosering,
];

static effect BASTILLE_BUDGETEER = $effect[ Bastille Budgeteer ];
static effect BASTILLE_BOURGEOISIE = $effect[ Bastille Bourgeoisie ];
static effect BASTILLE_BRAGGADOCIO = $effect[ Bastille Braggadocio ];

static effect_set valid_battalion_effects = $effects[
    Bastille Budgeteer,
    Bastille Bourgeoisie,
    Bastille Braggadocio,
];

static item SHARKFIN_GUMBO = $item[ sharkfin gumbo ];
static item BOILING_BROTH = $item[ boiling broth ];
static item INTERROGATIVE_ELIXIR = $item[ interrogative elixir ];

static item_list BATTALION_POTIONS = {
     0: SHARKFIN_GUMBO,
     1: BOILING_BROTH,
     2: INTERROGATIVE_ELIXIR,
};

static string_set valid_battalion_potions = $strings[
    sharkfin gumbo,
    boiling broth,
    interrogative elixir,
    random,
    rarest,
];

// *** Boxing Daycare ********

static int [string] boxing_buff_to_option = {
    "Muddled" : 1,
    "muscle" : 1,
    "Ten out of Ten" : 2,
    "moxie" : 2,
    "Uncucumbered" : 3,
    "mysticality" : 3,
    "Flagrantly Fragrant" : 4,
    "regen" : 4,
};    

// *** Clan Looking Glass

static item DRINK_ME_POTION = $item[ &quot;DRINK ME&quot; potion ];

static int [effect] hatter_effects = {
    $effect[Assaulted with Pepper] : 4,
    $effect[Three Days Slow] : 6,
    $effect[Cat-Alyzed] : 7,
    $effect[Anytwo Five Elevenis?] : 8,
    $effect[Coated Arms] : 9,
    $effect[Smoky Third Eye] : 10,
    $effect[Full Bottle in front of Me] : 11,
    $effect[Thick-Skinned] : 12,
    $effect[20-20 Second Sight] : 13,
    $effect[Slimy Hands] : 14,
    $effect[Bottle in front of Me] : 15,
    $effect[Fan-Cooled] : 16 ,
    $effect[Ginger Snapped] : 17,
    $effect[Egg on your Face] : 18,
    $effect[Pockets of Fire] : 19,
    $effect[Weapon of Mass Destruction] : 20,
    $effect[Orchid Blood] : 21,
    $effect[Dances with Tweedles] : 22,
    $effect[Patched In] : 23,
    $effect[You Can Really Taste the Dormouse] : 24,
    $effect[Turtle Titters] : 25,
    $effect[Cat Class, Cat Style] : 26,
    $effect[Surreally Buff] : 27,
    $effect[Quadrilled] : 28,
    $effect[Coming Up Roses] : 29,
    $effect[Oleaginous Soles] : 30
};

// *** Clan Floundry

static item_set floundry_items = $items[
    carpe,
    codpiece,
    troutsers,
    bass clarinet,
    fish hatchet,
    tunac
];

// *** Clan Fortune Teller

static string[string] fortune_teller_npcs = {
    "susie" : "familiar",
    "familiar" : "familiar",
    "hagnk" : "items",
    "items" : "items",
    "meatsmith" : "meat",
    "meat" : "meat",
    "gunther" : "muscle",
    "muscle" : "muscle",
    "gorgonzola" : "mysticality",
    "mysticality" : "mysticality",
    "shifty" : "moxie",
    "moxie" : "moxie",
};

static string NO_NPC = "none";

// *** Clan Shower

static string_set shower_settings = $strings[
    cold, ice,
    cool, moxie,
    lukewarm, mysticality,
    warm, muscle,
    hot, mp
];

// *** Clan Swimming Pool

static effect LAPDOG = $effect[ Lapdog ];
static effect SILENT_RUNNING = $effect[ Silent Running ];

static effect_set swimming_pool_effects = $effects[
    Lapdog,
    Silent Running
];

// *** Machine Elf

static effect ACTION = $effect[ Action ];
static effect SENSATION = $effect[ Sensation ];
static effect THOUGHT = $effect[ Thought ];

static item ABSTRACTION_ACTION = $item[ abstraction: action ];
static item ABSTRACTION_SENSATION = $item[ abstraction: sensation ];
static item ABSTRACTION_THOUGHT = $item[ abstraction: thought ];

static string_set dmt_choices = $strings[
    abstractions,
    comprehension,
    modern picture frame
];

// *** Mumming Trunk

static string [ string ] possible_mumming_costumes = {
    "muscle" : "muscle",
    "mus" : "muscle",

    "mysticality" : "mysticality",
    "myst" : "mysticality",

    "moxie" : "moxie",
    "mox" : "moxie",

    "hp" : "hp",

    "mp" : "mp",

    "item" : "item",
    "item drop" : "item",

    "meat" : "meat",
    "meat drop" : "meat",

    "saint patrick" : "muscle",
    "oliver cromwell" : "mysticality",
    "miss funny" : "moxie",
    "the doctor" : "hp",
    "beelzebub" : "mp",
    "prince george" : "item",
    "the captain" : "meat",
};

static int [ string ] mummery_costume_options = {
    "meat" : 1,
    "mp" : 2,
    "mus" : 3,
    "item" : 4,
    "mys" : 5,
    "hp" : 6,
    "mox" : 7,
};

// *** Plastic Vampire Fangs

// Vamp Out Places

static string_set valid_vamp_out_places = $strings[
    Vlad,
    Isabella,
    Masquerade
];

// Vamping Out at Vlad's

static effect MISTIFIED = $effect[ Mistified ];
static effect BAT_ATTITUDE = $effect[ Bat Attitude ];
static effect THERE_WOLF = $effect[ There Wolf ];

static effect_set possible_vlad_rewards = $effects[
    Mistified,
    Bat Attitude,
    There Wolf
];

// Vamping Out at Isabella's

static string_set possible_isabella_rewards = $strings[
    mainstat,
    muscle,
    mysticality,
    moxie,
    meat
];

// Vamping Out at The Masquerade

static item INTERVIEW_WITH_YOU = $item[ Interview With You (a Vampire) ];
static item YOUR_OWN_BLACK_HEART = $item[ your own black heart ];
static item BROUHAHA_PRINCE = $item[ Sword of the Brouhaha Prince ];
static item TORREMOLINOS_PRINCE = $item[ Sceptre of the Torremolinos Prince ];
static item VENTRILO_PRINCE = $item[ Medallion of the Ventrilo Prince ];
static item MALKOVICH_PRINCE = $item[ Chalice of the Malkovich Prince ];

static item_set possible_masquerade_rewards = $items[
    Interview With You (a Vampire),
    your own black heart,
    Sword of the Brouhaha Prince,
    Sceptre of the Torremolinos Prince,
    Medallion of the Ventrilo Prince,
    Chalice of the Malkovich Prince
];

// *** Potted Tea Tree

// Items you can shake from the Tea Tree
static item_set CUPPSA_TEA = $items[
     cuppa Activi tea,
     cuppa Alacri tea,
     cuppa Boo tea,
     cuppa Chari tea,
     cuppa Craft tea,
     cuppa Cruel tea,
     cuppa Dexteri tea,
     cuppa Feroci tea,
     cuppa Flamibili tea,
     cuppa Flexibili tea,
     cuppa Frost tea,
     cuppa Gill tea,
     cuppa Impregnabili tea,
     cuppa Improprie tea,
     cuppa Insani tea,
     cuppa Irritabili tea,
     cuppa Loyal tea,
     cuppa Mana tea,
     cuppa Mediocri tea,
     cuppa Monstrosi tea,
     cuppa Morbidi tea,
     cuppa Nas tea,
     cuppa Net tea,
     cuppa Neuroplastici tea,
     cuppa Obscuri tea,
     cuppa Physicali tea,
     cuppa Proprie tea,
     cuppa Royal tea,
     cuppa Serendipi tea,
     cuppa Sobrie tea,
     cuppa Toast tea,
     cuppa Twen tea,
     cuppa Uncertain tea,
     cuppa Vitali tea,
     cuppa Voraci tea,
     cuppa Wit tea,
     cuppa Yet tea
];

static string_set valid_royalty_actions = $strings[
     use,
     mallsell,
     keep,
     choose
];

// *** Robortender

static string_set possible_robortender_items = $strings[
    bartend,
    bounce,
    equipped,
    default
];

record robodrink
{
    phylum source;		// Phylum of the monster that drops ingredient
    boolean strong;		// weak vs. strong effect
    string desc;		// description of effect
};

static robodrink [item] robodrinks = {
    $item[ literal grasshopper ] : new robodrink( $phylum[ bug ], false, "+3 Muscle stats per combat" ),
    $item[ eighth plague ] : new robodrink( $phylum[ bug ], true, "+5 Muscle stats per combat" ),
    $item[ double entendre ] : new robodrink( $phylum[ constellation ], false, "+0.5 Fairy" ),
    $item[ single entendre ] : new robodrink( $phylum[ constellation ], true, "+1.0 Fairy" ),
    $item[ Phlegethon ] : new robodrink( $phylum[ demon ], false, "Hot Damage during combat" ),
    $item[ reverse Tantalus ] : new robodrink( $phylum[ demon ], true, "Hot Damage during combat" ),
    $item[ Siberian sunrise ] : new robodrink( $phylum[ elemental ], false, "Cold Damage during combat" ),
    $item[ elemental caipiroska ] : new robodrink( $phylum[ elemental ], true, "Cold Damage during combat" ),
    $item[ mentholated wine ] : new robodrink( $phylum[ elf ], false, "Grant random candy sometimes" ),
    $item[ Feliz Navidad ] : new robodrink( $phylum[ elf ], true, "Grant random candy more often" ),
    $item[ low tide martini ] : new robodrink( $phylum[ fish ], false, "Familiar can breathe underwater" ),
    $item[ Bloody Nora ] : new robodrink( $phylum[ fish ], true, "Familiar can breathe underwater w/ +10 Familiar Weight" ),
    $item[ shroomtini ] : new robodrink( $phylum[ goblin ], false, "+3 Moxie stats per combat" ),
    $item[ moreltini ] : new robodrink( $phylum[ goblin ], true, "+5 Moxe stats per combat" ),
    $item[ morning dew ] : new robodrink( $phylum[ hippy ], false, "MP Restore" ),
    $item[ hell in a bucket ] : new robodrink( $phylum[ hippy ], true, "MP Restore" ),
    $item[ whiskey squeeze ] : new robodrink( $phylum[ hobo ], false, "Grant item from Refusal sometimes" ),
    $item[ Newark ] : new robodrink( $phylum[ hobo ], true, "Grant item from Refusal more often" ),
    $item[ great old fashioned ] : new robodrink( $phylum[ horror ], false, "Spooky Damage during combat" ),
    $item[ R'lyeh ] : new robodrink( $phylum[ horror ], true, "Spooky Damage during combat" ),
    $item[ Gnomish sagngria ] : new robodrink( $phylum[ humanoid ], false, "Physical Damage during combat" ),
    $item[ Gnollish sangria ] : new robodrink( $phylum[ humanoid ], true, "Physical Damage during combat" ),
    $item[ vodka stinger ] : new robodrink( $phylum[ mer-kin ], false, "Stench Damage during combat" ),
    $item[ vodka barracuda ] : new robodrink( $phylum[ mer-kin ], true, "Stench Damage during combat" ),
    $item[ extremely slippery nipple ] : new robodrink( $phylum[ orc ], false, "HP Restore" ),
    $item[ Mysterious Island iced tea ] : new robodrink( $phylum[ orc ], true, "HP Restore" ),
    $item[ piscatini ] : new robodrink( $phylum[ penguin ], false, "+0.5 Leprechaun" ),
    $item[ drive-by shooting ] : new robodrink( $phylum[ penguin ], true, "+1.0 Leprechaun" ),
    $item[ Churchill ] : new robodrink( $phylum[ pirate ], false, "Sleaze Damage during combat" ),
    $item[ gunner's daughter ] : new robodrink( $phylum[ pirate ], true, "Sleaze Damage during combat" ),
    $item[ soilzerac ] : new robodrink( $phylum[ plant ], false, "+3 Mysticality stats per combat" ),
    $item[ dirt julep ] : new robodrink( $phylum[ plant ], true, "+5 Mysticality stats per combat" ),
    $item[ London frog ] : new robodrink( $phylum[ slime ], false, "Blocks like a potato" ),
    $item[ Simepore slime ] : new robodrink( $phylum[ slime ], true, "Blocks like a potato" ),
    $item[ nothingtini ] : new robodrink( $phylum[ weird ], false, "Delevel by weight/2 sometimes" ),
    $item[ Phil Collins ] : new robodrink( $phylum[ weird ], true, "Delevel by weight/2 always" )
};

static item [phylum] strong_robodrinks;

static
{
    foreach it, data in robodrinks {
	if ( data.strong ) {
	    strong_robodrinks[ data.source ] = it;
	}
    }
}

// *** SongBoom&trade; BoomBox ***

static string [string] boombox_keyword_to_song = {
    "spooky" : "Eye of the Giger",
    "food" : "Food Vibrations",
    "defense" : "Remainin' Alive",
    "offense" : "These Fists Were Made for Punchin'",
    "meat" : "Total Eclipse of Your Meat",
    "none" : ""
};

static string [string] boombox_song_to_keyword = {
    "Eye of the Giger" : "spooky",
    "Food Vibrations" : "food",
    "Remainin' Alive" : "defense",
    "These Fists Were Made for Punchin'" : "offense",
    "Total Eclipse of Your Meat" : "meat",
    "" : "none"
};

static string [string] boombox_song_to_cli_option = {
    "Eye of the Giger" : "giger",
    "Food Vibrations" : "food",
    "Remainin' Alive" : "alive",
    "These Fists Were Made for Punchin'" : "fists",
    "Total Eclipse of Your Meat" : "meat",
    "" : "silent"
};

// *** Source Terminal

static item SOURCE_ESSENCE = $item[ Source essence ];

// Source Terminal Enhancements

static effect_set valid_enhancements = $effects[
    critical.enh,
    damage.enh,
    init.enh,
    items.enh,
    meat.enh,
    substats.enh
];

// Source Terminal Extrusions

record extrusion {
    item result;	// The item you extrude
    int cost;		// How much Source Essence it costs
    int max;		// How many you can install
    string property;	// Property that tracks this item
};

static extrusion [string] valid_extrusions = {
    "booze.ext" : new extrusion( $item[ hacked gibson ], 10 ),
    "food.ext" : new extrusion( $item[ browser cookie ], 10 ),
    "goggles.ext" : new extrusion( $item[ Source shades ], 100 ),
    "gram.ext" : new extrusion( $item[ Source terminal GRAM chip ], 100, 10, "sourceTerminalGram" ),
    "pram.ext" : new extrusion( $item[ Source terminal PRAM chip ], 100, 10, "sourceTerminalPram" ),
    "spam.ext" : new extrusion( $item[ Source terminal SPAM chip ], 100, 10, "sourceTerminalSpam" ),
    "cram.ext" : new extrusion( $item[ Source terminal CRAM chip ], 1000, 1, "CRAM" ),
    "dram.ext" : new extrusion( $item[ Source terminal DRAM chip ], 1000, 1, "DRAM" ),
    "tram.ext" : new extrusion( $item[ Source terminal TRAM chip ], 1000, 1, "TRAM" ),
    "familiar.ext" : new extrusion( $item[ software bug ], 10000 )
};

// ****** Spacegate **********

static string_set valid_spacegate_strategies = $strings[
    research,
    turns
];

// *** Sweet Synthesis

// Sweet Synthesis effects
static effect SYNTHESIS_GREED = $effect[ Synthesis: Greed ];		// Meat Drop +300 for 30 turns
static effect SYNTHESIS_COLLECTION = $effect[ Synthesis: Collection ];	// Item Drop +150 for 30 turns

// *** That 70s Volcano

// Discotheque Rewards
static int DISCO_STATS = 1;
static int DISCO_ITEM_DROP = 2;
static int DISCO_TRAVOLTRON = 3;
static int DISCO_DRUNK = 4;
static int DISCO_TURNS = 5;
static int DISCO_VOLCOINO = 6;

// Velvet garments
static item_set VELVET_GARMENTS = $items[
     smooth velvet pants,
     smooth velvet shirt,
     smooth velvet hat,
     smooth velvet pocket square,
     smooth velvet socks,
     smooth velvet hanky
];

// *** Time-Spinner

// Far Future rewards
static item RIKER = $item[ Riker's Search History ];		// combat item: 900-1000 sleaze damage
static item KARDASHIAN = $item[ Shot of Kardashian Gin ];	// EPIC 1 drunk booze, +3 PVP fights
static item POINTY_EARS = $item[ Unstable Pointy Ears ];	// accessory disappears at rollover, +3 stats
static item MEMORY_DISK = $item[ Memory Disk, Alpha ];		// usable, allows access to The Far Future
static item EARL_GREY = $item[ Tea, Earl Grey, Hot ];		// EPIC 1 full food, 1000 MP and 1000 HP

// Keyword for Exandora's FarFuture script to replicate each item
static string [item] FAR_FUTURE_OPTION = {
     RIKER : "riker",
     KARDASHIAN : "booze",
     POINTY_EARS : "ears",
     MEMORY_DISK : "memory",
     EARL_GREY : "food"
};

// *** Tome of Clip Art

// Items you can create using Clip Art
static item_set CLIP_ART_ITEMS = $items[
     Ur-Donut,
     The Bomb,
     box of Familiar Jacks,
     bucket of wine,
     ultrafondue,
     oversized snowflake,
     unbearable light,
     crystal skull,
     borrowed time,
     box of hammers,
     shining halo,
     furry halo,
     frosty halo,
     time halo,
     Lumineux Limnio,
     Morto Moreto,
     Temps Tempranillo,
     Bordeaux Marteaux,
     Fromage Pinotage,
     Beignet Milgranet,
     Muschat,
     cool jelly donut,
     shrapnel jelly donut,
     occult jelly donut,
     thyme jelly donut,
     frozen danish,
     smashed danish,
     forbidden danish,
     cool cat claw,
     blunt cat claw,
     shadowy cat claw,
     cheezburger,
     toasted brie,
     potion of the field gar,
     too legit potion,
     Bright Water,
     cold-filtered water,
     graveyard snowglobe,
     cool cat elixir,
     potion of the captain's hammer,
     potion of X-ray vision,
     potion of the litterbox,
     potion of animal rage,
     potion of punctual companionship,
     holy bomb\, batman,
     bobcat grenade,
     chocolate frosted sugar bomb,
     broken glass grenade,
     noxious gas grenade,
     skull with a fuse in it,
     boozebomb,
     4:20 bomb,
     blunt icepick,
     fluorescent lightbulb,
     blammer,
     clock-cleaning hammer,
     hammerus,
     broken clock,
     dethklok,
     glacial clock
];

// *** Tunnel of L.O.V.E.

// Tunnel of L.O.V.E. Enemies
static monster LOV_ENFORCER = $monster[ LOV Enforcer ];
static monster LOV_ENGINEER = $monster[ LOV Engineer ];
static monster LOV_EQUIVOCATOR = $monster[ LOV Equivocator ];

static monster_set valid_lov_enemies = $monsters[
    LOV Enforcer,
    LOV Engineer,
    LOV Equivocator
];

// Tunnel of L.O.V.E. Equipment
static item LOV_EARDIGAN = $item[ LOV Eardigan ];
static item LOV_EPAULETTES = $item[ LOV Epaulettes ];
static item LOV_EARRINGS = $item[ LOV Earrings ];

static item_set valid_lov_equipment = $items[
    LOV Eardigan,
    LOV Epaulettes,
    LOV Earrings
];

// Tunnel of L.O.V.E. Effects
static effect LOVEBOTAMY = $effect[ Lovebotamy ];
static effect OPEN_HEART_SURGERY = $effect[ Open Heart Surgery ];
static effect WANDERING_EYE_SURGERY = $effect[ Wandering Eye Surgery ];

static effect_set valid_lov_effects = $effects[
    Lovebotamy,
    Open Heart Surgery,
    Wandering Eye Surgery
];

// Tunnel of L.O.V.E. Endowments
static item LOV_ENAMORANG = $item[ LOV Enamorang ];
static item LOV_EMOTIONIZER = $item[ LOV Emotionizer ];
static item LOV_EXTRATERRESTRIAL_CHOCOLATE = $item[ LOV Extraterrestrial Chocolate ];
static item LOV_ECHINACEA_BOUQUET = $item[ LOV Echinacea Bouquet ];
static item LOV_ELEPHANT = $item[ LOV Elephant ];
static item TOAST = $item[ toast ];

static item_set valid_lov_endowments = $items[
    LOV Enamorang,
    LOV Emotionizer,
    LOV Extraterrestrial Chocolate,
    LOV Echinacea Bouquet,
    LOV Elephant,
    toast
];

// *** Horsery Contract

static string_set horsery_horses = $strings[
    none,
    normal,
    dark,
    crazy,
    pale
];

// Voting Booth

static string_set vote_monster_options = $strings[
    never,
    free,
    monsters,
    always
];

static monster_set valid_vote_monsters = $monsters[
    angry ghost,
    annoyed snake,
    government bureaucrat,
    terrible mutant,
    slime blob
];

// *** Witchess Set

static monster_set witchess_monsters = $monsters[
    Witchess Pawn,
    Witchess Knight,
    Witchess Bishop,
    Witchess Rook,
    Witchess Ox,
    Witchess King,
    Witchess Witch,
    Witchess Queen
];

// *** Workshed Items ****
static item_set workshed_items = $items[
    model train set,
    spinning wheel,
    portable Mayo clinic
];

static class NO_CLASS = $class[ none ];
static effect NO_EFFECT = $effect[ none ];
static familiar NO_FAMILIAR = $familiar[ none ];
static item NO_ITEM = $item[ none ];
static location NO_LOCATION = $location[ none ];
static monster NO_MONSTER = $monster[ none ];
static slot NO_SLOT = $slot[ none ];
static stat NO_STAT = $stat[ none ];
static vykea NO_VYKEA = $vykea[ none ];

// *** Familiars *********

static familiar BABY_GRAVY_FAIRY = $familiar[ Baby Gravy Fairy ];
static familiar CHOCOLATE_LAB = $familiar[ Chocolate Lab ];
static familiar CORNBEEFADON = $familiar[ Cornbeefadon ];
static familiar GOD_LOBSTER = $familiar[ God Lobster ];
static familiar HOBO_MONKEY = $familiar[ Hobo Monkey ];
static familiar JUMPSUITED_HOUND_DOG = $familiar[ Jumpsuited Hound Dog ];
static familiar LEPRECHAUN = $familiar[ Leprechaun ];
static familiar MACHINE_ELF = $familiar[ Machine Elf ];
static familiar ROBORTENDER = $familiar[ Robortender ];
static familiar SPACE_JELLYFISH = $familiar[ Space Jellyfish ];
static familiar STOOPER = $familiar[ Stooper ];
static familiar TOT = $familiar[ Trick-or-Treating Tot ];

// *** Items *************

static item AMULET_COIN = $item[ amulet coin ];
static item BASTILLE_BATTALION = $item[ Bastille Battalion control rig ];
static item BARTEND_SWITCH = $item[ toggle switch (Bartend) ];
static item BEACH_COMB = $item[ Beach Comb ];
static item BOUNCE_SWITCH = $item[ toggle switch (Bounce) ];
static item BOX_FULL_OF_MONSTER = $item[ Rain-Doh box full of monster ];
static item CAN_OF_RAIN_DOH = $item[ can of Rain-Doh ];
static item CLAN_FAX_MACHINE = $item[ deluxe fax machine ];
static item CLAN_FLOUNDRY = $item[ Clan Floundry ];
static item CLAN_FORTUNE_TELLER = $item[ Clan Carnival Game ];
static item CLAN_POOL_TABLE = $item[ Clan pool table ];
static item CLAN_SHOWER = $item[ Clan shower ];
static item CLAN_SWIMMING_POOL = $item[ Olympic-sized Clan crate ];
static item CLOSED_CIRCUIT_PAY_PHONE = $item[ closed-circuit pay phone ];
static item COSMIC_BOWLING_BALL = $item[ cosmic bowling ball ];
static item DECK = $item[ Deck of Every Card ];
static item DINSEY_TICKET = $item[ one-day ticket to Dinseylandfill ];
static item ETCHED_HOURGLASS = $item[ etched hourglass ];
static item GENIE_BOTTLE = $item[ genie bottle ];
static item GLITCH_ITEM = $item[ [glitch season reward name] ];
static item GOVERNMENT_PER_DIEM = $item[ government per-diem ];
static item GUZZLR_TABLET = $item[ Guzzlr tablet ];
static item I_VOTED_STICKER = $item[ &quot;I Voted!&quot; sticker ];
static item LOUNGE_KEY = $item[ Clan VIP Lounge key ];
static item MAYO_CLINIC = $item[ portable Mayo Clinic ];
static item MAYOFLEX = $item[ Mayoflex ];
static item MAYO_MINDER = $item[ Mayo Minder&trade; ];
static item MIME_ARMY_SHOTGLASS = $item[ mime army shotglass ];
static item MODEL_TRAIN_SET = $item[ model train set ];
static item MOLEHILL_MOUNTAIN = $item[ molehill mountain ];
static item MUMMING_TRUNK = $item[ mumming trunk ];
static item PHOTOCOPIED_MONSTER = $item[ photocopied monster ];
static item PLASTIC_VAMPIRE_FANGS = $item[ plastic vampire fangs ];
static item RAIN_DOH_BLACK_BOX = $item[ Rain-Doh black box ];
static item REDWOOD_RAIN_STICK = $item[ redwood rain stick ];
static item ROYAL_SCEPTER = $item[ Royal scepter ];
static item ROYAL_TEA = $item[ cuppa Royal tea ];
static item SAND_DOLLAR = $item[ sand dollar ];
static item SONGBOOM_BOOMBOX = $item[ SongBoom&trade; BoomBox ];
static item SOURCE_TERMINAL = $item[ Source terminal ];
static item SPINNING_WHEEL = $item[ spinning wheel ];
static item SPOOKY_PUTTY_MONSTER = $item[ Spooky Putty monster ];
static item SPOOKY_PUTTY_SHEET = $item[ Spooky Putty sheet ];
static item TEA_TREE = $item[ potted tea tree ];
static item TIMESPINNER = $item[ Time-Spinner ];
static item VYKEA_KEY = $item[ VYKEA hex key ];
static item WITCHESS_SET = $item[ Witchess Set ];

// *** Locations *********

static location BARF_MOUNTAIN = $location[ Barf Mountain ];
static location GARBAGE_BARGES = $location[ Pirates of the Garbage Barges ];
static location ICY_PEAK = $location[ The Icy Peak ];
static location MADNESS_BAKERY = $location[ Madness Bakery ];
static location OFFICE = $location[ The Hidden Office Building ];
static location OVERGROWN_LOT = $location[ The Overgrown Lot ];
static location SKELETON_STORE = $location[ The Skeleton Store ];

// *** Skills ************

static skill CALCULATE_THE_UNIVERSE = $skill[ calculate the universe ];
static skill RAINBOW_GRAVITATION = $skill[ Rainbow Gravitation ];
static skill SMILE_OF_MR_A = $skill[ The Smile of Mr. A. ];
static skill SUMMON_CLIPART = $skill[ Summon Clip Art ];
static skill SWEET_SYNTHESIS = $skill[ Sweet Synthesis ];

// *** Slots *************

static slot HAT = $slot[ hat ];
static slot WEAPON = $slot[ weapon ];
static slot PANTS = $slot[ pants ];
static slot BACK = $slot[ back ];
static slot ACC3 = $slot[ acc3 ];
static slot_set ACCESSORIES = $slots[ acc1, acc2, acc3 ];

// *** Stats *************

static stat MUSCLE = $stat[ muscle ];
static stat MYSTICALITY = $stat[ mysticality ];
static stat MOXIE = $stat[ moxie ];

// *** Character Variables

string me = my_name();
class profession = my_class();

// Create a file in your "data" directory named "<PLAYER NAME>.prankees.txt"
// It will contain one line per prospective victim:
//
// NAME<TAB>ENABLED
//
// The first field is the player name
// The second field says whether to send pranks to this player: true or false

string TIME_SPINNER_PRANKEES = me + ".prankees.txt";

// Create a file in your "data" directory named "<PLAYER NAME>.goldens.txt"
// It will contain one line per prospective victim:
//
// NAME<TAB>COUNT
//
// The first field is the player name
// The second field says how many times to bestow The Smile of Mr. A. on this player

string GOLDENS = me + ".goldens.txt";

// Retrieve Clan VIP Lounge key before looking at lounge
if ( available_amount( LOUNGE_KEY ) > 0 ) {
    retrieve_item( 1, LOUNGE_KEY );
}

// Look at the airport to see which planes are available
visit_url( "place.php?whichplace=airport" );

string home_clan = get_clan_name();
string BAFH = "Bonus Adventures from Hell";
boolean have_clan = home_clan != "";
item_to_int_map campground = get_campground();
int [string] clan_rumpus_room = get_clan_rumpus();
item_to_int_map clan_lounge = get_clan_lounge();
string holiday = holiday();

// Available familiars

boolean have_chocolate_lab = have_familiar( CHOCOLATE_LAB );
boolean have_cornbeefadon = have_familiar( CORNBEEFADON );
boolean have_god_lobster = have_familiar( GOD_LOBSTER );
boolean have_hobo_monkey = have_familiar( HOBO_MONKEY );
boolean have_jumpsuited_hound_dog = have_familiar( JUMPSUITED_HOUND_DOG );
boolean have_machine_elf = have_familiar( MACHINE_ELF );
boolean have_space_jellyfish = have_familiar( SPACE_JELLYFISH );
boolean have_stooper = have_familiar( STOOPER );
boolean have_tot = have_familiar( TOT );

// Available items

boolean have_amulet_coin = ( available_amount( AMULET_COIN ) > 0 );
boolean have_battalion = ( available_amount( BASTILLE_BATTALION ) > 0 );
boolean have_beach_comb = ( available_amount( BEACH_COMB ) > 0 );
boolean have_black_box = ( available_amount( RAIN_DOH_BLACK_BOX ) > 0 );
boolean have_boombox = ( available_amount( SONGBOOM_BOOMBOX ) > 0 );
boolean have_closed_circuit_pay_phone = ( available_amount( CLOSED_CIRCUIT_PAY_PHONE ) > 0 );
boolean have_deck = ( available_amount( DECK ) > 0 );
boolean have_dinsey_ticket = ( available_amount( DINSEY_TICKET ) > 0 );
boolean have_fax_machine = clan_lounge contains CLAN_FAX_MACHINE;
boolean have_floundry = clan_lounge contains CLAN_FLOUNDRY;
boolean have_fortune_teller = clan_lounge contains CLAN_FORTUNE_TELLER;
boolean have_genie_bottle = ( available_amount( GENIE_BOTTLE ) > 0 );
boolean have_glitch_item = ( item_amount( GLITCH_ITEM ) > 0 );
boolean have_guzzlr_tablet = ( available_amount( GUZZLR_TABLET ) > 0 );
boolean have_lounge_key = ( item_amount( LOUNGE_KEY ) > 0 );
boolean have_mayo_clinic = campground contains MAYO_CLINIC;
boolean have_mayo_minder = ( item_amount( MAYO_MINDER ) > 0 );
boolean have_mime_army_shotglass = ( available_amount( MIME_ARMY_SHOTGLASS ) > 0 );
boolean have_model_train_set = campground contains MODEL_TRAIN_SET || ( available_amount( MODEL_TRAIN_SET ) > 0 );
boolean have_molehill_mountain = ( available_amount( MOLEHILL_MOUNTAIN ) > 0 );
boolean have_mumming_trunk = ( available_amount( MUMMING_TRUNK ) > 0 );
boolean have_plastic_vampire_fangs = ( available_amount( PLASTIC_VAMPIRE_FANGS ) > 0 );
boolean have_pool_table = clan_lounge contains CLAN_POOL_TABLE;
boolean have_rain_doh = ( available_amount( CAN_OF_RAIN_DOH ) > 0 );
boolean have_redwood_rain_stick = ( available_amount( REDWOOD_RAIN_STICK ) > 0 );
boolean have_shower = clan_lounge contains CLAN_SHOWER;
boolean have_spinning_wheel = campground contains SPINNING_WHEEL || ( available_amount( SPINNING_WHEEL ) > 0 );
boolean have_spooky_putty = ( available_amount( SPOOKY_PUTTY_SHEET ) > 0 );
boolean have_swimming_pool = clan_lounge contains CLAN_SWIMMING_POOL;
boolean have_tea_tree = campground contains TEA_TREE;
boolean have_timespinner = ( available_amount( TIMESPINNER ) > 0 );
boolean have_voter_sticker = ( available_amount( I_VOTED_STICKER ) > 0 );

boolean have_workshed_item = ( have_model_train_set || have_spinning_wheel || have_mayo_clinic );

// Available locations

boolean love_tunnel_available = get_property( "loveTunnelAvailable" ).to_boolean();
boolean boxing_daycare_available = get_property( "daycareOpen" ).to_boolean() || get_property( "_daycareToday" ).to_boolean();
boolean hot_airport_available = ( get_property( "hotAirportAlways" ).to_boolean() || get_property( "_hotAirportToday" ).to_boolean() );
boolean can_disco = hot_airport_available && !get_property( "_infernoDiscoVisited" ).to_boolean();
boolean gingerbread_city_available = ( get_property( "gingerbreadCityAvailable" ).to_boolean() || get_property( "_gingerbreadCityToday" ).to_boolean() );
boolean snojo_available = get_property( "snojoAvailable" ).to_boolean();
boolean stench_airport_available = ( get_property( "stenchAirportAlways" ).to_boolean() || get_property( "_stenchAirportToday" ).to_boolean() );
boolean have_source_terminal = campground contains SOURCE_TERMINAL;
boolean have_witchess_set = campground contains WITCHESS_SET;
boolean horsery_available = get_property( "horseryAvailable" ).to_boolean();
boolean spacegate_available = get_property( "spacegateAlways" ).to_boolean();
boolean never_ending_party_available = ( get_property( "neverendingPartyAlways" ).to_boolean() || get_property( "_neverendingPartyToday" ).to_boolean() );
boolean speakeasy_available = get_property( "ownsSpeakeasy" ).to_boolean();
boolean store_available = have_shop();

// Installed Source Terminal items

string_set installed_chips = get_property( "sourceTerminalChips" ).to_string_set( "," );
string_set known_enhancements = get_property( "sourceTerminalEnhanceKnown" ).to_string_set( "," );
string_set known_extrusions = get_property( "sourceTerminalExtrudeKnown" ).to_string_set( "," );
string st_educate1 = get_property( "sourceTerminalEducate1" );
string st_educate2 = get_property( "sourceTerminalEducate2" );

// Available skills

boolean can_digitive = ( st_educate1 == "digitize.edu" || st_educate2 == "digitize.edu" );
boolean can_extract =  ( st_educate1 == "extract.edu" || st_educate2 == "extract.edu" );
boolean can_synthesize = have_skill( SWEET_SYNTHESIS );
boolean have_clipart = have_skill( SUMMON_CLIPART );
boolean numberology_available = have_skill( CALCULATE_THE_UNIVERSE );

// Item Retrieval options

boolean should_use_closet = get_property( "autoSatisfyWithCloset" ).to_boolean();
boolean should_use_stash = get_property( "autoSatisfyWithStash" ).to_boolean();
boolean should_use_storage = get_property( "autoSatisfyWithStorasge" ).to_boolean();

// Other character settings

string current_boombox_song = get_property( "boomBoxSong" );
boolean mayflies_may_fly = get_property( "_mayflySummons" ).to_int() < 30;

// Hobo Monkey stasis items
static item SEAL_TOOTH = $item[ seal tooth ];
static item DICTIONARY = $item[ dictionary ];
static item FACSIMILE = $item[ facsimile dictionary ];

// Utility to find a hat of the appropriate length
item hatter_hat = NO_ITEM;
boolean available_hat( int hat_length )
{
    int hat_length( item hat )
    {
	return length( create_matcher( "\\s", hat.name ).replace_all( "" ) );
    }

    boolean matches( item hat )
    {
	int length = hat.hat_length();
	return hat_length == 30 ?
	       length >= 30 :
	       hat_length == 4 ?
	       length <= 5 :
	       length == hat_length;
    }

    boolean find_hat( item_to_int_map hat_map )
    {
	foreach hat in hat_map {
	    if ( hat.to_slot() == $slot[ hat ] && hat.matches() && hat.can_equip() ) {
		hatter_hat = hat;
		return true;
	    }
	}
	return false;
    }

    item current_hat = equipped_item( HAT );
    if ( current_hat != NO_ITEM && current_hat.matches() ) {
	hatter_hat = current_hat;
	return true;
    }

    return find_hat( get_inventory() ) ||
	   ( should_use_closet && find_hat( get_closet() ) ) ||
	   ( should_use_storage && find_hat( get_storage() ) ) ;
}

// Utility to validate genie wishes
string valid_wish( string wish )
{
    // *** TBD
    return wish;
}

// Workshed items to use:
item workshed1 = NO_ITEM;
item workshed2 = NO_ITEM;

void configure_workshed_items()
{
    // workshed_cycle has been trimmed to contain only items you either have installed or have
    // available. In the latter case, each has been pulled into inventory, if necessary.

    if (count(workshed_cycle) == 0) {
	return;
    }

    boolean can_use_item(item desired, item... items)
    {
	foreach n, it in items {
	    if (desired == it) {
		return true;
	    }
	}
	return false;
    }

    boolean wheel = can_use_item( SPINNING_WHEEL, workshed_cycle);
    boolean clinic = can_use_item( MAYO_CLINIC, workshed_cycle);
    boolean train = can_use_item( MODEL_TRAIN_SET, workshed_cycle);

    // If we have at least two, decide when to use based on what is currently installed, if either.
    item current_item = get_workshed();
    boolean workshed_swapped = get_property("_workshedItemUsed").to_boolean();

    // model train set + spinning wheel
    if ( train && wheel ) {
	switch (current_item) {
	case NO_ITEM:
	    workshed1 = MODEL_TRAIN_SET;
	    workshed2 = SPINNING_WHEEL;
	    break;
	case MODEL_TRAIN_SET:
	    workshed1 = MODEL_TRAIN_SET;
	    workshed2 = workshed_swapped ? MODEL_TRAIN_SET : SPINNING_WHEEL;
	    break;
	case SPINNING_WHEEL:
	    workshed1 = SPINNING_WHEEL;
	    workshed2 = workshed_swapped ? SPINNING_WHEEL : MODEL_TRAIN_SET;
	    break;
	default:
	    if (!workshed_swapped) {
		workshed1 = MODEL_TRAIN_SET;
	    }
	    break;
	}
	return;
    }

    // model train set + portable Mayo clinic
    if ( train && clinic ) {
	switch (current_item) {
	case NO_ITEM:
	    workshed1 = MAYO_CLINIC;
	    workshed2 = MODEL_TRAIN_SET;
	    break;
	case MODEL_TRAIN_SET:
	    workshed1 = MODEL_TRAIN_SET;
	    workshed2 = workshed_swapped ? MODEL_TRAIN_SET : MAYO_CLINIC;
	    break;
	case MAYO_CLINIC:
	    workshed1 = MAYO_CLINIC;
	    workshed2 = workshed_swapped ? MAYO_CLINIC : MODEL_TRAIN_SET;
	    break;
	default:
	    if (!workshed_swapped) {
		workshed1 = MODEL_TRAIN_SET;
	    }
	    break;
	}
	return;
    }

    // spinning wheel + portable Mayo clinic
    if ( wheel && clinic ) {
	switch (current_item) {
	case NO_ITEM:
	    workshed1 = MAYO_CLINIC;
	    workshed2 = SPINNING_WHEEL;
	    break;
	case SPINNING_WHEEL:
	    workshed1 = SPINNING_WHEEL;
	    workshed2 = workshed_swapped ? SPINNING_WHEEL : MAYO_CLINIC;
	    break;
	case MAYO_CLINIC:
	    workshed1 = MAYO_CLINIC;
	    workshed2 = workshed_swapped ? MAYO_CLINIC : SPINNING_WHEEL;
	    break;
	default:
	    if (!workshed_swapped) {
		// We'll run with whatever was already installed and then install the spinning wheel
		// at the end of the day.
		workshed2 = SPINNING_WHEEL;
	    }
	    break;
	}
	return;
    }

    // model train set
    if (train) {
	// Install model train set before running turns
	switch (current_item) {
	case NO_ITEM:
	case MODEL_TRAIN_SET:
	    workshed1 = MODEL_TRAIN_SET;
	    break;
	default:
	    if (!workshed_swapped) {
		workshed1 = MODEL_TRAIN_SET;
	    }
	    break;
	}
	return;
    }

    // portable Mayo clinic
    if (clinic) {
	// Install portable Mayo clinic before eating
	switch (current_item) {
	case NO_ITEM:
	case MAYO_CLINIC:
	    workshed1 = MAYO_CLINIC;
	    break;
	default:
	    if (!workshed_swapped) {
		workshed1 = MAYO_CLINIC;
	    }
	    break;
	}
	return;
    }

    // spinning wheel
    if (wheel) {
	// Install spinning wheel at end of day, to allow for leveling
	switch (current_item) {
	case NO_ITEM:
	case SPINNING_WHEEL:
	    workshed2 = SPINNING_WHEEL;
	    break;
	default:
	    if (!workshed_swapped) {
		workshed2 = SPINNING_WHEEL;
	    }
	    break;
	}
	return;
    }
}
 
// Default familiar: Meat or Item, depending on what you are hunting.
familiar default_familiar;

// Hobo Monkey, if you have one, for stasising. Otherwise, default
familiar hobo_or_default_familiar;

void validate_configuration()
{
    boolean valid = true;

    print( "Validating configuration." );

    // Check all configuration variables

    // monster_set olfaction_targets;
    // boolean should_sell_breakfast_loot;
    // boolean should_summon_demon;
    // boolean make_prismatic_wads;
    // boolean fight_eldritch_tentacles
    // boolean should_extract
    // -> no validation needed

    if ( !( farm_options contains farm_type ) ) {
	print( "VMF.FarmType: '" + farm_type + "' is invalid.", "red" );
	valid = false;
    }

    // If farming location is not specified, choose one
    if ( farm_location == NO_LOCATION ) {
	farm_location = BARF_MOUNTAIN;
    }

    if ( farm_location == BARF_MOUNTAIN &&
	 !(stench_airport_available || ( should_use_dinsey_ticket && have_dinsey_ticket ) ) ) {
	farm_location = OFFICE;
    }

    // If farming familiar is not specified, choose one
    if ( meat_familiar == NO_FAMILIAR ) {
	meat_familiar = TOT;
    }

    if ( meat_familiar == TOT && !have_tot ) {
	meat_familiar = HOBO_MONKEY;
    }

    if ( meat_familiar == HOBO_MONKEY && !have_hobo_monkey ) {
	meat_familiar = LEPRECHAUN;
    }

    // Verify we have specified familiar
    if ( !have_familiar( meat_familiar ) ) {
	print( "VMF.MeatFamiliar: '" + get_property( "VMF.MeatFamiliar" ) + "' is unavailable.", "red" );
	valid = false;
    }

    // If item drop familiar is not specified, choose one
    if ( item_familiar == NO_FAMILIAR ) {
	item_familiar = TOT;
    }

    if ( item_familiar == TOT && !have_tot ) {
	item_familiar = JUMPSUITED_HOUND_DOG;
    }

    if ( item_familiar == JUMPSUITED_HOUND_DOG && !have_jumpsuited_hound_dog ) {
	item_familiar = BABY_GRAVY_FAIRY;
    }

    // Verify we have specified familiar
    if ( !have_familiar( item_familiar ) ) {
	print( "VMF.ItemFamiliar: '" + get_property( "VMF.ItemFamiliar" ) + "' is unavailable.", "red" );
	valid = false;
    }

    // Check familiar items
    if ( get_amulet_coin && !have_cornbeefadon ) {
	print( "VMF.GetAmuletCoin: You need a Cornbeefadon to get an amulet coin; ignoring." );
	get_amulet_coin = false;
    }

    default_familiar = farm_type == "meat" ? meat_familiar : item_familiar;
    hobo_or_default_familiar = have_hobo_monkey ? HOBO_MONKEY : default_familiar;

    // For the Tot, we will get the +item and +meat outfits
    if ( default_familiar == TOT ) {
	if ( default_famequip != NO_ITEM ) {
	    print( "VMF.FamiliarEquipment: '" + default_famequip + "' may not be the best item for your " + default_familiar + "; ignoring." );
	    default_famequip = NO_ITEM;
	}
	if ( get_amulet_coin ) {
	    print( "VMF.GetAmuletCoin: 'amulet coin' may not be the best item for your " + default_familiar + "; ignoring." );
	    get_amulet_coin = false;
	}
    }

    if ( default_familiar == ROBORTENDER ) {
	// Validate desired equipment
	if ( !( possible_robortender_items contains robortender_item ) ) {
	    print( "VMF.RobortenderEquipment: '" + robortender_item + "' is not a valid robortender item.", "red" );
	    valid = false;
	}

	// Validate the drinks to feed to your Robortender
	item_set drinks;
	item [ phylum ] phyla;
	boolean changed = false;

	// Validate that all drinks are in robodrinks (error if not)
	// Keep only strongest drink of each phylum (warning if both given)
	foreach drink in robortender_drinks {
	    if ( !( robodrinks contains drink ) ) {
		print( "VMF.RoboDrinks: '" + drink + "' cannot be fed to a Robortender; ignoring." );
		changed = true;
	    } else {
		// Create list of drinks, keeping only the strongest from a given phylum
		robodrink data = robodrinks[ drink ];
		phylum source = data.source;
		item old = phyla[ source ];
		if ( old == NO_ITEM ) {
		    phyla[ source ] = drink;
		    drinks[ drink ] = true ;
		} else if ( data.strong ) {
		    print( "VMF.RoboDrinks: '" + drink + "' is better than '" + old + "; keeping better drink." );
		    phyla[ source ] = drink;
		    remove drinks[ old ];
		    drinks[ drink ] = true;
		    changed = true;
		} else {
		    print( "VMF.RoboDrinks: '" + old + "' is better than '" + drink + "; keeping better drink." );
		    changed = true;
		}
	    }
	}

	if ( changed ) {
	    set_property( "VMF.RoboDrinks", drinks.to_string() );
	    robortender_drinks = drinks;
	}

	// Acquire the drinks up front, since they may be too expensive
	// for autoBuyPriceLimit, in which case acquisition will
	// fail. Abort now, rather than in middle of executing tasks.
 	item_set used = get_property( "_roboDrinks" ).to_item_set( "," );
	foreach drink in robortender_drinks {
	    if ( used contains drink ) {
		continue;
	    }
	    if ( !retrieve_item( 1, drink ) ) {
		print( "VMF.RoboDrinks: unable to acquire '" + drink + "'; acquire it manually and try again.", "red" );
		valid = false;
	    }
	}
    }

    // Verify we have specified equipment
    if ( default_famequip != NO_ITEM ) {
	// *** Could verify that it is universal familiar equipment
	if ( available_amount( default_famequip ) == 0 ) {
	    print( "VMF.FamiliarEquipment: '" + default_famequip + "' is unavailable; using whatever is equipped." );
	    default_famequip = NO_ITEM;
	}
    }

    if ( stasis_item != NO_ITEM && !stasis_item.combat ) {
	print( "VMF.StasisItem: '" + stasis_item + "' is not a combat item.", "red" );
	valid = false;
    }

    if ( !( friars_blessing_settings contains blessing ) ) {
	print( "VMF.FriarsBlessing: '" + blessing + "' is invalid.", "red" );
	valid = false;
    }

    if ( nightcap != NO_ITEM && nightcap.inebriety == 0 ) {
	print( "VMF.Nightcap: '" + nightcap + "' is not booze.", "red" );
	valid = false;
    }

    if ( farm_location == ICY_PEAK && !have_outfit( icy_peak_outfit ) ) {
	print( "VMF.IcyPeakOutfit '" + icy_peak_outfit + "' is unavailable.", "red" );
	valid = false;
    }

    if ( !have_outfit( farm_outfit ) ) {
	print( "VMF.DefaultOutfit '" + farm_outfit + "' is unavailable.", "red" );
	valid = false;
    }

    if ( !have_outfit( item_outfit ) ) {
	print( "VMF.ItemDropOutfit '" + item_outfit + "' is unavailable.", "red" );
	valid = false;
    }

    // If we might be summoning monsters, check specified familiar
    if ( have_fax_machine || have_deck || have_genie_bottle) {
	// Verify we have specified familiar
	if ( copied_monster_familiar != NO_FAMILIAR && !have_familiar( copied_monster_familiar ) ) {
	    print( "VMF.CopyFamiliar: '" + copied_monster_familiar + "' is unavailable.", "red" );
	    valid = false;
	}
    }

    // Breakfast Counter

    if ( should_eat_muffins ) {
	if ( muffin_to_order != NO_ITEM && !( valid_muffins contains muffin_to_order ) ) {
	    print( "VMF.MuffinToOrder: '" + muffin_to_order + "' is not a muffin available at the Breakfast Counter.", "red" );
	    valid = false;
	}
    }

    // *** Dependence Day ***

    if ( dependence_day_firework != NO_ITEM ) {
	if ( !( valid_fireworks contains dependence_day_firework ) ) {
	    print( "VMF.DependenceDayFireWork: '" + dependence_day_firework + "' is not a Dependence Day firework.", "red" );
	    valid = false;
	}
    }

    // *** Bastille Battalion
    if ( have_battalion && use_battalion ) {
	if ( !( valid_battalion_stats contains battalion_stats ) ) {
	    print( "VMF.BattalionStats: '" + battalion_stats + "' is not a valid stat specification.", "red" );
	    valid = false;
	}
	if ( !( valid_battalion_accessories contains battalion_accessory ) ) {
	    print( "VMF.BattalionAccessory: '" + battalion_accessory + "' is not available from the Bastille Battalion.", "red" );
	    valid = false;
	}
	if ( !( valid_battalion_effects contains battalion_effect ) ) {
	    print( "VMF.BattalionEffect: '" + battalion_effect + "' is not available from the Bastille Battalion.", "red" );
	    valid = false;
	}
	if ( !( valid_battalion_potions contains battalion_potion ) ) {
	    print( "VMF.BattalionPotion: '" + battalion_potion + "' is not available from the Bastille Battalion.", "red" );
	    valid = false;
	}
    }

    // *** Beach Comb
    if ( have_beach_comb && beach_comb_turns >= 0 ) {
	string_list repositories = beach_comb_scripts[ beach_comb_script ];
	if ( count(repositories) == 0 ) {
	    print( "VMF.UseBeachCombScript: '" + beach_comb_script + "' is not a known Beach Comb script.", "red" );
	    valid = false;
	}
	// Do not require the script to be installed; we'll do that at runtime
    }

    // *** Boxing Daycare
    if ( boxing_daycare_available ) {
	if ( boxing_daycare_buff != "" ) {
	    if ( boxing_buff_to_option[ boxing_daycare_buff ] == 0 ) {
		print( "VMF.BoxingDaycareBuff: '" + boxing_daycare_buff + "' is not available at the Boxing Daycare Spa.", "red" );
		valid = false;
	    }
	}
    }

    // *** Clan Fax Machine
    if ( have_fax_machine ) {
	// VMF.FaxMonster
	// VMF.UseRainDoh
	// VMF.UseSpookyPutty
	// -> no validation needed
    }

    // *** Clan Floundry
    if ( have_floundry ) {
	if ( floundry_item != NO_ITEM ) {
	    if ( !( floundry_items contains floundry_item ) ) {
		print( "VMF.Floundry: '" + floundry_item + "' is not createable at a clan Floundry.", "red" );
		valid = false;
	    } else if ( clan_lounge[ floundry_item ] < 1 ) {
		print( "VMF.Floundry: '" + floundry_item + "' cannot currently be created at your Clan Floundry; ignoring." );
		floundry_item = NO_ITEM;
	    }
	}
    }

    // *** Clan Fortune Teller
    if ( have_fortune_teller ) {
	if ( fortune_teller_npc != NO_NPC ) {
	    if ( !( fortune_teller_npcs contains fortune_teller_npc ) ) {
		print( "VMF.FortuneTellerNPC: '" + fortune_teller_npc + "' does not refer to a known NPC.", "red" );
		valid = false;
	    }
	}
    }

    // *** Clan Looking Glass
    if ( hatter_buff != NO_EFFECT ) {
	int hat_length = hatter_effects[ hatter_buff ];
	if ( hat_length == 0 ) {
	    print( "VMF.HatterBuff: '" + hatter_buff + "' is not available at the Mad Tea Party.", "red" );
	    valid = false;
	} else if ( !available_hat( hat_length ) ){
	    print( "VMF.HatterBuff: '" + hatter_buff + "' requires a hat of length " + hat_length +", which you lack.", "red" );
	    valid = false;
	}
    }

    // *** Clan Pool Table
    if ( have_pool_table ) {
	// VMF.PoolTableStance
	// Cannot validate; either a valid stat or coerced int NO_STAT
    }

    // *** Clan Shower
    if ( have_shower ) {
	if ( !( shower_settings contains shower ) ) {
	    print( "VMF.ShowerTemperature: '" + shower + "' is invalid.", "red" );
	    valid = false;
	}
    }

    // *** Clan Swimming Pool
    if ( have_swimming_pool ) {
	if ( swimming_pool != NO_EFFECT && !( swimming_pool_effects contains swimming_pool ) ) {
	    print( "VMF.SwimmingPool: '" + swimming_pool + "' cannot be obtained from the clan swimming pool.", "red" );
	    valid = false;
	}
    }

    // *** Deck of Every Card
    if ( have_deck ) {
	boolean changed = false;
	string_set seen;
	foreach n, card in deck_cards {
	    string name = every_card_name( card );
	    if ( name == "" ) {
		print( "VMF.DeckCards: '" + card + "' is not an unambiguously valid card name.", "red" );
		valid = false;
	    } else if ( name != card ) {
		print( "VMF.DeckCards: '" + card + "' disambiguates to '" + name + "'." );
		deck_cards[ n ] = name;
		changed = true;
	    } else if ( seen[ name ] ) {
		print( "VMF.DeckCards: '" + name + "' can only be drawn once.", "red" );
		valid = false;
	    } else {
		seen[ name ] = true;
	    }
	}

	// Save with disambiguated names
	if ( changed ) {
	    set_property( "VMF.DeckCards", deck_cards.to_string() );
	}
    }

    // *** Deep Machine Tunnels
    if ( have_machine_elf ) {
	if ( !have_outfit( dmt_outfit ) ) {
	    print( "VMF.DMTOutfit: '" + dmt_outfit + "' is unavailable.", "red" );
	    valid = false;
	}

	if ( dmt_choice != "" && !( dmt_choices contains dmt_choice ) ) {
	    print( "VMF.DMTChoice: '" + dmt_choice + "' is invalid.", "red" );
	    valid = false;
	}
    }

    // *** Dinseylandfill
    if ( farm_location == BARF_MOUNTAIN ) {
	if ( !have_outfit( barf_outfit ) ) {
	    print( "VMF.BarfMountainOutfit: '" + barf_outfit + "' is unavailable.", "red" );
	    valid = false;
	}
    }

    // *** Genie Bottle
    if ( have_genie_bottle ) {
	boolean changed = false;
	foreach n, wish in genie_wishes {
	    string name = valid_wish( wish );
	    if ( name == "" ) {
		print( "VMF.GenieWishes: '" + wish + "' is not an unambiguously valid wish.", "red" );
		valid = false;
	    } else if ( name != wish ) {
		print( "VMF.GenieWishes: '" + wish + "' disambiguates to '" + name + "'." );
		genie_wishes[ n ] = name;
		changed = true;
	    }
	}

	// Save with disambiguated names
	if ( changed ) {
	    set_property( "VMF.GenieWishes", genie_wishes.to_string() );
	}
    }

    // *** Gingerbread City
    if ( use_gingerbread_city ) {
	if ( !check_installed( gingerbread_scripts )) {
	    print( "VMF.GingerbreadCity: you want to adventure in the Gingerbread City, but you have not installed the Gingerbread City script", "red" );
	    valid = false;
	}
	// Cannot validate; Gingerbread City.ash will validate its own settings
    }

    // *** Manual of Numberology
    if ( numberology_available ) {
	if ( numberology_goal < 0 || numberology_goal > 99 ) {
	    print( "VMF.NumberologyGoal: (" + numberology_goal + ") must be between 0 and 99.", "red" );
	    valid = false;
	} else if ( numberology_prize( numberology_goal) == "Try Again" ) {
	    print( "VMF.NumberologyGoal: (" + numberology_goal + ") does not lead to a valid result.", "red" );
	    valid = false;
	}
    }

    // *** mayfly bait necklace
    if ( mayfly_bait_replacement != NO_ITEM ) {
	string itype = item_type( mayfly_bait_replacement );
	if ( itype  != "accessory" ) {
	    print( "VMF.MayflyReplacementAccessory: " + mayfly_bait_replacement + " is not an accessory.", "red" );
	    valid = false;
	}
    }

    // *** Pantsgiving
    if ( pantsgiving_replacement != NO_ITEM ) {
	string itype = item_type( pantsgiving_replacement );
	if ( itype  != "pants" ) {
	    print( "VMF.PanstsgivingReplacement: " + pantsgiving_replacement + " is not an pair of pants.", "red" );
	    valid = false;
	}
    }

    // *** Mumming Trunk
    if ( have_mumming_trunk ) {
	string mcommand = mumming_costume.to_lower_case();
	if ( mcommand == "mainstat" ) {
	    mcommand = my_primestat().to_string().to_lower_case();
	} else if ( mcommand != "none" ) {
	    mcommand = possible_mumming_costumes[ mcommand ];
	    if ( mcommand == "" ) {
		print( "VMF.MummingCostume: (" + mumming_costume + ") is not available in your Mumming Trunk.", "red" );
		valid = false;
	    } else if ( get_property( "_mummeryUses" ).contains_text( to_string( mummery_costume_options [ mcommand ] ) ) ) {
		print( "VMF.MummingCostume: (" + mumming_costume + ") has already been used today." );
		mcommand = "none";
	    }
	}

	// Save the option used by the "mummery" command to use the specified costume
	mumming_costume = mcommand;
    }

    // *** Neverending Party
    if ( never_ending_party_available ) {
	if ( !have_outfit( nep_outfit ) ) {
	    print( "VMF.NEPOutfit: '" + nep_outfit + "' is unavailable.", "red" );
	    valid = false;
	}
    }

    // *** Plastic Vampire Fangs
    if ( should_vamp_out ) {
	// VMF.VampOutPlaces
	foreach place in vamp_out_places {
	    if ( !( valid_vamp_out_places contains place ) ) {
		print( "You can't vamp out with " + place + "; ignoring." );
		remove vamp_out_places[ place ];
	    }
	}

	if ( vlad_reward != NO_EFFECT && !( possible_vlad_rewards contains vlad_reward ) ) {
	    print( "VMF.VampOutAtVlad: '" + vlad_reward + "' is not available from Vlad.", "red" );
	    valid = false;
	}

	if ( isabella_reward != "none" && !( possible_isabella_rewards contains isabella_reward ) ) {
	    print( "VMF.VampOutAtIsabella: '" + isabella_reward + "' is not available from Isabella.", "red" );
	    valid = false;
	}

	if ( masquerade_reward != NO_ITEM && !( possible_masquerade_rewards contains masquerade_reward ) ) {
	    print( "VMF.VampOutAtMasquerade: '" + masquerade_reward + "' is not available from The Masquerade.", "red" );
	    valid = false;
	}
    }

    // *** Potted Tea Tree
    if ( have_tea_tree ) {
	if ( desired_cuppa_tea != NO_ITEM && !( CUPPSA_TEA contains desired_cuppa_tea ) ) {
	    print( "VMF.CuppaTea: '" + desired_cuppa_tea + "' is not available from the tea tree.", "red" );
	    valid = false;
	}

	if ( !( valid_royalty_actions contains royalty_choice ) ) {
	    print( "VMF.RoyalTeaUsage: '" + royalty_choice + "' is not a valid action for a cuppa Royal tea.", "red" );
	    valid = false;
	}

	// If you don't have a store in the mall, "mallsell" -> "keep"
	if ( !store_available && royalty_choice == "mallsell" ) {
	    print( "VMF.RoyalTeaUsage: want 'mallsell', but you don't have a shop in the mall; using 'keep'." );
	    royalty_choice = "keep";
	}
    }

    // *** Snojo
    if ( snojo_available ) {
	// VMF.SnojoMode
	// Cannot validate; either a valid stat or coerced int NO_STAT
    }

    // *** SongBoom&trade; BoomBox ***
    if ( have_boombox ) {
	if ( !( boombox_keyword_to_song contains boombox_song ) ) {
	    print( "VMF.BoomBoxSong: '" + boombox_song + "' is not a valid SongBoom&trade BoomBox song.", "red" );
	    valid = false;
	}
	foreach song in boombox_sing_along_songs {
	    if ( !( boombox_keyword_to_song contains song ) ) {
		print( "VMF.BoomBoxSingAlong: '" + song	+ "' is not a valid SongBoom&trade BoomBox song.", "red" );
		valid = false;
	    }
	}
    }

    // *** Source Terminal
    if ( have_source_terminal ) {
	// One enhancement
	if ( source_terminal_enhancement != NO_EFFECT ) {
	    if ( !( valid_enhancements contains source_terminal_enhancement ) ) {
		print( "VMF.SourceTerminalEnhancement: '" + source_terminal_enhancement + "' is not a valid Source Terminal enhancement.", "red" );
		valid = false;
	    } else if ( !( known_enhancements contains source_terminal_enhancement.to_string() ) ) {
		print( "VMF.SourceTerminalEnhancement: '" + source_terminal_enhancement + "' is not installed in your Source Terminal.", "red" );
		valid = false;
	    }
	}

	// List of extrusions
	foreach n, ext in desired_extrusions {
	    if ( !( valid_extrusions contains ext ) ) {
		print( "VMF.SourceTerminalExtrusions: '" + ext + "' is not a valid Source Terminal extrusion.", "red" );
		valid = false;
	    } else if ( !( known_extrusions contains ext ) ) {
		print( "VMF.SourceTerminalExtrusions: '" + ext + "' is not installed in your Source Terminal.", "red" );
		valid = false;
	    }
	    // You are allowed to specify more than 3 since we will
	    // ignore already installed or too costly extrusions at run
	    // time.
	}
    }

    // ****** Spacegate **********
    if ( spacegate_available ) {
	if ( spacegate_command != "" && !check_installed( spacegate_scripts )) {
	    print( "VMF.SpacegateCommand: '" + spacegate_command + "', but you have not installed VeracitySpacegate", "red" );
	    valid = false;
	}
	// Cannot validate command; VeracitySpacegate will parse and validate it
	if ( !( valid_spacegate_strategies contains spacegate_strategy ) ) {
	    print( "VMF.SpacegateStrategy: '" + spacegate_strategy + "' is not a valid Spacegate strategy.", "red" );
	    valid = false;
	}
    }

    // *** Sweet Synthesis
    if ( can_synthesize ) {
	if ( synthesis_target != NO_EFFECT ) {
	    if ( !synthesis_target.to_string().starts_with( "Synthesis:" ) ) {
		print( "VMF.SynthesisEffect: '" + synthesis_target + "' is not obtainable via Sweet Synthesis.", "red" );
		valid = false;
	    }
	}
    }

    // *** That 70s Volcano
    if ( can_disco && disco_goal != 0 ) {
	if ( disco_goal < 1 || disco_goal > 6 ) {
	    print( "VMF.DiscoGoal: (" + disco_goal + ") must be between 1 and 6", "red" );
	    valid = false;
	} else if ( !have_outfit( velvet_outfit ) ) {
	    print( "VMF.VelvetOutfit: '" + velvet_outfit + "' is unavailable.", "red" );
	    valid = false;
	} else {
	    // Make sure the outfit has enough velvet
	    int garments = 0;
	    foreach i, piece in outfit_pieces( velvet_outfit ) {
		if ( VELVET_GARMENTS contains piece ) {
		    ++garments;
		}
	    }

	    if ( garments < disco_goal ) {
		print( "VMF.VelvetOutfit: '" + velvet_outfit + "' contains only " + garments + " velvet garments, but at least " + disco_goal + " + are required", "red" );
		valid = false;
	    }
	}
    }

    // *** The Glaciest
    // VMF.VYKEACompanion
    // Cannot validate; either a valid companion or coerced int NO_VYKEA

    // *** Time-Spinner
    if ( have_timespinner ) {
	if ( far_future_item != NO_ITEM && !( FAR_FUTURE_OPTION contains far_future_item ) ) {
	    print( "VMF.FarFutureItem: '" + far_future_item + "' is not available in the Far Future.", "red" );
	    valid = false;
	}
    }

    // *** Tome of Clip Art
    if ( have_clipart ) {
	foreach n, it in clip_art {
	    if ( it != NO_ITEM && !( CLIP_ART_ITEMS contains it ) ) {
		print( "VMF.ClipArt: '" + it + "' is not created from Clip Art.", "red" );
		valid = false;
	    }
	}
    }

    // *** Tunnel of L.O.V.E.
    if ( love_tunnel_available && use_tunnel_of_love ) {
	foreach mon in lov_enemies {
	    if ( !( valid_lov_enemies contains mon ) ) {
		print( "VMF.LOVEnemies: You can't fight a " + mon + " in the Tunnel of L.O.V.E.; ignoring." );
		remove lov_enemies[ mon ];
	    }
	}

	if ( lov_equipment != NO_ITEM && !( valid_lov_equipment contains lov_equipment ) ) {
	    print( "VMF.LOVEquipment: '" + lov_equipment + "' is not available in the Tunnel of L.O.V.E.", "red" );
	    valid = false;
	}

	if ( lov_effect != NO_EFFECT && !( valid_lov_effects contains lov_effect ) ) {
	    print( "VMF.LOVEffect: '" + lov_effect + "' is not available in the Tunnel of L.O.V.E.", "red" );
	    valid = false;
	}

	if ( lov_endowment != NO_ITEM && !( valid_lov_endowments contains lov_endowment ) ) {
	    print( "VMF.LOVEndowment: '" + lov_endowment + "' is not available in the Tunnel of L.O.V.E.", "red" );
	    valid = false;
	}

	if ( !have_outfit( lov_ensemble ) ) {
	    print( "VMF.LOVEnsemble: '" + lov_ensemble + "' is unavailable.", "red" );
	    valid = false;
	}
    }

    // *** Voting Booth
    if ( have_voter_sticker ) {
	if ( !( vote_monster_options contains fight_voters ) ) {
	    print( "VMF.FightVoteMonsters: '" + fight_voters + "' must be never, free, monster, or always.", "red" );
	    valid = false;
	}
	foreach m in vote_monsters {
	    if ( !( valid_vote_monsters contains m ) ) {
		print( "VMF.WorthyVoteMonsters: '" + m + "' is not a vote monster.", "red" );
		valid = false;
	    }
	}
    }

    // *** Witchess Set
    if ( have_witchess_set ) {
	foreach n, mon in witchess_fights {
	    if ( !( witchess_monsters contains mon ) ) {
		print( "VMF.WitchessMonsters: You can't fight a " + mon + " at your Witchess Set.; ignoring." );
		remove witchess_fights[ n ];
	    }
	}
    }

    // *** Workshed Items
    if ( have_workshed_item ) {
	foreach n, it in workshed_cycle {
	    if ( !( workshed_items contains it ) ) {
		print( "VMF.WorkshedCycle: We don't know how to use a " + it + " in your workshed; ignoring." );
		remove workshed_cycle[ n ];
		continue;
	    }
	    if (campground contains it) {
		continue;
	    }
	    if (available_amount( it ) == 0) {
		print( "VMF.WorkshedCycle: You don't own a " + it + "; ignoring." );
		remove workshed_cycle[ n ];
		continue;
	    }
	    retrieve_item( it );
	}
	// Configure which (up to) two workshed items we will use
	configure_workshed_items();
    }

    // *** Horsery Contract
    if ( !( horsery_horses contains horsery_horse ) ) {
	print( "VMF.HorseryHorse: '" + horsery_horse + "' is not rentable from The Horsery.", "red" );
	valid = false;
    }

    if ( !valid ) {
	abort( "Correct those errors and try again." );
    }

    print( "All is well!" );
}

// ***************************
// *      Constants          *
// ***************************

static int MAX_INT = 16777215;	// Not really, but maximum item count

static class ACCORDION_THIEF = $class[ Accordion Thief ];
static class DISCO_BANDIT = $class[ Disco Bandit ];
static class PASTAMANCER = $class[ Pastamancer ];
static class SAUCEROR = $class[ Sauceror ];
static class SEAL_CLUBBER = $class[ Seal Clubber ];
static class TURTLE_TAMER = $class[ Turtle Tamer ];

static effect ANAPEST_EFFECT = $effect[ Just the Best Anapests ];
static effect HAIKU_EFFECT = $effect[ Haiku State of Mind ];
static effect INIGO_EFFECT = $effect[ Inigo's Incantation of Inspiration ];
static effect ODE_EFFECT = $effect[ Ode to Booze ];
static effect PHAT_EFFECT = $effect[ Fat Leon's Phat Loot Lyric ];
static effect POLKA_EFFECT = $effect[ Polka of Plenty ];
static effect SCAM_EFFECT = $effect[ How to Scam Tourists ];

// Familiar equipment
static item FAMILIAR_JACKS = $item[ box of Familiar Jacks ];
static item LIBERTY_COSTUME = $item[ li'l liberty costume ];
static item PIRATE_COSTUME = $item[ li'l pirate costume ];
static item NINJA_COSTUME = $item[ li'l ninja costume ];
static item PIRATE_FLEDGES = $item[ pirate fledges ];		// To get Pirate Costume

// Items needed or useful for adventuring
static item PANTSGIVING = $item[ Pantsgiving ];
static item DRASTIC_SCROLL = $item[scroll of drastic healing ];

// Items needed for busting ghosts
static item PROTONIC_ACCELERATOR_PACK = $item[ protonic accelerator pack ];
static item TALISMAN_O_NAMSILAT = $item[ Talisman o' Namsilat ];

// Items needed for summoning demons
static item EVIL_SCROLL = $item[ scroll of ancient forbidden unspeakable evil ];
static item THIN_BLACK_CANDLE = $item[ thin black candle ];

// God Lobster items
static item GOD_LOBSTER_SCEPTER = $item[ God Lobster's Scepter ];
static item GOD_LOBSTER_RING = $item[ God Lobster's Ring ];
static item GOD_LOBSTER_ROD = $item[ God Lobster's Rod ];
static item GOD_LOBSTER_ROBE = $item[ God Lobster's Robe ];
static item GOD_LOBSTER_CROWN = $item[ God Lobster's Crown ];

// Voting Monster items
static item MUTANT_ARM = $item[ mutant arm ];
static item MUTANT_LEGS = $item[ mutant legs ];
static item MUTANT_CROWN = $item[ mutant crown ];

// Eating, Drinking, and Spleening
static item FOODCONE = $item[ Dinsey food-cone ];		// EPIC 2 full food, 30 Meat Drop +80
static item HORSERADISH = $item[ jumping horseradish ];		// EPIC 1 full food: 50 Meat Drop +100
static item SPAGHETTI_BREAKFAST = $item[ spaghetti breakfast ];
static item BLUEBERRY_MUFFIN = $item[ blueberry muffin ];
static item BRAN_MUFFIN = $item[ bran muffin ];
static item CHOCOLATE_CHIP_MUFFIN = $item[ chocolate chip muffin ];
static item MUFFIN_TIN = $item[ earthenware muffin tin ];
static item TWINKLY_WAD = $item[ twinkly wad ];			// cheap 1 spleen toxin

// Nightcaps
static item TPS = $item[ tiny plastic sword ];

// Items for Barf Mountain
static item FUN_FUNDS = $item[ FunFunds&trade; ];
static item SCAM_BOOK = $item[ How to Avoid Scams ];
static item LUBE_SHOES = $item[ lube-shoes ];
static item MAYFLY_BAIT = $item[ mayfly bait necklace ];

// Milk and its ingredients
static item MAGNESIUM = $item[ milk of magnesium ];
static item GOATS_MILK = $item[ glass of goat's milk ];
static item REAGENT = $item[ scrumptious reagent ];

// Items needed for daily-limited actions
static item PSYCH_JAR = $item[ psychoanalytic jar];
static item GAME_GRID_TOKEN = $item[ Game Grid token];
static item LEGENDARY_BEAT = $item[ The Legendary Beat];
static item LICENSE_TO_CHILL = $item[ License to Chill ];
static item PYEC = $item[ Platinum Yendorian Express Card ];

// Items you can create using Nash Crosby's Still
static item_set STILL_ITEMS = $items[
     bottle of Calcutta Emerald,
     bottle of Definit,
     bottle of Domesticated Turkey,
     bottle of Jorge Sinsonte,
     bottle of Lieutenant Freeman,
     boxed champagne,
     cocktail onion,
     kiwi,
     kumquat,
     raspberry,
     tangerine,
     tonic water
];

static location BARRR = $location[ Barrrney's Barrr ];
static location BELOWDECKS = $location[ Belowdecks ];
static location COVE = $location[ The Obligatory Pirate's Cove ];
static location DMT = $location[ The Deep Machine Tunnels ];
static location NEP = $location[ The Neverending Party ];
static location NINJA_LAIR = $location[ Lair of the Ninja Snowmen ];
static location PALINDOME = $location[ Inside the Palindome ];
static location NOOB_CAVE = $location[ Noob Cave ];
static location SNOJO = $location[ The X-32-F Combat Training Snowman ];
static location SPEAKEASY = $location[ An Unusually Quiet Barroom Brawl ];
static location TUNNEL = $location[ The Tunnel of L.O.V.E. ];

static monster TIME_PRANK = $monster[ time-spinner prank ];

static skill ADVANCED_SAUCECRAFTING = $skill[ Advanced Saucecrafting ];
static skill BOWL_STRAIGHT_UP = $skill[ Bowl Straight Up ];
static skill COCOON = $skill[ Cannelloni Cocoon ];
static skill EVOKE_ELDRITCH_HORROR = $skill[ Evoke Eldritch Horror ];
static skill GALLAPAGOSIAN_MATING_CALL = $skill[ Gallapagosian Mating Call ];
static skill INIGO_SKILL = $skill[ Inigo's Incantation of Inspiration ];
static skill ODE_SKILL = $skill[ The Ode to Booze];
static skill SPAGHETTI_BREAKFAST_SKILL = $skill[ Spaghetti Breakfast ];
static skill OLFACTION = $skill[ Transcendent Olfaction ];
static skill THINGFINDER = $skill[ The Ballad of Richie Thingfinder ];

// Combat skills
static skill ENTANGLING_NOODLES = $skill[ Entangling Noodles ];
static skill DIGITIZE_SKILL = $skill[ Digitize ];
static skill EXTRACT_SKILL = $skill[ Extract ];

record buffbot
{
    string name;
    string command;
};

static buffbot BUFFY = new buffbot( "Buffy", "send to buffy || The Ode to Booze" );
static buffbot TESTUDINATA = new buffbot( "Testudinata", "csend 1 meat to Testudinata" );
static buffbot NOBLESSE_OBLIGE = new buffbot( "Noblesse Oblige", "csend 15 meat to Noblesse Oblige" );

// Let's iterate over all items and make item_sets  based on thing we care about.

static item_set chocolates;
static item_set potion_candies;
static item_set food_candies;
static item_set other_candies;

static {
    foreach it in $items[] {
	if ( it.candy ) {
	    item_set iset =
		( it.item_type() == "potion" ) ? potion_candies :
		( it.fullness > 0 ) ? food_candies :
		other_candies;
	    iset [ it ] = true;
	}
	if ( it.chocolate ) {
	    chocolates [ it ] = true;
	}
    }
}

// Items you can get by consulting with Madame Zatara
static item_set ZATARA_PRIZES = $items[
     // Incompatible word 1
     Swedish massage fish,
     heart-shaped candy whetstone,
     Bustle Hustler,
     Third Base,
     // Compatible word 1
     eaves droppers,
     heart cozy,
     Lolsipop,
     personal graffiti kit,
     // Incompatible word 2
     tonic o' Banderas,
     Bettie page,
     Fabiotion,
     heather graham cracker,
     // Compatible word 2
     Mysterious Black Box,
     Mysterious Blue Box,
     Mysterious Green Box,
     Mysterious Red Box,
     // Incompatible word 3
     genie's turbane,
     genie's scimitar,
     genie's pants,
     genie's bracers,
     // Compatible word 3
     psychic's circlet,
     psychic's crystal ball,
     psychic's pslacks,
     psychic's amulet,
     // Rare
     How To Get Bigger Without Really Trying,
     Illustrated Mating Rituals of the Gallapagos,
     Convincing People You Can See The Future,
     Love Potions and the Wizards who Mix Them,
     They'll Love You In Rhinestones,
     Silly Little Love Song,
];

// ****** Configuration ******

// Here are configurable variables which are not tied to properties; if
// you want to change them, you must edit the script and the changes
// will apply to all characters.

// Each of the following item sets must contain at least one
// item. Otherwise, ASH will give you a set of ALL items.
//
// If you want no items in a particular set, use "none" as the only
// element.

// Removed "complex" candies:
//
//     breath mint
//     Crimbo peppermint bark
//     Crimbo fudge
//     Crimbo candied pecan
//     peanut brittle shield
//     peppermint sprout
//     sugar sheet

// Items found in The Hidden Office Building which will be "used"
// *** Must contain at least one token. Use "none" for no items.
static item_set OFFICE_USE_LOOT = $items[
     briefcase
];

// Items found in The Hidden Office Building which will be autosold
// *** Must contain at least one token. Use "none" for no items.
static item_set OFFICE_AUTOSELL_LOOT = $items[
     adder,
     attorney's badge,
     bone abacus,
     fat stacks of cash,
     headhunter necktie,
     pointed stick,
     pygmy briefs,
     short calculator,
     short writ of habeas corpus,
     world's smallest violin
];

// Items found in Barf Mountain which will be "used" (keeping one)
// *** Must contain at least one token. Use "none" for no items.
static item_set BARF_USE_LOOT = $items[
     bag of park garbage
];

// Items found in Barf Mountain which will be autosolf (keeping one)
// *** Must contain at least one token. Use "none" for no items.
static item_set BARF_AUTOSELL_LOOT = $items[
     cheap sunglasses,
     expensive camera,
     filthy child leash
];

// Items dropped by Mr. Screege's spectacles or other equipment which will be "used"
// *** Must contain at least one token. Use "none" for no items.
static item_set GENERAL_USE_LOOT = $items[
     ancient vinyl coin purse,
     black pension check,
     CSA discount card,
     duct tape wallet,
     fat wallet,
     old coin purse,
     old leather wallet,
     pixel coin,
     pixellated moneybag,
     shiny stones,
     solid gold jewel,
     stolen meatpouch,
     Gathered Meat-Clip
];

// Items dropped by Mr. Screege's spectacles or other equipment which will be autosold
// *** Must contain at least one token. Use "none" for no items.
static item_set GENERAL_AUTOSELL_LOOT = $items[
     1952 Mickey Mantle card,
     decomposed boot,
     dense meat stack,
     dollar-sign bag,
     gold nuggets,
     half of a gold tooth,
     huge gold coin,
     leather bookmark,
     massive gemstone,
     meat stack,
     pile of gold coins,
];

// Items dropped by breakfast which will be "used"
// *** Must contain at least one token. Use "none" for no items.
static item_set BREAKFAST_USE_LOOT = $items[
     fisherman's sack
];

// Items dropped by breakfast which will be autosold
// *** Must contain at least one token. Use "none" for no items.
static item_set BREAKFAST_AUTOSELL0_LOOT = $items[
     Angry Farmer candy,
     marzipan skull,
     Tasty Fun Good rice candy,
     toast,
     Crimbo Candy Cookbook,
     Jack-in-the-box
];

// Items dropped by breakfast which will be autosold (keeping one)
// *** Must contain at least one token. Use "none" for no items.
static item_set BREAKFAST_AUTOSELL1_LOOT = $items[
     Red Rover BB gun,
     red-and-green sweater,
];

// Items dropped by breakfast which will be placed in your mall store
// *** Must contain at least one token. Use "none" for no items.
static item_set BREAKFAST_MALLSELL0_LOOT = $items[
     Taco Dan's Taco Stand Taco,
     Taco Dan's Taco Stand Chimichangarita,
     Taco Dan's Taco Stand Chillacious Churro,

     Trivial Avocations Card: What?,
     Trivial Avocations Card: When?,
     Trivial Avocations Card: Who?,
     Trivial Avocations Card: Where?,

     Yummy Tummy bean,

     Pack of Alice's Army Cards,
     Ye Wizard's Shack snack voucher,

     watered-down Red Minotaur,
     pool torpedo,
     Ze&trade; goggles,
     soggy used band-aid,
     stylish swimsuit,
     lost key,
];

// Items dropped by breakfast which will be placed in your mall store (keeping one)
// *** Must contain at least one token. Use "none" for no items.
static item_set BREAKFAST_MALLSELL1_LOOT = $items[
     &quot;DRINK ME&quot; potion,
];

static
{
    string [int] PRANK_GREETINGS;

    void prank_greeting( string message )
    {
	PRANK_GREETINGS[ count( PRANK_GREETINGS ) ] = message;
    }

    prank_greeting( "Booga booga!" );
    prank_greeting( "Tag! You're it!" );
    prank_greeting( "Didn't I just see you?" );
    prank_greeting( "Why are there so many %FRIEND%s in my timestream?" );
    prank_greeting( "Now that you have found me, I must kill you. Sorry." );
    prank_greeting( "Our tentacled masters demand I implant this tentacle in your head. Just hold still now..." );
    prank_greeting( "Salad salad salad salad salad!" );

    // We will send a randomly selected greeting to randomly selected
    // players from your list until you run out of either Time-Spinner
    // minutes or prospective victims who do not already have someone
    // lurking in their time stream.
}

// Where to go for Ode
buffbot[int] buffbots {
    1 : BUFFY,
    2 : TESTUDINATA,
    3 : NOBLESSE_OBLIGE
};

// You can define others above, but this seems like a reasonable ordering

// ***************************
// *     Initialization      *
// ***************************

boolean can_ode = have_skill( ODE_SKILL );
boolean can_inigo = have_skill( INIGO_SKILL );
boolean can_invoke_eldritch_horror = have_skill( EVOKE_ELDRITCH_HORROR );
boolean can_noodle = have_skill( ENTANGLING_NOODLES );
boolean can_emit_mating_call = have_skill( GALLAPAGOSIAN_MATING_CALL );
boolean can_olfact = have_skill( OLFACTION );
boolean can_bowl = available_amount( COSMIC_BOWLING_BALL ) > 0 || get_property( "cosmicBowlingBallReturnCombats" ).to_int() >= 0;
boolean can_sauce = have_skill( ADVANCED_SAUCECRAFTING );
boolean have_barrel_shrine = get_property( "barrelShrineUnlocked" ).to_boolean();
boolean have_chateau = get_property( "chateauAvailable" ).to_boolean();
boolean have_detective_school = get_property( "hasDetectiveSchool" ).to_boolean();
boolean have_game_grid_token = ( available_amount( GAME_GRID_TOKEN ) > 0 );
boolean have_lovebugs = get_property( "lovebugsUnlocked" ).to_boolean();
boolean have_protonic_accelerator = ( available_amount( PROTONIC_ACCELERATOR_PACK ) > 0 );
boolean have_psych_jar = ( available_amount( PSYCH_JAR ) > 0 );

// Adjust configured variables to conform with what is actually
// available to this character.

// Select an outfit suitable for busting ghosts at the Icy Peak
string icy_peak_ghost_outfit =
    have_outfit( icy_peak_outfit ) ? icy_peak_outfit :
    have_outfit( "Slimesuit" ) ? "Slimesuit" :
    "eXtreme Cold-Weather Gear";

// Set this to true around invocations of external scripts that go to adventure.php.
boolean handling_counters = false;

// ***************************
// *   Utility Functions     *
// ***************************

buffer pnum( buffer b, int n )
{
    buffer pnum_helper( buffer b, int n, int level )
    {
	if ( n >= 10 ) {
	    pnum_helper( b, n / 10, level + 1 );
	}
	b.append( to_string( n % 10 ) );
	if ( level > 0 && level % 3 == 0 ) {
	    b.append( "," );
	}
	return b;
    }

    if ( n < 0 ) {
	b.append( "-" );
	n = -n;
    }
    return pnum_helper( b, n, 0 );
}

string pnum( int n )
{
    buffer b;
    return pnum( b, n ).to_string();
}

item_to_int_map load_item_map( item_list ilist )
{
    item_to_int_map map;
    foreach index, it in ilist {
	map[ it ] = available_amount( it );
    }
    return map;
}

item_to_int_map load_item_map( item_set iset )
{
    item_to_int_map map;
    foreach it in iset {
	map[ it ] = available_amount( it );
    }
    return map;
}

item find_rarest_item( item_to_int_map map )
{
    item make = $item[ none ];
    int count = MAX_INT;
    foreach it, num in map {
	if ( num < count ) {
	    make = it;
	    count = num;
	}
    }
    return make;
}

item_to_int_map item_map_difference( item_to_int_map map1, item_to_int_map map2 )
{
    item_to_int_map result;
    foreach it, map1count in map1 {
	int map2count = map2[ it ];
	if ( map1count != map2count ) {
	    result[ it ] = map2Count - map1Count;
	}
    }
    foreach it, map2count in map2 {
	int map1count = map1[ it ];
	if ( map2count != map1count ) {
	    result[ it ] = map2Count - map1Count;
	}
    }
    return result;
}

void print_item_map( item_to_int_map mapd, string label )
{
    print( label );
    foreach it, count in mapd {
	print( "\u00A0\u00A0\u00A0\u00A0" + it + " -> " + count );
    }
}

item_set to_item_set( item_to_int_map input )
{
    item_set output;
    foreach it in input {
	output[ it ] = true;
    }
    return output;
}

item_to_int_map to_item_to_int_map( item_set input )
{
    item_to_int_map output;
    foreach it in input {
	output[ it ] = 1;
    }
    return output;
}

item cheapest( item_set items )
{
    // Bulk cache mall prices
    mall_prices( items );

    item best = NO_ITEM;
    int current_best_price = MAX_INT;

    foreach candidate in items {
	int price = mall_price( candidate );
	if ( price < current_best_price ) {
	    current_best_price = price;
	    best = candidate;
	}
    }

    return best;
}

item cheapest( item member )
{
    return cheapest( to_item_set( get_related( member, "zap" ) ) );
}

item dearest( item_set items )
{
    // Bulk cache mall prices
    mall_prices( items );

    item best = NO_ITEM;
    int current_best_price = 0;

    foreach candidate in items {
	int price = mall_price( candidate );
	if ( price > current_best_price ) {
	    current_best_price = price;
	    best = candidate;
	}
    }

    return best;
}

int increment_property( string setting, int delta )
{
    int value = get_property( setting ).to_int() + delta;
    if ( delta != 0 ) {
	set_property( setting, value );
    }
    return value;
}

void use_all_but( item it, int keep )
{
    if ( it == NO_ITEM ) {
	return;
    }
    int have = item_amount( it );
    if ( have > keep ) {
	use( have - keep, it );
    }
}

void autosell_all_but( item it, int keep )
{
    if ( it == NO_ITEM ) {
	return;
    }
    int have = item_amount( it );
    if ( have > keep ) {
	autosell( have - keep, it );
    }
}

void mallsell_all_but( item it, int keep )
{
    if ( !store_available ) {
	return;
    }
    if ( it == NO_ITEM ) {
	return;
    }
    int have = item_amount( it );
    if ( have > keep ) {
	put_shop( 0, 0, have - keep, it );
    }
}

void shrug( effect eff )
{
    if ( have_effect( eff ) > 0 ) {
	cli_execute( "shrug " + eff.to_string() );
    }
}

void free_song_slot( effect eff )
{
    if ( have_effect( eff ) > 0 ) {
	return;
    }

    effect_set shruggable;
    int songs = 0;

    foreach eff in my_effects() {
	// Only Accordion Thief songs can be shrugged - or need to be
	if ( eff.song ) {
	    songs++;
	    if ( eff == POLKA_EFFECT || eff == PHAT_EFFECT ) {
		continue;
	    }
	    shruggable[ eff ] = true;
	}
    }

    int max_songs = ( boolean_modifier( "Four Songs" ) ? 4 : 3 ) + numeric_modifier( "Additional Song" );

    if ( songs < max_songs ) {
	return;
    }

    foreach eff in shruggable {
	shrug( eff );
	if ( --songs < max_songs ) {
	    return;
	}
    }
}

boolean craft_or_retrieve_item( int want, item it )
{
    int have = available_amount( it );
    int need = max( want - have, 0 );

    // If we need more than we have, perhaps retrieve_item will simply
    // buy the missing items, but it may decide that it is cheaper to
    // craft. If so, and this is a fancy concoction, it will take turns
    // to craft. If we have free crafting turns available from Rapid
    // Prototyping, those will be consumed, but still more may be
    // required. Just in case, get enough Inigo to cover them.
    if ( need > 0 && can_inigo ) {
	int turns = creatable_turns( it, need, true );
	if ( turns > 0 ) {
	    int available = 10 - get_property( "_inigosCasts" ).to_int();
	    while ( turns > 0 && available > 0 ) {
		free_song_slot( INIGO_EFFECT );
		use_skill( 1, INIGO_SKILL );
		turns = creatable_turns( it, need, true );
		available--;
	    }
	}
    }

    return retrieve_item( want, it );
}

void ode_up( int needed )
{
    if ( needed > 0 ) {
	// Make sure there is a free AT song slot
	free_song_slot( ODE_EFFECT );

	int ode_turns = have_effect( ODE_EFFECT );

	while ( needed > ode_turns ) {
	    if ( can_ode ) {
		use_skill( 1, ODE_SKILL );
		ode_turns = have_effect( ODE_EFFECT );
	    } else {
		foreach index, bot in buffbots {
		    if ( !is_online( bot.name ) ) {
			print( bot.name + " is not online" );
			continue;
		    }

		    print( "Asking " + bot.name + " for Ode" );
		    cli_execute( bot.command );
		    for i from 1 to 12 {
			print( "Waiting..." );
			waitq( 10 );
			refresh_status();
			ode_turns = have_effect( ODE_EFFECT );
			if ( ode_turns >= needed ) {
			    return;
			}
		    }
		    print( "No response in 120 seconds from " + bot.name );
		}

		if ( ode_turns < needed ) {
		    abort( "Failed to acquire Ode" );
		}
	    }
	}
    }
}

boolean retrieve_outfit( string outfit_name )
{
    item[ int ] pieces = outfit_pieces( outfit_name );
    foreach index, piece in pieces {
	if ( available_amount( piece ) == 0 ||
	     !retrieve_item( 1, piece ) ) {
	    return false;
	}
    }
    return true;
}

slot accessory_slot( item accessory )
{
    foreach sl in ACCESSORIES {
	if ( equipped_item( sl ) == accessory ) {
	    return sl;
	}
    }
    return NO_SLOT;
}

void swap_out_mayflies()
{
    // If the mayfly bait necklace is out of summons for the day and we
    // have a replacement item configured, replace it
    if ( !mayflies_may_fly && mayfly_bait_replacement != NO_ITEM ) {
	slot mayfly_slot = accessory_slot( MAYFLY_BAIT );
	if ( mayfly_slot != NO_SLOT ) {
	    equip( mayfly_slot, mayfly_bait_replacement );
	}
    }
}

void suit_up( location loc, familiar fam, item famequip, boolean meat )
{
    // PirateRealm eyepatch lowers your maximum stats and prevents you
    // from equipping items that require higher stats - even if it will
    // be removed by the outfit switch. I don't know if this is KoL or
    // KoLmafia doing this. If the latter, I will fix it - later.
    //
    // For now, unequip it if it is equipped.

    // Why is the following not a built-in function?
    item [ slot ] current_equipment;
    foreach sl in $slots[] {
	current_equipment[ sl ] = equipped_item( sl );
    }

    // If it weren't for accessories, we could have an equipped_slot()
    // function. Instead, iterate of slots and unequip all matching
    // instances of the item

    void unequip_item( item it )
    {
	foreach sl in $slots[] {
	    if ( current_equipment[ sl ] == it ) {
		equip( sl, NO_ITEM );
		current_equipment[ sl ] = NO_ITEM;
	    }
	}
    }

    static item_set troublesome_items = $items[ PirateRealm eyepatch ];
    foreach it in troublesome_items {
	if ( have_equipped( it ) ) {
	    unequip_item( it );
	}
    }

    switch ( loc ) {
    case BARF_MOUNTAIN:
	outfit( barf_outfit );
	use_familiar( fam );
	break;
    case ICY_PEAK:
	outfit( icy_peak_outfit );
	use_familiar( fam );
	break;
    case DMT:
	outfit( dmt_outfit );
	use_familiar( MACHINE_ELF );
	break;
    case NEP:
	outfit( nep_outfit );
	use_familiar( fam );
	break;
    case TUNNEL:
	outfit( lov_ensemble );
	// LOV Engineer will not drop LOV Elixer #6 if your familiar acts
	use_familiar( NO_FAMILIAR );
	return;
    default:
	outfit( meat ? farm_outfit : item_outfit );
	use_familiar( fam );
	break;
    }

    swap_out_mayflies();
    
    // If unspecified, use whatever the familiar is already wearing
    if ( fam != NO_FAMILIAR && famequip != NO_ITEM ) {
	equip( famequip );
    }
}

void suit_up( location loc, familiar fam, boolean meat )
{
    item famequip = default_famequip;

    switch ( fam ) {
    case TOT:
	if ( meat ) {
	    famequip = ( available_amount( PIRATE_COSTUME ) > 0 ? PIRATE_COSTUME :
			 available_amount( LIBERTY_COSTUME ) > 0 ? LIBERTY_COSTUME :
			 default_famequip );
	} else {
	    famequip = ( available_amount( NINJA_COSTUME ) > 0 ? NINJA_COSTUME :
			 available_amount( LIBERTY_COSTUME ) > 0 ? LIBERTY_COSTUME :
			 default_famequip );
	}
	break;
    case ROBORTENDER:
	switch ( robortender_item ) {
	case "bartend":
	    // Should already be wearing the correct item
	    famequip = BARTEND_SWITCH;
	    break;
	case "bounce":
	    // Should already be wearing the correct item
	    famequip = BOUNCE_SWITCH;
	    break;
	case "equipped":
	    famequip = NO_ITEM;
	    break;
	case "default":
	    break;
	}
	break;
    }

    suit_up( loc, fam, famequip, meat );
}

void suit_up( location loc, familiar fam, item famequip )
{
    suit_up( loc, fam, famequip, farm_type == "meat" );
}

void suit_up( location loc, familiar fam )
{
    suit_up( loc, fam, farm_type == "meat" );
}

void suit_up( location loc )
{
    suit_up( loc, default_familiar, farm_type == "meat" );
}

familiar summoned_monster_familiar()
{
    // Choose an appropriate familiar for fighting monsters you've chosen to summon:
    // 
    //   photocopied monster via deluxe fax machine
    //   deck of every card
    //   genie wish
    //
    // "copied_monster_familiar" lets you specifiy this exactly

    if ( copied_monster_familiar != NO_FAMILIAR ) {
	return copied_monster_familiar;
    }

    // Otherwise, use a Meat Drop or Item Drop familiar depending on whether you are farming Meat or Items
    return default_familiar;
}

int timespinner_minutes_left()
{
    return have_timespinner ? ( 10 - get_property( "_timeSpinnerMinutesUsed" ).to_int() ) : 0;
}

string timespinner_replicator_option( int minutes_left )
{
    // If we don't want to get an item, punt
    if ( !( FAR_FUTURE_OPTION contains far_future_item ) ) {
	return "";
    }

    // If we don't have time to to get an item or have already gotten one today, punt
    if ( minutes_left < 2 || get_property( "_timeSpinnerReplicatorUsed" ).to_boolean() ) {
	return "";
    }

    // If today is April Fool's Day, Ezandora's script gets overwhelmed by salads
    if ( holiday.contains_text( "April Fool's Day" ) ) {
	return "";
    }

    // If we don't have Ezandora's script installed, punt
    if ( !check_installed( ezandora_far_future ) ) {
	return "";
    }

    return FAR_FUTURE_OPTION[ far_future_item ];
}

void between_battle_checks()
{
    // Call this between fights initiated via visit_url to keep your
    // mood up-to-date and to recover HP and MP, as specified by your
    // recoveryScript or your configured recovery settings.
    mood_execute( -1 );
    restore_hp( 0 );
    restore_mp( 0 );
}

boolean will_fight_voters()
{
    // If we don't want to fight voters - or have not voted - don't fight.
    if ( !have_voter_sticker || fight_voters == "never" ) {
	return false;
    }

    // We get 3 free fights per day. Always use those.
    int free_fights_left = 3 - get_property( "_voteFreeFights" ).to_int();
    if ( free_fights_left > 0 ) {
	return true;
    }

    // If we only want free fights, skip this fight.
    if ( fight_voters == "free" ) {
	return false;
    }

    // If we only want to fight certain monsters, fight only if today's monster is acceptable
    if ( fight_voters == "monsters" ) {
	monster current_monster = get_property( "_voteMonster" ).to_monster();
	boolean will_fight = ( current_monster == NO_MONSTER ) ? true : ( vote_monsters contains current_monster );
	return will_fight;
    }

    // We want to fight all monsters, all the time
    return true;
}

void install_workshed_item( item workshed )
{
    if ( workshed != NO_ITEM && workshed != get_workshed() ) {
	use(1, workshed);
    }
}

typedef int organ;

static organ LIVER = 1;
static organ STOMACH = 2;
static organ SPLEEN = 3;

int capacity( organ o )
{
    switch ( o ) {
    case LIVER:
	return inebriety_limit();
    case STOMACH:
	return fullness_limit();
    case SPLEEN:
	return spleen_limit();
    }
    return 0;
}

int used( organ o )
{
    switch ( o ) {
    case LIVER:
	return my_inebriety();
    case STOMACH:
	return my_fullness();
    case SPLEEN:
	return my_spleen_use();
    }
    return 0;
}

string to_string( organ o )
{
    switch ( o ) {
    case LIVER:
	return "liver";
    case STOMACH:
	return "stomach";
    case SPLEEN:
	return "spleen";
    }
    return 0;
}

int consumable_size( organ o, item it )
{
    switch ( o ) {
    case LIVER:
	return it.inebriety;
    case STOMACH:
	return it.fullness;
    case SPLEEN:
	return it.spleen;
    }
    return 0;
}

typedef consumable [int] consumables_by_size;

consumables_by_size best_consumables( organ o, int mpa )
{
    switch ( o ) {
    case LIVER:
    {
	consumables_by_size retval = vcon_best_boozes;
	if ( count( retval ) == 0 ) {
	    calculate_best_boozes( mpa );
	}
	return retval;
    }
    case STOMACH:
    {
	consumables_by_size retval = vcon_best_foods;
	if ( count( retval ) == 0 ) {
	    calculate_best_foods( mpa );
	}
	return retval;
    }
    case SPLEEN:
    {
	consumables_by_size retval = vcon_best_spleens;
	if ( count( retval ) == 0 ) {
	    calculate_best_spleens( mpa );
	}
	return retval;
    }
    }

    consumables_by_size retval;
    return retval;
}

void reset_best_consumables( organ o, item it )
{
    // Exclude this consumable from consideration by vcon
    user_excluded_consumables[ it ] = true;

    // Force recalculateion
    switch ( o ) {
    case LIVER:
	vcon_best_boozes.clear();
	break;
    case STOMACH:
	vcon_best_foods.clear();
	break;
    case SPLEEN:
	vcon_best_spleens.clear();
	break;
    }
}

// Forward references
void eat_food( int count, item food );

void consume( organ o, int count, item consumable )
{
    switch ( o ) {
    case LIVER:
	drink( count, consumable );
	return;
    case STOMACH:
	eat_food( count, consumable );
	return;
    case SPLEEN:
	chew( count, consumable );
	return;
    }
}

void fill( organ o, int needed, boolean sim )
{
    // If the organ is not full, find profitable adventure producing
    // items we can use.

    if ( needed <= 0 ) {
	return;
    }

    item_to_int_map compact( consumable_diet diet )
    {
	// Combine multiples of each item.
	item_to_int_map retval;
	foreach index, c in diet {
	    retval[ c.it ]++;
	}
	return retval;    
    }

    while ( needed > 0 ) {
	consumables_by_size best = o.best_consumables( vcon_mpa() );
	consumable_diet diet = calculate_diet( best, needed );

	if ( diet.count() == 0 ) {
	    print( "Failed to create a diet to fill " + needed + " " + o, "red" );
	    break;
	}

	foreach it, count in diet.compact() {
	    int size = o.consumable_size( it );

	    if ( sim ) {
		print( "Consuming " + count + " " + it + " @ " + size + " " + o );
		needed -= count * size;
		continue;
	    }

	    if ( !craft_or_retrieve_item( count, it ) ) {
		// We can't get the item we want to consume. This can happen
		// if there is only a single vendor for the desired consumable
		// whose limit is too austere to allow us to purchase it.

		// We'll tell vcon to exclude this item and recalculate.
		o.reset_best_consumables( it );
		break;
	    }

	    o.consume( count, it );
	    needed -= count * size;
	}
    }
}

void fill( organ o, boolean sim )
{
    int capacity = o.capacity();
    int current = o.used();
    o.fill( capacity - current, sim );	
}

void fill( organ o, int needed )
{
    o.fill( needed, false );
}

void fill( organ o )
{
    o.fill( false );
}

void run_available_choice( int... choices )
{
    if ( handling_choice() ) {
	string [int] available = available_choice_options();
	foreach i, choice in choices {
	    if ( available contains choice ) {
		run_choice( choice );
		return;
	    }
	}
    }
}

// ***************************
// *      Experimental       *
// ***************************

// Semirare hunting is dead. R.I.P.

// However, the price analysis code is still potentially
// interesting. For something.

// Semirare items from locations that drop a single item type

item_set known_semirare_items = $items[
    Flamin' Whatshisname,		// (3)	
    cube of billiard chalk,
    Bram's choker,
    freezerburned ice cube,
    black eyedrops,
    tasty tart,				// (3)	
    distilled fortified wine,		// (3)	
    can of spinach,
    bottle of antifreeze,
    cyclops eyedrops,
    death blossom,
    miniature boiler,
    unnatural gas,
    red foxglove,
    Red Fox glove,			// rare
    Dogsgotnonoz pills,
    Super Weight-Gain 9000,
    possibility potion,
    Mick's IcyVapoHotness Inhaler,
    Eau de Guaneau,
    scented massage oil,		//  (3)
    bottle of Mystic Shell,
    irradiated pet snacks,
    poltergeist-in-the-jar-o,
    Knob Goblin lunchbox,	
    donkey flipbook,
    SPF 451 lip balm,
    shrinking powder,
    stone wool,				//  (1-3)
    [2426]fire flower,
    fake blood,
    bag of lard,
    teeny-tiny magic scroll,
    bottle of rhinoceros hormones,
    bottle of pirate juice,
];

item_set known_special_semirare_items = $items[
    jar of squeeze,			// (5 hobo nickels)
    bowl of fishysoisse,		// (5 hobo nickels)
    concentrated garbage juice,		// (5 hobo nickels)
    deadly lampshade,			// (5 hobo nickels)
    lewd playing card,			// (5 hobo nickels)
    giant pearl,			// The Sea
    long-forgotten necklace,		// The Sea
    shavin' razor,			// The Sea
    pixel stopwatch,			// Vanya's Castle
    folder (KOLHS),			// KOLHS
];

void semirare_values()
{
    void prime_prices( item_set iset ) {
	foreach it in iset {
	    mall_price( it );
	}
    }

    void print_prices( item_set iset ) {
	foreach it in iset {
	    print( it.name + " = " + pnum( mall_price( it ) ) + " Meat" );
	}
    }

    prime_prices( known_semirare_items );
    prime_prices( known_special_semirare_items );

    print( "" );
    print( "Semirares from normal adventure locations");
    print( "" );
    print_prices( known_semirare_items );

    print( "" );
    print( "Semirares from special adventure locations");
    print( "" );
    print_prices( known_special_semirare_items );
}

record chocolate
{
    item it;		// The item
    int counter;	// Which chocolate counter
    int[3] advs;	// Adventure progression
    class cl;		// associated class, if any
};

// Chocolate counters
int CHOCOLATE = 1;
int CHOCOLATE_SPACE = 2;
int CHOCOLATE_ART = 3;
int CHOCOLATE_NANOBOT = 4;
int CHOCOLATE_TOBACCO = 5;

chocolate [] chocolate_data = {
    // "space" chocolates
    new chocolate( $item[ LOV Extraterrestrial Chocolate ], CHOCOLATE_SPACE, { 3, 2, 1 }, NO_CLASS ),
    // "art" chocolates
    new chocolate( $item[ fancy chocolate sculpture ], CHOCOLATE_ART, { 5, 3, 1 }, NO_CLASS ),
    // "nanobot" chocolates
    new chocolate( $item[ vitachoconutriment capsule ], CHOCOLATE_NANOBOT, { 5, 3, 1 }, NO_CLASS ),
    // "tobacco" chocolates
    new chocolate( $item[ chocolate cigar ], CHOCOLATE_TOBACCO, { 5, 3, 1 }, NO_CLASS ),
    // regular chocolates
    new chocolate( $item[ fancy chocolate ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS ),
    new chocolate( $item[ fancy but probably evil chocolate ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS ),
    new chocolate( $item[ fancy chocolate car ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS ),
    new chocolate( $item[ beet-flavored Mr. Mediocrebar ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS ),
    new chocolate( $item[ cabbage-flavored Mr. Mediocrebar ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS ),
    new chocolate( $item[ sweet-corn-flavored Mr. Mediocrebar ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS ),
    new chocolate( $item[ choco-Crimbot ], CHOCOLATE, { 5, 3, 1 }, NO_CLASS  ),
    // class-tuned chocolates; give one fewer adventure if not corresponding class
    new chocolate( $item[ chocolate seal-clubbing club ], CHOCOLATE, { 3, 2, 1 }, $class[ seal clubber ] ),
    new chocolate( $item[ chocolate turtle totem ], CHOCOLATE, { 3, 2, 1 }, $class[ turtle tamer ] ),
    new chocolate( $item[ chocolate pasta spoon ], CHOCOLATE, { 3, 2, 1 }, $class[ pastamancer ] ),
    new chocolate( $item[ chocolate saucepan ], CHOCOLATE, { 3, 2, 1 }, $class[ sauceror ] ),
    new chocolate( $item[ chocolate disco ball ], CHOCOLATE, { 3, 2, 1 }, $class[ disco bandit ] ),
    new chocolate( $item[ chocolate stolen accordion ], CHOCOLATE, { 3, 2, 1 }, $class[ accordion thief ] ),
};

void chocolate_values()
{
    // Strictly based on chocolate itemIds, as precalculated
    mall_prices( chocolates );

    foreach choc in chocolates {
	print( choc + " = " + pnum( mall_price( choc ) ) + " Meat" );
    }
}

// ***************************
// *     Combat Filters      *
// ***************************

boolean pickpocket_available = false;
boolean using_pantsgiving = false;
boolean extract_available = false;
boolean love_gnats_available = false;
boolean mayflies_available = false;
boolean rain_doh_available = false;
boolean spooky_putty_available = false;
boolean should_sing_along = false;

void combat_filter_setup( location loc )
{
    // Exclude Witchess and Snojo fights
    pickpocket_available = loc != NO_LOCATION && loc != SNOJO;
    using_pantsgiving = have_equipped( PANTSGIVING );
    extract_available = should_extract && can_extract;
    love_gnats_available = have_lovebugs;
    mayflies_may_fly = get_property( "_mayflySummons" ).to_int() < 30;
    mayflies_available = mayflies_may_fly && ( loc == BARF_MOUNTAIN ) && have_equipped( MAYFLY_BAIT );
    should_sing_along = boombox_sing_along_songs contains boombox_song_to_keyword[ current_boombox_song ];
}

string choose_combat_filter( location loc )
{
    combat_filter_setup( loc );

    if ( loc == DMT ) {
	return "dmt_filter";
    }

    if ( my_familiar() == HOBO_MONKEY ) {
	return "hobo_monkey_filter";
    }

    return "default_filter";
}

string hobo_monkey_filter( int round, monster mon, string page )
{ 
    static boolean gave_meat = false;
    static boolean pocket_crumbs = false;
    static boolean summoned_mayflies = false;
    static boolean extracted = false;
    static boolean sang_along = false;
    static boolean emitted_mating_call = false;

    boolean should_olfact = can_olfact && combat_skill_available( OLFACTION ) && olfaction_targets contains mon;
    boolean should_bowl = combat_skill_available( BOWL_STRAIGHT_UP );
    boolean should_emit_mating_call = can_emit_mating_call && olfaction_targets contains mon && mon != get_property( "_gallapagosMonster" ).to_monster();

    if ( round == 0 ) {
	gave_meat = false;
	pocket_crumbs = !using_pantsgiving;
	extracted = !extract_available || ( my_mp() < mp_cost( EXTRACT_SKILL ) );
	summoned_mayflies = !mayflies_available || ( mon == time_prank );
	sang_along = false;
	emitted_mating_call = false;
    }

    if ( !gave_meat ) {
	// If we have Haiku or Anapests, we cannot recognize gaining
	// Meat from our Hobo Monkey
	boolean haiku = have_effect( HAIKU_EFFECT ) > 0;
	boolean anapests = have_effect( ANAPEST_EFFECT ) > 0;
	gave_meat = haiku || anapests || page.contains_text( "where did he find that?" );
    }

    if ( pickpocket_available && can_still_steal() ) {
	return "\"pickpocket\"";
    }

    // We want to use items and cast spells even if
    // Hobo Monkey already gave us Meat

    if ( should_sing_along && !sang_along ) {
	sang_along = true;
	return "skill Sing Along";
    }

    if ( !pocket_crumbs ) {
	pocket_crumbs = true;
	return "skill Pocket Crumbs";
    }

    if ( !summoned_mayflies ) {
	summoned_mayflies = true;
	return "skill Summon Mayfly Swarm";
    }

    if ( should_olfact ) {
	return "skill Transcendent Olfaction";
    }

    if ( should_bowl ) {
	return "skill Bowl Straight Up";
    }

    if ( should_emit_mating_call && !emitted_mating_call ) {
	emitted_mating_call = true;
	return "skill Gallapagosian Mating Call";
    }

    if ( !extracted ) {
	extracted = true;
	return "skill Extract";
    }

    // Let the CCS take over if we already got Meat

    // Or not. KoLmafia will start the CCS from the beginning, even if
    // we have already pickpocketed, for example.

    // Assume you are running with a sparse CCS without extra actions at
    // the beginning.

    if ( gave_meat ) {
	return "";
    }

    // Otherwise, stasis

    return "item " + stasis_item + ",none";
}

string dmt_filter( int round, monster mon, string page )
{ 
    static boolean pocket_crumbs = false;
    static boolean used_abstraction = false;
    static boolean extracted = false;

    if ( round == 0 ) {
	pocket_crumbs = !using_pantsgiving;
	extracted = !extract_available || ( my_mp() < mp_cost( EXTRACT_SKILL ) );
	used_abstraction = false;
    }

    if ( pickpocket_available && can_still_steal() ) {
	return "\"pickpocket\"";
    }

    if ( !pocket_crumbs ) {
	pocket_crumbs = true;
	return "skill Pocket Crumbs";
    }

    if ( !used_abstraction ) {
	used_abstraction = true;

	item abstraction = $item[ none ];
	switch ( mon ) {
	case $monster[ Perceiver of Sensations ]:
	    abstraction = $item[ abstraction: thought ];
	    break;
	case $monster[ Performer of Actions ]:
	    abstraction = $item[ abstraction: sensation ];
	    break;
	case $monster[ Thinker of Thoughts ]:
	    abstraction = $item[ abstraction: action ];
	    break;
	}

	if ( abstraction != $item[ none ] && item_amount( abstraction ) > 1 ) {
	    return "item " + abstraction + ",none";
	}
    }

    if ( !extracted ) {
	extracted = true;
	return "skill Extract";
    }
    
    return "";
}

string putty_filter( int round, monster mon, string page )
{ 
    static boolean pocket_crumbs = false;
    static boolean rain_doh = false;
    static boolean spooky_putty = false;
    static boolean extracted = false;
    static boolean sang_along = false;

    if ( round == 0 ) {
	pocket_crumbs = !using_pantsgiving;
	rain_doh = !rain_doh_available;
	spooky_putty = !spooky_putty_available;
	extracted = !extract_available || ( my_mp() < mp_cost( EXTRACT_SKILL ) );
	sang_along = false;
    }

    if ( pickpocket_available && can_still_steal() ) {
	return "\"pickpocket\"";
    }

    if ( should_sing_along && !sang_along ) {
	sang_along = true;
	return "skill Sing Along";
    }

    if ( !pocket_crumbs ) {
	pocket_crumbs = true;
	return "skill Pocket Crumbs";
    }

    if ( !rain_doh ) {
	rain_doh = true;
	return "item Rain-Doh black box,none";
    }

    if ( !spooky_putty ) {
	spooky_putty = true;
	return "item Spooky Putty sheet,none";
    }

    if ( !extracted ) {
	extracted = true;
	return "skill Extract";
    }

    return "";
}

string default_filter( int round, monster mon, string page )
{ 
    static boolean pocket_crumbs = false;
    static boolean summoned_mayflies = false;
    static boolean extracted = false;
    static boolean sang_along = false;
    static boolean emitted_mating_call = false;

    boolean should_olfact = can_olfact && combat_skill_available( OLFACTION ) && olfaction_targets contains mon;
    boolean should_bowl = combat_skill_available( BOWL_STRAIGHT_UP );
    boolean should_emit_mating_call = can_emit_mating_call && olfaction_targets contains mon && mon != get_property( "_gallapagosMonster" ).to_monster();

    if ( round == 0 ) {
	pocket_crumbs = !using_pantsgiving;
	summoned_mayflies = !mayflies_available || ( mon == time_prank );
	extracted = !extract_available || ( my_mp() < mp_cost( EXTRACT_SKILL ) );
	sang_along = false;
	emitted_mating_call = false;
    }

    if ( pickpocket_available && can_still_steal() ) {
	return "\"pickpocket\"";
    }

    if ( should_sing_along && !sang_along ) {
	sang_along = true;
	return "skill Sing Along";
    }

    if ( !pocket_crumbs ) {
	pocket_crumbs = true;
	return "skill Pocket Crumbs";
    }

    if ( !summoned_mayflies ) {
	summoned_mayflies = true;
	return "skill Summon Mayfly Swarm";
    }

    if ( should_olfact ) {
	return "skill Transcendent Olfaction";
    }

    if ( should_bowl ) {
	return "skill Bowl Straight Up";
    }

    if ( should_emit_mating_call && !emitted_mating_call ) {
	emitted_mating_call = true;
	return "skill Gallapagosian Mating Call";
    }

    if ( !extracted ) {
	extracted = true;
	return "skill Extract";
    }

    return "";
}

string bust_ghost_filter( int round, monster mon, string page )
{
    string_set subtypes = mon.sub_types;

    if ( subtypes contains "ghost" ) {
	string stun =
	    have_lovebugs ? "skill Summon Love Gnats" :
	    can_noodle ? "skill Entangling Noodles" :
	    "skip";

	switch ( round ) {
	case 0:
	    return stun;
	case 1:
	case 2:
	case 3:
	    return "skill Shoot Ghost";
	case 4:
	    return "skill Trap Ghost";
	}
    }

    return "";
}

// ***************************
// *    Combat Functions     *
// ***************************

void bust_ghost( location paranormal )
{
    if ( !have_protonic_accelerator || paranormal == NO_LOCATION ) {
	return;
    }

    switch ( paranormal ) {
    case SKELETON_STORE:
	// Make sure The Skeleton Store is available
	if ( get_property( "questM23Meatsmith" ) == "unstarted" ) {
	    visit_url( "shop.php?whichshop=meatsmith" );
	    visit_url( "shop.php?whichshop=meatsmith&action=talk" );
	    // Accept Quest/Continue quest/Done with Quest
	    run_available_choice( 1, 3, 6 );
	}
	break;

    case OVERGROWN_LOT:
	// Make sure The Overgrown Lot is available
	if ( get_property( "questM24Doc" ) == "unstarted" ) {
	    visit_url( "shop.php?whichshop=doc" );
	    visit_url( "shop.php?whichshop=doc&action=talk" );
	    // Accept Quest/Complete quest/Continue Quest
	    run_available_choice( 1, 2, 3 );
	}
	break;

    case MADNESS_BAKERY:
	// Make sure Madness Bakery is available
	if ( get_property( "questM25Armorer" ) == "unstarted" ) {
	    visit_url( "shop.php?whichshop=armory" );
	    visit_url( "shop.php?whichshop=armory&action=talk" );
	    // Accept Quest/Continue quest/Done with Quest
	    run_available_choice( 1, 3, 6 );
	}
	break;
    }

    try {
	cli_execute( "checkpoint" );

	item back_item = equipped_item( BACK );
	if ( back_item != PROTONIC_ACCELERATOR_PACK ) {
	    equip( back, PROTONIC_ACCELERATOR_PACK );
	}

	item acc3_item = equipped_item( ACC3 );
	if ( paranormal == PALINDOME && acc3_item != TALISMAN_O_NAMSILAT ) {
	    equip( ACC3, TALISMAN_O_NAMSILAT );
	}

	if ( paranormal == ICY_PEAK && numeric_modifier( "Cold Resistance" ) < 5 ) {
	    outfit( icy_peak_ghost_outfit );
	}

	catch adv1( paranormal, 0, "bust_ghost_filter" );
    }
    finally {
	cli_execute( "outfit checkpoint" );

	if ( get_property( "ghostLocation" ).to_location() != NO_LOCATION ) {
	    // We either didn't find a ghost or got new paranormal
	    // activity immediately - which is a KoL bug. Read the
	    // quest log to reset ghostLocation.
	    visit_url( "questlog.php?which=1" );
	}
    }
}

void bust_ghost()
{
    location paranormal = get_property( "ghostLocation" ).to_location();
    bust_ghost( paranormal );
}

int turns_to_ghost()
{
    int next_ghost_turn = get_property( "nextParanormalActivity" ).to_int();
    return next_ghost_turn - total_turns_played();
}

int turns_to_vote_monster()
{
    int total_turns = total_turns_played();
    int last_vote_monster = get_property( "lastVoteMonsterTurn" ).to_int();
    int next = 11 - ( ( total_turns - 1 ) % 11 );
    return ( total_turns == last_vote_monster ) ? 11 : ( next == 11 ) ? 0 : next;
}

int turns_to_mayflies_exhausted()
{
    return 30 - get_property( "_mayflySummons" ).to_int();
}

int fight_voter()
{
    // This may or may not take a turn;
    int start_turn = total_turns_played();

    // If we are not wearing the "I Voted!" sticker, put it on.
    slot swapped_slot = NO_SLOT;
    item old_accessory = NO_ITEM;
    if ( !have_equipped( I_VOTED_STICKER ) ) {
	// If wearing mayfly bait, equip it there.
	// Otherwise, pick the acc3
	slot mayfly_slot = accessory_slot( MAYFLY_BAIT );
	swapped_slot = mayfly_slot != NO_SLOT ? mayfly_slot : acc3;
	old_accessory = equipped_item( swapped_slot );
	equip( swapped_slot, I_VOTED_STICKER );
    }

    // If fighting mutants, perhaps swap in appropria mutant item
    slot mutant_slot = NO_SLOT;
    item mutant_slot_item = NO_ITEM;
    if ( get_property( "_voteMonster" ) == "terrible mutant" ) {
	// Choose which item to equip
	int count_arms = available_amount( MUTANT_ARM );
	int count_legs = available_amount( MUTANT_LEGS );
	int count_crowns = available_amount( MUTANT_CROWN );
	item mutant_item_to_equip =
	    ( count_crowns < count_legs ) ? MUTANT_LEGS :
	    ( count_legs < count_arms ) ? MUTANT_ARM :
	    ( count_crowns > 0 ) ? MUTANT_CROWN :
	    NO_ITEM;
	mutant_slot =
	    ( mutant_item_to_equip == MUTANT_ARM ) ? WEAPON :
	    ( mutant_item_to_equip == MUTANT_LEGS ) ? PANTS :
	    ( mutant_item_to_equip == MUTANT_CROWN ) ? HAT :
	    NO_SLOT;
	if ( mutant_slot != NO_SLOT ) {
	    mutant_slot_item = equipped_item( mutant_slot );
	    equip( mutant_slot, mutant_item_to_equip );
	}
    }

    // Fight the voter!

    // Don't let KoLmafia's counter stop adventuring
    stop_counter( "Vote Monster" );

    // Fight in a safe place 
    string filter = choose_combat_filter( NOOB_CAVE );
    boolean ignored = adv1( NOOB_CAVE, 1, filter );

    // If swapped mutant item, swap back
    if ( mutant_slot != NO_SLOT ) {
	equip( mutant_slot, mutant_slot_item );
    }

    if ( swapped_slot != NO_SLOT ) {
	equip( swapped_slot, old_accessory );
    }

    // If this did not take a turn, say we got the monster this turn,
    // whether or not we did; we've had a report of a KoL glitch (?) not
    // supplying the monster on the expec ted turn. Since KoLmafia will
    // not set the property, this results in an infinite loop for us.
    int turns_used = total_turns_played() - start_turn;
    if ( turns_used == 0 ) {
	set_property( "lastVoteMonsterTurn", start_turn );
    }

    return turns_used;
}

void do_adventure( location loc, boolean one_turn, int choice )
{
    // If we're overdrunk, don't even think about adventuring
    if ( my_inebriety() > inebriety_limit() ) {
	return;
    }

    // This calls combat_filter_setup( loc ), which will set
    // using_pantsgiving as appropriate
    string filter = choose_combat_filter( loc );
    boolean have_goals = count( get_goals() ) > 0;

    // Requesting either one turn or (up to) all remaining turns
    int turns = one_turn ? 1 : my_adventures();

    int fill_stomach()
    {
	// Pantsgiving could have given us some fullness
	int full_remaining = fullness_limit() - my_fullness();
	if ( full_remaining <= 0 ) {
	    return 0;
	}

	// Hard to imagine we got here without using magnesium today,
	// but handle it.
	if ( !get_property( "_milkOfMagnesiumUsed" ).to_boolean() ) {
	    craft_or_retrieve_item( 1, MAGNESIUM );
	    use( 1, MAGNESIUM );
	}

	int initial_adventures = my_adventures();
	try {
	    // Eating with Mayo could leave us improperly equipped, if we
	    // used Travoltan trousers to buy it
	    cli_execute( "checkpoint" );

	    // Use horseradishes if you got 'em
	    int available_horseradishes = item_amount( HORSERADISH );
	    int horseradishes = min( full_remaining, available_horseradishes, 5 );
	    if ( horseradishes > 0 ) {
		eat_food( horseradishes, HORSERADISH );
		full_remaining -= horseradishes;
	    }

	    // use whatever is best to finish filling your stomach
	    if ( full_remaining > 0 ) {
		fill( STOMACH );
	    }
	}
	finally {
	    cli_execute( "outfit checkpoint" );
	}

	return my_adventures() - initial_adventures;
    }

    boolean adventure_until_choice( int turns )
    {
	string url = loc.to_url();
	while ( turns > 0 ) {
	    between_battle_checks();
	    string page = visit_url( url );
	    if ( page.contains_text( "fight.php" ) ) {
		// Combat
		run_combat( filter );
		turns--;
	    } else if ( page.contains_text( "choice.php" ) ) {
		// Choice
		int whichchoice = last_choice();
		// Take default option
		run_choice( -1 );
		// If this was the choice we sought, done
		if ( whichchoice == choice ) {
		    return true;
		}
		// *** In Barf Mountain, the only choice is the one we seek
		// *** In other locations, other turn-using choices exist
		// *** Depending on options, may not use turns.
		// Turtle taming or ghost dog do not consume a turn.
	    } else {
		// Non-Combat
		turns--;
	    }
	}
	return false;
    }

    boolean ignorable_autostop()
    {
	switch( get_property("lastEncounter") ) {
	case "The Back Door":
	    return true;
	}
	return false;
    }

    boolean do_adventure( int turns )
    {
	// Adventure for at most "turns". Stop if we get an error,
	// fulfill a goal, or run out of adventures.

	turns = min( turns, my_adventures() );

	// Return true if should stop looping, false if should continue

	if ( choice > 0 ) {
	    // If we are looking for a particular choice, we need to run
	    // one turn at a time.
	    return adventure_until_choice( turns );
	}

	// adventure() can return false on an error like "Autorecovery
	// failed" or because we encountered an autostop encounter like
	// "The Back Door".
	//
	// We want to stop for the former, but not the latter.
	//
	// There is no way to distinguish a general "autostop", so
	// special case "The Back Door".

	if ( !adventure( turns, loc, filter ) && !ignorable_autostop()) {
	    return true;
	}

	if ( have_goals && count( get_goals() ) == 0 ) {
	    // If we had a goal and fulfilled it, stop looping
	    return true;
	}

	return false;
    }

    // We have several things we might want to delay for:
    // - Extra fullness from Pantsgiving
    // - Fighting a Vote Monster
    // - Ghost Busting - does not consume a turn
    // - Swapping out mayfly bait necklace

    while ( turns > 0 && my_adventures() > 0 ) {
	// If we have extra fullness (due to Pantsgiving) fill it now.
	int extra_fullness = fullness_limit() - my_fullness();
	if ( extra_fullness > 0 ) {
	    int extra_turns = fill_stomach();
	    // If we are being called to take exactly one adventure,
	    // don't increase required iterations.
	    if ( !one_turn ) {
		turns += extra_turns;
	    }
	}

	int initial_adventures = my_adventures();

	// *** Pantsgiving gives extra fullness after 5, 50, 500, ... wins.
	// *** If we can't predict when that will happen, run one turn at a
	// *** time and look for extra fullness each iteration
	int pantsgiving_delay = using_pantsgiving ? 1 : MAX_INT;

	int voter_delay = will_fight_voters() ? turns_to_vote_monster() : MAX_INT;
	int ghost_delay = have_protonic_accelerator ? turns_to_ghost() : MAX_INT;
	int mayfly_delay = ( mayflies_may_fly && loc == BARF_MOUNTAIN && mayfly_bait_replacement != NO_ITEM ) ? turns_to_mayflies_exhausted() : MAX_INT;
	int delay = min( pantsgiving_delay, voter_delay, ghost_delay, mayfly_delay, turns );

	if ( mayfly_delay == 0 ) {
	    mayflies_may_fly = get_property( "_mayflySummons" ).to_int() < 30;
	    if ( !mayflies_may_fly ) {
		swap_out_mayflies();
		mayflies_available = false;
	    }
	    continue;
	}

	if ( voter_delay == 0 ) {
	    turns -= fight_voter();
	    continue;
	}

	location paranormal = get_property( "ghostLocation" ).to_location();
	if ( paranormal != NO_LOCATION) {
	    item back_item = equipped_item( BACK );
	    equip( back, PROTONIC_ACCELERATOR_PACK );
	    bust_ghost( paranormal );
	    equip( back, back_item );
	    continue;
	}

	if ( ghost_delay <= 0 ) {
	    // Adventure once to detect paranormal activity
	    item back_item = equipped_item( BACK );

	    try {
		equip( back, PROTONIC_ACCELERATOR_PACK );
		if ( do_adventure( 1 ) ) {
		    return;
		}
	    } finally {
		equip( back, back_item );
	    }

	    turns -= 1;
	    continue;
	}

	// There is a bug, somewhere, that causes an infinite loop here:
	// we have accepted the Barf Mountain quest to Lubricate the
	// Tracks, have suited up and therefore called this function -
	// but no adventuring actually happens.

	if ( delay == 0 ) {
	    print( "*** pantsgiving_delay = " + pantsgiving_delay );
	    print( "*** voter_delay = " + voter_delay );
	    print( "*** ghost_delay = " + ghost_delay );
	    print( "*** mayfly_delay = " + mayfly_delay );
	    print( "*** turns = " + turns );
	    // Hopefully recalculating potential delays will get around
	    // the problem until I can debug the issue.
	    continue;
	}

	if ( do_adventure( delay ) ) {
	    return;
	}

	turns -= initial_adventures - my_adventures();
    }
}

void do_adventure_once( location loc )
{
    // One adventure only
    do_adventure( loc, true, 0 );
}

void do_adventure_all( location loc )
{
    // All remaining adventures (until goal is satisfied)
    do_adventure( loc, false, 0 );
}

void do_adventure_choice( location loc, int choice )
{
    // All remaining adventures (until specified choice is taken)
    do_adventure( loc, false, choice );
}

void do_adv1( int turnsUsed, location loc )
{
    if ( my_inebriety() > inebriety_limit() ) {
	return;
    }
    
    bust_ghost();

    string filter = choose_combat_filter( loc );
    adv1( loc, turnsUsed, filter );
}

void fight_eldritch_tentacles()
{
    // Fighting Eldritch Tentacles is optional
    if ( !fight_eldritch_tentacles ) {
	return;
    }

    boolean tentacle = get_property( "_eldritchTentacleFought" ).to_boolean();
    boolean horror = !can_invoke_eldritch_horror || get_property( "_eldritchHorrorEvoked" ).to_boolean();

    // If we have fought Dr. Gordon Stewart's speciman and also used
    // Evoke Eldritch Horror, no free tentacle fights are available
    if ( tentacle && horror ) {
	return;
    }

    // Want an Item Drop familiar
    suit_up( NO_LOCATION, item_familiar, false );

    print( "Fighting Eldritch Tentacles" );

    // Dr. Gordon Stewart's tentacle
    if ( !tentacle ) {
	between_battle_checks();
	string page = visit_url( "place.php?whichplace=forestvillage&action=fv_scientist" );

	// The option can vary. Pick correct one
	int fight = 0;
	int great = 0;

	foreach n, text in available_choice_options() {
	    if ( text.starts_with( "Can I fight that tentacle" ) ) {
		fight = n;
	    } else if ( text.starts_with( "Great!" ) ) {
		great = n;
	    }
	}

	if ( fight != 0 ) {
	    run_choice( fight );
	} else if ( great != 0 ) {
	    run_choice( great );
	}

	// It is possible to have no choice options
    }

    // Invoke Eldritch Horror
    if ( !horror ) {
	use_skill( EVOKE_ELDRITCH_HORROR );
    }

    // If we detected paranormal activity after that fight, may as well bust the ghost now.
    bust_ghost();
}

void use_gingerbread_city()
{
    // Adventuring in the Gingerbread City is optional
    if ( !use_gingerbread_city ) {
	return;
    }

    if ( !gingerbread_city_available ||
	 !check_installed( gingerbread_scripts ) ) {
	return;
    }

    // Knowing whether you have completed the Gingerbread City today is
    // complicated. The Gingerbread City script will calculate it.

    try {
	handling_counters = true;
	cli_execute( "Gingerbread City" );
    } finally {
	handling_counters = false;
    }

    // If we detected paranormal activity in the Gingerbread City, may as well bust the ghost now.
    bust_ghost();
}

// ***************************
// *     Task Functions      *
// ***************************

static string [stat] safe184 = { MUSCLE: "2", MYSTICALITY : "2", MOXIE : "3" };

void get_pirate_costume()
{
    if ( available_amount( PIRATE_COSTUME ) == 0 ) {
	string pirate_outfit = "Swashbuckling Getup";
	location pirate_zone =
	    ( farm_location == BARF_MOUNTAIN ) ? GARBAGE_BARGES :
	    ( item_amount( PIRATE_FLEDGES ) > 0 ) ? BELOWDECKS :
	    retrieve_outfit( pirate_outfit ) ? BARRR :
	    COVE;
	suit_up( pirate_zone, TOT );
	item acc3_item = equipped_item( acc3 );
	try {
	    switch ( pirate_zone ) {
	    case BELOWDECKS:
		equip( acc3, PIRATE_FLEDGES );
		break;
	    case BARRR:
		outfit( pirate_outfit );
		set_property( "choiceAdventure184", safe184[ my_primestat() ] );
		break;
	    }
	    // time pranks and wanderers are not pirates...
	    while ( my_adventures() > 0 &&
		    item_amount( PIRATE_COSTUME ) == 0 &&
		    // If we bust a ghost, we'll equip the pirate costume
		    familiar_equipped_equipment( TOT ) != PIRATE_COSTUME ) {
		do_adventure_once( pirate_zone );
	    }
	} finally {
	    switch ( pirate_zone ) {
	    case BELOWDECKS:
	    equip( acc3, acc3_item );
		break;
	    case BARRR:
		outfit( "last" );
		break;
	    }
	}
    }
}

void get_ninja_costume()
{
    if ( available_amount( NINJA_COSTUME ) == 0 ) {
	suit_up( NINJA_LAIR, TOT );
	// time pranks and wanderers are not ninjas...
	while ( my_adventures() > 0 && item_amount( NINJA_COSTUME ) == 0 ) {
	    do_adventure_once( NINJA_LAIR );
	}
    }
}

void get_robortender_item()
{
    static item_set switches = { BARTEND_SWITCH : true, BOUNCE_SWITCH : true };

    if ( robortender_item == "equipped" || robortender_item == "default" ) {
	return;
    }

    item needed = ( robortender_item == "bartend" ) ? BARTEND_SWITCH : BOUNCE_SWITCH;
    item other = ( robortender_item == "bartend" ) ? BOUNCE_SWITCH : BARTEND_SWITCH;

    // If we have neither item, acquire the cheapest one
    if ( available_amount( needed ) == 0 && available_amount( other ) == 0 ) {
	retrieve_item( 1, cheapest( switches ) );
    }

    // If we already have the desired item, make sure it is equipped
    if ( available_amount( needed ) > 0 ) {
	if ( familiar_equipped_equipment( ROBORTENDER ) == needed ) {
	    return;
	}
	// Not currently equipped. Pull into inventory
	retrieve_item( 1, needed );

	// Put it on your Robortender
	use_familiar( ROBORTENDER );
	equip( needed );
	return;
    }

    // If we have the other item, equip it and toggle it
    if ( available_amount( other ) > 0 ) {
	// Can only toggle the equipment if Robortender is wearing it
	use_familiar( ROBORTENDER );

	// If not already wearing the other item, get it and equip it
	if ( familiar_equipped_equipment( ROBORTENDER ) != other ) {
	    retrieve_item( 1, other );
	    equip( other );
	}

	// Toggle it
	visit_url( "inventory.php?action=togglebutt&slot=familiarequip&pwd", false );
	return;
    }

    // We shouldn't get here, since we retrieved one of the two switches
}

void acquire_gear()
{
    // If we are not actually going to adventure, don't get any gear.
    // Especially since you have to adventure to get certain pieces.
    if ( my_adventures() == 0 || my_inebriety() > inebriety_limit() ) {
	return;
    }

    print( "Acquiring necessary adventuring gear" );

    // You can use either a Rain-Doh black box or a Spooky Putty sheet five times a day.
    // They share a counter and you can get a total of six copies a day from the two of them.

    // Do item acquisation here because the can of Rain-doh contains items other than the
    // Black Box which you might want to use even if you are not faxing.

    // Check availablity of Rain-Doh
    if ( use_rain_doh ) {
	if ( get_property( "_raindohCopiesMade" ).to_int() >= 5 ) {
	    use_rain_doh = false;
	} else if ( item_amount( BOX_FULL_OF_MONSTER ) > 0 ) {
	    print( "You have a " + BOX_FULL_OF_MONSTER + "; skipping Rain-Doh." );
	    use_rain_doh = false;
	} else if ( have_black_box ) {
	    retrieve_item( 1, RAIN_DOH_BLACK_BOX );
	} else if ( have_rain_doh ) {
	    retrieve_item( 1, CAN_OF_RAIN_DOH );
	    use( 1, CAN_OF_RAIN_DOH );
	} else {
	    use_rain_doh = false;
	}
    }

    // Check availablity of Spooky Putto
    if ( use_spooky_putty ) {
	if ( get_property( "spookyPuttyCopiesMade" ).to_int() >= 5 ) {
	    use_spooky_putty = false;
	} else if ( item_amount( SPOOKY_PUTTY_MONSTER ) > 0 ) {
	    print( "You have a " + SPOOKY_PUTTY_MONSTER + "; skipping Spooky Putty." );
	    use_spooky_putty = false;
	} else if ( have_spooky_putty ) {
	    retrieve_item( 1, SPOOKY_PUTTY_SHEET );
	} else {
	    use_spooky_putty = false;
	}
    }

    // Make sure protonic accelerator is equipped or in inventory
    if ( have_protonic_accelerator ) {
	// Get into inventory if necessary
	if ( !have_equipped( PROTONIC_ACCELERATOR_PACK ) &&
	     item_amount( PROTONIC_ACCELERATOR_PACK ) == 0 ) {
	    retrieve_item( 1, PROTONIC_ACCELERATOR_PACK );
	}
    }

    // If want to replace mayfly bait necklace with another accessory, get it
    if ( mayfly_bait_replacement != NO_ITEM ) {
	if ( !have_equipped( mayfly_bait_replacement ) &&
	     item_amount( mayfly_bait_replacement ) == 0 ) {
	    retrieve_item( 1, mayfly_bait_replacement );
	}
    }

    // Get Time-spinner into inventory
    if ( have_timespinner &&
	 item_amount( TIMESPINNER ) == 0 ) {
	retrieve_item( 1, TIMESPINNER );
    }

    // Get cosmic bowling ball into inventory if it is not currently active
    if ( can_bowl && get_property( "cosmicBowlingBallReturnCombats" ).to_int() < 0 ) {
	retrieve_item( 1, COSMIC_BOWLING_BALL );
    }

    // To use hobo_monkey_filter, you need an item to stasis with
    // Prefer one that does no damage
    if ( stasis_item == NO_ITEM ) {
	stasis_item =
	    available_amount( FACSIMILE ) >= 1 ? FACSIMILE :
	    item_amount( DICTIONARY ) == 1 ? DICTIONARY :
	    SEAL_TOOTH;
    }

    retrieve_item( 1, stasis_item );

    // Attempt to get an amulet coin, if requested.  We disabled this
    // during validation if you are using a Trick-or-Treating Tot or if
    // you don't have a Cornbeefadon
    if ( get_amulet_coin ) {
	if ( !have_amulet_coin && retrieve_item( 1, FAMILIAR_JACKS ) ) {
	    use_familiar( CORNBEEFADON );
	    use( 1, FAMILIAR_JACKS );
	    have_amulet_coin = ( available_amount( AMULET_COIN ) > 0 );
	}
	if ( have_amulet_coin ) {
	    default_famequip = AMULET_COIN;
	}
    }

    // If we are using the Trick-or-Treating Tot, get the pirate
    // costume, since that is optimal for Meat farming. Ditto for the
    // ninja costume, which is optimal for item farming.
    if ( meat_familiar == TOT ) {
	get_pirate_costume();
    }

    if ( item_familiar == TOT ) {
	get_ninja_costume();
    }

    // If we are using the Robortender, get whatever equipment is
    // configured for it
    if ( meat_familiar == ROBORTENDER || item_familiar == ROBORTENDER ) {
	get_robortender_item();
    }
}

void etched_hourglass()
{
    if ( available_amount( ETCHED_HOURGLASS ) == 0 ) {
	return;
    }	

    if ( get_property( "_etchedHourglassUsed" ).to_boolean() ) {
	return;
    }

    print( "Time needs to flow backwards now." );

    retrieve_item( 1, ETCHED_HOURGLASS );
    use( 1, ETCHED_HOURGLASS );
}

void get_witchess_buff()
{
    if ( get_property( "puzzleChampBonus" ).to_int() != 20 ||
	 get_property( "_witchessBuff" ).to_boolean() ) {
	return;
    }

    print( "Getting Witchess Buff" );
    cli_execute( "witchess" );
}

void get_fortune_teller_buff()
{
    if ( !have_clan || !have_lounge_key || !have_fortune_teller ) {
	return;
    }

    if ( fortune_teller_npc == NO_NPC || 
	 get_property( "_clanFortuneBuffUsed" ).to_boolean() ) {
	return;
    }

    string npc = fortune_teller_npcs[ fortune_teller_npc ];
    print( "Getting Fortune Teller buff (" + npc + ")" );
    cli_execute( "fortune buff " + npc );
}

void get_friars_blessing()
{
    if ( get_property( "friarsBlessingReceived" ).to_boolean() ) {
	return;
    }

    static string_set FRIARS_BLESSINGS = $strings[ food, booze, familiar ];

    if ( FRIARS_BLESSINGS contains blessing ) {
	print( "Getting Friars Blessing" );
	cli_execute( "friars " + blessing );
    }
}

void visit_getaway_campsite()
{
    if ( !get_property( "getawayCampsiteUnlocked" ).to_boolean() ) {
	return;
    }

    int campaway_buffs()
    {
	return
	    get_property( "_campAwaySmileBuffs" ).to_int() +
	    get_property( "_campAwayCloudBuffs" ).to_int();
    }

    int daily_buffs = campaway_buffs();
    if ( daily_buffs >= 4 ) {
	return;
    }

    print( "Visiting Getaway Campsite" );

    while ( daily_buffs < 4 ) {
	visit_url( "place.php?whichplace=campaway&action=campaway_sky" );
	// If the properties are out of synch with KoL, visiting will
	// resynchronize if no effect is granted
	daily_buffs = campaway_buffs();
    }
}

void get_source_terminal_enhancement()
{
    string enhancements = get_property( "sourceTerminalEnhanceKnown" );
    if ( !enhancements.contains_text( source_terminal_enhancement ) ) {
	return;
    }

    int daily = 1;
    string chips = get_property( "sourceTerminalChips" );
    foreach i, chip in chips.split_string( "," ) {
	if  ( chip == "CRAM" || chip == "SCRAM" ) {
	    ++daily;
	}
    }

    int used = get_property( "_sourceTerminalEnhanceUses" ).to_int();
    int available = daily - used;

    if ( available <= 0 ) {
	return;
    }

    print( "Getting Enhancement from Source Terminal" );
    while ( available-- > 0 ) {
	cli_execute( "terminal enhance " + source_terminal_enhancement );
    }
}

void summon_demon()
{
    // If don't want to do this, punt
    if ( !should_summon_demon ) {
	return;
    }

    // You can only summon one demon per day.
    if ( get_property( "demonSummoned" ).to_boolean() ) {
	return;
    }

    // If we don't know the name of demon #2, we can't summon it
    if ( get_property( "demonName2" ) == "" ) {
	return;
    }

    // Acquire the necessary ritual items
    if ( !retrieve_item( 1, EVIL_SCROLL ) || !retrieve_item( 3, THIN_BLACK_CANDLE ) ) {
	return;
    }

    // Summon Demon: Preternatural Greed
    cli_execute( "summon Preternatural Greed" );
}

void tea_party()
{
    if ( hatter_hat == NO_ITEM || get_property( "_madTeaParty" ).to_boolean() ) {
	return;
    }

    // Get an appropriate hat into inventory
    retrieve_item( 1, hatter_hat );

    // Get the buff using the chosen hat
    retrieve_item( 1, DRINK_ME_POTION );
    cli_execute( "hatter " + hatter_hat.name );
}

void create_vykea_companion()
{
    // If we don't want to make a VYKEA companion or already have one, punt
    if ( desired_vykea_companion == NO_VYKEA || my_vykea_companion() != NO_VYKEA ) {
	return;
    }

    // VYKEA companions disappear at rollover. If we have no turns left
    // or are overdrunk, it would be a waste to make one.
    if ( my_adventures() == 0 || my_inebriety() > inebriety_limit() ) {
	return;
    }

    // We must have a VYKEA key in inventory for a VYKEA companion to be creatable
    if ( !retrieve_item( 1, VYKEA_KEY ) ) {
	return;
    }

    // Make it!
    cli_execute( "create " + desired_vykea_companion.to_string() );
}

void wear_mumming_costume()
{
    if ( !have_mumming_trunk || mumming_costume == "none" ) {
	return;
    }

    print( "Dressing up your familiar in a mumming costume" );

    retrieve_item( 1, MUMMING_TRUNK );

    use_familiar( default_familiar );
    cli_execute( "mummery " + mumming_costume );
}

void vamp_out()
{
    if ( !should_vamp_out || !have_plastic_vampire_fangs ) {
	return;
    }

    boolean visit_vlad =
	vamp_out_places contains "Vlad" &&
	possible_vlad_rewards contains vlad_reward &&
	!get_property( "_interviewVlad" ).to_boolean();
    boolean visit_isabella =
	vamp_out_places contains "Isabella" &&
	possible_isabella_rewards contains isabella_reward &&
	!get_property( "_interviewIsabella" ).to_boolean();
    boolean visit_masquerade =
	vamp_out_places contains "Masquerade" &&
	possible_masquerade_rewards contains masquerade_reward &&
	!get_property( "_interviewMasquerade" ).to_boolean();

    if ( !visit_vlad && !visit_isabella && !visit_masquerade ) {
	return;
    }

    print( "Vamping Out in Seaside Town" );

    retrieve_item( 1, PLASTIC_VAMPIRE_FANGS );
    equip( ACC3, PLASTIC_VAMPIRE_FANGS );

    if ( visit_vlad ) {
	// Vamp Out at Vlad's
	int choice =
	    vlad_reward == MISTIFIED ? 1 :
	    vlad_reward == BAT_ATTITUDE ? 2 :
	    vlad_reward == THERE_WOLF ? 3 :
	    0;
	if ( choice != 0 ) {
	    set_property( "choiceAdventure546", choice ); 
	    visit_url( "place.php?whichplace=town&action=town_vampout" );
	    cli_execute( "choice-goal" );
	}
    }

    if ( visit_isabella ) {
	// Vamp Out at Isabella's
	string ireward = isabella_reward.to_lower_case();
	if ( ireward == "mainstat" ) {
	    ireward = my_primestat().to_string().to_lower_case();
	}
	int choice =
	    ireward == "muscle" ? 4 :
	    ireward == "mysticality" ? 5 :
	    ireward == "moxie" ? 6 :
	    ireward == "meat" ? 7 :
	    0;
	if ( choice != 0 ) {
	    set_property( "choiceAdventure546", choice ); 
	    visit_url( "place.php?whichplace=town&action=town_vampout" );
	    cli_execute( "choice-goal" );
	}
    }

    if ( visit_masquerade ) {
	// Vamp Out at The Masquerade
	int choice =
	    masquerade_reward == BROUHAHA_PRINCE ? 8 :
	    masquerade_reward == TORREMOLINOS_PRINCE ? 9 :
	    masquerade_reward == VENTRILO_PRINCE ? 10 :
	    masquerade_reward == MALKOVICH_PRINCE ? 11 :
	    masquerade_reward == INTERVIEW_WITH_YOU ? 12 :
	    masquerade_reward == YOUR_OWN_BLACK_HEART ? 13 :
	    0;
	if ( choice != 0 ) {
	    set_property( "choiceAdventure546", choice ); 
	    visit_url( "place.php?whichplace=town&action=town_vampout" );
	    cli_execute( "choice-goal" );
	}
    }
}

void use_tunnel_of_love()
{
    // Adventuring in the Tunnel of L.O.V.E. is optional
    if ( !use_tunnel_of_love ) {
	return;
    }

    if ( !love_tunnel_available || get_property( "_loveTunnelUsed" ).to_boolean() ) {
	return;
    }

    print( "Taking a trip through the Tunnel of L.O.V.E." );

    // LOV Engineer will not drop LOV Elixer #6 if your familiar acts
    suit_up( TUNNEL, NO_FAMILIAR );

    // Heal up for first fight. The tunnel will heal us for second and third
    between_battle_checks();

    visit_url( "place.php?whichplace=town_wrong" );

    string page = visit_url( "place.php?whichplace=town_wrong&action=townwrong_tunnel" );
    if ( !page.contains_text( "choice.php" ) ) {
	// Already been through here. Unexpected.
	return;
    }

    // Enter the tunnel
    run_choice( 1 );

    // Fight or sneak around the LOV Enforcer
    if ( lov_enemies contains LOV_ENFORCER ) {
	run_choice( 1 );
	run_combat();
    } else {
	run_choice( 2 );
    }
    visit_url( "choice.php" );

    // Optionally choose some equipment
    int equipment_option =
	lov_equipment == LOV_EARDIGAN ? 1 :
	lov_equipment == LOV_EPAULETTES ? 2 :
	lov_equipment == LOV_EARRINGS ? 3 :
	4;

    run_choice( equipment_option );

    // Fight or sneak around the LOV Engineer
    if ( lov_enemies contains LOV_ENGINEER ) {
	run_choice( 1 );
	run_combat();
    } else {
	run_choice( 2 );
    }
    visit_url( "choice.php" );

    // Optionally choose an effect
    int effect_option =
	lov_effect == LOVEBOTAMY ? 1 :
	lov_effect == OPEN_HEART_SURGERY ? 2 :
	lov_effect == WANDERING_EYE_SURGERY ? 3 :
	4;

    run_choice( effect_option );

    // Fight or sneak around the LOV Equivocator
    if ( lov_enemies contains LOV_EQUIVOCATOR ) {
	run_choice( 1 );
	run_combat();
    } else {
	run_choice( 2 );
    }
    visit_url( "choice.php" );

    // Optionally choose an endowment
    int endowment_option =
	lov_endowment == LOV_ENAMORANG ? 1 :
	lov_endowment == LOV_EMOTIONIZER ? 2 :
	lov_endowment == LOV_EXTRATERRESTRIAL_CHOCOLATE ? 3 :
	lov_endowment == LOV_ECHINACEA_BOUQUET ? 4 :
	lov_endowment == LOV_ELEPHANT ? 5 :
	have_space_jellyfish && lov_endowment == TOAST ? 6 :
	7;

    page = run_choice( endowment_option );

    if ( page.contains_text( "choice.php" ) ) {
	// If there is another choice, we went through doing nothing
	run_choice( 1 );
    }
}

void visit_boxing_daycare()
{
    // Visiting the Boxing Daycare is optional
    if ( !boxing_daycare ) {
	return;
    }

    if ( !boxing_daycare_available ) {
	return;
    }

    int buff_option = boxing_buff_to_option[ boxing_daycare_buff ];

    boolean nap = !get_property( "_daycareNap" ).to_boolean();
    boolean buff = buff_option != 0 && !get_property( "_daycareNap" ).to_boolean();
    int scavenges = boxing_daycare_scavenge - get_property( "_daycareGymScavenges" ).to_int();
    boolean scavenge = scavenges > 0;
    int recruits = boxing_daycare_recruit - get_property( "_daycareRecruits" ).to_int();
    boolean recruit = recruits > 0;
    boolean spar = boxing_daycare_spar && !get_property( "_daycareFights" ).to_boolean();

    if ( !nap && !buff && !scavenge && !recruit && !spar ) {
	return;
    }

    print( "Working out in the Boxing Daycare." );

    // Enter the Boxing Dayacare Lobby (whichchoice = 1334)
    visit_url( "place.php?whichplace=town_wrong&action=townwrong_boxingdaycare" );

    // If we are going to Daydream, do it from here
    if ( nap ) {
	run_choice( 1 );
	// Leaves you in Boxing Daycare Lobby (whichchoice = 1334)
    }

    // If we are going to scavenge, recruit, or spar, enter the Boxing Daycare
    if ( scavenge || recruit || spar ) {
	run_choice( 3 );
	// Boxing Daycare (whichchoice = 1336)
	while ( scavenges-- > 0 ) {
	    run_choice( 2 );
	}
	while ( recruits-- > 0 ) {
	    run_choice( 1 );
	}
	if ( spar ) {
	    run_choice( 4 );
	}
	// Return to the Lobby
	run_choice( 5 );
	// Leaves you in Boxing Daycare Lobby (whichchoice = 1334)
    }

    // If we are going to get a buff, enter the Boxing Daycare Spa
    // Get this after you scavenge, recruit, or spar, since those can take turns
    if ( buff ) {
	run_choice( 2 );
	// Boxing Daycare Spa (whichchoice = 1335)
	if ( last_choice() == 1335 ) {
	    run_choice( buff_option );
	}
	// Leaves you in Boxing Daycare Lobby (whichchoice = 1334)
    }

    // Leave the Boxing Daycare
    run_choice( 4 );
}

void rent_a_horse()
{
    // If we don't have a horsery, can't rent a horse
    if ( !horsery_available ) {
	return;
    }

    // If you don't want a horse, don't rent one
    int choice =
	horsery_horse == "none" ? 0 :
	horsery_horse == "normal" ? 1 :
	horsery_horse == "dark" ? 2 :
	horsery_horse == "crazy" ? 3 :
	horsery_horse == "pale" ? 4 :
	0;

    if ( choice == 0 ) {
	return;
    }

    // If we have already rented a horse, keep it
    // *** You are allowed to rent additional horses for 500 Meat.
    // *** But if you have manually chosen a horse, accept that decision.
    if ( get_property( "_horsery" ) != "" ) {
	return;
    }

    // Rent the requested horse
    visit_url( "place.php?whichplace=town_right" );

    string page = visit_url( "place.php?whichplace=town_right&action=town_horsery" );
    if ( !page.contains_text( "choice.php" ) ) {
	// Didn't offer a choce? Unexpected.
	return;
    }

    // Rent the desired horse
    run_choice( choice );
}

void witchess_fights()
{
    if ( !have_witchess_set || my_adventures() == 0 || count( witchess_monsters ) == 0 ) {
	return;
    }

    // Validate requested fights
    monster[5] monsters;

    int index = 0;
    foreach i, m in witchess_fights {
	if ( witchess_monsters contains m ) {
	    monsters[ index++ ] = m;
	    if ( index == 5 ) {
		break;
	    }
	}
    }

    // No valid witchess monsters
    if ( index == 0 ) {
	return;
    }

    // Fill in unspecified fights
    while ( index < 5 ) {
	monster fight = monsters[ index - 1];
	monsters[ index++ ] = fight;
    }

    int fights = 5 - get_property( "_witchessFights" ).to_int();
    if ( fights > 0 ) {
	print( "Free fights: Your Witchess Set" );

	suit_up( NO_LOCATION, hobo_or_default_familiar );

	index = 0;
	while ( fights-- > 0 ) {
	    monster fight = monsters[ index++ ];
	    between_battle_checks();
	    visit_url( "campground.php?action=witchess" );
	    run_choice( 1 );
	    visit_url( "choice.php?whichchoice=1182&option=1&piece=" + fight.id + "&pwd=" + my_hash(), false );
	    string filter = choose_combat_filter( NO_LOCATION );
	    run_combat( filter );

	    // If we detected paranormal activity after that fight, may as well bust the ghost now.
	    bust_ghost();
	}
    }
}

void snojo_fights()
{
    int to_int( stat s )
    {
	return s == MUSCLE ? 1 : s == MYSTICALITY ? 2 : s == MOXIE ? 3 : 6;
    }

    if ( !snojo_available || snojo_mode == NO_STAT || my_adventures() == 0 ) {
	return;
    }

    visit_url( "place.php?whichplace=snojo&action=snojo_controller" );
    // choice 1 = Muscle, choice 2 = Mysticality, choice 3 = Moxie
    // choice 4 = tournament, choice 6 = leave as is
    run_choice( snojo_mode.to_int() );

    int fights = 10 - get_property( "_snojoFreeFights" ).to_int();
    // It takes a turn to go to adventure.php even if none will be used.
    if ( fights > 0 && my_adventures() > 0 ) {
	print( "Free fights: The Snojo" );

	suit_up( SNOJO, hobo_or_default_familiar );
	while ( fights-- > 0 ) {
	    do_adv1( 0, SNOJO );

	    // If we detected paranormal activity after that fight, may as well bust the ghost now.
	    bust_ghost();
	}
    }
}

void dmt_fights()
{
    if ( !have_machine_elf || my_adventures() == 0 ) {
	return;
    }

    int fights = 5 - get_property( "_machineTunnelsAdv" ).to_int();
    // It takes a turn to go to adventure.php even if none will be used.
    if ( fights <= 0 ) {
	return;
    }

    print( "Free fights: The Deep Machine Tunnel" );

    suit_up( DMT, MACHINE_ELF );

    int option =
	dmt_choice == "abstractions" ? 1 :
	dmt_choice == "comprehension" ? 2 :
	dmt_choice == "modern picture frame" ? 3 :
	6;

    if ( dmt_choice == "comprehension" && get_property( "encountersUntilDMTChoice" ).to_int() <= 5 ) {
	int current_spleen = my_spleen_use();
	int max_spleen = spleen_limit();

	if ( max_spleen - current_spleen >= 3 &&
	     retrieve_item( 1, ABSTRACTION_ACTION ) &&
	     retrieve_item( 1, ABSTRACTION_SENSATION ) &&
	     retrieve_item( 1, ABSTRACTION_THOUGHT ) ) {
	    chew( 1, ABSTRACTION_ACTION );
	    chew( 1, ABSTRACTION_SENSATION );
	    chew( 1, ABSTRACTION_THOUGHT );
	} else {
	    option = 6;
	}
    }

    int adventures = my_adventures();
    while ( fights > 0 && adventures > 0 ) {
	between_battle_checks();
	string page = visit_url( DMT.to_url() );
	if ( page.contains_text( "fight.php" ) ) {
	    combat_filter_setup( DMT );
	    run_combat( "dmt_filter" );
	    fights--;
	} else if ( last_choice() != 1119 ) {
	    // Turtle taming or ghost dog?
	    // Does not consume a turn
	    run_choice( -1 );
	} else {
	    // If we found the choice but our chosen option is not
	    // available for some reason, skip it.
	    if ( !( available_choice_options() contains option ) ) {
		option = 6;
	    }

	    // Take configured choice.
	    run_choice( option );

	    // Unless you walked from the choice, it takes a turn but
	    // does not count as a free fight
	    if ( option != 6 ) {
		adventures--;
	    }
	}

	// If we detected paranormal activity after that fight, may as well bust the ghost now.
	bust_ghost();
    }
}

void nep_fights()
{
    // It takes a turn to go to adventure.php even if none will be used.
    if ( !never_ending_party_available || my_adventures() == 0 ) {
	return;
    }

    // If you finished the daily quest, you cannot party
    if ( get_property( "_questPartyFair" ) == "finished" ) {
	return;
    }

    // You have only 10 free turns per day. You may want to spend
    // non-free turns there, but not via this script.
    int fights = 10 - get_property( "_neverendingPartyFreeTurns" ).to_int();
    if ( fights <= 0 ) {
	return;
    }

    print( "Free fights: The Neverending Party" );

    // Go for items.
    suit_up( NEP, item_familiar, false );

    while ( fights > 0 && my_adventures() > 0 ) {
	between_battle_checks();
	string page = visit_url( NEP.to_url() );
	if ( page.contains_text( "fight.php" ) ) {
	    combat_filter_setup( NEP );
	    run_combat( "default_filter" );
	    fights--;
	} else if ( last_choice() == 1322 ) {
	    // The Beginning of the Neverend
	    //
	    // Choice 1 = accept quest
	    // Choice 2 = reject quest
	    // Choice 3 = come back later
	    //
	    // This script wants 10 free fights and nothing more.
	    // Quests require non-free turns. Therefore, reject quest
	    // This choice does not consume a turn

	    run_choice( 2 );
	} else if ( last_choice() == 1324 ) {
	    // It Hasn't Ended, It's Just Paused
	    //
	    // Choice 1 = Head upstairs
	    // Choice 2 = Check out the kitchen
	    // Choice 3 = Go to the back yard
	    // Choice 4 = Investigate the basement
	    // Choice 5 = Pick a fight.
	    //
	    // The first 4 are only for progressing quests

	    run_choice( 5 );
	    combat_filter_setup( NEP );
	    run_combat( "default_filter" );
	    fights--;
	} else {
	    // Turtle taming or ghost dog?
	    // Does not consume a turn
	    run_choice( -1 );
	}

	// If we detected paranormal activity after that fight, may as well bust the ghost now.
	bust_ghost();
    }
}

void speakeasy_fights()
{
    // It takes a turn to go to adventure.php even if none will be used.
    if ( !speakeasy_available || my_adventures() == 0 ) {
	return;
    }

    // You have only 3 free turns per day. You may want to spend
    // non-free turns there, but not via this script.
    int fights = 3 - get_property( "_speakeasyFreeFights" ).to_int();
    if ( fights <= 0 ) {
	return;
    }

    print( "Free fights: " + get_property( "speakeasyName" ) );

    // Go for items.
    suit_up( SPEAKEASY, item_familiar, false );

    while ( fights > 0 && my_adventures() > 0 ) {
	between_battle_checks();
	string page = visit_url( SPEAKEASY.to_url() );
	if ( page.contains_text( "fight.php" ) ) {
	    combat_filter_setup( SPEAKEASY );
	    run_combat( "default_filter" );
	    fights--;
	} else {
	    // Turtle taming or ghost dog?
	    // Does not consume a turn
	    run_choice( -1 );
	}

	// If we detected paranormal activity after that fight, may as well bust the ghost now.
	bust_ghost();
    }
}

void god_lobster_fights()
{
    if ( !have_god_lobster ) {
	return;
    }

    int fights = 3 - get_property( "_godLobsterFights" ).to_int();
    if ( fights <= 0 ) {
	return;
    }

    // Neither Meat Drop nor Item Drop matters for these fights.
    // Put on something, at least.
    outfit( farm_outfit );
    use_familiar( GOD_LOBSTER );

    // First goal is to acquire all the pieces of regalia.  Once you
    // have them all, equip the crown and choose "experience", which
    // will also give you a dish of clarified butter
    while ( fights > 0 && my_adventures() > 0 ) {
	// Choose which item to equip
	int scepters = available_amount( GOD_LOBSTER_SCEPTER );
	int rings = available_amount( GOD_LOBSTER_RING );
	int rods = available_amount( GOD_LOBSTER_ROD );
	int robes = available_amount( GOD_LOBSTER_ROBE );
	int crowns = available_amount( GOD_LOBSTER_CROWN );
	item familiar_item =
	    ( crowns > 0 ) ? GOD_LOBSTER_CROWN :
	    ( robes > 0 ) ? GOD_LOBSTER_ROBE :
	    ( rods > 0 ) ? GOD_LOBSTER_ROD :
	    ( rings > 0 ) ? GOD_LOBSTER_RING :
	    ( scepters > 0 ) ? GOD_LOBSTER_SCEPTER :
	    NO_ITEM;
    
	// If unspecified, use whatever the familiar is already wearing
	if ( familiar_item != NO_ITEM ) {
	    equip( familiar_item );
	}

	between_battle_checks();
	string page = visit_url( "main.php?fightgodlobster=1" );
	if ( !page.contains_text( "fight.php" ) ) {
	    // Unexpected
	    break;
	}

	combat_filter_setup( NO_LOCATION );
	page = run_combat( "default_filter" );
	fights--;

	if ( !page.contains_text( "choice.php" ) ) {
	    // Unexpected. Perhaps you lost the fight?
	    continue;
	}

	page = visit_url( "choice.php" );

	// Options 1, 2, or 3 - unless you are wearing the crown, in
	// which case the "regalia" option is not available and the
	// others are 1 and 2. We'll go for "experience"
	// 
	// "I'd like part of your regalia."
	// "I'd like a blessing."
	// "I'd like some experience."

	int option = ( familiar_item == GOD_LOBSTER_CROWN ) ? 2 : 1;
	run_choice( option );
    }
}

void glitch_item_fight()
{
    if ( !have_glitch_item || get_property( "_glitchMonsterFights" ).to_int() > 0 ) {
	return;
    }

    // We have one or more [glitch item reward name] in inventory.
    // Having more than one doubles the difficulty - and the reward.
    // Leave it to the user to decide how many are in inventory

    print( "You have " + item_amount( GLITCH_ITEM ) + " " + GLITCH_ITEM.name + " in inventory" );

    between_battle_checks();
    combat_filter_setup( NO_LOCATION );
    string page = visit_url( "inv_eat.php?whichitem=" + GLITCH_ITEM.to_int() );
    // We should be in a fight unless we are out of sync with KoL.
    if ( page.contains_text( "fight.php" ) ) {
	// Assume that the CCS can handle this fight
	run_combat();
    }
}

void molehill_mountain_fight()
{
    if ( !have_molehill_mountain || get_property( "_molehillMountainUsed" ).to_boolean() ) {
	return;
    }

    // Pull it into inventory
    retrieve_item( 1, MOLEHILL_MOUNTAIN );

    // Use it and fight a Moleman
    between_battle_checks();
    combat_filter_setup( NO_LOCATION );
    string page = visit_url( "inv_use.php?whichitem=" + MOLEHILL_MOUNTAIN.to_int() );
    // We should be in a fight unless we are out of sync with KoL.
    if ( page.contains_text( "fight.php" ) ) {
	// Assume that the CCS can handle this fight
	run_combat();
    }
}

void rufus_quest()
{
    // If don't have a command, nothing to do
    if ( shadow_rift_command1 == "" && shadow_rift_command2 == "" ) {
	return;
    }

    // If we don't have a closed-circuit pay phone, can't do this.
    if ( !have_closed_circuit_pay_phone ) {
	return;
    }

    // If we haven't installed ShadowRift.ash, can't do this
    if ( !check_installed( shadow_rift_scripts ) ) {
	return;
    }

    // If we have already gotten Shadow Affinity today - which provides
    // 11 free combats in the Shadow Rift - subsequent visits will take
    // turns. Don't do that.
    if (get_property("_shadowAffinityToday").to_boolean()) {
	return;
    }

    // If/when the ShadowRift script handles Drunkula's wine glass,
    // rethink this check.
    if ( my_inebriety() > inebriety_limit() ) {
	return;
    }

    print( "Adventuring in the Shadow Rift" );

    // Pull pay phone into inventory
    retrieve_item( 1, CLOSED_CIRCUIT_PAY_PHONE );

    if (get_property("questRufus") != "unstarted") {
	// Print current state of quest.
	cli_execute("call ShadowRift check");
	print("This script can't handle in-progress quests; skipping.", "red");
	return;
    }

    // Switch to item drop familiar
    use_familiar( item_familiar );

    // If we want to select rift based on particular item, see what Rufus is looking for.
    if ( shadow_rift_command1.contains_text("ITEM") ||
	 shadow_rift_command2.contains_text("ITEM")) {
	cli_execute("call ShadowRift check");
	string desired = get_property("rufusDesiredItems");
	shadow_rift_command1 = replace_string(shadow_rift_command1, "ITEM", desired);
	shadow_rift_command2 = replace_string(shadow_rift_command2, "ITEM", desired);
    }

    // Run the script up to two more times
    if ( shadow_rift_command1 != "" ) {
	cli_execute("call ShadowRift " + shadow_rift_command1 );
    }
    if ( shadow_rift_command2 != "" ) {
	cli_execute("call ShadowRift " + shadow_rift_command2 );
    }

    // If we detected paranormal activity in a Shadow Rift, may as well bust the ghost now.
    bust_ghost();
}

void run_free_fights()
{
    // You need an adventure available even for free fights
    if ( my_adventures() == 0 ) {
	return;
    }

    // Accept quests from Rufus and fulfill in Shadow Rift
    // Do this first, as it can yield 30 turns of Shadow Waters,
    // which grants Item Drop: +100 and Meat Drop: +100
    // 
    // This can be done while falling-down drunk with Drunkula's wine
    // glass - assuming the ShadowRift script can handle that.
    rufus_quest();

    // Fight some Eldritch Tentacles, which drop items but no meat
    fight_eldritch_tentacles();

    // Witchess can be done while falling-down drunk
    witchess_fights();

    // You can fight the God Lobster while falling-down drunk
    god_lobster_fights();

    // You can fight the %monster% while falling-down drunk
    glitch_item_fight();

    // Other free fights use adventure.php and cannot be done drunk.
    if ( my_inebriety() > inebriety_limit() ) {
	return;
    }

    // The Snojo uses adventure.php but is not interrupted by wanderers.
    snojo_fights();

    // The Neverending Party use adventure.php. The free fights can (will)
    // be interrupted by a choice adventure that can lead to a free fight.
    nep_fights();

    // 3 free fights per day at An Unusually Quiet Barroom Brawl
    speakeasy_fights();

    // 1 free fight per day with Moleman by using molehill mountain
    molehill_mountain_fight();

    // The Deep Machine Tunnels use adventure.php. The free fights can
    // be interrupted by a choice adventure that takes a turn.
    // Therefore, do this last.
    dmt_fights();
}

void cheat_deck()
{
    if ( !have_deck ) {
	return;
    }

    if ( my_adventures() <= 0 ) {
	return;
    }

    // See how many cheats are available today
    int available = ( 15 - get_property( "_deckCardsDrawn" ).to_int() ) / 5;
    if ( available == 0 ) {
	return;
    }

    // Get deck into inventory
    if ( item_amount( DECK ) == 0 ) {
	retrieve_item( 1, DECK );
    }

    // See which cards, if any, have already been seen today
    string_set seen = get_property( "_deckCardsSeen" ).normalize_set( "string" ).to_string_set();

    // Since we might be summoning monsters, suit up with appropriate familiar
    familiar deck_familiar = summoned_monster_familiar();
    suit_up( NO_LOCATION, deck_familiar );

    // Cheat from the Deck of Every Card
    foreach i, card in deck_cards {
	// You can only cheat a particular card once a day
	if ( seen contains card ) {
	    continue;
	}

	cli_execute( "cheat " + card );

	if ( --available == 0 ) {
	    break;
	}
    }
}

void genie_wishes()
{
    if ( !have_genie_bottle ) {
	return;
    }

    // See how many wishes are available today
    int available = 3 - get_property( "_genieWishesUsed" ).to_int();
    if ( available <= 0 ) {
	return;
    }

    // Get genie bottle into inventory
    if ( item_amount( GENIE_BOTTLE ) == 0 ) {
	retrieve_item( 1, GENIE_BOTTLE );
    }

    // Since we might be summoning monsters, suit up with appropriate familiar
    familiar wish_familiar = summoned_monster_familiar();
    suit_up( NO_LOCATION, wish_familiar );

    // Ask the genie for wishes
    foreach i, wish in genie_wishes {
	// In case we are fighting monsters, heal up
	between_battle_checks();

	cli_execute( "genie " + wish );

	// If we fought a monster, may as well bust ghosts now
	bust_ghost();

	if ( --available == 0 ) {
	    break;
	}
    }
}

void time_pranks( int minutes_left )
{
    if ( minutes_left <= 0 ) {
	return;
    }

    // load the set of prankees
    string_set prankees;
    file_to_map( TIME_SPINNER_PRANKEES, prankees );

    int friends = count( prankees );

    string nth_friend( int n )
    {
	if ( n >= 0 && n < friends ) {
	    foreach friend in prankees {
		if ( n-- == 0 ) {
		    return friend;
		}
	    }
	}
	return "";
    }

    int greetings = count( PRANK_GREETINGS );

    while ( minutes_left > 0 && friends > 0 ) {
	// Pick a random friend
	int n = friends == 1 ? 0 : random( friends );
	string friend = nth_friend( n );
	boolean enabled = remove prankees[ friend ];
	friends--;

	// You can enable/disable specific friends
	if ( !enabled ) {
	    continue;
	}

	// Pick a random greeting
	string msg = PRANK_GREETINGS[ random( greetings ) ];
	msg = replace_string( msg, "%FRIEND%", friend );

	print( "Pranking " + friend + ": " + msg );
	cli_execute( "timespinner prank " + friend + " msg=" + msg );

	minutes_left = timespinner_minutes_left();
    }
}

void time_pranks()
{
    // Use up all remaining minutes pranking friends
    time_pranks( timespinner_minutes_left() );
}

void use_timespinner()
{
    if ( !have_timespinner ) {
	return;
    }

    if ( my_adventures() <= 0 ) {
	return;
    }

    int minutes_left = timespinner_minutes_left();

    if ( minutes_left == 0 ) {
	return;
    }

    print( "Using the Time-Spinner" );

    string option = timespinner_replicator_option( minutes_left );
    if ( option != "" ) {
	// Get an item. I've seen this fail when KoL returned a 500
	// response code. Let the user decide what to do.
	if ( !cli_execute( "FarFuture " + option ) ) {
	    abort( "Error executing FarFuture script." );
	}
	minutes_left = timespinner_minutes_left();
    }
 
    // Use remaining minutes to prank friends

    time_pranks( minutes_left );
}

void send_smiles()
{
    // How many Golden Mr. Accessories do we have?
    int accessories = get_property( "goldenMrAccessories" ).to_int();

    if ( accessories <= 0 ) {
	return;
    }

    int smiles_allowed = accessories * 5;
    int smiles_bestowed = get_property( "_smilesOfMrA" ).to_int();
    int smiles_available = smiles_allowed - smiles_bestowed;

    if ( smiles_available <= 0 ) {
	return;
    }

    print( "Bestowing The Smile of Mr. A. upon the victims of your choice." );

    // Load the set of recipients
    string_to_int_map victims;
    file_to_map( GOLDENS, victims );

    int candidates = count( victims );

    string nth_candidate( int n )
    {
	if ( n >= 0 && n < candidates ) {
	    foreach candidate in victims {
		if ( n-- == 0 ) {
		    return candidate;
		}
	    }
	}
	return "";
    }

    while ( smiles_available > 0 && candidates > 0 ) {
	// Pick a random victim
	int n = candidates == 1 ? 0 : random( candidates );
	string victim = nth_candidate( n );
	int smiles = victims[ victim ]--;
	if ( smiles > 1 ) {
	    // Allow victim to be selected again, but bestow 1 at a time
	    smiles = 1;
	} else if ( smiles <= 1 ) {
	    remove victims[ victim ];
	    candidates--;
	}

	if ( smiles <= 0 ) {
	    continue;
	}

	int count = min( smiles, smiles_available );

	print( "Smiling on " + victim + " " + count + " time" + ( count != 1 ? "s" : "" ) + "." );
	use_skill( count, SMILE_OF_MR_A, victim );

	smiles_available -= count;
    }
}

void harvest_garden()
{
    if ( !check_installed( garden_harvester_scripts ) ) {
	return;
    }

    // Since an external script does the garden for us, we don't know
    // what to expect, so allow for fights and turns being spent
    // (skulldozer or piranha plants)
    try {
	handling_counters = true;
	between_battle_checks();
	// "garden" is an internal command, so we must "call" the script.
	cli_execute( "call Garden Harvester" );
    } finally {
	handling_counters = false;
    }
}

void celebrate_arrrbor_day()
{
    if ( !celebrate_arrrbor_day ) {
	return;
    }

    if ( !check_installed( arrrbor_day_scripts ) ) {
	return;
    }

    // This will consume either 3 or 102 turns.
    cli_execute( "call Arrrbor Day" );
}

void eat_food( int count, item food )
{
    boolean timespinner_food_allowed( item food )
    {
	return food.discardable && food.tradeable && !food.gift;
    }

    boolean timespinner_food_available( item food )
    {
	if ( !timespinner_food_allowed( food ) ) {
	    return false;
	}

	string property = get_property( "_timeSpinnerFoodAvailable" );
	if ( property == "" ) {
	    return false;
	}
	string itemId = food.to_int().to_string();
	foreach i, it in property.split_string( "," ) {
	    if ( it == itemId ) {
		return true;
	    }
	}
	return false;
    }

    if ( count == 0 ) {
	return;
    }

    // Use Mayoflex to get one additional adventure per food
    // Our Mayo Minder will automatically use it from inventory
    if ( have_mayo_clinic ) {
	int need = count - ( get_property( "mayoInMouth" ) == "" ? 0 : 1 );
	retrieve_item( need, MAYOFLEX );
    }

    // Use the time spinner to recall some meals.
    if ( have_timespinner && my_adventures() > 0 && timespinner_food_allowed( food ) ) {
	// If want to get a Far Future item, reserve 2 minutes
	int minutes_left = timespinner_minutes_left();
	if ( timespinner_replicator_option( minutes_left ) != "" ) {
	    minutes_left -= 2;
	}

	int delicious_meals = max( minutes_left / 3, 0 );
	if ( delicious_meals > 0 ) {
	    // Eat one normally to make it available
	    if ( !timespinner_food_available( food ) ) {
		craft_or_retrieve_item( 1, food );
		eat( 1, food );
		count--;
	    }

	    // Recall meals via the time spinner
	    while ( count > 0 && delicious_meals-- > 0 ) {
		if ( !cli_execute( "timespinner eat " + food ) ) {
		    break;
		}
		count--;
	    }
	}
    }

    // Eat remaining food normally
    if ( count > 0 ) {
	craft_or_retrieve_item( count, food );
	eat( count, food );
    }
}

void explore_spacegate()
{
    // If don't have a command, nothing to do
    if ( spacegate_command == "" ) {
	return;
    }

    // If we don't have a Spacegate access badge, can't do this.
    if ( !spacegate_available ) {
	return;
    }

    // If we haven't installed VeracitySpacegate.ash, can't do this
    if ( !check_installed( spacegate_scripts ) ) {
	return;
    }

    // Prepend "visit" if not already in command
    string command = 
	spacegate_command.starts_with( "visit " ) ?
	spacegate_command :
	( "visit " + spacegate_command );

    // Select desired strategy
    set_property( "VSG.Strategy", spacegate_strategy );

    // Switch to item drop familiar
    use_familiar( item_familiar );

    // Explore the Spacegate!
    try {
	handling_counters = true;
	cli_execute("VeracitySpacegate " + command );
    } finally {
	handling_counters = false;
    }

    // If we detected paranormal activity Beyond the Spacegate, may as well bust the ghost now.
    bust_ghost();
}

boolean eat_muffin()
{
    item available_muffin()
    {
	foreach muffin in valid_muffins {
	    if ( available_amount( muffin ) > 0 ) {
		retrieve_item( 1, muffin );
		return muffin;
	    }
	}
	return NO_ITEM;
    }

    int monorail_index( string text )
    {
	foreach n, button in available_choice_options() {
	    if ( button == text ) {
		return n;
	    }
	}
	return 0;
    }

    void visit_breakfast_counter()
    {
	int index = monorail_index( "Visit the Breakfast Counter" );
	run_choice( index );
    }

    void order_next_muffin( item previous )
    {
	item next_muffin = muffin_to_order;
	if ( next_muffin == NO_ITEM ) {
	    switch ( previous ) {
	    case BLUEBERRY_MUFFIN:
		next_muffin = BRAN_MUFFIN;
		break;
	    case BRAN_MUFFIN:
		next_muffin = CHOCOLATE_CHIP_MUFFIN;
		break;
	    case CHOCOLATE_CHIP_MUFFIN:
	    case NO_ITEM:
		next_muffin = BLUEBERRY_MUFFIN;
		break;
	    }
	}

	// We have to search for the correct option; apparently, some
	// times you are also offered the chance to buy another muffin tin.

	int index = monorail_index( "Order a " + next_muffin );
	run_choice( index );
    }

    void return_to_platform()
    {
	int index = monorail_index( "Back to the Platform!" );
	run_choice( index );
    }

    void leave_platform()
    {
	int index = monorail_index( "Nevermind" );
	run_choice( index );
    }

    item last_muffin = NO_ITEM;

    item available = available_muffin();
    // Eat a muffin
    while ( true ) {
	// If we have a muffin, eat it now
	if ( available != NO_ITEM ) {
	    eat_food( 1, available );
	    last_muffin = available;
	    break;
	}

	// No muffin in inventory. Make sure we have a muffin tin in
	// inventory, if possible, in case we need to order a muffin.
	if ( available_amount( MUFFIN_TIN ) > 0 ) {
	    retrieve_item( 1, MUFFIN_TIN );
	}

	// Visit Breakfast Counter to pick up our order, if any.
	visit_url( "place.php?whichplace=monorail&action=monorail_downtown" );
	visit_breakfast_counter();

	// If we got a muffin, exit the breakfast counter and eat it.
	available = available_muffin();
	if ( available != NO_ITEM ) {
	    return_to_platform();
	    leave_platform();
	    continue;
	}

	// We did not have a muffin waiting. We can't eat today.
	if ( available_amount( MUFFIN_TIN ) > 0 &&
	     get_property( "muffinOnOrder" ) == "none" ) {
	    // Order a muffin for tomorrow
	    order_next_muffin( NO_ITEM );
	}

	// Exit the Breakfast Counter. We're done here.
	return_to_platform();
	leave_platform();
	return false;
    }

    // We've eaten a muffin and have a muffin tin in inventory.
    // Order a new muffin

    visit_url( "place.php?whichplace=monorail&action=monorail_downtown" );
    visit_breakfast_counter();
    // We might have already ordered a muffin today
    if ( get_property( "muffinOnOrder" ) == "none" ) {
	order_next_muffin( last_muffin );
    }
    return_to_platform();
    leave_platform();

    return true;
}

void eat_up()
{
    // If want to use portable Mayo clinic as first workshed item - i.e. before eating -
    // now is the time to install it.
    if ( workshed1 == MAYO_CLINIC ) {
	install_workshed_item( MAYO_CLINIC );
    }

    int current_full = my_fullness();
    int max_full = fullness_limit();

    if ( current_full >= max_full ) {
	return;
    }

    // Get current prices so that when we want to "acquire" some milk of
    // magnesium, we'll buy it, rather than make it, if it is cheap enough.
    // Only need to do this if we CAN make it ourself

    if ( can_sauce ) {
	int magnesium_price = mall_price( MAGNESIUM );
	int reagent_price = mall_price( REAGENT );
	int milk_price = mall_price( GOATS_MILK );
    }

    // If we have a portable Mayo Clinic, make sure we have a properly
    // configured Mayo Minder
    if ( have_mayo_clinic ) {
	// Quest item, so if we have it, it is in inventory
	// If not, buy one.
	if ( !have_mayo_minder ) {
	    retrieve_item( 1, MAYO_MINDER );
	}
	if ( get_property( "mayoMinderSetting" ) != "Mayoflex" ) {
	    // Using your Mayo Minder redirects to a choice, so invoke
	    // directly rather than going through use()
	    visit_url( "inv_use.php?whichitem=" + MAYO_MINDER.to_int() );
	    run_choice( 5 );
	}
    }

    print( "Giving in to gluttony" );

    int full_remaining = max_full - current_full;

    if ( !get_property( "_milkOfMagnesiumUsed" ).to_boolean() ) {
	craft_or_retrieve_item( 1, MAGNESIUM );
	use( 1, MAGNESIUM );
    }

    // Use barrel prayer, if appropriate
    if ( profession == TURTLE_TAMER && have_barrel_shrine && !get_property( "_barrelPrayer" ).to_boolean() ) {
	cli_execute( "barrelprayer buff" );
    }

    // spaghetti breafast gives 6 adventures if you are Level 11 or better. If you know the skill
    // and can summon one, it's worth using
    if ( have_skill( SPAGHETTI_BREAKFAST_SKILL ) ) {
	if ( !get_property( "_spaghettiBreakfast" ).to_boolean() ) {
	    use_skill( 1, SPAGHETTI_BREAKFAST_SKILL );
	}
	if ( current_full == 0 && !get_property( "_spaghettiBreakfastEaten" ).to_boolean() ) {
	    eat_food( 1, SPAGHETTI_BREAKFAST );
	    current_full = my_fullness();
	    full_remaining = max_full - current_full;
	}
    }

    // Muffins are a good choice to eat as your first food of the day
    if ( should_eat_muffins ) {
	if ( eat_muffin() ) {
	    current_full = my_fullness();
	    full_remaining = max_full - current_full;
	}
    }

    // jumping horseradish is an EPIC food that grants 50 turns of Kicked in the Sinuses (+100% Meat Drop)
    // It's expensive for a 1-fullness food, but is certainly worth using if you have a Witchess Set and
    // can generate five of them per day by fighting Witchess Knights.
    int available_horseradishes = item_amount( HORSERADISH );
    int horseradishes = min( full_remaining, available_horseradishes, 5 );
    if ( horseradishes > 0 ) {
	eat_food( horseradishes, HORSERADISH );
	current_full = my_fullness();
	full_remaining = max_full - current_full;
    }

    // The Dinsey food-cone is a 2-full EPIC food that grants 30 turns of The Dinsey Way (+80% Meat Drop)
    // It is untradable - as are Dinsey FunFunds - so use only if you have access to DinseyLandFill and have
    // available FunFunds. If you are farming Barf Mountain, you should have plenty...
    if ( stench_airport_available ) {
	int funds = item_amount( FUN_FUNDS );
	item food = FOODCONE;
	int count = min( full_remaining / food.fullness, funds / 2 );
	if ( count > 0 ) {
	    eat_food( count, food );
	    current_full = my_fullness();
	    full_remaining = max_full - current_full;
	}
    }

    // If we are full, stop now
    if ( full_remaining == 0 ) {
	return;
    }
    
    fill( STOMACH );
}

void visit_disco( int choice )
{
    if ( !can_disco || choice == 0 ) {
	return;
    }

    print( "Visiting the Towering Inferno Discotheque" );

    outfit( velvet_outfit );

    visit_url( "place.php?whichplace=airport_hot&action=airport4_zone1" );
    // Choice 1 is gift shop. Choices 2-7 are available with 1-6 velvet garments
    run_choice( choice + 1 );
    can_disco = false;
}

void drink_up()
{
    // If your current familiar is a Stooper, you will be overdrunk when we switch familiars to adventure.
    // Unequip it, if so.
    if ( my_familiar() == STOOPER ) {
	use_familiar( NO_FAMILIAR );
    }

    int current_drunk = my_inebriety();
    int max_drunk = inebriety_limit();
    
    // If we have not yet drunk our nightcap, make one now.
    if ( current_drunk <= max_drunk && nightcap != NO_ITEM && item_amount( nightcap ) == 0 ) {
	craft_or_retrieve_item( 1, nightcap );
    }

    if ( current_drunk >= max_drunk ) {
	return;
    }

    print( "Reveling in alcoholism" );

    int reserve = 0;

    int drunk_remaining = max_drunk - current_drunk - reserve;
    int disco_drunk = ( can_disco && disco_goal == DISCO_DRUNK ) ? 1 : 0;

    // Get enough Ode
    ode_up( drunk_remaining + disco_drunk );

    // Use barrel prayer, if appropriate
    if ( profession  == ACCORDION_THIEF && have_barrel_shrine && !get_property( "_barrelPrayer" ).to_boolean() ) {
	cli_execute( "barrelprayer buff" );
    }

    // If we have a mime army shotglass in inventory and have not yet
    // used it today, drink a single one-drunk drink for free.
    if ( have_mime_army_shotglass &&
	 !get_property( "_mimeArmyShotglassUsed" ).to_boolean() &&
	 retrieve_item( 1, MIME_ARMY_SHOTGLASS ) ) {
	fill( LIVER, 1 );

	// Your inebriety should not have changed. But if you used your
	// mime army shotglass outside of KoLmafia, we won't know about
	// that and need to correct.
	current_drunk = my_inebriety();
	drunk_remaining = max_drunk - current_drunk - reserve;
    }

    // Now fill up the rest of your liver.
    if ( drunk_remaining > 0 ) {
	fill( LIVER, drunk_remaining );
	current_drunk = my_inebriety();
	drunk_remaining = max_drunk - current_drunk - reserve;
    }

    // The disco will remove one drunk. Therefore, we can't visit the
    // disco until we've actually gained some inebriety. We did that.
    if ( disco_drunk > 0 ) {
	visit_disco( disco_goal );
	current_drunk = my_inebriety();
	drunk_remaining = max_drunk - current_drunk - reserve;
    }

    if ( drunk_remaining > 0 ) {
	fill( LIVER, drunk_remaining );
    }
}

void spleen_up()
{
    // We use spleen for the following purposes:
    //
    // Sweet Synthesis
    // Getting abstraction: comprehension from the choice adventure in the Deep Machine Tunnels
    // Spacing out calls to Calculate the Universe, if needed

    boolean will_synthesize_collection =
	can_synthesize &&
	synthesize_item_drop_for_free_fights;
    boolean will_synthesize =
	can_synthesize &&
	synthesis_target != NO_EFFECT;
    boolean will_dmt =
	have_machine_elf &&
	dmt_choice == "comprehension" &&
	get_property( "encountersUntilDMTChoice" ).to_int() < 5;
    boolean will_calculate = numberology_available;

    void use_spleen( int spleen, boolean fill )
    {
	// Flags = 1 to choose "available" candies vs. "cheap" candies
	int flags = synthesis_prefers_available ? 1 : 0;

	// Synthesize Item Drop once for free fights?
	if ( will_synthesize_collection ) {
	    sweet_synthesis( 1, SYNTHESIS_COLLECTION, flags );
	    spleen--;
	    will_synthesize_collection = false;
	}

	// Synthesize to get configured farming effect
	if ( will_synthesize && spleen > 0) {
	    int turns_remaining = my_adventures();
	    int current_effect = have_effect( synthesis_target );
	    // Fudge factor: +2 to accomodate extra turns from Pantsgiving
	    int synthesis_casts = min( spleen, ( turns_remaining - current_effect + 2 + 29 ) / 30 );
	    // Do it one cast at a time, since candy costs can vary widely
	    // *** In r26018, sweet_synthesis() does this itself
	    sweet_synthesis( synthesis_casts, synthesis_target, flags );
	    spleen -= synthesis_casts;
	}

	// Decide what to do with remaining spleen, if anything
	if ( spleen > 0 ) {
	    // We are done synthesizing
	    will_synthesize = false;

	    // If trying to use a specific amount of spleen, chew wads
	    if (fill ) {
		chew( spleen, TWINKLY_WAD );
	    }
	}
    }

    int max_spleen = spleen_limit();
    int current_spleen = my_spleen_use();

    // If we will use a machine elf, want to get abstraction:
    // comprehension, and the choice adventure will come today, save 3
    // spleen for chewing abstractions. If we don't have 3 spleen
    // available, we may as well use it to synthesize
    if ( will_dmt && max_spleen - current_spleen >= 3 ) {
	max_spleen -= 3;
    }

    if ( current_spleen >= max_spleen ) {
	return;
    }

    print( "Poisoning your spleen" );

    if ( will_synthesize || will_synthesize_collection ) {
	print( "Priming mall prices for all candy." );
	update_candy_prices();
    }

    // We use spleen to space out Numberology
    if ( will_calculate ) {
	int calculations_used = get_property( "_universeCalculated" ).to_int();
	int calculations_available = get_property( "skillLevel144" ).to_int();

	while ( calculations_available > calculations_used ) {
	    int available_spleen = max_spleen - current_spleen;
	    int spleen_to_use = -1;
	    for i from 0 to available_spleen {
		if ( reverse_numberology( 0, i ) contains numberology_goal ) {
		    spleen_to_use = i;
		    break;
		}
	    }

	    // If we can't calculate the universe within available spleen, give up.
	    if ( spleen_to_use == -1 ) {
		break;
	    }

	    // If we can calculaye the universe right now, do it
	    if ( spleen_to_use == 0 ) {
		cli_execute( "numberology " + numberology_goal );
		calculations_used++;
		continue;
	    }

	    // Otherwise use spleen to get to next calculate the universe point
	    use_spleen( spleen_to_use, true );
	    current_spleen += spleen_to_use;
	}
    }

    // If we have spleen left over, use just enough of it finish synthesizing
    if ( current_spleen < max_spleen ) {
	use_spleen( max_spleen - current_spleen, false );
	current_spleen = my_spleen_use();
    }

    // If we still have spleen left over, fill it up with profitable
    // adventure producing spleen toxins, leaving enough to chew
    // abstractions, if are doing that today

    fill( SPLEEN, max_spleen - current_spleen );
}

void scam_up()
{
    int current_scam = have_effect( SCAM_EFFECT );
    int adventures = my_adventures();
    if ( current_scam < adventures ) {
	int scam_needed = adventures - current_scam + ( have_equipped( PANTSGIVING ) ? 20 : 0 );
	int books_needed = ( scam_needed + 19 ) / 20;
	use( books_needed, SCAM_BOOK );
    }
}

void get_thingfinder()
{
    if ( profession == ACCORDION_THIEF &&
	 my_level() >= 15 &&
	 have_skill( THINGFINDER ) ) {
	int casts_used = get_property( "_thingfinderCasts" ).to_int();
	int casts_remaining = 10 - casts_used;
	if ( casts_remaining > 0 ) {
	    shrug( ODE_EFFECT );
	    use_skill( casts_remaining, THINGFINDER );
	}
    }
}

void check_hp_recovery()
{
    // You must have HP & MP recovery configured.  If you don't, you
    // might run out of HP or MP and the script will abort. That is not
    // the end of the world, since you can manually do whatever is
    // needed and restart, but it is inconvenient.

    // If you have a recovery script configured, assume it will do
    // whatever is necessary.
    if ( get_property( "recoveryScript" ) != "" ) {
	return;
    }

    // Otherwise, let's take a look at your configured options.
    //
    // KoLmafia's HP restoration manager requires/expects all recovery
    // methods to be lower-cased full item names, effect names, or CLI
    // commands. They appear in a semicolon separated list.
    //
    // Since character entities end with a semicolon, entity decode the
    // property before processing it.
    
    string_set recovery_methods = get_property( "hpAutoRecoveryItems" ).entity_decode().to_string_set( ";" );

    // Since the property is lower cased, compare with lower case names

    // Cannelloni Cocoon heals all HP and is eminently suitable.
    // If you know it and have it configured, super.
    if ( have_skill( COCOON ) && recovery_methods contains "cannelloni cocoon" ) {
	return;
    }

    // Otherwise the best option (in my opinion) is the scroll of
    // drastic healing.

    if ( recovery_methods contains "scroll of drastic healing" ) {
	// "acquire" a bunch of them to cut down on repeated purchases.
	// (Since KoL itself will "acquire" 30 at a time, this is
	// unnecessary.)

	// retrieve_item( 100, DRASTIC_SCROLL );
	return;
    }

    // None of the "easy" full HP restores are configured.
    // Hope for the best.

    print( "" );
    print( "Have you configured HP restoration?", "red" );
    print( "" );
}

void enable_adventure_locations()
{
    if ( farm_location == BARF_MOUNTAIN && !stench_airport_available ) {
	// This will be true only if user asked to use a one-day ticket
	// and one is available to us
	if ( !retrieve_item( 1, DINSEY_TICKET ) ) {
	    abort( "Failed to acquire a one-day ticket to Dinseylandfill" );
	}
	use( 1, DINSEY_TICKET );
	stench_airport_available = true;
    }
}

void prepare_to_adventure()
{
    if ( my_adventures() == 0 ) {
	return;
    }
    
    print( "Getting ready to adventure" );

    // Make sure we don't abort in the middle because we can't recover HP
    check_hp_recovery();

    // Get anough turns of How to Scam Tourists effect
    if ( farm_location == BARF_MOUNTAIN ) {
	scam_up();
    }

    // The Ballad of Richie Thingfinder improves both Meat Drop and Item Drop
    get_thingfinder();

    // Get inspired to find Meat
    if ( !get_property( "concertVisited" ).to_boolean() &&
	 get_property( "sidequestArenaCompleted" ) == "fratboy" &&
	 get_property( "sideDefeated" ) == "hippies") {
	cli_execute( "concert winklered" );
    }

    // Disable autoattack, since that will interfere with our combat filters
    set_auto_attack( 0 );
}

void play_boombox_song()
{
    if ( !have_boombox || boombox_song == "none" ) {
	return;
    }

    string current_keyword = boombox_song_to_keyword[ current_boombox_song ];
    if ( boombox_song == current_keyword ) {
	return;
    }

    // The boombox not playing the desired song. Make sure we can change songs today.
    if ( get_property( "_boomBoxSongsLeft" ).to_int() <= 0 ) {
	return;
    }

    // We can! Put boombox in inventory.
    retrieve_item( 1, SONGBOOM_BOOMBOX );

    // Switch to desired song
    string new_song = boombox_keyword_to_song[ boombox_song ];
    string option = boombox_song_to_cli_option[ new_song ];

    print( "Playing " + new_song + " on your SongBoom&trade; BoomBox" );
    cli_execute( "boombox " + option );
    current_boombox_song = new_song;
}

void lubricate_robortender()
{
    if ( meat_familiar != ROBORTENDER && item_familiar != ROBORTENDER ) {
	return;
    }

    item_set used = get_property( "_roboDrinks" ).to_item_set( "," );
    int available = 5 - count( used );

    // Can only use five drinks per day
    if ( available <= 0 ) {
	return;
    }

    item_set use;

    // For each configured drink, if not already used, add to set of
    // drinks to use. Ignore if already have a stronger effect from the
    // same phylum.

    foreach drink in robortender_drinks {
	// If we already have used this drink, skip it.
	if ( used contains drink ) {
	    continue;
	}

	robodrink data = robodrinks[ drink ];

	// If this is a strong drink, it overrides the effect of a weak drink
	if ( data.strong ) {
	    use[ drink ] = true;
	    continue;
	}

	// This is a weak drink. If we have used the corresponding
	// strong drink already, skip this one.
	if ( !( used contains strong_robodrinks[ data.source ] ) ) {
	    use[ drink ] = true;
	}
    }

    // Acquire and feed drinks to the Robortender
    use_familiar( ROBORTENDER );

    foreach drink in use {
	if ( !retrieve_item( 1, drink ) ) {
	    print( "Unable to acquire and use drink '" + drink + "' to feed Robortender; skipping." );
	    continue;
	}

	robodrink data = robodrinks[ drink ];

	print( "Lubricating Robortender with '" + drink + "' to gain effect: " + data.desc );
	
	if ( cli_execute( "robo " + drink.name ) && --available == 0 ) {
	    break;
	}
    }
}

void visit_kiosk()
{
    if ( farm_location != BARF_MOUNTAIN ) {
	return;
    }

    print( "Checking if the Barf Mountain tracks need lubrication" );

    // We may have already accepted the assignment
    if ( item_amount( lube_shoes ) == 1 ) {
	print( "They do!" );
	return;
    }

    // Visit Employee Assignment Kiosk
    string page = visit_url( "place.php?whichplace=airport_stench&action=airport3_kiosk" );
    matcher m = create_matcher( "<b>Track Maintenance</b>.*?name=option value=(.)>", page );
	
    if ( m.find() ) {
	// Accept the job
	print( "They do!" );
	run_choice( m.group( 1 ).to_int() );
    } else {
	print( "Nope!" );
	set_property( "choiceAdventure1073", "1" );
    }

    // Leave the Kiosk
    run_choice( 6 );
}

void lubricate_tracks()
{
    if ( farm_location != BARF_MOUNTAIN || item_amount( lube_shoes ) == 0 ) {
	return;
    }

    if ( my_adventures() > 0 ) {
	print( "Lubricating Barf Mountain tracks" );

	// Prepare to adventure
	suit_up( BARF_MOUNTAIN, meat_familiar );

	// Adventure at Barf Mountain until we got a ticket to ride -
	// but we don't care.
	set_property( "choiceAdventure1073", "6" );
	do_adventure_choice( BARF_MOUNTAIN, 1073 );

	if ( my_adventures() == 0 ) {
	    return;
	}

	// Equip lube-shoes in acc3
	item acc3_item = equipped_item( acc3 );
	equip( acc3, LUBE_SHOES );

	// Adventure at Barf Mountain and take the choice
	set_property( "choiceAdventure1073", "1" );
	do_adventure_once( BARF_MOUNTAIN );

	// Equip original acc3
	equip( acc3, acc3_item );

	// Visit Employee Assignment Kiosk and accept reward
	visit_url( "place.php?whichplace=airport_stench&action=airport3_kiosk" );
	run_choice( 3 );
	run_choice( 6 );

	// If we accepted this assignment before today, we can accept
	// another assignment. If Track Maintenance is available again,
	// take it. We will complete it next time this script runs.
	visit_kiosk();
    }
}

void sell_adventure_loot()
{
    print( "Selling loot obtained while adventuring" );

    // Sell loot
    switch ( farm_location ) {
    case OFFICE:
	batch_open();
	foreach it in OFFICE_USE_LOOT {
	    use_all_but( it, 0 );
	}
	batch_close();

	batch_open();
	foreach it in OFFICE_AUTOSELL_LOOT {
	    autosell_all_but( it, 0 );
	}
	batch_close();
	break;
    case BARF_MOUNTAIN:
	// Turn in some park garbage
	visit_url( "place.php?whichplace=airport_stench&intro=1" );
	visit_url( "place.php?whichplace=airport_stench&action=airport3_tunnels" );
	run_choice( 6 );

	batch_open();
	foreach it in BARF_USE_LOOT {
	    use_all_but( it, 1 );
	}
	batch_close();

	batch_open();
	foreach it in BARF_AUTOSELL_LOOT {
	    autosell_all_but( it, 1 );
	}
	batch_close();
	break;
    }

    // Now deal with random stuff which might have dropped

    batch_open();
    foreach it in GENERAL_USE_LOOT {
	use_all_but( it, 0 );
    }
    batch_close();

    batch_open();
    foreach it in GENERAL_AUTOSELL_LOOT {
	autosell_all_but( it, 0 );
    }
    batch_close();

    // If you you have a government per-diem, use it.
    if ( available_amount( GOVERNMENT_PER_DIEM ) > 0 &&
	 !get_property( "_governmentPerDiemUsed" ).to_boolean() ) {
	retrieve_item( 1, GOVERNMENT_PER_DIEM );
	use( 1, GOVERNMENT_PER_DIEM );
    }
}

void tea_tree()
{
    if ( !have_tea_tree || get_property( "_pottedTeaTreeUsed" ).to_boolean() ) {
	return;
    }

    if ( CUPPSA_TEA contains desired_cuppa_tea ) {
	print( "Harvesting your tea tree" );
	cli_execute( "teatree " + desired_cuppa_tea );
    }
}

void handle_royalty()
{
    int tea_count = item_amount( ROYAL_TEA );
    if ( tea_count == 0 ) {
	return;
    }

    string option = royalty_choice;
    if ( option == "choose" ) {
	int scepter_count = available_amount( ROYAL_SCEPTER ) + display_amount( ROYAL_SCEPTER );
	option = scepter_count > 0 ? "mallsell" : "use";
    }

    switch ( option ) {
    case "use":
	use_all_but( ROYAL_TEA, 0 );
	break;
    case "mallsell":
	mallsell_all_but( ROYAL_TEA, 0 );
	break;
    }
}

void comb_beach()
{
    // If you don't have a beach comb or don't want to use it, punt.
    if ( !have_beach_comb || ( beach_comb_turns < 0 ) ) {
	return;
    }

    // We will use one of two scripts:
    // 
    // combo - by Loathing Associates Scripting Society
    // BeachComber - by Veracity

    // "combo" will preferentially visit squares known to be "rare".
    // I.e., ones that can have a piece of driftwood, cursed pirate
    // gear, a message in a bottle, a meteorite fragment, or a whale
    // Its database contains the location of all 744 such squares.

    // "BeachComber" will visit random sections of the beach and harvest
    // whales (I've seen one!) or "sparkly" squares.

    // beach_comb_script specifies which script you want to use.
    // If you have it installed, we will use it.
    if ( !check_installed( beach_comb_scripts[ beach_comb_script ] ) ) {
	return;
    }

    boolean use_beach_comber = beach_comb_script == "BeachComber";
    boolean use_combo = beach_comb_script == "combo";
    
    // Determine how many free walks we have used today.
    int free_walks_used = get_property( "_freeBeachWalksUsed" ).to_int();
    int free_walks_left = 11 - free_walks_used;

    // Determine how many walks we have used today with Veracity's Beach Comber
    // *** Unfortunately, combo does not save its turn-using walk count in a property
    // *** However, if called from this script, we'll tally them in BeachComber's property
    int turn_walks_used = get_property( "_VBC.TurnsSpentCombing" ).to_int();

    if ( beach_comb_turns == 0 ) {
	// Only want free walks.
	if ( free_walks_left > 0 ) {
	    if ( use_combo ) {
		cli_execute( "combo " + free_walks_left );
	    } else {
		cli_execute( "BeachComber free" );
	    }
	}
    } else {
	// We are willing to spend turns.
	int turn_walks_left = beach_comb_turns - turn_walks_used;

	if ( turn_walks_left == 0 ) {
	    // We are done combing for the day
	} else if ( use_combo ) {
	    // combo does not distinguish between free walks and those
	    // that spend turns.
	    cli_execute( "combo " + ( free_walks_left + turn_walks_left ) );
	    // save turn walks in BeachComber's property
	    set_property( "_VBC.TurnsSpentCombing", turn_walks_left );
	} else {
	    // BeachComber will use up remaining free walks and then use turns
	    cli_execute( "BeachComber " + turn_walks_left );
	}
    }

    // If we got any sand dollars, closet them. If our costume includes
    // a lucky gold ring, that will prevent it from finding more sand
    // dollars, which are less valuable than charter currency.
    put_closet( item_amount( SAND_DOLLAR ), SAND_DOLLAR );
}

void bastille_battalion()
{
    if ( !use_battalion || !have_battalion ) {
	return;
    }

    if ( item_amount( BRUTAL_BROGUES ) > 0 ||
	 item_amount( DRAFTSMANS_DRIVING_GLOVES ) > 0 ||
	 item_amount( NOUVEAU_NOSERING ) > 0 ) {
	    return;
    }

    if ( !check_installed( ezandora_bastille )) {
	return;
    }

    // calculate parameters for the Barbican, Drawbridge, Murder Hole, and Moat

    string barbican_keyword()
    {
	stat st =
	    battalion_stats == "mainstat" ?
	    my_primestat() :
	    battalion_stats.to_stat();
	switch ( st ) {
	case MUSCLE:
	    return "babar";
	case MYSTICALITY:
	    return "barbecue";
	case MOXIE:
	    return "barbershop";
	}
	return "none";
    }

    string drawbridge_keyword()
    {
	switch ( battalion_accessory ) {
	case BRUTAL_BROGUES:
	    return "brutalist";
	case DRAFTSMANS_DRIVING_GLOVES:
	    return "draftsman";
	case NOUVEAU_NOSERING:
	    return "nouveau";
	}
	return "none";
    }

    string murder_hole_keyword()
    {
	switch ( battalion_effect ) {
	case BASTILLE_BUDGETEER:
	    return "cannon";
	case BASTILLE_BOURGEOISIE:
	    return "catapult";
	case BASTILLE_BRAGGADOCIO:
	    return "gesture";
	}
	return "none";
    }

    string moat_keyword()
    {
	string keyword = battalion_potion;

	switch ( battalion_potion ) {
	case  "random":
	    keyword = BATTALION_POTIONS[ random( 3 ) ].name;
	    break;
	case "rarest":
	    keyword = BATTALION_POTIONS.load_item_map().find_rarest_item().name;
	    break;
	}

	switch ( keyword ) {
	case "sharkfin gumbo":
	    return "sharks";
	case "boiling broth":
	    return "lava";
	case "interrogative elixir":
	    return "truth";
	}
	return "none";
    }

    string barbican = barbican_keyword();
    string drawbridge = drawbridge_keyword();
    string murder_hole = murder_hole_keyword();
    string moat = moat_keyword();

    string parameters = `{barbican} {drawbridge} {murder_hole} {moat}`;

    // Make sure your Bastille Battalion control rig is in inventory
    retrieve_item( 1, BASTILLE_BATTALION );

    // Call Ezandora's script
    cli_execute( "bastille " + parameters );
}

void detective_school()
{
    if ( !have_detective_school ||
	 get_property("_detectiveCasesCompleted").to_int() >= 3 ||
	 !check_installed( ezandora_detective_solver )) {
	return;
    }

    cli_execute( "Detective Solver" );
}

void make_wads()
{
    if ( !make_prismatic_wads || !have_skill( RAINBOW_GRAVITATION ) ) {
	return;
    }

    int casts = 3 - get_property( "prismaticSummons" ).to_int();
    if ( casts > 0 ) {
	catch use_skill( casts, RAINBOW_GRAVITATION );
    }
}

void claim_defective_token()
{
    // Check for / acquire a defective Game Grid token
    if ( have_game_grid_token && !get_property( "_defectiveTokenChecked" ).to_boolean() ) {
	// Get it into inventory
	if ( item_amount( GAME_GRID_TOKEN ) == 0 ) {
	    retrieve_item( 1, GAME_GRID_TOKEN );
	}

	print( "Looking for a Defective Game Grid token" );
	visit_url( "place.php?whichplace=town_wrong" );
	visit_url( "place.php?whichplace=arcade" );
	visit_url( "place.php?whichplace=arcade&action=arcade_plumber", false );
    }
}

void psychoanalize_jick()
{
    // Check for / acquire a jar of psychoses (Jick)
    if ( have_psych_jar && get_property( "_jickJarAvailable" ) == "unknown" ) {
	print( "Looking for a Jick jar" );

	// Get it into inventory
	if ( item_amount( PSYCH_JAR ) == 0 ) {
	    retrieve_item( 1, PSYCH_JAR );
	}

	string page = visit_url( "showplayer.php?who=1" );
	if ( page.contains_text( "psychoanalytic jar" ) ) {
	    print( "Yes! Time for some psychoanalysis." );
	    visit_url( "showplayer.php?who=1&action=jung&whichperson=jick" );
	} else {
	    print( "Nope." );
	}
    }
}

void collect_sea_jelly()
{
    if ( have_space_jellyfish && !get_property( "_seaJellyHarvested" ).to_boolean() ) {
	if ( get_property("questS01OldGuy") == "unstarted" ) {
	    print( "Talking to the Old Man" );
	    visit_url( "place.php?whichplace=sea_oldman&action=oldman_oldman" );
	}

	print( "Harvesting your daily sea jelly" );
	use_familiar( SPACE_JELLYFISH );
	visit_url( "place.php?whichplace=thesea&action=thesea_left2" );
	run_choice( 1 );
    }
}

void drink_nightcap()
{
    int current_inebriety_limit = inebriety_limit();

    if ( my_inebriety() > current_inebriety_limit || nightcap == NO_ITEM ) {
	return;
    }

    print( "Time for a little nightcap" );

    // If you have a Stooper, use it as part of your nightcao
    boolean use_stooper = have_stooper && use_familiar( STOOPER ) && ( inebriety_limit() > current_inebriety_limit );

    int ode_needed = nightcap.inebriety + ( use_stooper ? 1 : 0 );
    ode_up( ode_needed );

    if ( use_stooper ) {
	fill( LIVER, 1 );
    }

    // If we used our Stooper, we are drinking with turns left.
    overdrink( 1, nightcap );
}

void ballpit()
{
    if ( !get_property( "_ballpit" ).to_boolean() &&
	 clan_rumpus_room contains "Awesome Ball Pit" ) {
	cli_execute( "ballpit" );
    }
}

void telescope()
{
    if ( get_property( "telescopeUpgrades" ).to_int() > 0 &&
	 !get_property( "telescopeLookedHigh" ).to_boolean() ) {
	cli_execute( "telescope look high" );
    }
}

void chateau()
{
    if ( !have_chateau ) {
	return;
    }

    // Use up free rests since Chateau Mantegna will increase mainstat
    int free_rests = total_free_rests();
    int used_rests = get_property( "timesRested" ).to_int();
    while ( used_rests++ < free_rests ) {
	cli_execute( "rest free" );
    }

    if ( !get_property( "_chateauDeskHarvested" ).to_boolean() ) {
	visit_url( "place.php?whichplace=chateau&action=chateau_desk" );
    }
}

void nuns()
{
    // The nuns only restore MP if you rescued their Meat as a fratboy
    if ( get_property( "sidequestNunsCompleted" ) != "fratboy" ) {
	return;
    }

    int available = 3 - get_property( "nunsVisits" ).to_int();
    while ( available-- > 0 ) {
	cli_execute( "nuns mp" );
    }
}

void breakfast()
{
    if ( get_property( "breakfastCompleted" ).to_boolean() ) {
	return;
    }

    print( "Time for breakfast - at the end of the day?" );

    if ( breakfast_script == "" ) {
	cli_execute( "breakfast" );
    } else {
	cli_execute( "call " + breakfast_script );
    }
}

void create_extrusions()
{
    if ( !have_source_terminal ) {
	return;
    }

    // Extrusions are optional
    if ( count( desired_extrusions ) == 0 ) {
	return;
    }

    int available = 3 - get_property( "_sourceTerminalExtrudes" ).to_int();

    if ( available <= 0 ) {
	return;
    }

    print( "Extruding Source essence into items" );

    foreach n, name in desired_extrusions {
	extrusion ext = valid_extrusions[ name ];

	// Certain items are untradeable Source Terminal upgrades.  If
	// you have already upgraded your Source Terminal to max with
	// such items, don't extrude another one.
	if ( ext.max > 0 ) {
	    if ( ext.max == 1 ) {
		if ( installed_chips contains ext.property ) {
		    print( "You already have a " + ext.result + " installed in your Source Terminal - skipping." );
		    continue;
		}
	    } else {
		int current = get_property( ext.property ).to_int();
		if ( current >= ext.max ) {
		    print( "You already have " + current + " " + ext.result + "s installed in your Source Terminal - skipping." );
		    continue;
		}
	    }
	}

	// Reasonable item. Can we afford it?
	if ( !retrieve_item( ext.cost, SOURCE_ESSENCE ) ) {
	    print( "Unable to retrieve enough Source essence to extrude a " + ext.result + " - skipping." );
	    continue;
	}

	cli_execute( "terminal extrude " + name );

	// If it is a non-tradeable Source Terminal upgrade, use it
	// immediately.
	if ( ext.max > 0 && item_amount( ext.result ) > 0 ) {
	    print( "Installing Source Terminal upgrade: " + ext.result );
	    use( 1, ext.result );
	    // If installing a single chip, update list of installed chips
	    if ( ext.max == 1 ) {
		installed_chips[ ext.property ] = true;
	    }
	}

	// Quit when we have no more extrusions available
	if (--available <= 0) {
	    break;
	}
    }
}

void raid_clan()
{
    if ( !have_clan ) {
	return;
    }

    if ( clan_rumpus_room contains "Snack Machine" ) {
	// Get chips from the snack machine
	int available = 3 - get_property( "_chipBags" ).to_int();

	if ( available > 0 ) {
	    print( "Collecting snacks" );

	    switch ( available ) {
	    case 3:
		cli_execute( "chips radium" );
	    case 2:
		cli_execute( "chips wintergreen" );
	    case 1:
		cli_execute( "chips ennui" );
	    default:
		break;
	    }
	}
    }
}

void raid_lounge()
{
    if ( !have_clan || !have_lounge_key) {
	return;
    }

    if ( have_shower && !get_property( "_aprilShower" ).to_boolean() ) {
	print( "Taking a shower in the Clan VIP Lounge" );
	cli_execute( "shower " + shower );
    }

    if ( have_swimming_pool && swimming_pool != NO_EFFECT && !get_property( "_olympicSwimmingPool" ).to_boolean() ) {
	print( "Taking a dip in the Clan swimming pool" );
	string command = swimming_pool == LAPDOG ? "laps" : "sprints";
	cli_execute( "swim " + command );
    }
}

void play_pool()
{
    if ( !have_clan || !have_lounge_key || !have_pool_table ) {
	return;
    }

    if ( pool_table_stance == NO_STAT ) {
	return;
    }

    int available = 3 - get_property( "_poolGames" ).to_int();
    if ( available > 0 ) {
	print( "Playing pool in the Clan VIP Lounge" );
	int stance =
	    pool_table_stance == MUSCLE ? 1 :
	    pool_table_stance == MYSTICALITY ? 2 :
	    pool_table_stance == MOXIE ? 3 :
	    0;
	while ( stance != 0 && available-- > 0 ) {
	    cli_execute( "pool " + stance );
	}
    }
}

void legendary_beat()
{
    if ( available_amount( LEGENDARY_BEAT ) == 0 ) {
	return;
    }	

    if ( get_property( "_legendaryBeat" ).to_boolean() ) {
	return;
    }

    print( "And the beat goes on..." );

    retrieve_item( 1, LEGENDARY_BEAT );
    use( 1, LEGENDARY_BEAT );
}

void redwood_rain_stick()
{
    if ( available_amount( REDWOOD_RAIN_STICK ) == 0 ) {
	return;
    }	

    if ( get_property( "_redwoodRainStickUsed" ).to_boolean() ) {
	return;
    }

    print( "Shake it! Shake it!" );

    retrieve_item( 1, REDWOOD_RAIN_STICK );
    use( 1, REDWOOD_RAIN_STICK );
}

void license_to_chill()
{
    if ( available_amount( LICENSE_TO_CHILL ) == 0 ) {
	return;
    }	

    if ( get_property( "_licenseToChillUsed" ).to_boolean() ) {
	return;
    }

    print( "Time to chill out. You deserve it!" );

    retrieve_item( 1, LICENSE_TO_CHILL );
    use( 1, LICENSE_TO_CHILL );
}

void platinum_yendorian_express_card()
{
    boolean from_stash = false;
    boolean available = false;

    // Special shenanigans if might borrow/return from clan stash
    if ( should_use_stash ) {
	// See if it is available without using the stash
	try {
	    set_property( "autoSatisfyWithStash", false );
	    available = available_amount( PYEC ) > 0;
	} finally {
	    set_property( "autoSatisfyWithStash", true );
	}

	// If not, see if it is available with the stash
	if ( !available ) {
	    // Refresh the stash
	    get_stash();
	    from_stash = available = available_amount( PYEC ) > 0;
	}
    } else {
	available = available_amount( PYEC ) > 0;
    }

    // If we can't get one, we can't use one
    if ( !available ) {
	return;
    }	

    if ( get_property( "expressCardUsed" ).to_boolean() ) {
	return;
    }

    print( "Extending some effects." );

    // Even though we verified that a PYEC is available, retrieve_item()
    // can fail, since a PYEC is a karma-regulated item in a clan stash.
    if ( retrieve_item( 1, PYEC ) ) {
	use( 1, PYEC );

	// If we borrowed from the stash, put it back
	if ( from_stash ) {
	    put_stash( 1, PYEC );
	}
    }
}

void celebrate_dependence_day()
{
    if ( !holiday.contains_text( "Dependence Day" ) ) {
	return;
    }

    if ( dependence_day_firework == NO_ITEM ) {
	return;
    }

    if ( get_property( "_fireworkUsed" ).to_boolean() ) {
	return;
    }

    use( 1, dependence_day_firework );
}

void floundry_fabricate()
{
    if ( !have_clan || !have_lounge_key || !have_floundry ) {
	return;
    }

    if ( floundry_item == NO_ITEM ) {
	return;
    }

    // One per day
    if ( get_property( "_floundryItemCreated" ).to_boolean() ) {
	return;
    }

    // Make it!
    cli_execute( "create " + floundry_item.to_string() );
}

void consult_with_madame_zatara()
{
    if ( !have_lounge_key || !consult_with_cheesefax ) {
	return;
    }

    // Check how many times you've consulted with a clanmate.
    // You are allowed three per day.
    if ( get_property( "_clanFortuneConsultUses" ).to_int() >= 3 ) {
	return;
    }

    string word1 = get_property( "clanFortuneWord1" );
    boolean compatible1 = word1 ≈ "pizza";
    string word2 = get_property( "clanFortuneWord2" );
    boolean compatible2 = word2 ≈ "batman";
    string word3 = get_property( "clanFortuneWord3" );
    boolean compatible3 = word3 ≈ "thick";

    print( "Consulting with CheeseFax seeking {" +
	   ( compatible1 ? "compatible" : "incompatible" ) + ", " +
	   ( compatible2 ? "compatible" : "incompatible" ) + ", " +
	   ( compatible3 ? "compatible" : "incompatible" ) +
	   "} prizes." );

    // CheeseFax
    int player = 3038166;

    // Unless CheeseFax is on your contact list, this will return the player ID.
    // Which works, even though responses from Madame Zatara will use the name
    string name = get_player_name( player );

    string consultURL =
	"choice.php?pwd=&whichchoice=1278&option=1&which=1" +
	"&whichid=" + name +
	"&q1=" + word1 +
	"&q2=" + word2 +
	"&q3=" + word3;

    // Save current inventory
    item_to_int_map initial_inventory = get_inventory();

    try {
	// We start out in home_clan
	if ( home_clan != BAFH ) {
	    cli_execute( "/whitelist " + BAFH );
	}

	if ( BAFH != get_clan_name() ) {
	    print( "You are not whitelisted in " + BAFH + ". Fix that and try again.", "red" );
	    return;
	}

	// 5 minutes. Should not take this long except right after rollover
	int INTERVAL = 5;			// 5 seconds
	int TIMEOUT = 300;			// 300 seconds = 5 minutes
	int retries = TIMEOUT / INTERVAL;

	while ( true ) {
	    string page = visit_url( "clan_viplounge.php?preaction=lovetester", false );
	    page = visit_url( consultURL );
	    if ( page.contains_text( "You can't consult Madame Zatara about your relationship with anyone else today." ) ) {
		return;
	    }
	    if ( page.contains_text( "You enter your answers and wait for " + name + " to answer, so you can get your results!" ) ||
		 page.contains_text( "You're already waiting on your results with " + name + "." ) ) {
		print( "Waiting for " + name + " to respond..." );
	    }
	    else if ( page.contains_text( "You can only consult Madame Zatara about someone in your clan.") ) {
		print( name + " is not in the clan. Waiting...", "blue" );
	    } else {
		print( "Waiting for " + name + " to respond..." );
	    }
	    if ( --retries < 0 ) {
		print( name + " seems to be lost. Giving up.", "red" );
		return;
	    }
	    waitq( INTERVAL );
	}
    } finally {
	if ( home_clan != get_clan_name() ) {
	    cli_execute( "/whitelist " + home_clan );
	}

	// New items arrive in kmail
	cli_execute( "refresh inventory" );

	item_to_int_map inventory_diff = item_map_difference( initial_inventory, get_inventory() );

	// You can gain other items in kmail or lose things by PVP.
	// Make a map containing only Zatara's prizes
	item_to_int_map prizes = get_property( "_zataraPrizes" ).to_item_set().to_item_to_int_map();
	foreach it, count in inventory_diff {
	    if ( ZATARA_PRIZES contains it && count == 1 ) {
		prizes[ it ] = count;
	    }
	}

	if ( count( prizes ) > 0 ) {
	    print( "The following items arrived from " + name + ":" );
	    foreach it, count in prizes {
		print( "\u00A0\u00A0\u00A0\u00A0" + it );
	    }
	}

	// Save it in a daily property so you can look at it later
	set_property( "_zataraPrizes", prizes.to_item_set().to_string( "|" ) );
    }
}

void fax_monster()
{
    if ( !have_clan || !have_lounge_key || !have_fax_machine ) {
	return;
    }

    if ( fax_monster == NO_MONSTER || get_property( "_photocopyUsed" ).to_boolean() ) {
	return;
    }

    if ( !can_faxbot( fax_monster ) ) {
	print( "monster '" + fax_monster + "' is not currently available in the fax network." );
	return;
    }

    print( "Requesting a fax" );

    // Chat must be open to receive a fax.
    print( "*** chat must remain open until your fax is received ***" );
    cli_execute( "chat" );
    waitq( 5 );		// Wait a bit to allow time for the frame to open

    if ( !faxbot( fax_monster ) ) {
	print( "Unable to fax monster '" + fax_monster + "'." );
	return;
    }

    // Use the desired familiar. If none specified, use farming familiar
    familiar fax_familiar = summoned_monster_familiar();

    // *** ask for no familiar item ... because we want to be able to copy it before our familiar acts?
    suit_up( NO_LOCATION, fax_familiar, NO_ITEM );

    // Use the photocopied monster to start the fight
    between_battle_checks();
    visit_url( "inv_use.php?whichitem=" + PHOTOCOPIED_MONSTER.to_int() );

    // Fight the monster and perhaps copy it
    while ( true ) {
	// Decide which monster copying mechanism to use.
	boolean setup_copying()
	{
	    int rain_doh_used = get_property( "_raindohCopiesMade" ).to_int();
	    int spooky_putty_used = get_property( "spookyPuttyCopiesMade" ).to_int();

	    int total_copies = rain_doh_used + spooky_putty_used;

	    // If neither rain-doh nor spooky putty is available, use neither
	    if ( !use_rain_doh && !use_spooky_putty ) {
		rain_doh_available = false;
		spooky_putty_available = false;
		return false;
	    }

	    // If have made 6 copies today, use neither
	    if ( total_copies >= 6 ) {
		rain_doh_available = false;
		spooky_putty_available = false;
		return false;
	    }

	    // If we have rain-doh and spooky putty is unavailable, use it if have copies left
	    if ( use_rain_doh && ( !use_spooky_putty || spooky_putty_used >= 5 ) ) {
		rain_doh_available = rain_doh_used < 5;
		spooky_putty_available = false;
		return rain_doh_available;
	    }

	    // If we have spooky putty and rain-doh is unavailable, use it if have copies left
	    if ( use_spooky_putty && ( !use_rain_doh || rain_doh_used >= 5 ) ) {
		spooky_putty_available = spooky_putty_used < 5;
		rain_doh_available = false;
		return spooky_putty_available;
	    }

	    // We have both available. Pick one to use, since it complicates
	    // later logic if we have both copies already in inventory.
	    // Arbitrarily use the one we've used fewer times today
	    if ( rain_doh_used <= spooky_putty_used ) {
		rain_doh_available = true;
		spooky_putty_available = false;
	    } else {
		rain_doh_available = false;
		spooky_putty_available = true;
	    }

	    return true;
	}

	// Set up the fight: can pickpocket, can use available copier
	combat_filter_setup( NO_LOCATION );
	pickpocket_available = true;
	boolean will_copy = setup_copying();

	// Fight!
	run_combat( "putty_filter" );

	// If we detected paranormal activity after that fight, may as well bust the ghost now.
	bust_ghost();

	// If we didn't try to make a copy, done fighting
	if ( !will_copy ) {
	    break;
	}

	item copied_monster =
	    use_rain_doh && item_amount( BOX_FULL_OF_MONSTER ) > 0 ?
	    BOX_FULL_OF_MONSTER :
	    use_spooky_putty && item_amount( SPOOKY_PUTTY_MONSTER ) > 0 ?
	    SPOOKY_PUTTY_MONSTER :
	    NO_ITEM;

	// We wanted to copy, but if no copy was made, done fighting
	if ( copied_monster == NO_ITEM ) {
	    break;
	}

	between_battle_checks();
	visit_url( "inv_use.php?whichitem=" + copied_monster.to_int() );
    }
}

void clip_art()
{
    if ( !have_clipart ) {
	return;
    }

    int available = 3 - get_property( "_clipartSummons" ).to_int();

    if ( available == 0 ) {
	return;
    }

    // If any clip_art is unconfigured, choose most expensive item
    if ( !( CLIP_ART_ITEMS contains clip_art[0] &&
	    CLIP_ART_ITEMS contains clip_art[1] &&
	    CLIP_ART_ITEMS contains clip_art[2] ) ) {
	item clip = dearest( CLIP_ART_ITEMS );
	if ( !( CLIP_ART_ITEMS contains clip_art[0] ) ) {
	    clip_art[0] = clip;
	}
	if ( !( CLIP_ART_ITEMS contains clip_art[1] ) ) {
	    clip_art[1] = clip;
	}
	if ( !( CLIP_ART_ITEMS contains clip_art[2] ) ) {
	    clip_art[2] = clip;
	}
    }

    print( "Summoning Clip Art" );

    switch ( available ) {
    case 3:
	create( 1, clip_art[2] );
    case 2:
	create( 1, clip_art[1] );
    case 1:
	create( 1, clip_art[0] );
    default:
	break;

    }
}

void handle_guzzlr()
{
    if ( !collect_guzzlr_cocktail_set || !have_guzzlr_tablet ) {
	return;
    }

    // Pull it into inventory
    retrieve_item( 1, GUZZLR_TABLET );

    // You can only do this once per day
    if ( get_property( "_guzzlrPlatinumDeliveries" ).to_int() > 0 ) {
	return;
    }

    print( "Collecting a Guzzlr cocktail set" );

    // Tap your Guzzlr tablet
    visit_url( "inventory.php?tap=guzzlr", false );

    if ( !( available_choice_options() contains 4 ) ) {
	// We've apparently already taken a platinum client today.
	print( "Not today" );
	run_choice( 5 );
	return;
    }

    // A Platinum client is available. Accept them.
    run_choice( 4 );

    // Tap your Guzzlr tablet again
    visit_url( "inventory.php?tap=guzzlr", false );

    // Leave your Platinum client thirsty
    run_choice( 1 );

    // Do not participate in the Gig economy
    run_choice( 5 );
}

void use_still()
{
    int stills = stills_available();
    if ( stills == 0 ) {
	return;
    }

    print( "Using Nash Crosby's Still" );

    item_to_int_map map = load_item_map( STILL_ITEMS );

    while ( stills-- > 0 ) {
	// Pick the item we have the fewest of
	item make = find_rarest_item( map );
	create( 1, make );
	map[ make ]++;
    }
}

void sell_breakfast_loot()
{
    batch_open();
    foreach it in BREAKFAST_USE_LOOT {
	use_all_but( it, 0 );
    }
    batch_close();

    if ( !should_sell_breakfast_loot ) {
	return;
    }

    print( "Selling loot obtained from breakfast" );

    batch_open();
    foreach it in BREAKFAST_AUTOSELL0_LOOT {
	autosell_all_but( it, 0 );
    }
    foreach it in BREAKFAST_AUTOSELL1_LOOT {
	autosell_all_but( it, 1 );
    }
    batch_close();

    if ( store_available ) {
	batch_open();
	foreach it in BREAKFAST_MALLSELL0_LOOT {
	    mallsell_all_but( it, 0 );
	}
	foreach it in BREAKFAST_MALLSELL1_LOOT {
	    mallsell_all_but( it, 1 );
	}
	batch_close();
    }
}

boolean counterExpired( string label, string turns_remaining )
{
    print( "Counter '" + label + "' expires in " + turns_remaining + " turns" );
    if ( !handling_counters ) {
	print( "We are not currently handling counters in a counterScript" );
    } else if ( turns_remaining > 0 ) {
	print( "We only handle times when they are expiring now." );
    } else {
	print( "We don't handle that counter." );
    }
    print( "Done with counter script" );

    // This means we handled it. Which is always true: We either did
    // something special or intentionally ignored it.
    return true;
}

// ***************************
// *     Master Control      *
// ***************************

void run_tasks()
{
    // Cloud Talk gives you +25% stat gains
    visit_getaway_campsite();

    // If spinning wheel is our first workshed item, install it.
    if ( workshed1 == SPINNING_WHEEL ) {
	install_workshed_item( SPINNING_WHEEL );
	// If it is not the second workshed item, harvest it now so the other item can be installed.
	if ( workshed2 != SPINNING_WHEEL ) {
	    visit_url("campground.php?action=spinningwheel");
	}
    }

    // Consume to gain adventures and stats
    eat_up();
    drink_up();

    // Arrrbor Day requires turns but is all non-combats.
    // Therefore, no special gear, familiar, effects.
    // Certainly not Sweet Synthesis.
    celebrate_arrrbor_day();

    // Use items that grant adventures. Do this before spleening so we
    // can account for them in Sweet Synthesis casting requirements
    etched_hourglass();

    // Visit Towering Inferno Discotheque to gain adventures
    if ( disco_goal == DISCO_TURNS ) {
	visit_disco( disco_goal );
    }

    // Consume to synthesize candy and/or gain turns
    spleen_up();

    // Get necessary items
    acquire_gear();

    // Perform daily tasks that require available turns
    cheat_deck();
    use_timespinner();

    // Fighting a skulldozer or piranha plants results in a fight.
    // Otherwise, we could harvest the garden at the end of the day.
    harvest_garden();

    // Vamping out can improve damage and/or give useful items
    // It takes 1 turn per reward.
    vamp_out();

    // Get yerself a horse!
    rent_a_horse();

    // Possibly get effects that improve Item Drop or familiars
    get_witchess_buff();
    get_fortune_teller_buff();
    get_friars_blessing();
    play_pool();
    legendary_beat();
    redwood_rain_stick();

    if ( disco_goal == DISCO_ITEM_DROP ) {
	visit_disco( disco_goal );
    }

    // Celebrate Dependence Day - get a buff or clovers
    celebrate_dependence_day();
    
    // Make a lasts-until-rollover items
    floundry_fabricate();

    // *** Here start potential adventures/fights.

    // Install model train set, if so-configured
    if ( workshed1 == MODEL_TRAIN_SET || workshed2 == MODEL_TRAIN_SET ) {
	install_workshed_item( MODEL_TRAIN_SET );
    }

    // The Tunnel of L.O.V.E. does not use turns, and available effects
    // and lasts-until-rollover items might be of interest.
    use_tunnel_of_love();

    // A VYKEA companion can help with item drops
    create_vykea_companion();

    // Put a mumming costume on your familiar
    wear_mumming_costume();

    // Play a boombox song. Do this before fighting, since we might sing along during the fight.
    // Free fights will not advance the counter for dropping a special song item.
    play_boombox_song();

    // If case we are using a Robortender for item drop, lubricate it
    // before running free fights
    if ( my_inebriety() <= inebriety_limit() &&
	 my_adventures() > 0 ) {
	// Lubricate Robortender, if necessary
	lubricate_robortender();
    }

    run_free_fights();

    // The Boxing Daycare might use turns and might provide useful
    // farming buffs
    visit_boxing_daycare();

    // Optionally adventure Through the Spacegate. For science!
    // No Meat drops there, although rare and/or expensive items do.
    explore_spacegate();

    // Optionally adventure in the Gingerbread City for sprinkles and/or items.
    // No Meat drops there.
    use_gingerbread_city();

    // Optionally spend turns combing the beach
    comb_beach();

    // Play with the Bastille Battalion. This can improve your Meat Drop.
    bastille_battalion();

    // Get effects that (probably) improve Meat Drop
    get_source_terminal_enhancement();
    summon_demon();
    tea_party();

    // Get any other disco goal
    if ( disco_goal == DISCO_STATS || disco_goal == DISCO_TRAVOLTRON || disco_goal == DISCO_VOLCOINO ) {
	visit_disco( disco_goal );
    }

    // Do things that extend the duration of (some) effects
    // *** execute our mood here? Need better mood support.
    platinum_yendorian_express_card();
    license_to_chill();

    // Fax in, copy, and fight a monster, which might have desirable
    // Meat or item drops. It might also be a free fight.
    fax_monster();

    // Ask the genie for wishes. This might include fighting monsters
    genie_wishes();

    if (!run_turns) {
	exit;
    }

    // Allow this script to be run multiple times
    if ( my_inebriety() <= inebriety_limit() &&
	 my_adventures() > 0 ) {

	// Make sure adventuring locations are available.
	enable_adventure_locations();

	// Accept Dinseylandfill Track Maintenance task, if available, to earn 3 FunFunds
	visit_kiosk();

	// Prepare to adventure
	prepare_to_adventure();

	// *** farm! ***

	// Lubricate Barf Mountain tracks if we accepted the task
	lubricate_tracks();

	// put on proper outfit
	suit_up( farm_location );

	// Consume all turns
	do_adventure_all( farm_location );

	// *** end of farming ***
    }

    // Sell loot
    sell_adventure_loot();

    // Perform daily tasks that don't require available turns and/or
    // can't be done while drunk
    tea_tree();
    handle_royalty();
    detective_school();
    make_wads();
    claim_defective_token();
    collect_sea_jelly();
    psychoanalize_jick();

    // Drink nightcap
    drink_nightcap();

    // Since drinking a nightcap is optional, you might have 0 turns
    // available here. Do things that can be done drunk and don't
    // require a turn here and things that do require a turn elsewhere.

    // Increase stats and available HP/MP
    ballpit();
    telescope();

    // Use free rests to gain XP and restore HP & MP
    chateau();

    // Burn MP at Nunnery
    nuns();

    // Time to install certain second workshed items.
    switch (workshed2) {
    case MAYO_CLINIC:
	// portable Mayo clinic ready to use tomorrow
    case SPINNING_WHEEL:
	// spinning wheel ready to use in breakfast
	install_workshed_item( workshed2 );
	break;
    }

    // Do breakfast at the end, since the spinning wheel, for example,
    // depends on your level, and you could have leveled up.
    breakfast();

    // Collect a Guzzlr cocktail set
    handle_guzzlr();

    // Get items from Clan Rumpus room and Clan Lounge
    raid_clan();
    raid_lounge();

    // Create desired clip art
    clip_art();

    // Make Source Terminal Extrusions
    create_extrusions();

    // Use Nash Crosby's still
    use_still();

    // Bestow The Smile of Mr. A. on your friends
    send_smiles();

    // Consult with the clan fortune teller
    consult_with_madame_zatara();

    // Sell breakfast loot
    sell_breakfast_loot();

    // If you have a Trick or Treating Tot, prefer that, since the li'l
    // unicorn costume is likely better than general familiar equipment
    // for rollover adventures
    use_familiar( have_tot ? TOT : meat_familiar );

    // Put on rollover outfit
    maximize( "advs", false );
}

string configure_counter_script( string function, string file )
{
    return function + "@" + file;
}

// We explicitly handle all sorts of things that have counters that abort.
static string COUNTER_SCRIPT = "counterScript";
string new_counter_script = configure_counter_script( "counterExpired", __FILE__ );
string old_counter_script = get_property( COUNTER_SCRIPT );

void main()
{
    void migrate_settings()
    {
	if ( property_exists( "VeracityMeatFarmTotalMeat" ) ) {
	    rename_property( "VeracityMeatFarmTotalMeat", MEAT_SETTING );
	}
	if ( property_exists( "VeracityMeatFarmTotalTurns" ) ) {
	    rename_property( "VeracityMeatFarmTotalTurns", TURN_SETTING );
	}
	if ( property_exists( "VMF.FarmFamiliar" ) ) {
	    rename_property( "VMF.FarmFamiliar", "VMF.MeatFamiliar" );
	}
	if ( property_exists( "VMF.GardenCrops" ) ) {
	    remove_property( "VMF.GardenCrops" );
	}
    }

    int mpa( int meat, int turns )
    {
	return turns == 0 ? meat : ( meat / turns );
    }

    // Rename configuration properties if needed
    migrate_settings();

    // Check configuration and either correct or abort
    validate_configuration();

    int initial_meat = my_session_meat();
    int initial_turns = total_turns_played();

    // Existing conditions will mess up automations.
    cli_execute( "conditions clear" );

    // I did not like how this script behaved when I forgot to manually
    // reset my battle action away from "item bottle of G&uuml;-Gone"
    set_property( "battleAction", "custom combat script" );

    try {
	set_property( COUNTER_SCRIPT, new_counter_script );
	run_tasks();
    } finally {
	set_property( COUNTER_SCRIPT, old_counter_script );

	int meat_delta = my_session_meat() - initial_meat;
	int turn_delta = total_turns_played() - initial_turns;
	int meat_total = increment_property( MEAT_SETTING, meat_delta );
	int turn_total = increment_property( TURN_SETTING, turn_delta );
	int run_mpa = mpa( meat_delta, turn_delta );
	int cumulative_mpa = mpa( meat_total, turn_total );

	print( "Net income = " + pnum( meat_delta ) + " Meat in " + pnum( turn_delta ) + " turns. Meat/Adventure = " + pnum( run_mpa ) );
	print( "Cumulative income = " + pnum( meat_total ) + " Meat in " + pnum( turn_total ) + " turns. Meat/Adventure = " + pnum( cumulative_mpa ) );
    }
}