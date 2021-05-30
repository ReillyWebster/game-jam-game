extends Area2D

onready var vein_sprite = get_node("Sprite")

var gold_vein_texture = preload("res://images/GoldVein.png")
var pyrite_vein_texture = preload("res://images/PyriteVein.png")

var veinType

enum VeinType {Gold, Pyrite}

func _ready() -> void:
	set_sprite()
	
func set_sprite():
	match get_random_sprite():
		1: 
			vein_sprite.set_texture(gold_vein_texture)
			veinType = VeinType.Gold
			
		2: 
			vein_sprite.set_texture(pyrite_vein_texture)
			veinType = VeinType.Pyrite

func get_random_sprite():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(1, 2)

func _on_OreVein_area_entered(area: Area2D) -> void:
	print("Hit ore")
