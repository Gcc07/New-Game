extends Camera2D

# Controls Player Camera Logic.



@export var target : Player
@export var sensitivity := 0.1

var actual_cam_pos : Vector2

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	position = position.lerp(target.position, delta * 3)
	
	#actual_cam_pos = actual_cam_pos.lerp(target.global_position, delta*3)
	#var cam_subpixel_offset = actual_cam_pos.round() - actual_cam_pos
	#get_parent().get_parent().get_parent().material.set_shader_parameter("cam_offset", cam_subpixel_offset)
	#global_position = actual_cam_pos.round()

#func _physics_process(delta: float) -> void:
	#var target_position = target.aim_position * sensitivity
	#position = position.lerp(target_position, 0.25)
