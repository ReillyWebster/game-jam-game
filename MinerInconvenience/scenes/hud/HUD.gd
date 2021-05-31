extends CanvasLayer

export var stamina_max = 20
var current_stamina = stamina_max

onready var staminaBar = $MC/HBC/StaminaBox/StaminaBar
onready var staminaCount = $MC/HBC/StaminaBox/StaminaCount

var gold_count = 0
var pyrite_count = 0

func _ready():
	staminaBar.max_value = stamina_max
	staminaBar.value = current_stamina
	staminaCount.text = str(current_stamina)

func set_stamina(value):
	stamina_max = value

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

func update_gold(value):
	gold_count += value
	print("Gold count: " + str(gold_count))

func update_pyrite(value):
	pyrite_count += value
	print("Pyrite count: " + str(pyrite_count))
