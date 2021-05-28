extends Area2D

onready var anim = $AnimationPlayer

func _ready():
	get_parent().connect("swing_pickaxe", self, "mine")
	
func mine():
	anim.play("swing")
