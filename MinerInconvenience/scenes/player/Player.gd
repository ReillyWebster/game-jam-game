extends KinematicBody2D

signal swing_pickaxe

const ACCELERATION = 500
const MAX_SPEED = 120
const FRICTION = 500

enum player_state{
	MOVE,
	SWINGPICKAXE
}

var state = player_state.MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
	
func _ready() -> void:
	animationTree.active = true

func _process(delta: float) -> void:
	if Input.get_action_strength("swing_pickaxe"):
		emit_signal("swing_pickaxe")
	
func _physics_process(delta):
	match state:
		player_state.MOVE: 
			move_state(delta)
		player_state.SWINGPICKAXE:
			swing_pickaxe_state(delta)
	
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if(input_vector != Vector2.ZERO):
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/SwingPickaxe/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animationState.travel("Idle")
		
	velocity = move_and_slide(velocity)
	
	if(Input.is_action_just_pressed("swing_pickaxe")):
		state = player_state.SWINGPICKAXE

func swing_pickaxe_state(delta):
	animationState.travel("SwingPickaxe")

func swing_animation_finished():
	state = player_state.MOVE
