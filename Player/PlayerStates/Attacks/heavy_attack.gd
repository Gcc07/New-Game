extends ActionState

@export
var none_state : ActionState

@onready var finished_attack : bool = false

func enter() -> void:
	finished_attack = false
	moveAnimations.active = false
	actionAnimations.active = true
	actionAnimations.play("PlayerAction/" + animation_name)
	print("in heavy")

func exit() -> void:
	actionAnimations.active = false

func process_physics(delta: float) -> ActionState:
	if finished_attack:
		return none_state
	else:
		return null

func process(delta: float) -> ActionState:
	return null

func attack_finished():
	finished_attack = true
