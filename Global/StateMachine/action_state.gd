class_name ActionState
extends State

var action_component

func enter() -> void:
	actionAnimations.play("PlayerAction/" + animation_name)
	#if animation_name != "idle":
		#animations.play(animation_name)

func get_attack_input() -> bool:
	return action_component.get_attack_input()
