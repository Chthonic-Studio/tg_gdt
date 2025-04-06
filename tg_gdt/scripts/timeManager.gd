extends Node

# Time control variables
var game_speed: float = 1.0
var current_date: Dictionary = {"day": 13, "moon": 8, "year": 735}
var day_duration: float = 12.0 # 12 real life seconds
var timer: Timer = null

# Signals for updating the date label and game speed changes
signal date_updated(new_date: Dictionary)
signal game_speed_changed(new_speed: float)
signal year_passed

func _ready():
	start_timer()

# Function to start the game timer
func start_timer():
	if timer:
		timer.queue_free()
	timer = Timer.new()
	timer.set_wait_time(day_duration / game_speed)
	timer.connect("timeout", Callable (self, "_on_day_passed"))
	add_child(timer)
	timer.start()

# Function to handle day passing
func _on_day_passed():
	advance_day()
	start_timer()

# Function to advance the game day
func advance_day():
	current_date["day"] += 1
	if current_date["day"] > 30:
		current_date["day"] = 1
		current_date["moon"] += 1
		if current_date["moon"] > 12:
			current_date["moon"] = 1
			current_date["year"] += 1
			emit_signal("year_passed", current_date["year"])
	emit_signal("date_updated", current_date)

# Functions to control game speed
func pause_game():
	if timer:
		timer.stop()
	game_speed = 0.0
	emit_signal("game_speed_changed", game_speed)

func normal_speed():
	game_speed = 1.0
	start_timer()
	emit_signal("game_speed_changed", game_speed)

func double_speed():
	game_speed = 2.0
	start_timer()
	emit_signal("game_speed_changed", game_speed)
