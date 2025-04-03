extends ScrollContainer

var PartiesListItemScene = preload("res://parties_list_item.tscn")

@onready var parties_list_vbox = $partiesListVbox

# Function to clear the VBoxContainer
func clear_vbox_container():
	for child in parties_list_vbox.get_children():
		parties_list_vbox.remove_child(child)
		child.queue_free()
