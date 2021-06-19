extends Node2D

onready var hUD = $HUD

var player_can_exit = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$YSort/OreVein2.set_vein("gold")
	$YSort/OreVein.set_vein("pyrite")

func update_gold(value):
	Global.current_gold += value
	hUD.update_gold()

func update_pyrite(value):
	Global.current_pyrite += value
	hUD.update_pyrite()

func update_stamina(value):
	Global.current_stamina += value
	hUD.update_stamina()
	if Global.current_stamina <= 0:
		get_tree().change_scene("res://scenes/gameover/GameOver.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_in_exit():
	player_can_exit = true

func _on_Player_left_exit():
	player_can_exit = false

func _on_OreVein_vein_hit(vein_type):
	if vein_type:
		update_pyrite(1)
	else:
		update_gold(1)
	update_stamina(-1)

#TEST CONTROLS
func _input(event):
	if event.is_action_pressed("ui_home"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("ui_focus_next"):
		hUD.update_stamina(-1)
	if event.is_action_pressed("ui_accept") and player_can_exit and Global.current_pyrite >= Global.exit_cost:
		Global.current_pyrite -= 1
		Global.current_stage += 1
		Global.exit_cost = ceil((Global.current_stage + 11)/2)
		get_tree().change_scene("res://scenes/world/World.tscn")
