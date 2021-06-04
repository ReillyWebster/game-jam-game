extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/LblTotalGold.text = "You died with " + str(Global.current_gold) + " gold!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	Global.current_gold = 0
	Global.current_pyrite = 0
	Global.current_stamina = Global.max_stamina
	get_tree().change_scene("res://scenes/startingZone/StartingZone.tscn")


func _on_BtnQuit_pressed():
	get_tree().quit()
