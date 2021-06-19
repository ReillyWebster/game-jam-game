extends Node2D

onready var vein_sprite = get_node("Sprite")
onready var mining_audio = $MiningAudio

signal vein_hit(vein_type)

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

func _on_Hurtbox_area_entered(area: Area2D) -> void:
	emit_signal("vein_hit", veinType)
	$MiningAudio.play()
	yield($MiningAudio, "finished")
	self.queue_free()

func set_vein(vein_type):
	if vein_type == "gold":
		vein_sprite.set_texture(gold_vein_texture)
		veinType = VeinType.Gold
	else:
		vein_sprite.set_texture(pyrite_vein_texture)
		veinType = VeinType.Pyrite
