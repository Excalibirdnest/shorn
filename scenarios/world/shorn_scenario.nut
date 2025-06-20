this.shorn_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {
				FavouredEnemyPerks = [
			::Const.Perks.PerkDefs.LegendFavouredEnemyGhoul,
			::Const.Perks.PerkDefs.LegendFavouredEnemyHexen,
			::Const.Perks.PerkDefs.LegendFavouredEnemyAlps,
			::Const.Perks.PerkDefs.LegendFavouredEnemyUnhold,
			::Const.Perks.PerkDefs.LegendFavouredEnemyLindwurm,
			::Const.Perks.PerkDefs.LegendFavouredEnemyDirewolf,
			::Const.Perks.PerkDefs.LegendFavouredEnemySpider,
			::Const.Perks.PerkDefs.LegendFavouredEnemySchrat,
			::Const.Perks.PerkDefs.LegendFavouredEnemyGoblin,
			::Const.Perks.PerkDefs.LegendFavouredEnemyOrk,
			::Const.Perks.PerkDefs.LegendFavouredEnemySkeleton,
			::Const.Perks.PerkDefs.LegendFavouredEnemyVampire,
			::Const.Perks.PerkDefs.LegendFavouredEnemyZombie,
		],
		},
	function create()
	{
		this.m.ID = "scenario.shorn";
		this.m.Name = "The Shorn";
		this.m.Description = "[p=c][img]gfx/ui/events/event_44.png[/img][/p][p]A beast hunter, an alchemist, and an anatomist walk into a bar, they decide to become monsters. The shorn are a group of monster hunters who work closely with anatomists in order to mutate themselves into something beyond human.\n\n[color=#bcad8c]Field Researchers:[/color] Start with all the components for a bad joke and low funds. Research the corpses of your fallen enemies and gain knowledge to empower your men. \n[color=#bcad8c]Promising Candidates:[/color] Characters come with the 'Resilient' perk, which reduces the duration of negative status effects. Characters also come with a 'Favoured Enemy' perk which unlocks new contracts against variants of those enemies. \n[color=#bcad8c]Skinners:[/color] Each beast you slay has a 25% chance to drop an additional trophy.\n[color=#bcad8c]Filthy Mutants:[/color] Most people do not trust your kind, get 25% worse prices.\n[color=#bcad8c]Promise of Power:[/color] You'll find more beast hunters and anatomists willing to join your company. But you will also attract the attention of the downtrodden and powerless.[/p]";
		this.m.Difficulty = 1;
		this.m.Order = 322;
	}

	function isValid()
	{
		return this.Const.DLC.Paladins;
	}

	function onSpawnAssets() {
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 3; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
		}

		local bros = roster.getAll();

		// Assign names to the characters (in order)
		local keys = ["beast", "anatomist", "alchemist"];

		// Define the talents for each character
		local bro_talents = {
				beast = {
					Count = 0,
					Hitpoints = 2,
					MeleeSkill = 3,
					MeleeDefense = 3,
					Fatigue = 0,
					Bravery = 0,
					Initiative = 0,
					RangedSkill = 0,
					RangedDefense = 0
				},
				anatomist = {
					Count = 0,
					Hitpoints = 2,
					MeleeSkill = 1,
					MeleeDefense = 3,
					Fatigue = 2,
					Bravery = 2,
					Initiative = 1,
					RangedSkill = 0,
					RangedDefense = 0
				},
				alchemist = {
					Count = 0,
					Hitpoints = 2,
					MeleeSkill = 3,
					MeleeDefense = 3,
					Fatigue = 0,
					Bravery = 0,
					Initiative = 0,
					RangedSkill = 0,
					RangedDefense = 0
				}
		};

		// Define an associative array to hold the attributes for each character
		local bro_attributes = {
			beast = {
				background = "beast_hunter_background",
				description = "Example desc 1",
				formation = 4,
				veteranPerks = 2,
				improveMood = [2.5, "Is back in business"],
				worsenMood = [0, "Is back in business"],
				skills = [
					"scripts/skills/perks/perk_hold_out",
					"scripts/skills/traits/loyal_trait",
					"scripts/skills/traits/hate_beasts_trait"
				],
				unequip = [
					this.Const.ItemSlot.Head,
					this.Const.ItemSlot.Body,
					this.Const.ItemSlot.Mainhand,
					this.Const.ItemSlot.Offhand
				],
				items = [
					["scripts/items/weapons/woodcutters_axe",""],
					["scripts/items/legend_armor/cloth/wanderers_coat",
						[
							"scripts/items/legend_armor/armor_upgrades/legend_direwolf_pelt_upgrade"
						],
					],
				]
			},
			anatomist = {
				background = "anatomist",
				description = "Example desc 2",
				formation = 5,
				veteranPerks = 2,
				improveMood = [1, "Eager to get started"],
				worsenMood = [0, ""],
				skills = [
					"scripts/skills/perks/perk_hold_out",
				],
				unequip = [
					this.Const.ItemSlot.Head,
					this.Const.ItemSlot.Body,
					this.Const.ItemSlot.Mainhand,
					this.Const.ItemSlot.Offhand
				],
				items = [
					// Some items have upgrades, which are defined in the second array
					["scripts/items/weapons/shortsword",""],
					["scripts/items/legend_armor/cloth/anatomist_robe",
						[
							"scripts/items/legend_armor/cloak/anatomist_hood"
						],
					],
					["scripts/items/legend_helmets/hood/legend_helmet_beak_hood",
							[
								"scripts/items/legend_helmets/top/legend_helmet_mask_beak",
								"scripts/items/legend_helmets/vanity/legend_helmet_physicians_hood"
							]
					],
				]
			},
			alchemist = {
				background = "alchemist",
				description = "Example desc 2",
				formation = 3,
				veteranPerks = 2,
				improveMood = [0, ""],
				worsenMood = [1.5, "Thinks this plan is ridiculous"],
				skills = [
					"scripts/skills/traits/legend_slack_trait",
					"scripts/skills/perks/perk_hold_out"
				],
				unequip = [
					this.Const.ItemSlot.Head,
					this.Const.ItemSlot.Body,
					this.Const.ItemSlot.Mainhand,
					this.Const.ItemSlot.Offhand
				],
				items = [
					["scripts/items/weapons/crossbow",""],
					["scripts/items/ammo/quiver_of_bolts",""],
					["scripts/items/legend_armor/cloth/legend_tunic",
						[
							"scripts/items/legend_armor/plate/undertakers_apron"
						],
					],
				],
			}
		};

		// Loop through each bros and set talents
		for (local i = 0; i < bros.len(); i++) {
			local talents = bros[i].getTalents();
			local attrs = bro_talents[keys[i]];
			foreach (attr, value in attrs) {
				if (attr == "Count") {
					talents.resize(this.Const.Attributes.COUNT, [value]);
				}
				else if (attr == "Hitpoints") {
					talents[this.Const.Attributes.Hitpoints] = [value];
				}
				else if (attr == "MeleeSkill") {
					talents[this.Const.Attributes.MeleeSkill] = [value];
				}
				else if (attr == "MeleeDefense") {
					talents[this.Const.Attributes.MeleeDefense] = [value];
				}
				else if (attr == "Fatigue") {
					talents[this.Const.Attributes.Fatigue] = [value];
				}
				else if (attr == "Bravery") {
					talents[this.Const.Attributes.Bravery] = [value];
				}
				else if (attr == "Initiative") {
					talents[this.Const.Attributes.Initiative] = [value];
				}
				else if (attr == "RangedSkill") {
					talents[this.Const.Attributes.RangedSkill] = [value];
				}
				else if (attr == "RangedDefense") {
					talents[this.Const.Attributes.RangedDefense] = [value];
				}
			}
		}

		// Loop through bros and set attributes
		for (local i = 0; i < bros.len(); i++) {
			local attrs = bro_attributes[keys[i]];
			foreach (attr, value in attrs) {
				if (attr == "background") {
					bros[i].setStartValuesEx([value]);
				}
				else if (attr == "description") {
					bros[i].getBackground().m.RawDescription([value]);
				}
				else if (attr == "formation") {
					bros[i].setPlaceInFormation([value]);
				}
				else if (attr == "veteranPerks") {
						bros[i].setVeteranPerks([value]);
				}
				else if (attr == "improveMood") {
						bros[i].improveMood([value][0], [value][1]);
				}
				else if (attr == "worsenMood") {
						bros[i].worsenMood([value][0], [value][1]);
				}
				else if (attr == "skills") {
					foreach (skill in [value]) {
						bros[i].getSkills().add(this.new(skill));
					}
				}
				else if (attr == "unequip") {
					foreach (slot in [value]) {
						local items = bros[i].getItems();
						items.unequip(items.getItemAtSlot(slot));
					}
				}
				else if (attr == "items") {
					local items = bros[i].getItems();
					foreach (item in [value]) {
						local item_to_equip = this.new(item[0]);
						items.equip(item_to_equip);
						// If there are upgrades, apply them
						if (typeof item[1] == "array") { //If second element is non-blank
							// Loop through each upgrade and apply it
							foreach (upgrade in item[1]) {
								local item_upgrade = this.new(upgrade);
								item_to_equip.setUpgrade(item_upgrade);
							}
						}
					}
				}
			}
			bros[i].m.Talents = [];
			bros[i].getBackground().addPerk(this.Const.Perks.PerkDefs.HoldOut, 2, false);
		}

		this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_wolf_meat_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/legend_liquor_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_beasts_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_greenskins_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_undead_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/research_notes_legendary_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/misc/anatomist/apotheosis_potion_item"));
		this.World.Statistics.getFlags().set("isNecromancerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isWiedergangerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isFallenHeroPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGeistPotionAcquired", false);
		this.World.Statistics.getFlags().set("isRachegeistPotionAcquired", false);
		this.World.Statistics.getFlags().set("isSkeletonWarriorPotionAcquired", false);
		this.World.Statistics.getFlags().set("isHonorGuardPotionAcquired", false);
		this.World.Statistics.getFlags().set("isAncientPriestPotionAcquired", false);
		this.World.Statistics.getFlags().set("isNecrosavantPotionAcquired", false);
		this.World.Statistics.getFlags().set("isLorekeeperPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcYoungPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcWarriorPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcBerserkerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isOrcWarlordPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGoblinGruntPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGoblinOverseerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isGoblinShamanPotionAcquired", false);
		this.World.Statistics.getFlags().set("isDirewolfPotionAcquired", false);
		this.World.Statistics.getFlags().set("isLindwurmPotionAcquired", false);
		this.World.Statistics.getFlags().set("isUnholdPotionAcquired", false);
		this.World.Statistics.getFlags().set("isWebknechtPotionAcquired", false);
		this.World.Statistics.getFlags().set("isNachzehrerPotionAcquired", false);
		this.World.Statistics.getFlags().set("isAlpPotionAcquired", false);
		this.World.Statistics.getFlags().set("isHexePotionAcquired", false);
		this.World.Statistics.getFlags().set("isSchratPotionAcquired", false);
		this.World.Statistics.getFlags().set("isSerpentPotionAcquired", false);
		this.World.Statistics.getFlags().set("isKrakenPotionAcquired", false);
		this.World.Statistics.getFlags().set("isIjirokPotionAcquired", false);
		this.World.Statistics.getFlags().set("isIfritPotionAcquired", false);
		this.World.Statistics.getFlags().set("isHyenaPotionAcquired", false);
		this.World.Assets.m.Money = this.World.Assets.m.Money / 2 + 2;
	}

	function onSpawnPlayer()
	{
		local randomVillage;

		for( local i = 0; i != this.World.EntityManager.getSettlements().len(); i = ++i )
		{
			randomVillage = this.World.EntityManager.getSettlements()[i];

			if (!randomVillage.isMilitary() && !randomVillage.isIsolatedFromRoads() && randomVillage.getSize() >= 3 && !randomVillage.isSouthern())
			{
				break;
			}
		}

		local randomVillageTile = randomVillage.getTile();
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.X - 4), this.Math.min(this.Const.World.Settings.SizeX - 2, randomVillageTile.SquareCoords.X + 4));
			local y = this.Math.rand(this.Math.max(2, randomVillageTile.SquareCoords.Y - 4), this.Math.min(this.Const.World.Settings.SizeY - 2, randomVillageTile.SquareCoords.Y + 4));

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.Type == this.Const.World.TerrainType.Ocean || tile.Type == this.Const.World.TerrainType.Shore || tile.IsOccupied)
				{
				}
				else if (tile.getDistanceTo(randomVillageTile) <= 1)
				{
				}
				else
				{
					local path = this.World.getNavigator().findPath(tile, randomVillageTile, navSettings, 0);

					if (!path.isEmpty())
					{
						randomVillageTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", randomVillageTile.Coords.X, randomVillageTile.Coords.Y);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.shorn_scenario_intro");
		}, null);
	}

	function onActorKilled( _actor, _killer, _combatID )
	{
		if (this.Tactical.State.getStrategicProperties().IsArenaMode)
		{
			return;
		}

		local isLegendary = _actor.getType() == this.Const.EntityType.ZombieBoss || _actor.getType() == this.Const.EntityType.SkeletonLich || _actor.getType() == this.Const.EntityType.Kraken || _actor.getType() == this.Const.EntityType.TricksterGod;

		if (!isLegendary && _killer != null && _killer.getFaction() != this.Const.Faction.Player && _killer.getFaction() != this.Const.Faction.PlayerAnimals)
		{
			return;
		}

		switch(_actor.getType())
		{
		case this.Const.EntityType.Necromancer:
			this.World.Statistics.getFlags().set("shouldDropNecromancerPotion", true);
			break;

		case this.Const.EntityType.Zombie:
		case this.Const.EntityType.ZombieYeoman:
			this.World.Statistics.getFlags().set("shouldDropWiedergangerPotion", true);
			break;

		case this.Const.EntityType.ZombieKnight:
		case this.Const.EntityType.ZombieBetrayer:
			this.World.Statistics.getFlags().set("shouldDropFallenHeroPotion", true);
			break;

		case this.Const.EntityType.Ghost:
			this.World.Statistics.getFlags().set("shouldDropGeistPotion", true);
			break;

		case this.Const.EntityType.ZombieBoss:
			this.World.Statistics.getFlags().set("shouldDropRachegeistPotion", true);
			break;

		case this.Const.EntityType.SkeletonLight:
		case this.Const.EntityType.SkeletonMedium:
			this.World.Statistics.getFlags().set("shouldDropSkeletonWarriorPotion", true);
			break;

		case this.Const.EntityType.SkeletonHeavy:
			this.World.Statistics.getFlags().set("shouldDropHonorGuardPotion", true);
			break;

		case this.Const.EntityType.SkeletonPriest:
			this.World.Statistics.getFlags().set("shouldDropAncientPriestPotion", true);
			break;

		case this.Const.EntityType.Vampire:
			this.World.Statistics.getFlags().set("shouldDropNecrosavantPotion", true);
			break;

		case this.Const.EntityType.SkeletonLich:
			this.World.Statistics.getFlags().set("shouldDropLorekeeperPotion", true);
			break;

		case this.Const.EntityType.OrcYoung:
			this.World.Statistics.getFlags().set("shouldDropOrcYoungPotion", true);
			break;

		case this.Const.EntityType.OrcWarrior:
			this.World.Statistics.getFlags().set("shouldDropOrcWarriorPotion", true);
			break;

		case this.Const.EntityType.OrcBerserker:
			this.World.Statistics.getFlags().set("shouldDropOrcBerserkerPotion", true);
			break;

		case this.Const.EntityType.OrcWarlord:
			this.World.Statistics.getFlags().set("shouldDropOrcWarlordPotion", true);
			break;

		case this.Const.EntityType.GoblinAmbusher:
		case this.Const.EntityType.GoblinFighter:
		case this.Const.EntityType.GoblinWolfrider:
			this.World.Statistics.getFlags().set("shouldDropGoblinGruntPotion", true);
			break;

		case this.Const.EntityType.GoblinLeader:
			this.World.Statistics.getFlags().set("shouldDropGoblinOverseerPotion", true);
			break;

		case this.Const.EntityType.GoblinShaman:
			this.World.Statistics.getFlags().set("shouldDropGoblinShamanPotion", true);
			break;

		case this.Const.EntityType.Direwolf:
			this.World.Statistics.getFlags().set("shouldDropDirewolfPotion", true);
			break;

		case this.Const.EntityType.Lindwurm:
			this.World.Statistics.getFlags().set("shouldDropLindwurmPotion", true);
			break;

		case this.Const.EntityType.Unhold:
		case this.Const.EntityType.UnholdFrost:
		case this.Const.EntityType.UnholdBog:
		case this.Const.EntityType.BarbarianUnhold:
		case this.Const.EntityType.BarbarianUnholdFrost:
			this.World.Statistics.getFlags().set("shouldDropUnholdPotion", true);
			break;

		case this.Const.EntityType.Spider:
			this.World.Statistics.getFlags().set("shouldDropWebknechtPotion", true);
			break;

		case this.Const.EntityType.Ghoul:
			this.World.Statistics.getFlags().set("shouldDropNachzehrerPotion", true);
			break;

		case this.Const.EntityType.Alp:
			this.World.Statistics.getFlags().set("shouldDropAlpPotion", true);
			break;

		case this.Const.EntityType.Hexe:
			this.World.Statistics.getFlags().set("shouldDropHexePotion", true);
			break;

		case this.Const.EntityType.Schrat:
			this.World.Statistics.getFlags().set("shouldDropSchratPotion", true);
			break;

		case this.Const.EntityType.Kraken:
			this.World.Statistics.getFlags().set("shouldDropKrakenPotion", true);
			break;

		case this.Const.EntityType.TricksterGod:
			this.World.Statistics.getFlags().set("shouldDropIjirokPotion", true);
			break;

		case this.Const.EntityType.Serpent:
			this.World.Statistics.getFlags().set("shouldDropSerpentPotion", true);
			break;

		case this.Const.EntityType.SandGolem:
			this.World.Statistics.getFlags().set("shouldDropIfritPotion", true);
			break;

		case this.Const.EntityType.Hyena:
			this.World.Statistics.getFlags().set("shouldDropHyenaPotion", true);
			break;
		}
	}

	function onBattleWon( _combatLoot )
	{
		local buffs = [
			{
				acquiredFlagName = "isNecromancerPotionAcquired",
				discoveredFlagName = "isNecromancerPotionDiscovered",
				shouldDropFlagName = "shouldDropNecromancerPotion",
				itemName = "necromancer_potion_item"
			},
			{
				acquiredFlagName = "isWiedergangerPotionAcquired",
				discoveredFlagName = "isWiedergangerPotionDiscovered",
				shouldDropFlagName = "shouldDropWiedergangerPotion",
				itemName = "wiederganger_potion_item"
			},
			{
				acquiredFlagName = "isFallenHeroPotionAcquired",
				discoveredFlagName = "isFallenHeroPotionDiscovered",
				shouldDropFlagName = "shouldDropFallenHeroPotion",
				itemName = "fallen_hero_potion_item"
			},
			{
				acquiredFlagName = "isGeistPotionAcquired",
				discoveredFlagName = "isGeistPotionDiscovered",
				shouldDropFlagName = "shouldDropGeistPotion",
				itemName = "geist_potion_item"
			},
			{
				acquiredFlagName = "isRachegeistPotionAcquired",
				discoveredFlagName = "isRachegeistPotionDiscovered",
				shouldDropFlagName = "shouldDropRachegeistPotion",
				itemName = "rachegeist_potion_item"
			},
			{
				acquiredFlagName = "isSkeletonWarriorPotionAcquired",
				discoveredFlagName = "isSkeletonWarriorPotionDiscovered",
				shouldDropFlagName = "shouldDropSkeletonWarriorPotion",
				itemName = "skeleton_warrior_potion_item"
			},
			{
				acquiredFlagName = "isHonorGuardPotionAcquired",
				discoveredFlagName = "isHonorGuardPotionDiscovered",
				shouldDropFlagName = "shouldDropHonorGuardPotion",
				itemName = "honor_guard_potion_item"
			},
			{
				acquiredFlagName = "isAncientPriestPotionAcquired",
				discoveredFlagName = "isAncientPriestPotionDiscovered",
				shouldDropFlagName = "shouldDropAncientPriestPotion",
				itemName = "ancient_priest_potion_item"
			},
			{
				acquiredFlagName = "isNecrosavantPotionAcquired",
				discoveredFlagName = "isNecrosavantPotionDiscovered",
				shouldDropFlagName = "shouldDropNecrosavantPotion",
				itemName = "necrosavant_potion_item"
			},
			{
				acquiredFlagName = "isLorekeeperPotionAcquired",
				discoveredFlagName = "isLorekeeperPotionDiscovered",
				shouldDropFlagName = "shouldDropLorekeeperPotion",
				itemName = "lorekeeper_potion_item"
			},
			{
				acquiredFlagName = "isOrcYoungPotionAcquired",
				discoveredFlagName = "isOrcYoungPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcYoungPotion",
				itemName = "orc_young_potion_item"
			},
			{
				acquiredFlagName = "isOrcWarriorPotionAcquired",
				discoveredFlagName = "isOrcWarriorPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcWarriorPotion",
				itemName = "orc_warrior_potion_item"
			},
			{
				acquiredFlagName = "isOrcBerserkerPotionAcquired",
				discoveredFlagName = "isOrcBerserkerPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcBerserkerPotion",
				itemName = "orc_berserker_potion_item"
			},
			{
				acquiredFlagName = "isOrcWarlordPotionAcquired",
				discoveredFlagName = "isOrcWarlordPotionDiscovered",
				shouldDropFlagName = "shouldDropOrcWarlordPotion",
				itemName = "orc_warlord_potion_item"
			},
			{
				acquiredFlagName = "isGoblinGruntPotionAcquired",
				discoveredFlagName = "isGoblinGruntPotionDiscovered",
				shouldDropFlagName = "shouldDropGoblinGruntPotion",
				itemName = "goblin_grunt_potion_item"
			},
			{
				acquiredFlagName = "isGoblinOverseerPotionAcquired",
				discoveredFlagName = "isGoblinOverseerPotionDiscovered",
				shouldDropFlagName = "shouldDropGoblinOverseerPotion",
				itemName = "goblin_overseer_potion_item"
			},
			{
				acquiredFlagName = "isGoblinShamanPotionAcquired",
				discoveredFlagName = "isGoblinShamanPotionDiscovered",
				shouldDropFlagName = "shouldDropGoblinShamanPotion",
				itemName = "goblin_shaman_potion_item"
			},
			{
				acquiredFlagName = "isDirewolfPotionAcquired",
				discoveredFlagName = "isDirewolfPotionDiscovered",
				shouldDropFlagName = "shouldDropDirewolfPotion",
				itemName = "direwolf_potion_item"
			},
			{
				acquiredFlagName = "isLindwurmPotionAcquired",
				discoveredFlagName = "isLindwurmPotionDiscovered",
				shouldDropFlagName = "shouldDropLindwurmPotion",
				itemName = "lindwurm_potion_item"
			},
			{
				acquiredFlagName = "isUnholdPotionAcquired",
				discoveredFlagName = "isUnholdPotionDiscovered",
				shouldDropFlagName = "shouldDropUnholdPotion",
				itemName = "unhold_potion_item"
			},
			{
				acquiredFlagName = "isWebknechtPotionAcquired",
				discoveredFlagName = "isWebknechtPotionDiscovered",
				shouldDropFlagName = "shouldDropWebknechtPotion",
				itemName = "webknecht_potion_item"
			},
			{
				acquiredFlagName = "isNachzehrerPotionAcquired",
				discoveredFlagName = "isNachzehrerPotionDiscovered",
				shouldDropFlagName = "shouldDropNachzehrerPotion",
				itemName = "nachzehrer_potion_item"
			},
			{
				acquiredFlagName = "isAlpPotionAcquired",
				discoveredFlagName = "isAlpPotionDiscovered",
				shouldDropFlagName = "shouldDropAlpPotion",
				itemName = "alp_potion_item"
			},
			{
				acquiredFlagName = "isHexePotionAcquired",
				discoveredFlagName = "isHexePotionDiscovered",
				shouldDropFlagName = "shouldDropHexePotion",
				itemName = "hexe_potion_item"
			},
			{
				acquiredFlagName = "isSchratPotionAcquired",
				discoveredFlagName = "isSchratPotionDiscovered",
				shouldDropFlagName = "shouldDropSchratPotion",
				itemName = "schrat_potion_item"
			},
			{
				acquiredFlagName = "isSerpentPotionAcquired",
				discoveredFlagName = "isSerpentPotionDiscovered",
				shouldDropFlagName = "shouldDropSerpentPotion",
				itemName = "serpent_potion_item"
			},
			{
				acquiredFlagName = "isKrakenPotionAcquired",
				discoveredFlagName = "isKrakenPotionDiscovered",
				shouldDropFlagName = "shouldDropKrakenPotion",
				itemName = "kraken_potion_item"
			},
			{
				acquiredFlagName = "isIjirokPotionAcquired",
				discoveredFlagName = "isIjirokPotionDiscovered",
				shouldDropFlagName = "shouldDropIjirokPotion",
				itemName = "ijirok_potion_item"
			},
			{
				acquiredFlagName = "isIfritPotionAcquired",
				discoveredFlagName = "isIfritPotionDiscovered",
				shouldDropFlagName = "shouldDropIfritPotion",
				itemName = "ifrit_potion_item"
			},
			{
				acquiredFlagName = "isHyenaPotionAcquired",
				discoveredFlagName = "isHyenaPotionDiscovered",
				shouldDropFlagName = "shouldDropHyenaPotion",
				itemName = "hyena_potion_item"
			}
		];

		foreach( buff in buffs )
		{
			if (!this.World.Statistics.getFlags().get(buff.acquiredFlagName) && this.World.Statistics.getFlags().get(buff.shouldDropFlagName))
			{
				this.World.Statistics.getFlags().set(buff.acquiredFlagName, true);
				this.World.Statistics.getFlags().set(buff.discoveredFlagName, true);
				_combatLoot.add(this.new("scripts/items/misc/anatomist/" + buff.itemName));
			}
		}
	}

	function onCombatFinished()
	{
		this.World.Statistics.getFlags().set("shouldDropNecromancerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropWiedergangerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropFallenHeroPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGeistPotion", false);
		this.World.Statistics.getFlags().set("shouldDropRachegeistPotion", false);
		this.World.Statistics.getFlags().set("shouldDropSkeletonWarriorPotion", false);
		this.World.Statistics.getFlags().set("shouldDropHonorGuardPotion", false);
		this.World.Statistics.getFlags().set("shouldDropAncientPriestPotion", false);
		this.World.Statistics.getFlags().set("shouldDropNecrosavantPotion", false);
		this.World.Statistics.getFlags().set("shouldDropLorekeeperPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcYoungPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcWarriorPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcBerserkerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropOrcWarlordPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGoblinGruntPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGoblinOverseerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropGoblinShamanPotion", false);
		this.World.Statistics.getFlags().set("shouldDropDirewolfPotion", false);
		this.World.Statistics.getFlags().set("shouldDropLindwurmPotion", false);
		this.World.Statistics.getFlags().set("shouldDropUnholdPotion", false);
		this.World.Statistics.getFlags().set("shouldDropWebknechtPotion", false);
		this.World.Statistics.getFlags().set("shouldDropNachzehrerPotion", false);
		this.World.Statistics.getFlags().set("shouldDropAlpPotion", false);
		this.World.Statistics.getFlags().set("shouldDropHexePotion", false);
		this.World.Statistics.getFlags().set("shouldDropSchratPotion", false);
		this.World.Statistics.getFlags().set("shouldDropSerpentPotion", false);
		this.World.Statistics.getFlags().set("shouldDropKrakenPotion", false);
		this.World.Statistics.getFlags().set("shouldDropIjirokPotion", false);
		this.World.Statistics.getFlags().set("shouldDropIfritPotion", false);
		this.World.Statistics.getFlags().set("shouldDropHyenaPotion", false);
		return true;
	}

	function onInit()
	{
		this.starting_scenario.onInit();
		this.World.Assets.m.BuyPriceMult = 1.25;
		this.World.Assets.m.SellPriceMult = 0.75;
		this.World.Assets.m.ExtraLootChance = 25;
		this.World.Assets.m.FootprintVision = 1.25;
	}

	function onBuildPerkTree( _background )
	{
		local perk = ::MSU.Array.rand(this.m.FavouredEnemyPerks);
		this.addScenarioPerk(_background, perk);
		this.addScenarioPerk(_background, this.Const.Perks.PerkDefs.HoldOut);
	}

	function onUpdateHiringRoster( _roster )
	{
		this.addBroToRoster(_roster, "beast_hunter_background", 7);
		this.addBroToRoster(_roster, "anatomist_background", 4);
		this.addBroToRoster(_roster, "beggar_background", 5);
		this.addBroToRoster(_roster, "cripple_background", 5);
		this.addBroToRoster(_roster, "daytaler_background", 5);
	}

});