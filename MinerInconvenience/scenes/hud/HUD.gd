extends CanvasLayer

onready var staminaBar = $MC/HBC/StaminaBox/StaminaBar
onready var staminaCount = $MC/HBC/StaminaBox/StaminaCount

func _ready():
	update_gold()
	update_pyrite()
	update_stamina()
	update_stage_counter()
	

func update_stamina():
	staminaBar.value = Global.current_stamina
	staminaBar.max_value = Global.max_stamina
	staminaCount.text = str(Global.current_stamina)

func update_gold():
	$MC/HBC/VBoxContainer/HBoxContainer/GoldLabel.text = str(Global.current_gold)

func update_pyrite():
	$MC/HBC/VBoxContainer/HBoxContainer2/PyriteLabel.text = str(Global.current_pyrite)

func update_stage_counter():
	$LblStageCounter.text = str(Global.current_stage)
