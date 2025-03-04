class_name ActionState
extends State

@export
var death_state : ActionState

var action_component

func enter() -> void:
	actionAnimations.play(str(parent.name)+"Action/" + animation_name)

func get_light_attack_input() -> bool:
	return action_component.get_light_attack_input()
	
func get_heavy_attack_input() -> bool:
	return action_component.get_heavy_attack_input()

func get_special_attack_input() -> bool:
	return action_component.get_special_attack_input()
