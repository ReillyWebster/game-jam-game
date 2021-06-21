extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_BtnContinue_pressed():
	get_tree().paused = false
	self.queue_free()


func _on_BtnRestart_pressed():
	get_tree().paused = false
	Global.restart()

func _on_BtnQuit_pressed():
	get_tree().quit()
