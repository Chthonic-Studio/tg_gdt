extends Node

# Dictionary to hold the player's inventory items and their quantities
var inventory = {}

# Signal to notify when the inventory is updated
signal inventory_updated

func _ready():
	print("Inventory script initialized")
	# Initialize inventory if needed
	init_inventory()

# Function to initialize the inventory
func init_inventory():
	# Example: Initially empty inventory
	inventory = {}

# Function to add an item to the inventory
func add_item(item_id: int, quantity: int = 1):
	if inventory.has(item_id):
		inventory[item_id] += quantity
	else:
		inventory[item_id] = quantity
	print("Added item to inventory: ", item_id, " Quantity: ", quantity)
	emit_signal("inventory_updated")

# Function to remove an item from the inventory
func remove_item(item_id: int, quantity: int = 1) -> bool:
	if inventory.has(item_id) and inventory[item_id] >= quantity:
		inventory[item_id] -= quantity
		if inventory[item_id] <= 0:
			inventory.erase(item_id)
		print("Removed item from inventory: ", item_id, " Quantity: ", quantity)
		emit_signal("inventory_updated")
		return true
	print("Failed to remove item from inventory: ", item_id, " Quantity: ", quantity)
	return false

# Function to get the quantity of an item in the inventory
func get_item_quantity(item_id: int) -> int:
	if inventory.has(item_id):
		return inventory[item_id]
	return 0

# Function to check if the inventory has a specific item
func has_item(item_id: int) -> bool:
	return inventory.has(item_id)

# Function to get the entire inventory
func get_inventory() -> Dictionary:
	return inventory
