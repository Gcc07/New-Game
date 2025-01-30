extends ActionState

@export
var light_attack_state : ActionState

func enter() -> void:
	actionAnimations.active = false
	moveAnimations.active = true
	print("in none")

func process_input(event: InputEvent) -> ActionState:
	if get_attack_input():
		return light_attack_state
	return null
