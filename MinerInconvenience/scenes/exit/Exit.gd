extends Area2D

onready var pyriteLabel = $Label
signal player_exited_level

var pyrite_requirement = 0

func _on_Exit_body_entered(body):
	if (body.get_name() == "Player"):
		emit_signal("player_exited_level")

func set_pyrite_cost(value):
	pyrite_requirement = value
	pyriteLabel.text = str(value)
