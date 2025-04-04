extends ScrollContainer

# Preload the itemList scene
var ItemListScene = preload("res://item_list_entry.tscn")

# Reference to the GridContainer
@onready var inventoryGrid = $inventoryGrid

func _ready():
	# Populate the inventory when the node is ready
	populate_inventory()
	# Connect the inventory_updated signal to the populate_inventory function
	Inventory.connect("inventory_updated", Callable (self, "populate_inventory"))

# Function to populate the inventory
func populate_inventory():
	# Clear existing items in the inventory grid
	clear_inventory_grid()

	# Iterate through the inventory and create itemList instances
	for item_id in Inventory.get_inventory().keys():
		var quantity = Inventory.get_inventory()[item_id]
		add_inventory_item(item_id, quantity)

# Function to clear the inventory grid
func clear_inventory_grid():
	for child in inventoryGrid.get_children():
		child.queue_free()

# Function to add an item to the inventory grid
func add_inventory_item(item_id: int, quantity: int):
	var item = Items.items[item_id]
	var item_instance = ItemListScene.instantiate()
	item_instance.set_item(item, quantity)
	inventoryGrid.add_child(item_instance)
