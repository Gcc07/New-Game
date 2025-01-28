extends ActionState

@export
var light_attack_state : State

func enter() -> void:
	super()
	print("in none")

func process_input(event: InputEvent) -> State:
	if get_attack_input():
		return light_attack_state
	return null
