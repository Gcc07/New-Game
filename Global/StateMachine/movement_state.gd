class_name MovementState
extends State

var move_component

func enter() -> void:
	moveAnimations.play("PlayerMove/" + animation_name)

func get_movement_input() -> float:
	return move_component.get_movement_direction()

func get_jump() -> bool:
	return move_component.wants_jump()
