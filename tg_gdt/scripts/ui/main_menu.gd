extends Control

@onready var playButton = $MarginContainer/NinePatchRect/MarginContainer/NinePatchRect/NinePatchRect/MarginContainer/VBoxContainer/playButton
@onready var instructionsButton = $MarginContainer/NinePatchRect/MarginContainer/NinePatchRect/NinePatchRect/MarginContainer/VBoxContainer/instructionsButton
@onready var quitButton = $MarginContainer/NinePatchRect/MarginContainer/NinePatchRect/NinePatchRect/MarginContainer/VBoxContainer/quitButton
@onready var instructions = $MarginContainer/NinePatchRect/MarginContainer/NinePatchRect/instructions


func play():
	get_tree().change_scene_to_file("res://user_ui.tscn")

func instructions_toggle():
	instructions.visible = not instructions.visible

func quit():
	get_tree().quit()

func _on_play_button_pressed() -> void:
	play()
	
