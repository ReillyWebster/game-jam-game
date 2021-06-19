extends Control

func _ready():
	if $MarginContainer/VBoxContainer/HBoxContainer/LblTotalGold:
		$MarginContainer/VBoxContainer/HBoxContainer/LblTotalGold.text = "You died with " + str(Global.current_gold) + " gold!"

func _on_Button_pressed():
	Global.restart()

func _on_BtnQuit_pressed():
	get_tree().quit()


func _on_BtnMainMenu_pressed() -> void:
	get_tree().change_scene("res://scenes/main_menu/StartMenu.tscn")
