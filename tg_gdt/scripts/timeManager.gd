extends Node

# Time control variables
var game_speed: float = 1.0
var current_date: Dictionary = {"day": 13, "moon": 8, "year": 735}
var day_duration: float = 3.0 # 12 real life seconds
var timer: Timer = null

# Constants for date conversion
const DAYS_PER_MONTH = 30
const MONTHS_PER_YEAR = 12  # this means a year has 360 days

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
	timer.wait_time = day_duration / game_speed
	timer.connect("timeout", Callable(self, "_on_day_passed"))
	add_child(timer)
	timer.start()

# Function to handle day passing
func _on_day_passed():
	advance_day()
	start_timer()

# Function to advance the game day
func advance_day():
	current_date["day"] += 1
	if current_date["day"] > DAYS_PER_MONTH:
		current_date["day"] = 1
		current_date["moon"] += 1
		if current_date["moon"] > MONTHS_PER_YEAR:
			current_date["moon"] = 1
			current_date["year"] += 1
			emit_signal("year_passed", current_date["year"])
	emit_signal("date_updated", current_date)
	
	for character in GameManager.characters:
		CharBehavior.simulate_daily_action(character, current_date["day"])
	
	var global_day = convert_date_to_global_day(current_date)
	MissionController.simulate_daily_missions(global_day)
	
	# Call the autonomous daily update function in GameManager.
	GameManager.autonomous_daily_update(global_day)

# Helper function to convert a date dictionary into a continuous global day count.
func convert_date_to_global_day(date: Dictionary) -> int:
	return (date["year"] * MONTHS_PER_YEAR * DAYS_PER_MONTH) + ((date["moon"] - 1) * DAYS_PER_MONTH) + date["day"]

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
