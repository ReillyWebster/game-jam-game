extends Area2D

onready var pyriteLabel = $Label
signal player_in_exit_zone
signal player_left_exit_zone

var pyrite_requirement = 0

func _ready():
	$Label.text = str(Global.exit_cost)

func _on_Exit_body_entered(body):
	if (body.get_name() == "Player"):
		emit_signal("player_in_exit_zone")
		$Label.visible = true

func set_pyrite_cost(value):
	pyrite_requirement = value
	pyriteLabel.text = str(value)


func _on_Exit_body_exited(body):
	if (body.get_name() == "Player"):
		emit_signal("player_left_exit_zone")
		$Label.visible = false
