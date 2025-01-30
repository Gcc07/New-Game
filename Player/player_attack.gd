extends Node

# Return a boolean indicating if the character wants to attack
func get_attack_input() -> bool:
	return Input.is_action_just_pressed("attack")
	
