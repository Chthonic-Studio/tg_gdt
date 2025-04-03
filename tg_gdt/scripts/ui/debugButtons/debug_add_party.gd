extends Button

func _on_pressed():
	GameManager.test_party_creation()
	print ("Debug Button - Create Party")
