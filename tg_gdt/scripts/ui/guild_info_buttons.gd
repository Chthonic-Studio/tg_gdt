extends VBoxContainer

# Function to handle the upgrade button press
func _on_upgrade_button_pressed(building: String):
	print("Upgrade button pressed for building: " + building)
	GameManager.upgrade_building(building)
	update_ui()

# Function to handle the hire button press
func _on_hire_button_pressed(building: String):
	print("Hire button pressed for building: " + building)
	GameManager.hire_workers(building)
	update_ui()

# Function to update the UI after an action
func update_ui():
	print("Updating UI")
	# Update the UI elements with the new stats from the GameManager
	var guild_stats = GameManager.get_guild_stats()
	
	# Update Tavern UI
	if $HSplitContainer/tavern/tavernLevel:
		$HSplitContainer/tavern/tavernLevel.text = str(guild_stats.tavern_level)
	else:
		print("Error: tavernLevel is null")

	if $HSplitContainer/tavern/tavernStatus:
		$HSplitContainer/tavern/tavernStatus.text = guild_stats.tavern_status
	else:
		print("Error: tavernStatus is null")

	# Update Training Grounds UI
	if $HSplitContainer/trainingGrounds/trainingGroundsLevel:
		$HSplitContainer/trainingGrounds/trainingGroundsLevel.text = str(guild_stats.training_grounds_level)
	else:
		print("Error: trainingGroundsLevel is null")

	if $HSplitContainer/trainingGrounds/trainingGroundsStatus:
		$HSplitContainer/trainingGrounds/trainingGroundsStatus.text = guild_stats.training_grounds_status
	else:
		print("Error: trainingGroundsStatus is null")

	# Update Forge UI
	if $HSplitContainer2/forge/forgeLevel:
		$HSplitContainer2/forge/forgeLevel.text = str(guild_stats.forge_level)
	else:
		print("Error: forgeLevel is null")

	if $HSplitContainer2/forge/forgeStatus:
		$HSplitContainer2/forge/forgeStatus.text = guild_stats.forge_status
	else:
		print("Error: forgeStatus is null")

	# Update Apothecary UI
	if $HSplitContainer2/apothecary/apothecaryLevel:
		$HSplitContainer2/apothecary/apothecaryLevel.text = str(guild_stats.apothecary_level)
	else:
		print("Error: apothecaryLevel is null")

	if $HSplitContainer2/apothecary/apothecaryStatus:
		$HSplitContainer2/apothecary/apothecaryStatus.text = guild_stats.apothecary_status
	else:
		print("Error: apothecaryStatus is null")

	# Update Cartography UI
	if $HSplitContainer3/cartography/cartographyLevel:
		$HSplitContainer3/cartography/cartographyLevel.text = str(guild_stats.cartography_level)
	else:
		print("Error: cartographyLevel is null")

	if $HSplitContainer3/cartography/cartographyStatus:
		$HSplitContainer3/cartography/cartographyStatus.text = guild_stats.cartography_status
	else:
		print("Error: cartographyStatus is null")

	# Update Enchantment UI
	if $HSplitContainer3/enchantment/enchantmentLevel:
		$HSplitContainer3/enchantment/enchantmentLevel.text = str(guild_stats.enchantment_level)
	else:
		print("Error: enchantmentLevel is null")

	if $HSplitContainer3/enchantment/enchantmentStatus:
		$HSplitContainer3/enchantment/enchantmentStatus.text = guild_stats.enchantment_status
	else:
		print("Error: enchantmentStatus is null")

	# Update Economy Report UI
	if $HBoxContainer/VBoxContainer2/guildTavernIncome:
		$HBoxContainer/VBoxContainer2/guildTavernIncome.text = str(guild_stats.guild_tavern_income)
	else:
		print("Error: guildTavernIncome is null")

	if $HBoxContainer/VBoxContainer2/guildForgeIncome:
		$HBoxContainer/VBoxContainer2/guildForgeIncome.text = str(guild_stats.guild_forge_income)
	else:
		print("Error: guildForgeIncome is null")

	if $HBoxContainer/VBoxContainer2/cartographerTableIncome:
		$HBoxContainer/VBoxContainer2/cartographerTableIncome.text = str(guild_stats.cartographer_table_income)
	else:
		print("Error: cartographerTableIncome is null")

	if $HBoxContainer/VBoxContainer4/trainingGroundsIncome:
		$HBoxContainer/VBoxContainer4/trainingGroundsIncome.text = str(guild_stats.training_grounds_income)
	else:
		print("Error: trainingGroundsIncome is null")

	if $HBoxContainer/VBoxContainer4/apothecaryIncome:
		$HBoxContainer/VBoxContainer4/apothecaryIncome.text = str(guild_stats.apothecary_income)
	else:
		print("Error: apothecaryIncome is null")

	if $HBoxContainer/VBoxContainer4/enchantmentTableIncome:
		$HBoxContainer/VBoxContainer4.enchantmentTableIncome.text = str(guild_stats.enchantment_table_income)
	else:
		print("Error: enchantmentTableIncome is null")

# Function to initialize the button handler
func initialize():
	print("Initializing button handler")
	# Check and connect each button
	if $HSplitContainer/tavern/tavernUpgrade:
		$HSplitContainer/tavern/tavernUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("tavern"))
	else:
		print("Error: tavernUpgrade button is null")
	
	if $HSplitContainer/tavern/tavernHire:
		$HSplitContainer/tavern/tavernHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("tavern"))
	else:
		print("Error: tavernHire button is null")

	if $HSplitContainer/trainingGrounds/trainingGroundsUpgrade:
		$HSplitContainer/trainingGrounds/trainingGroundsUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("training_grounds"))
	else:
		print("Error: trainingGroundsUpgrade button is null")
	
	if $HSplitContainer/trainingGrounds/trainingGroundsHire:
		$HSplitContainer/trainingGrounds/trainingGroundsHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("training_grounds"))
	else:
		print("Error: trainingGroundsHire button is null")
	
	if $HSplitContainer2/forge/forgeUpgrade:
		$HSplitContainer2/forge/forgeUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("forge"))
	else:
		print("Error: forgeUpgrade button is null")
	
	if $HSplitContainer2/forge/forgeHire:
		$HSplitContainer2/forge/forgeHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("forge"))
	else:
		print("Error: forgeHire button is null")
	
	if $HSplitContainer2/apothecary/apothecaryUpgrade:
		$HSplitContainer2/apothecary/apothecaryUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("apothecary"))
	else:
		print("Error: apothecaryUpgrade button is null")
	
	if $HSplitContainer2/apothecary/apothecaryHire:
		$HSplitContainer2/apothecary.apothecaryHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("apothecary"))
	else:
		print("Error: apothecaryHire button is null")
	
	if $HSplitContainer3/cartography/cartographyUpgrade:
		$HSplitContainer3/cartography/cartographyUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("cartography"))
	else:
		print("Error: cartographyUpgrade button is null")
	
	if $HSplitContainer3/cartography/cartographyHire:
		$HSplitContainer3/cartography/cartographyHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("cartography"))
	else:
		print("Error: cartographyHire button is null")
	
	if $HSplitContainer3/enchantment/enchantmentUpgrade:
		$HSplitContainer3/enchantment.enchantmentUpgrade.connect("pressed", Callable(self, "_on_upgrade_button_pressed").bind("enchantment"))
	else:
		print("Error: enchantmentUpgrade button is null")
	
	if $HSplitContainer3/enchantment/enchantmentHire:
		$HSplitContainer3/enchantment.enchantmentHire.connect("pressed", Callable(self, "_on_hire_button_pressed").bind("enchantment"))
	else:
		print("Error: enchantmentHire button is null")

	# Update the UI initially
	update_ui()

func _ready():
	print("Button handler ready")
	# Use call_deferred to ensure the nodes are loaded before connecting
	call_deferred("initialize")
