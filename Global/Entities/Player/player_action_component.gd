class_name PlayerActionComponent
extends Node

# Return a boolean indicating if the character wants to attack

func get_special_attack_input() -> bool:
	return Input.is_action_just_pressed("special_attack")
	
func get_light_attack_input() -> bool:
	return Input.is_action_just_pressed("light_attack")
	
func get_heavy_attack_input() -> bool:
	return Input.is_action_just_pressed("heavy_attack")

func get_parry_input() -> bool:
	return Input.is_action_just_pressed("parry")




func get_input() -> String:
	if Input.is_action_just_pressed("special_attack"):
		return "special_attack"
	return ""
	
