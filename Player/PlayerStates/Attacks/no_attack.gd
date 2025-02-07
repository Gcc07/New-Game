extends ActionState

# The State for when an Entity has no current actions.

@export
var light_attack_state : ActionState
@export
var heavy_attack_state : ActionState

func enter() -> void:
	actionAnimations.active = false
	moveAnimations.active = true
	print("in none")

func process_input(event: InputEvent) -> ActionState:
	if get_light_attack_input():
		return light_attack_state
	if get_heavy_attack_input():
		if parent.is_on_floor() && parent.velocity.x == 0: ## If the player is grounded and not moving.
			return heavy_attack_state
	return null
