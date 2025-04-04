extends TextureButton

@onready var item_icon = $itemListIcon
@onready var item_quantity = $itemListIcon/Control/VBoxContainer/quantity
@onready var item_description = $itemListIcon/Control/VBoxContainer/descriptionBg/description

# Declare variables for item details
var item: Items.Item
var quantity: int

# Function to set item details
func set_item(item: Items.Item, quantity: int):
	self.item = item
	self.quantity = quantity
	update_item_display()

# Function to update the item display
func update_item_display():
	if item_icon and item.item_sprite:
		item_icon.texture = item.item_sprite
	else: 
		print ("Icon Not Initialized")
	if item_quantity:
		item_quantity.text = str(quantity)
	if item_description:
		item_description.text = item.item_description
