class_name EnemyNoneState
extends ActionState

# The State for when an Entity has no current actions.

@export
var light_attack_state : ActionState
@export
var heavy_attack_state : ActionState
@export
var special_attack_state : ActionState

func enter() -> void:
	actionAnimations.active = false
	moveAnimations.active = true

func process_physics(delta: float) -> ActionState:
	if not parent.alive:
		return death_state
	else: 
		return null
