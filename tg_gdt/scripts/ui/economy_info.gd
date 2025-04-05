extends VBoxContainer

@onready var item_info_label = $itemInfo
@onready var item_icon = $HSplitContainer/TextureRect
@onready var item_name_label = $HSplitContainer/itemName
@onready var item_description_label = $HSplitContainer/itemName/itemDescription
@onready var item_quantity_label = $HSplitContainer/itemName/HBoxContainer/itemQuantity

@onready var amount_bg = $HSplitContainer/itemName/HBoxContainer/itemQuantity/amountBg
@onready var amount_label = $HSplitContainer/itemName/HBoxContainer/itemQuantity/amountBg/amountLabel
@onready var amount_line_edit = $HSplitContainer/itemName/HBoxContainer/itemQuantity/amount

@onready var sell_button = $HSplitContainer/itemName/HBoxContainer/sellButton
@onready var donate_button = $HSplitContainer/itemName/HBoxContainer/donateButton

@onready var recent_missions_value = $economicInfoContainer/mainEconomicInfo/economicValues/recentMissionsValue
@onready var monthly_income_value = $economicInfoContainer/mainEconomicInfo/economicValues/monthlyIncomeValue
@onready var monthly_expenses_value = $economicInfoContainer/mainEconomicInfo/economicValues/monthlyExpensesValue
@onready var monthly_balance_value = $economicInfoContainer/mainEconomicInfo/economicValues/monthlyBalanceValue
@onready var guild_commentary_value = $economicInfoContainer/guildCommentaryLabel/guildCommentaryValue

@onready var town_economic_status = $economicStatus/economicStatusValue
@onready var guild_economic_status = $guildStatus/guildStatusValue

# Declare variables for item details
var item: Items.Item
var quantity: int

# Function to update the item information
func update_item_info(item: Items.Item, quantity: int):
	self.item = item
	self.quantity = quantity
	if item_icon and item.item_sprite:
		item_icon.texture = item.item_sprite
	if item_name_label:
		item_name_label.text = item.item_name
	if item_description_label:
		item_description_label.text = item.item_description
	if item_quantity_label:
		item_quantity_label.text = "Quantity: " + str(quantity)
	if sell_button:
		sell_button.disconnect("pressed", Callable(self, "_on_sell_button_pressed"))
		sell_button.connect("pressed", Callable(self, "_on_sell_button_pressed"))
	if donate_button:
		donate_button.disconnect("pressed", Callable(self, "_on_donate_button_pressed"))
		donate_button.connect("pressed", Callable(self, "_on_donate_button_pressed"))
	if amount_line_edit:
		amount_line_edit.disconnect("focus_exited", Callable(self, "_on_amount_focus_exited"))
		amount_line_edit.connect("focus_exited", Callable(self, "_on_amount_focus_exited"))

# Function to update the economic values (placeholders for now)
func update_economic_info():
	if recent_missions_value:
		recent_missions_value.text = "800"  # Placeholder value
	if monthly_income_value:
		monthly_income_value.text = "800"  # Placeholder value
	if monthly_expenses_value:
		monthly_expenses_value.text = "800"  # Placeholder value
	if monthly_balance_value:
		monthly_balance_value.text = "800"  # Placeholder value
	if guild_commentary_value:
		guild_commentary_value.text = "Guild Commentary Placeholder"
	if town_economic_status:
		town_economic_status.text = "Flourishing"  # Placeholder value
	if guild_economic_status:
		guild_economic_status.text = "Flourishing"  # Placeholder value

# Hide amount input elements
func hide_amount_input():
	if amount_label:
		amount_label.hide()
	if amount_line_edit:
		amount_line_edit.hide()
		amount_line_edit.text = ""
	if amount_bg:
		amount_bg.hide()

# Show amount input elements
func show_amount_input():
	if amount_label:
		amount_label.show()
	if amount_line_edit:
		amount_line_edit.show()
		amount_line_edit.grab_focus()
	if amount_bg:
		amount_bg.show()

func _ready():
	update_economic_info()
	hide_amount_input()

func _on_sell_button_pressed():
	show_amount_input()
	amount_line_edit.clear()
	amount_line_edit.disconnect("text_submitted", Callable(self, "_on_amount_entered"))
	amount_line_edit.connect("text_submitted", Callable(self, "_on_amount_entered").bind("Sell"))

func _on_donate_button_pressed():
	show_amount_input()
	amount_line_edit.clear()
	amount_line_edit.disconnect("text_submitted", Callable(self, "_on_amount_entered"))
	amount_line_edit.connect("text_submitted", Callable(self, "_on_amount_entered").bind("Donate"))

func _on_amount_entered(text, action):
	var quantity = text.to_int()
	if quantity > 0:
		if action == "Sell":
			print("Selling", quantity, "of", item.item_name)
			# Implement selling logic here
			Inventory.remove_item(item.item_id, quantity)
		elif action == "Donate":
			print("Donating", quantity, "of", item.item_name)
			# Implement donating logic here
			Inventory.remove_item(item.item_id, quantity)
		# Call the global UIManager to update all quantities
		UIManager.update_all_quantities()
		# Update the quantity of the current item in the economyInfo screen
		update_current_item_quantity()
	hide_amount_input()

func _on_amount_focus_exited():
	hide_amount_input()

# Function to update the quantity of the current item in the economyInfo screen
func update_current_item_quantity():
	var item_quantity = Inventory.get_item_quantity(item.item_id)
	if item_quantity_label:
		item_quantity_label.text = "Quantity: " + str(item_quantity)
