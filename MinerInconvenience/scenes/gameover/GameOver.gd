extends Control

func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/LblTotalGold.text = "You died with " + Global.current_gold + " gold!"
	pass

func _on_Button_pressed():
	Global.current_gold = 0
	Global.current_pyrite = 0
	Global.current_stamina = Global.max_stamina
	get_tree().change_scene("res://scenes/startingZone/StartingZone.tscn")

func _on_BtnQuit_pressed():
	get_tree().quit()


func _on_BtnMainMenu_pressed() -> void:
	get_tree().change_scene("res://scenes/main_menu/StartMenu.tscn")
