class_name ActionState
extends State

# These two are exported because child states will always need acess to them.
@export
var death_state : ActionState
@export
var stunned_state : ActionState
var action_component

func enter() -> void:
	actionAnimations.play(str(parent.entity_id)+"Action/" + animation_name)

# Pass the inputs from the action components into the sub-states

func get_parry_input() -> bool:
	return action_component.get_parry_input()

func get_light_attack_input() -> bool:
	return action_component.get_light_attack_input()
	
func get_heavy_attack_input() -> bool:
	return action_component.get_heavy_attack_input()

func get_special_attack_input() -> bool:
	return action_component.get_special_attack_input()

func spawn_fx():
	pass
	
