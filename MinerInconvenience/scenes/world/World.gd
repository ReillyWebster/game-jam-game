extends Node2D

const Player = preload("res://scenes/player/Player.tscn")
const ExitPoint = preload("res://scenes/exit/Exit.tscn")
const OreVein = preload("res://scenes/oreVein/OreVein.tscn")
const HUD = preload("res://scenes/hud/HUD.tscn")

var borders = Rect2(1, 1, 38, 21)
var number_of_random_veins = 10
var exit_cost = 1
var player
var exit
var map

export var max_stamina = 50
var current_stamina = max_stamina

onready var tileMap = $TileMap
onready var ySort = $YSort
onready var hUD = $HUD

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generate_level()

func destroy_level():
	for child in ySort.get_children():
		child.queue_free()
	for location in tileMap.get_used_cells():
		tileMap.set_cellv(location, 0)
	for location in map:
		tileMap.set_cellv(location, 0)
	tileMap.update_bitmask_region(borders.position, borders.end)

func generate_level():
	var walker = Walker.new(Vector2(19, 10), borders)
	map = walker.walk(300)
	
	player = Player.instance()
	ySort.add_child(player)
	player.position = map.front() * 32
	
	exit = ExitPoint.instance()
	ySort.add_child(exit)
	exit.position = map.back() * 32
	exit.set_pyrite_cost(exit_cost)
	exit.connect("player_exited_level", self, "_on_Player_exit")
	
	walker.queue_free()
	
	for location in map:
		tileMap.set_cellv(location, -1)
	tileMap.update_bitmask_region(borders.position, borders.end)
	
	for map_position in map:
		map_position.y -= 1
		var second_step = map_position
		second_step.y -= 1 
		if tileMap.get_cellv(map_position) != tileMap.INVALID_CELL and tileMap.get_cellv(second_step) != tileMap.INVALID_CELL:
			tileMap.set_cellv(map_position, 1)
			pass
	
	var new_veins = map.duplicate()
	new_veins.pop_front()
	new_veins.pop_back()
	
	for deploy_vein in number_of_random_veins:
		var map_position = randi() % new_veins.size()
		var vein_position = new_veins[map_position] * 32
		while vein_position == player.position or vein_position == exit.position:
			map_position = randi() % new_veins.size()
			vein_position = new_veins[map_position] * 32
		var new_vein = OreVein.instance()
		ySort.add_child(new_vein)
		new_vein.position = vein_position

func _on_Player_exit():
	destroy_level()
	generate_level()

#TEST CONTROLS
func _input(event):
	if event.is_action_pressed("ui_home"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("ui_focus_next"):
		hUD.update_stamina(-1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
