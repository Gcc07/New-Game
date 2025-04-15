extends Camera2D

# Controls Player Camera Logic.

@export var target : Player
@export var sensitivity := 0.1


#func _physics_process(delta: float) -> void:
	#var target_position = target.aim_position * sensitivity
	#position = position.lerp(target_position, 0.25)
