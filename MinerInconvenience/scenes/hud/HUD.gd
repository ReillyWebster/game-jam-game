extends CanvasLayer

export var stamina_max = 50
var current_stamina = stamina_max

onready var staminaBar = $MC/HBC/StaminaBox/StaminaBar
onready var staminaCount = $MC/HBC/StaminaBox/StaminaCount

func _ready():
	staminaBar.max_value = stamina_max
	staminaBar.value = current_stamina
	staminaCount.text = str(current_stamina)

func set_stamina(value):
	stamina_max

func update_stamina(value):
	if current_stamina + value <= 0:
		#Game Over Mechanic here
		pass
	elif current_stamina + value > stamina_max:
		current_stamina = stamina_max
	else:
		current_stamina = current_stamina + value
	
	staminaBar.value = current_stamina
	staminaCount.text = str(current_stamina)
	
