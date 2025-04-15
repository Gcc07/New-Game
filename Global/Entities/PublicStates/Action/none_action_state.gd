class_name NoneState
extends ActionState

# The State for when an Entity has no current actions.
@export_group("Attack States")
@export
var light_attack_state : ActionState
@export
var heavy_attack_state : ActionState
@export
var special_attack_state : ActionState

func enter() -> void:
	parent.can_move = true
	actionAnimations.active = false
	moveAnimations.active = true


func process_physics(delta: float) -> ActionState:
	if not parent.alive:
		return death_state
	if get_special_attack_input():
		return special_attack_state
	if get_light_attack_input():
		return light_attack_state
	if get_heavy_attack_input():
		if parent.is_on_floor():
			return heavy_attack_state
	else: 
		return null
	return null
