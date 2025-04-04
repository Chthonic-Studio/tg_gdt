extends Node

class Item:
	var item_id: int
	var item_name: String
	var item_sprite: Texture
	var item_description: String
	var item_base_price: int

	@warning_ignore("shadowed_variable")
	func _init(item_id: int, item_name: String, item_sprite: Texture, item_description: String, item_base_price: int):
		self.item_id = item_id
		self.item_name = item_name
		self.item_sprite = item_sprite
		self.item_description = item_description
		self.item_base_price = item_base_price

# Dictionary to hold all items
var items = {}

# Economy Variables
var city_wealth: int = 1000

var item_price_modifiers = {
	"Bronze Sword": 1.0,
	"Iron Sword": 1.0,
	"Steel Sword": 1.0
}

func _ready():
	print("ItemDatabase script initialized")
	create_items()

# Function to create items
func create_items():
	var bronze_sword = Item.new(101, "Bronze Sword", preload("res://assets/item_icons/tile080.png"), "A blade made of bronze", 25)
	var iron_sword = Item.new(102, "Iron Sword", preload("res://assets/item_icons/tile081.png"), "A blade made of iron", 50)
	var steel_sword = Item.new(103, "Steel Sword", preload("res://assets/item_icons/tile082.png"), "A sharp blade made of steel", 90)
	var hand_axe = Item.new(104, "Handaxe", preload("res://assets/item_icons/tile161.png"), "A short bladed axe", 20)
	var iron_axe = Item.new(105, "Iron Axe", preload("res://assets/item_icons/tile090.png"), "A sturdy axe made of iron", 40)
	var battleaxe = Item.new(106, "Steel Axe", preload("res://assets/item_icons/tile091.png"), "A massive, heavy battleaxe", 85)
	var club = Item.new(107, "Club", preload("res://assets/item_icons/tile093.png"), "A wooden log with spikes embedded in its head", 22)
	var flail = Item.new(108, "Flail", preload("res://assets/item_icons/tile092.png"), "A metallic rod with a chain that has a spiked ball in its end", 75)
	var dagger = Item.new(109, "Dagger", preload("res://assets/item_icons/tile087.png"), "A small but sharp dagger", 12)
	var sai = Item.new(110, "Sai", preload("res://assets/item_icons/tile088.png"), "A pair of strange melee weapons", 30)
	var dagger_set = Item.new(111, "Dagger Set", preload("res://assets/item_icons/tile089.png"), "A set of small but sharp daggers", 35)
	var whip = Item.new(112, "Whip", preload("res://assets/item_icons/tile094.png"), "A long, flexible weapon", 40)
	var wooden_shield = Item.new(113, "Wooden Shield", preload("res://assets/item_icons/tile096.png"), "A basic wooden shield", 15)
	var heater_shield = Item.new(114, "Heater Shield", preload("res://assets/item_icons/tile097.png"), "A medium-sized shield", 45)
	var kiteshield = Item.new(115, "Kiteshield", preload("res://assets/item_icons/tile098.png"), "A large, kite-shaped shield", 60)
	var bow = Item.new(116, "Bow", preload("res://assets/item_icons/tile099.png"), "A basic bow", 50)
	var crossbow = Item.new(117, "Crossbow", preload("res://assets/item_icons/tile100.png"), "A powerful crossbow", 70)
	var boomerang = Item.new(118, "Boomerang", preload("res://assets/item_icons/tile102.png"), "A returning throwing weapon", 25)
	var staff = Item.new(119, "Staff", preload("res://assets/item_icons/tile103.png"), "A basic staff", 20)
	var water_staff = Item.new(120, "Water Staff", preload("res://assets/item_icons/tile104.png"), "A staff imbued with water magic", 55)
	var fire_staff = Item.new(121, "Fire Staff", preload("res://assets/item_icons/tile105.png"), "A staff imbued with fire magic", 55)
	var nature_staff = Item.new(122, "Nature Staff", preload("res://assets/item_icons/tile106.png"), "A staff imbued with nature magic", 55)
	var iron_helm = Item.new(123, "Iron Helm", preload("res://assets/item_icons/tile113.png"), "A sturdy iron helmet", 35)
	var leather_helm = Item.new(124, "Leather Helm", preload("res://assets/item_icons/tile114.png"), "A basic leather helmet", 20)
	var steel_helm = Item.new(125, "Steel Helm", preload("res://assets/item_icons/tile115.png"), "A strong steel helmet", 50)
	var iron_bodyplate = Item.new(126, "Iron Bodyplate", preload("res://assets/item_icons/tile116.png"), "A sturdy iron bodyplate", 70)
	var leather_cuirass = Item.new(127, "Leather Cuirass", preload("res://assets/item_icons/tile118.png"), "A basic leather cuirass", 40)
	var steel_plate = Item.new(128, "Steel Plate", preload("res://assets/item_icons/tile119.png"), "A strong steel plate", 90)
	var wizard_robe = Item.new(129, "Wizard Robe", preload("res://assets/item_icons/tile120.png"), "A robe for wizards", 60)
	var leather_cloak = Item.new(130, "Leather Cloak", preload("res://assets/item_icons/tile126.png"), "A basic leather cloak", 30)
	var leather_boots = Item.new(131, "Leather Boots", preload("res://assets/item_icons/tile130.png"), "A pair of basic leather boots", 20)
	var pickaxe = Item.new(132, "Pickaxe", preload("res://assets/item_icons/tile162.png"), "A tool for mining", 25)
	var hammer = Item.new(133, "Hammer", preload("res://assets/item_icons/tile164.png"), "A tool for hammering", 20)
	var lantern = Item.new(134, "Lantern", preload("res://assets/item_icons/tile169.png"), "A source of light", 15)
	var torch = Item.new(135, "Torch", preload("res://assets/item_icons/tile170.png"), "A basic torch", 10)
	var horses = Item.new(136, "Horses", preload("res://assets/item_icons/tile314.png"), "A pair of horses", 100)
	var monsters_remains = Item.new(137, "Monster's Remains", preload("res://assets/item_icons/tile267.png"), "Remains of a defeated monster", 5)
	var skill_book = Item.new(138, "Skill Book", preload("res://assets/item_icons/tile215.png"), "A book to learn new skills", 50)
	var health_potion = Item.new(139, "Health Potion", preload("res://assets/item_icons/tile152.png"), "A potion to restore health", 10)
	var mana_potion = Item.new(140, "Mana Potion", preload("res://assets/item_icons/tile153.png"), "A potion to restore mana", 10)

	items[bronze_sword.item_id] = bronze_sword
	items[iron_sword.item_id] = iron_sword
	items[steel_sword.item_id] = steel_sword
	items[hand_axe.item_id] = hand_axe
	items[iron_axe.item_id] = iron_axe
	items[battleaxe.item_id] = battleaxe
	items[club.item_id] = club
	items[flail.item_id] = flail
	items[dagger.item_id] = dagger
	items[sai.item_id] = sai
	items[dagger_set.item_id] = dagger_set
	items[whip.item_id] = whip
	items[wooden_shield.item_id] = wooden_shield
	items[heater_shield.item_id] = heater_shield
	items[kiteshield.item_id] = kiteshield
	items[bow.item_id] = bow
	items[crossbow.item_id] = crossbow
	items[boomerang.item_id] = boomerang
	items[staff.item_id] = staff
	items[water_staff.item_id] = water_staff
	items[fire_staff.item_id] = fire_staff
	items[nature_staff.item_id] = nature_staff
	items[iron_helm.item_id] = iron_helm
	items[leather_helm.item_id] = leather_helm
	items[steel_helm.item_id] = steel_helm
	items[iron_bodyplate.item_id] = iron_bodyplate
	items[leather_cuirass.item_id] = leather_cuirass
	items[steel_plate.item_id] = steel_plate
	items[wizard_robe.item_id] = wizard_robe
	items[leather_cloak.item_id] = leather_cloak
	items[leather_boots.item_id] = leather_boots
	items[pickaxe.item_id] = pickaxe
	items[hammer.item_id] = hammer
	items[lantern.item_id] = lantern
	items[torch.item_id] = torch
	items[horses.item_id] = horses
	items[monsters_remains.item_id] = monsters_remains
	items[skill_book.item_id] = skill_book
	items[health_potion.item_id] = health_potion
	items[mana_potion.item_id] = mana_potion

	print("Items created")

# Function to update item prices based on demand
func update_item_price(item_name: String, quantity: int):
	item_price_modifiers[item_name] = clamp(item_price_modifiers[item_name] + (quantity * 0.02), 0.5, 2.0)
	print("Updated price modifier for ", item_name, ": ", item_price_modifiers[item_name])
