extends KinematicBody2D

signal swing_pickaxe

func _process(delta: float) -> void:
	if Input.get_action_strength("swing_pickaxe"):
		emit_signal("swing_pickaxe")

func _physics_process(delta: float) -> void:
	var direction = get_player_direction()
	move_and_slide(direction * 100)
	
func get_player_direction():
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var y_input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	return Vector2(x_input, y_input)
