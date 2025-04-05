extends TextureButton

@onready var item_icon = $itemListIcon
@onready var item_name = $onHoverPopUp/descriptionBg/VBoxContainer/name
@onready var item_quantity = $onHoverPopUp/descriptionBg/VBoxContainer/quantity
@onready var item_description = $onHoverPopUp/descriptionBg/VBoxContainer/description
@onready var onHoverPopUp = $onHoverPopUp
@onready var economy_info = $"../../../../../../../rightPage/rp_vbox/rp_title/rp_content/economyInfo"

# Declare variables for item details
var item: Items.Item
var quantity: int

# Function to set item details
func set_item(item: Items.Item, quantity: int):
	self.item = item
	self.quantity = quantity
	call_deferred("update_item_display")  # Defer the call to update_item_display

# Function to update the item display
func update_item_display():
	if item_icon and item.item_sprite:
		item_icon.texture = item.item_sprite
	else:
		print("Icon Not Initialized - item_icon:", item_icon, ", item_sprite:", item.item_sprite)
	if item_quantity:
		item_quantity.text = str(quantity)
	if item_description:
		item_description.text = item.item_description
	if item_name:
		item_name.text = item.item_name

# Debug initialization in _ready
func _ready():
	self.connect("pressed", Callable(self, "_on_item_pressed"))
	self.connect("mouse_entered", Callable(self, "_on_mouse_entered"))
	self.connect("mouse_exited", Callable(self, "_on_mouse_exited"))

# Show Control node on hover and update quantity and description
func _on_mouse_entered():
	onHoverPopUp.visible = true
	if item_quantity:
		item_quantity.text = "Quantity: " + str(Inventory.get_item_quantity(item.item_id))
	if item_description:
		item_description.text = item.item_description
	if item_name:
		item_name.text = item.item_name

# Hide Control node when not hovering
func _on_mouse_exited():
	onHoverPopUp.visible = false

# Handle item pressed event and update the economy info UI window
func _on_item_pressed():
	economy_info.update_item_info(item, quantity)
