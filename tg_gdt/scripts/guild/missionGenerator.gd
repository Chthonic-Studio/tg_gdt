extends Node

# Define a dictionary that groups title-description pairs (with item rewards) for each rank.
var mission_data = {
	"E": [
		{
			"title": "Lost Kitten",
			"description": "Find a child's lost pet cat in the town.",
			"item_rewards": [
				{"item_id": 139, "min": 1, "max": 2},   
				{"item_id": 130, "min": 1, "max": 1}    
			]
		},
		{
			"title": "Garden Pest Control",
			"description": "Eliminate the troublesome snails eating a farmer's crops.",
			"item_rewards": [
				{"item_id": 140, "min": 1, "max": 2}    # Mana Potion: a light reward for a small task
			]
		},
		{
			"title": "Delivery to the Baker",
			"description": "Take a package of flour to the town's bakery.",
			"item_rewards": [
				{"item_id": 138, "min": 1, "max": 1}    # Skill Book: a modest token for running errands
			]
		},
		{
			"title": "Fetch Firewood",
			"description": "Gather a small bundle of firewood from the nearby forest.",
			"item_rewards": [
				{"item_id": 104, "min": 1, "max": 1}    # Handaxe: symbolizing simple manual labor
			]
		},
		{
			"title": "Clear the Cellar",
			"description": "Remove some minor debris from a shopkeeper's cellar.",
			"item_rewards": [
				{"item_id": 107, "min": 1, "max": 1}    # Club: a basic tool that fits the task
			]
		},
		{
			"title": "Sign Posting",
			"description": "Put up notices around town for an upcoming event.",
			"item_rewards": [
				{"item_id": 135, "min": 1, "max": 1}    # Torch: a simple yet useful item
			]
		},
		{
			"title": "Empty the Buckets",
			"description": "Dispose of some dirty water behind the inn.",
			"item_rewards": [
				{"item_id": 130, "min": 1, "max": 1}    # Leather Cloak: a humble reward
			]
		},
		{
			"title": "Sharpen Tools",
			"description": "Take a set of dull tools to the local blacksmith.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 1}    # Dagger: representing a small, sharpened tool
			]
		},
		{
			"title": "Collect Wildflowers",
			"description": "Gather a bouquet of specific wildflowers for a sick villager.",
			"item_rewards": [
				{"item_id": 138, "min": 1, "max": 1}    # Skill Book: a reward imbued with gentle knowledge
			]
		},
		{
			"title": "Message Delivery",
			"description": "Take a short message to someone within the town.",
			"item_rewards": [
				{"item_id": 140, "min": 1, "max": 1}    # Mana Potion: a light and quick reward 
			]
		},
		{
			"title": "Stable Duty",
			"description": "Help muck out the stables for a few hours.",
			"item_rewards": [
				{"item_id": 131, "min": 1, "max": 1}    # Leather Boots: to keep your feet steady after hard work
			]
		},
		{
			"title": "Water the Plants",
			"description": "Water the flower boxes outside the guild hall.",
			"item_rewards": [
				{"item_id": 139, "min": 1, "max": 1}    # Health Potion: a small restorative bonus
			]
		},
		{
			"title": "Find Lost Keys",
			"description": "Search for a set of lost keys in a common area.",
			"item_rewards": [
				{"item_id": 123, "min": 1, "max": 1}    # Iron Helm: a symbolic reward for finding something lost
			]
		},
		{
			"title": "Sweep the Porch",
			"description": "Sweep the entrance porch of a building.",
			"item_rewards": [
				{"item_id": 134, "min": 1, "max": 1}    # Lantern: to brighten up a freshly swept area
			]
		},
		{
			"title": "Organize Supplies",
			"description": "Help organize some basic supplies in a storage room.",
			"item_rewards": [
				{"item_id": 132, "min": 1, "max": 1}    # Pickaxe: representing light manual work
			]
		},
		{
			"title": "Carry Packages",
			"description": "Assist a merchant by carrying a few light packages.",
			"item_rewards": [
				{"item_id": 131, "min": 1, "max": 1}    # Leather Boots: for someone on the move
			]
		},
		{
			"title": "Light the Lanterns",
			"description": "Light the street lanterns in the evening.",
			"item_rewards": [
				{"item_id": 134, "min": 1, "max": 1}    # Lantern: clearly suitable for the task
			]
		},
		{
			"title": "Watch the Cart",
			"description": "Keep an eye on a parked cart for a short time.",
			"item_rewards": [
				{"item_id": 107, "min": 1, "max": 1}    # Club: a simple, modest reward
			]
		},
		{
			"title": "Retrieve a Ball",
			"description": "Get a child's ball that rolled into a bush.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 1}    # Dagger: a light reward for a quick errand
			]
		},
		{
			"title": "Dust the Shelves",
			"description": "Dust some shelves in a quiet room.",
			"item_rewards": [
				{"item_id": 138, "min": 1, "max": 1}    # Skill Book: implying a tidy mind and reward
			]
		}
	],
	"D": [
		{
			"title": "Wolf Sighting",
			"description": "Investigate reports of a lone wolf harassing livestock.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 1},  # Dagger: quick tool for a swift task
				{"item_id": 140, "min": 1, "max": 2}   # Mana Potion: a light, replenishing reward
			]
		},
		{
			"title": "Lost Shipment",
			"description": "Track down a small, missing cart of trade goods.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 1}   # Wooden Shield: representing protection of goods
			]
		},
		{
			"title": "Sewer Rats",
			"description": "Clear out a minor infestation of large rats in the sewers.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 2},  # Dagger(s) for the task
				{"item_id": 140, "min": 1, "max": 3}   # Mana Potion(s) for a subtle boost
			]
		},
		{
			"title": "Bandit Scare",
			"description": "Investigate rumors of a small bandit group near the outskirts.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 1}   # Dagger: a modest and practical reward
			]
		},
		{
			"title": "Escort the Merchant",
			"description": "Provide safe passage for a merchant to a nearby farm.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 1}   # Wooden Shield: reinforcing the idea of protection
			]
		},
		{
			"title": "Clear the Path",
			"description": "Remove fallen branches blocking a well-used trail.",
			"item_rewards": [
				{"item_id": 104, "min": 1, "max": 1}   # Handaxe: a tool for clearing obstacles
			]
		},
		{
			"title": "Retrieve Stolen Goods",
			"description": "Recover a few stolen items from petty thieves.",
			"item_rewards": [
				{"item_id": 105, "min": 1, "max": 1}   # Iron Axe: a slightly heftier tool for retrieving items
			]
		},
		{
			"title": "Strange Noises",
			"description": "Investigate unusual sounds coming from an old well.",
			"item_rewards": [
				{"item_id": 134, "min": 1, "max": 1}   # Lantern: to illuminate dark, mysterious areas
			]
		},
		{
			"title": "Protect the Crops",
			"description": "Guard a field overnight from hungry animals.",
			"item_rewards": [
				{"item_id": 132, "min": 1, "max": 1}   # Pickaxe: a practical tool symbolizing hard work and protection
			]
		},
		{
			"title": "Minor Cave-In",
			"description": "Clear a small blockage in a minor cave entrance.",
			"item_rewards": [
				{"item_id": 133, "min": 1, "max": 1}   # Hammer: perfect for breaking through obstructions
			]
		},
		{
			"title": "Lost Pet",
			"description": "Find an exotic pet that has escaped its owner.",
			"item_rewards": [
				{"item_id": 140, "min": 1, "max": 2}   # Mana Potion: a light reward for a delicate task
			]
		},
		{
			"title": "Repair the Fence",
			"description": "Fix a section of damaged fencing around a property.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 1}   # Wooden Shield: symbolizing resilience and repair
			]
		},
		{
			"title": "Gather Rare Herbs",
			"description": "Collect a specific type of rare herb from a known location.",
			"item_rewards": [
				{"item_id": 138, "min": 2, "max": 4}   # Skill Book: representing knowledge or medicinal recipes
			]
		},
		{
			"title": "Investigate Footprints",
			"description": "Follow unusual footprints found near a village.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 1}   # Dagger: a concise reward for a clue-driven task
			]
		},
		{
			"title": "Deliver Medicine",
			"description": "Take urgent medicine to a sick person in a neighboring area.",
			"item_rewards": [
				{"item_id": 139, "min": 1, "max": 1}   # Health Potion: directly linked to medicinal aid
			]
		},
		{
			"title": "Extinguish Small Fire",
			"description": "Put out a small, uncontrolled fire in a field.",
			"item_rewards": [
				{"item_id": 135, "min": 1, "max": 1}   # Torch: appropriate for fire-related tasks
			]
		},
		{
			"title": "Scout the Area",
			"description": "Explore a small, uncharted area and report back.",
			"item_rewards": [
				{"item_id": 130, "min": 1, "max": 1}   # Leather Cloak: hinting at stealth and exploration
			]
		},
		{
			"title": "Guard the Caravan",
			"description": "Provide protection for a small caravan for a short distance.",
			"item_rewards": [
				{"item_id": 117, "min": 1, "max": 1}   # Crossbow: an effective protection tool
			]
		},
		{
			"title": "Retrieve a Key",
			"description": "Find a lost key within a very small, simple dungeon.",
			"item_rewards": [
				{"item_id": 123, "min": 1, "max": 1}   # Iron Helm: a symbolic reward for locating something lost
			]
		}
	],
	"C": [
		{
			"title": "Goblin Camp Cleanup",
			"description": "Eliminate a small goblin encampment causing trouble.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 2},  # Dagger(s) for a quick cleanup
				{"item_id": 140, "min": 1, "max": 3}   # Mana Potion(s) for a slight boost after the task
			]
		},
		{
			"title": "Dire Wolf Pack",
			"description": "Deal with a pack of dangerous dire wolves in the woods.",
			"item_rewards": [
				{"item_id": 109, "min": 2, "max": 4},  # Multiple Daggers for a more challenging hunt
				{"item_id": 140, "min": 2, "max": 5}   # Mana Potions to sustain during the encounter
			]
		},
		{
			"title": "Bandit Ambush",
			"description": "Disrupt a planned bandit ambush on a trade route.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 3},  # Daggers as a tool for swift action
				{"item_id": 113, "min": 1, "max": 1}   # Wooden Shield for basic protection
			]
		},
		{
			"title": "Sewer Monster",
			"description": "Investigate and eliminate a mutated creature in the lower sewers.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 2},  # Daggers, practical for close combat tasks
				{"item_id": 140, "min": 2, "max": 4}   # Mana Potions to recover after the encounter
			]
		},
		{
			"title": "Lost Artifact",
			"description": "Recover a significant artifact stolen by a small cult.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 1}   # Fire Staff as a unique and significant reward
			]
		},
		{
			"title": "Escort the Caravan",
			"description": "Provide safe passage for a medium-sized caravan through a risky area.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 2}   # Wooden Shield(s) to symbolize protection
			]
		},
		{
			"title": "Clear the Mineshaft",
			"description": "Remove a significant cave-in blocking access to a mine.",
			"item_rewards": [
				{"item_id": 139, "min": 3, "max": 6}   # Health Potions, to recover from the heavy labor
			]
		},
		{
			"title": "Retrieve Stolen Relic",
			"description": "Recover a religious relic stolen from a local temple.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 1}   # Fire Staff as a symbol of divine power
			]
		},
		{
			"title": "Haunted House Investigation",
			"description": "Investigate a house rumored to be haunted by a minor spirit.",
			"item_rewards": [
				{"item_id": 139, "min": 1, "max": 2}   # Health Potions to recover from fright
			]
		},
		{
			"title": "Protect the Village",
			"description": "Defend a small village from a wave of aggressive creatures.",
			"item_rewards": [
				{"item_id": 109, "min": 2, "max": 3},  # Multiple Daggers for a more intense defense
				{"item_id": 140, "min": 3, "max": 5}   # Mana Potions to bolster sustained defense
			]
		},
		{
			"title": "Explore the Ruins",
			"description": "Explore a small set of ancient ruins for information or items.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 1},  # Fire Staff as a reward for discovery
				{"item_id": 139, "min": 1, "max": 3}   # Health Potions for the journey
			]
		},
		{
			"title": "Track the Beast",
			"description": "Hunt down a dangerous beast that has been terrorizing the region.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 2},  # Daggers for close combat during the hunt
				{"item_id": 140, "min": 2, "max": 4}   # Mana Potions to maintain energy for the chase
			]
		},
		{
			"title": "Stop the Poachers",
			"description": "Intercept and stop a group of illegal poachers.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 2},  # Daggers symbolizing swift intervention
				{"item_id": 113, "min": 1, "max": 1}   # Wooden Shield for protection
			]
		},
		{
			"title": "Retrieve the Research Notes",
			"description": "Recover important research notes from a dangerous location.",
			"item_rewards": [
				{"item_id": 140, "min": 2, "max": 4}   # Mana Potions for a challenging retrieval task
			]
		},
		{
			"title": "Disrupt the Ritual",
			"description": "Interfere with a minor ritual being performed by a dark cult.",
			"item_rewards": [
				{"item_id": 122, "min": 1, "max": 1}   # Staff as a sign of powerful interference
			]
		},
		{
			"title": "Guard the Excavation Site",
			"description": "Protect an archaeological dig site from potential threats.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 2},  # Daggers as a reward for readiness in combat
				{"item_id": 139, "min": 1, "max": 3}   # Health Potions for sustained protection
			]
		},
		{
			"title": "Clear the Underground Passage",
			"description": "Remove obstacles from an underground passage to restore access.",
			"item_rewards": [
				{"item_id": 139, "min": 2, "max": 5}   # Health Potions, reflecting arduous labor
			]
		},
		{
			"title": "Investigate the Missing Patrol",
			"description": "Find out what happened to a missing group of guards.",
			"item_rewards": [
				{"item_id": 139, "min": 1, "max": 2}   # Health Potions as a moderate reward for mystery solving
			]
		},
		{
			"title": "Retrieve a Family Heirloom",
			"description": "Recover a valuable family heirloom from a monster's lair.",
			"item_rewards": [
				{"item_id": 120, "min": 1, "max": 1}   # Staff as a prestigious reward
			]
		},
		{
			"title": "Scout the Enemy Camp",
			"description": "Observe and report on the activities of a hostile group.",
			"item_rewards": [
				{"item_id": 139, "min": 1, "max": 2}   # Health Potions to sustain stealth operations
			]
		}
	],
	"B": [
		{
			"title": "Large Goblin Warband",
			"description": "Eliminate a well-organized and numerous goblin warband.",
			"item_rewards": [
				{"item_id": 109, "min": 2, "max": 5},  # Daggers for quick slashing
				{"item_id": 140, "min": 3, "max": 6},  # Mana Potions for stamina
				{"item_id": 124, "min": 1, "max": 1}   # Leather Helm for additional defense
			]
		},
		{
			"title": "Powerful Beast Hunt",
			"description": "Hunt down and defeat a particularly powerful and territorial monster.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 3},  # Daggers for agile combat
				{"item_id": 140, "min": 2, "max": 5},  # Mana Potions to keep energy up
				{"item_id": 110, "min": 1, "max": 1},  # Sai for close-quarters combat
				{"item_id": 105, "min": 1, "max": 1}   # Iron Axe for heavy strikes
			]
		},
		{
			"title": "Bandit Fortress Raid",
			"description": "Assault and dismantle a fortified bandit hideout.",
			"item_rewards": [
				{"item_id": 109, "min": 2, "max": 4},  # Daggers for rapid assault
				{"item_id": 113, "min": 1, "max": 2},  # Wooden Shields for protection
				{"item_id": 102, "min": 1, "max": 1}   # Iron Sword as a bonus weapon
			]
		},
		{
			"title": "Sewer Abomination",
			"description": "Confront and defeat a large and dangerous creature lurking in the deep sewers.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 3},  # Daggers for close combat
				{"item_id": 140, "min": 3, "max": 6},  # Mana Potions to recover after the fight
				{"item_id": 110, "min": 1, "max": 1},  # Sai for added variety
				{"item_id": 107, "min": 1, "max": 1}   # Club for blunt impact
			]
		},
		{
			"title": "Ancient Artifact Recovery",
			"description": "Recover a powerful ancient artifact from a heavily guarded location.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff as a signature reward
				{"item_id": 138, "min": 1, "max": 1}   # Skill Book to hint at lost knowledge
			]
		},
		{
			"title": "Escort the Noble",
			"description": "Provide safe passage for an important noble through dangerous territory.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 2},  # Wooden Shields for defense
				{"item_id": 130, "min": 1, "max": 1}   # Leather Cloak for style and protection
			]
		},
		{
			"title": "Clear the Ancient Catacombs",
			"description": "Explore and clear out a network of dangerous ancient catacombs.",
			"item_rewards": [
				{"item_id": 139, "min": 4, "max": 8},  # Health Potions reflecting grueling labor
				{"item_id": 121, "min": 1, "max": 1},  # Fire Staff as a prized relic
				{"item_id": 125, "min": 1, "max": 1}   # Steel Helm for additional protection
			]
		},
		{
			"title": "Retrieve the Sacred Text",
			"description": "Recover a sacred text stolen from a major temple by a dangerous organization.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff emphasizing divine power
				{"item_id": 129, "min": 1, "max": 1}   # Wizard Robe for scholarly significance
			]
		},
		{
			"title": "Haunted Manor Exorcism",
			"description": "Investigate and cleanse a large manor haunted by a powerful spirit or entity.",
			"item_rewards": [
				{"item_id": 139, "min": 2, "max": 4},  ## Health Potions to brave supernatural stress
				{"item_id": 110, "min": 1, "max": 1},  # Sai for swift action
				{"item_id": 114, "min": 1, "max": 1}   # Heater Shield for solid defense
			]
		},
		{
			"title": "Defend the Town",
			"description": "Organize the defense of a town against a significant monster attack.",
			"item_rewards": [
				{"item_id": 109, "min": 3, "max": 5},  # Daggers for robust offense
				{"item_id": 140, "min": 4, "max": 7},  # Mana Potions to keep the defenders strong
				{"item_id": 117, "min": 1, "max": 1}   # Crossbow as an extra ranged option
			]
		},
		{
			"title": "Explore the Ruins (Medium)",
			"description": "Explore a larger and more complex set of ancient ruins, facing greater dangers.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff to symbolize discovery
				{"item_id": 139, "min": 2, "max": 5},  # Health Potions for the toll of exploration
				{"item_id": 102, "min": 1, "max": 1}   # Iron Sword for adventuring
			]
		},
		{
			"title": "Track the Cult Leader",
			"description": "Hunt down and capture or eliminate the leader of a dangerous cult.",
			"item_rewards": [
				{"item_id": 109, "min": 1, "max": 3},  # Daggers for covert operations
				{"item_id": 113, "min": 1, "max": 1},  # Wooden Shield for defensive backup
				{"item_id": 111, "min": 1, "max": 1}   # Dagger Set for an extra edge
			]
		},
		{
			"title": "Stop the Smuggling Ring",
			"description": "Disrupt a large and well-connected smuggling operation.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 2},  # Wooden Shield(s) to imply protection
				{"item_id": 107, "min": 1, "max": 1}   # Club to represent brute force intervention
			]
		},
		{
			"title": "Retrieve the Magical Component",
			"description": "Recover a vital magical component needed for a critical ritual.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 1},  # Fire Staff for potent magical properties
				{"item_id": 122, "min": 1, "max": 1}   # Nature Staff as an alternate elemental reward
			]
		},
		{
			"title": "Disrupt the Major Ritual",
			"description": "Interfere with a significant ritual being performed by a powerful dark cult.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff for its disruptive energy
				{"item_id": 110, "min": 1, "max": 1},  # Sai for swift execution
				{"item_id": 120, "min": 1, "max": 1}   # Water Staff to counterbalance dark magic
			]
		},
		{
			"title": "Guard the Caravan (Long)",
			"description": "Provide protection for a large and valuable caravan across a long and perilous journey.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 3},  # Wooden Shields for robust defense
				{"item_id": 131, "min": 1, "max": 1}   # Leather Boots for steady travel
			]
		},
		{
			"title": "Clear the Underground City",
			"description": "Explore and clear out a section of a dangerous underground city.",
			"item_rewards": [
				{"item_id": 139, "min": 3, "max": 7},  # Health Potions reflecting arduous battles
				{"item_id": 109, "min": 1, "max": 2},  # Daggers to aid in clearing obstacles
				{"item_id": 106, "min": 1, "max": 1}   # Battleaxe for heavy demolition
			]
		},
		{
			"title": "Investigate the Plague Source",
			"description": "Discover the source of a mysterious illness affecting a region.",
			"item_rewards": [
				{"item_id": 139, "min": 2, "max": 4},  # Health Potions to recover from contagion
				{"item_id": 120, "min": 1, "max": 1},  # Water Staff as a symbol of purification
				{"item_id": 126, "min": 1, "max": 1}   # Iron Bodyplate for added protection
			]
		},
		{
			"title": "Retrieve a Stolen Spellbook",
			"description": "Recover a powerful spellbook stolen from a wizard's tower.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff for its arcane connection
				{"item_id": 138, "min": 1, "max": 1}   # Skill Book to reflect magical knowledge
			]
		},
		{
			"title": "Scout the Enemy Stronghold",
			"description": "Infiltrate and gather intelligence on a heavily defended enemy stronghold.",
			"item_rewards": [
				{"item_id": 139, "min": 2, "max": 4},  # Health Potions to support stealthy operations
				{"item_id": 116, "min": 1, "max": 1}   # Bow for silent ranged support
			]
		}
	],
	"A": [
		{
			"title": "Siege of the Goblin King",
			"description": "Lead an assault against the fortified stronghold of a powerful Goblin King.",
			"item_rewards": [
				{"item_id": 109, "min": 3, "max": 6},  # Daggers for rapid strikes
				{"item_id": 140, "min": 4, "max": 8},  # Mana Potions to bolster magical energy
				{"item_id": 112, "min": 1, "max": 1}   # Whip as an auxiliary weapon
			]
		},
		{
			"title": "Legendary Beast Slaying",
			"description": "Hunt down and defeat a mythical or legendary creature of immense power.",
			"item_rewards": [
				{"item_id": 109, "min": 2, "max": 4},  # Daggers for agile combat
				{"item_id": 140, "min": 3, "max": 6},  # Mana Potions to sustain during the fight
				{"item_id": 110, "min": 1, "max": 2}   # Sai to add variety to the arsenal
			]
		},
		{
			"title": "Dismantle the Bandit Empire",
			"description": "Destroy a large and well-established network of bandit gangs.",
			"item_rewards": [
				{"item_id": 109, "min": 3, "max": 5},  # Multiple Daggers for swift assaults
				{"item_id": 113, "min": 1, "max": 3}   # Wooden Shields to symbolize defensive measures
			]
		},
		{
			"title": "Sewer Leviathan",
			"description": "Confront and defeat a colossal and terrifying creature dwelling in the deepest parts of the sewers.",
			"item_rewards": [
				{"item_id": 109, "min": 2, "max": 4},  # Daggers, versatile for close combat
				{"item_id": 140, "min": 4, "max": 7},  # Mana Potions for recovery during prolonged fights
				{"item_id": 110, "min": 1, "max": 2}   # Sai to provide additional melee options
			]
		},
		{
			"title": "Recover the Crown Jewels",
			"description": "Retrieve priceless crown jewels stolen by a highly skilled and dangerous group.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 3}   # Fire Staff as a symbol of power and prestige
			]
		},
		{
			"title": "Protect the Royal Envoy",
			"description": "Provide safe passage for a royal envoy through a war-torn region.",
			"item_rewards": [
				{"item_id": 113, "min": 1, "max": 3},  # Wooden Shields for essential protection
				{"item_id": 112, "min": 1, "max": 1}   # Whip as an additional deterrent
			]
		},
		{
			"title": "Clear the Lost City",
			"description": "Explore and clear out a vast and dangerous lost city filled with ancient traps and powerful guardians.",
			"item_rewards": [
				{"item_id": 139, "min": 5, "max": 10},  # Health Potions reflecting the toll of the journey
				{"item_id": 121, "min": 1, "max": 2}    # Fire Staff as a prized relic from the ruins
			]
		},
		{
			"title": "Retrieve the Artifact of Power",
			"description": "Recover a powerful artifact of immense magical power from a formidable foe.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff to channel its magical might
				{"item_id": 110, "min": 1, "max": 1}   # Sai to complement the artifact's power
			]
		},
		{
			"title": "Banish the Ancient Evil",
			"description": "Confront and banish a powerful ancient evil that has awakened.",
			"item_rewards": [
				{"item_id": 110, "min": 1, "max": 2}, # Sai for decisive strikes
				{"item_id": 124, "min": 1, "max": 1}   # Leather Helm as a token of valor
			]
		},
		{
			"title": "Defend the Citadel",
			"description": "Organize the defense of a major citadel against a large-scale invasion.",
			"item_rewards": [
				{"item_id": 109, "min": 4, "max": 7},  # Daggers to lead the offensive
				{"item_id": 140, "min": 5, "max": 9},  # Mana Potions for constant reinforcement
				{"item_id": 112, "min": 1, "max": 2}   # Whip as an emblem of leadership in battle
			]
		},
		{
			"title": "Explore the Forbidden Lands",
			"description": "Venture into a highly dangerous and uncharted territory to discover its secrets.",
			"item_rewards": [
				{"item_id": 139, "min": 3, "max": 7},  # Health Potions to cope with harsh environments
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff as a guide through unknown magic
				{"item_id": 110, "min": 1, "max": 1}   # Sai to assist in survival
			]
		},
		{
			"title": "Assassinate the Tyrant",
			"description": "Infiltrate and assassinate a heavily guarded and oppressive ruler.",
			"item_rewards": [
				{"item_id": 108, "min": 1, "max": 2},  # Flail for brute force if needed
				{"item_id": 116, "min": 1, "max": 2}   # Bow for a silent kill from range
			]
		},
		{
			"title": "Break the Curse of the Land",
			"description": "Find the source of a powerful curse affecting a large area and break it.",
			"item_rewards": [
				{"item_id": 124, "min": 1, "max": 2},  # Leather Helm symbolizing resilience
				{"item_id": 110, "min": 1, "max": 1}   # Sai as a swift instrument of change
			]
		},
		{
			"title": "Retrieve the Heart of the Element",
			"description": "Recover a vital elemental heart from a dangerous elemental plane.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 2},  # Fire Staff for its elemental potency
				{"item_id": 110, "min": 1, "max": 1}   # Sai to support the extraction
			]
		},
		{
			"title": "Disrupt the Doomsday Ritual",
			"description": "Interfere with a world-threatening ritual being performed by a powerful cult.",
			"item_rewards": [
				{"item_id": 121, "min": 1, "max": 3},  # Fire Staff to counteract dark magic
				{"item_id": 124, "min": 1, "max": 1}   # Leather Helm as an emblem of defiance
			]
		},
		{
			"title": "Lead the Rebellion",
			"description": "Help topple an oppressive regime by leading a rebellion.",
			"item_rewards": [
				{"item_id": 112, "min": 1, "max": 2},  # Whip to rally the fighters
				{"item_id": 113, "min": 1, "max": 2}   # Wooden Shield to symbolize unity and defense
			]
		},
		{
			"title": "Clear the Interdimensional Rift",
			"description": "Close a dangerous rift to another dimension that is unleashing monsters.",
			"item_rewards": [
				{"item_id": 124, "min": 1, "max": 2},  # Leather Helm for protection against unknown forces
				{"item_id": 110, "min": 1, "max": 1}   # Sai to seal the breach with precision
			]
		},
		{
			"title": "Investigate the Vanishing Villages",
			"description": "Discover the cause behind the mysterious disappearance of entire villages.",
			"item_rewards": [
				{"item_id": 139, "min": 3, "max": 6},  # Health Potions to survive the ordeal
				{"item_id": 121, "min": 1, "max": 1}   # Fire Staff signifying the uncovering of dark magic
			]
		},
		{
			"title": "Retrieve the Divine Weapon",
			"description": "Recover a powerful weapon said to have been wielded by a deity.",
			"item_rewards": [
				{"item_id": 125, "min": 1, "max": 1}   # Steel Helm as a symbol of the weapon's divine heritage
			]
		},
		{
			"title": "Scout the Enemy Army",
			"description": "Infiltrate and gather crucial intelligence on a massive enemy army preparing for war.",
			"item_rewards": [
				{"item_id": 139, "min": 2, "max": 5}   # Health Potions to support covert operations
			]
		}
	],
	"S": [
		{
			"title": "Slay the Ancient Dragon",
			"description": "Hunt down and defeat a powerful and ancient dragon.",
			"item_rewards": [
				{"item_id": 125, "min": 2, "max": 3},  # Steel Helm: increased bounty for epic defense
				{"item_id": 119, "min": 2, "max": 3}   # Staff: representing the ancient power of the foe
			]
		},
		{
			"title": "Seal the Abyssal Gate",
			"description": "Close a permanent and dangerous gate to the abyssal planes.",
			"item_rewards": [
				{"item_id": 124, "min": 2, "max": 4},  # Leather Helm: now granted in higher quantities
				{"item_id": 110, "min": 2, "max": 3}   # Sai: upgraded reward range for crucial tasks
			]
		},
		{
			"title": "Defeat the Demon Lord",
			"description": "Confront and vanquish a powerful Demon Lord threatening the world.",
			"item_rewards": [
				{"item_id": 108, "min": 2, "max": 3},  # Flail: bountiful reward for a fearsome foe
				{"item_id": 125, "min": 2, "max": 3}   # Steel Helm: reflecting the valor needed
			]
		},
		{
			"title": "Recover the Lost God's Artifact",
			"description": "Retrieve a legendary artifact once belonging to a defeated deity.",
			"item_rewards": [
				{"item_id": 121, "min": 2, "max": 4},  # Fire Staff: its power scales with the challenge
				{"item_id": 125, "min": 2, "max": 3}   # Steel Helm: emblematic of divine favor
			]
		},
		{
			"title": "Stop the World-Ending Prophecy",
			"description": "Prevent a prophecy foretelling the end of the world from coming to pass.",
			"item_rewards": [
				{"item_id": 124, "min": 2, "max": 3},  # Leather Helm: sturdier reward for a legendary feat
				{"item_id": 121, "min": 2, "max": 3}   # Fire Staff: fueling the fight against destiny
			]
		},
		{
			"title": "Venture into Another Plane",
			"description": "Travel to a dangerous alternate plane of existence to stop a threat.",
			"item_rewards": [
				{"item_id": 124, "min": 2, "max": 4},  # Leather Helm: increased reward befitting otherworldly journeys
				{"item_id": 110, "min": 2, "max": 3}   # Sai: offering versatile combat aid across dimensions
			]
		},
		{
			"title": "Defeat the Lich King",
			"description": "Confront and destroy a powerful Lich King and his undead army.",
			"item_rewards": [
				{"item_id": 108, "min": 2, "max": 3},  # Flail: reflecting the brutal battle
				{"item_id": 125, "min": 2, "max": 3}   # Steel Helm: honor for conquering unspeakable evil
			]
		},
		{
			"title": "Seal the Source of Corruption",
			"description": "Find and seal the ultimate source of a widespread magical corruption.",
			"item_rewards": [
				{"item_id": 124, "min": 2, "max": 3},  # Leather Helm: robust protection against corruption
				{"item_id": 110, "min": 2, "max": 3}   # Sai: versatile and lethal when facing magical foes
			]
		},
		{
			"title": "Negotiate Peace with a Hostile Nation",
			"description": "Broker a peace treaty with a powerful and aggressive opposing nation.",
			"item_rewards": [
				{"item_id": 113, "min": 2, "max": 4},  # Wooden Shield: symbolizing the strength of unity
				{"item_id": 112, "min": 2, "max": 3}   # Whip: representing decisive leadership in negotiations
			]
		},
		{
			"title": "Unravel the Cosmic Conspiracy",
			"description": "Uncover and stop a conspiracy that threatens the very fabric of reality.",
			"item_rewards": [
				{"item_id": 121, "min": 2, "max": 4},  # Fire Staff: channeling cosmic forces
				{"item_id": 139, "min": 4, "max": 8}   # Health Potion: more abundant to withstand reality's strain
			]
		}
	]
	}

# Reward multipliers for increasing rewards with mission rank.
var reward_multiplier = {
	"E": 1.0,
	"D": 1.5,
	"C": 2,
	"B": 3,
	"A": 4,
	"S": 7
}

# Function to generate a unique mission
func generate_mission() -> Node:
	var mission = preload("res://scripts/guild/missionProfile.gd").new()
	
	mission.mission_id = str(Globals.get_next_mission_id())  # Assign the mission ID
	print("Generating mission with ID: ", mission.mission_id)  # Debug print
	
	mission.rank = get_random_rank()
	# Retrieve title-description and item rewards based on the generated rank.
	var data = mission_data[mission.rank]
	var pair = data[randi() % data.size()]
	mission.title = pair["title"]
	mission.description = pair["description"]
	
	# Generate the rewards dictionary using the mission rank.
	mission.rewards = generate_rewards(mission.rank)
	
	# Generate item rewards based on the mission data.
	# mission.item_rewards is an array of dictionaries with item_id and quantity.
	mission.item_rewards = []
	for reward in pair["item_rewards"]:
		var quantity = randi_range(reward["min"], reward["max"])
		# Only add the reward if quantity is positive.
		if quantity > 0:
			mission.item_rewards.append({"item_id": reward["item_id"], "quantity": quantity})
	
	# Calculate time_to_complete:
	# Base time is between 5 and 15 days, then multiplied by a factor based on mission rank.
	var base_time = randi_range(5, 15)
	var multiplier = get_time_multiplier(mission.rank)
	mission.time_to_complete = base_time * multiplier
	
	return mission

# Function to get a random rank from a predefined list with weighted probabilities.
func get_random_rank() -> String:
	var ranks = ["E", "D", "C", "B", "A", "S"]
	var weights = [40, 30, 20, 10, 5, 2.5]
	var total = 0.0
	for weight in weights:
		total += weight
	
	# Use randf() to get a random float and scale it to the total weights
	var random_num = randf() * total
	var accum = 0.0
	for i in range(ranks.size()):
		accum += weights[i]
		if random_num < accum:
			return ranks[i]
	# Fallback in case something goes wrong (should never hit)
	return "E"

# Function to generate random rewards based on mission rank.
func generate_rewards(rank: String) -> Dictionary:
	var mult = reward_multiplier[rank]
	var rewards = {
		"gold": int(randi_range(30, 100) * mult),
		"reputation": int(randi_range(2, 8) * mult),
		"prestige": int(randi_range(1, 5) * mult),
		"influence": int(randi_range(2, 7) * mult)
	}
	return rewards

# Function that returns the time multiplier based on mission rank.
func get_time_multiplier(rank: String) -> int:
	match rank:
		"E": return 1
		"D": return 2
		"C": return 3
		"B": return 4
		"A": return 6
		"S": return 8
		_:
			return 1
