extends Button

func _ready():
	connect("pressed", Callable (self, "_on_DebugButton_pressed"))

func _on_DebugButton_pressed():
	add_random_items_to_inventory(5)

func add_random_items_to_inventory(count: int):
	var item_ids = Items.items.keys()
	for i in range(count):
		var random_item_id = item_ids[randi() % item_ids.size()]
		var random_quantity = randi() % 10 + 1
		Inventory.add_item(random_item_id, random_quantity)
		print("Added random item: ", random_item_id, " Quantity: ", random_quantity)
