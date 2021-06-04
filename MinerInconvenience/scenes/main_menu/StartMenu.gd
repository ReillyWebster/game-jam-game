extends Control

func _on_Button_pressed():
	Global.current_gold = 0
	Global.current_pyrite = 0
	Global.current_stamina = Global.max_stamina
	get_tree().change_scene("res://scenes/startingZone/StartingZone.tscn")


func _on_BtnQuit_pressed():
	get_tree().quit()
