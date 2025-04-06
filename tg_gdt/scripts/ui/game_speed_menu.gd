extends MarginContainer

@onready var pause = $speedContainer/pauseButton
@onready var normalSpeed = $"speedContainer/1xButton"
@onready var doubleSpeed = $"speedContainer/2xButton"
@onready var date = $date
@onready var speedLabel = $date/speedLabel

# Connect the buttons to their respective functions
func _ready():
	pause.connect("pressed", Callable (self, "_on_pause_pressed"))
	normalSpeed.connect("pressed", Callable (self, "_on_normalSpeed_pressed"))
	doubleSpeed.connect("pressed", Callable (self, "_on_doubleSpeed_pressed"))
	TimeManager.connect("date_updated", Callable (self, "_on_date_updated"))
	TimeManager.connect("game_speed_changed", Callable (self, "_on_game_speed_changed"))

# Function to handle pause button press
func _on_pause_pressed():
	speedLabel.text = "Time Paused"
	TimeManager.pause_game()

# Function to handle normal speed button press
func _on_normalSpeed_pressed():
	speedLabel.text = "Speed x1"
	TimeManager.normal_speed()

# Function to handle double speed button press
func _on_doubleSpeed_pressed():
	speedLabel.text = "Speed x2"
	TimeManager.double_speed()

# Function to update the date label
func _on_date_updated(new_date: Dictionary):
	date.text = str(new_date["day"]) + "th of the " + str(new_date["moon"]) + "th Moon, " + str(new_date["year"])

# Function to handle game speed changes (optional, if you want to provide feedback)
func _on_game_speed_changed(new_speed: float):
	print("Game speed changed to: " + str(new_speed))
