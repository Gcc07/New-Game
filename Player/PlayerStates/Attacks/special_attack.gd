extends ActionState

@export
var none_state : ActionState

@onready var finished_attack : bool = false

var projectile : PackedScene = preload("uid://be3mpsirj8rwt")

func enter() -> void:
	finished_attack = false
	moveAnimations.active = false
	actionAnimations.active = true
	actionAnimations.play("PlayerAction/" + animation_name)
	print("in special")

func exit() -> void:
	actionAnimations.active = false

func process_physics(delta: float) -> ActionState:
	if finished_attack:
		return none_state
	else:
		return null

func process(delta: float) -> ActionState:
	return null

#func spawn_projectile(is_static : bool, position: Vector2D, scale : int):
	#projectile.

func spawn_corresponding_projectile():
		var spawned_projectile := projectile.instantiate() # Instantiates the projectile created by player light attack.
		
		spawned_projectile.stick_to_parent = true # Sets the projectile as static, staying on the player.
		spawned_projectile.projectile_num_of_frames = 3
		spawned_projectile.projectile_sprite_texture = "uid://hcpwpr1ot2sa"
		spawned_projectile.time_to_live = .2
		spawned_projectile.projectile_has_animation = true
		spawned_projectile.projectile_animation_is_continous = false


		if spawned_projectile.stick_to_parent == true: # If the projectile is a slash or similarly behaving
			if sprite.flip_h == false: # IF FACING RIGHT
				spawned_projectile.parent_offset = Vector2(-21,-3)
				spawned_projectile.scale.x = 1
			else: #                      IF FACING LEFT
				spawned_projectile.parent_offset = Vector2(+21,-3)
				spawned_projectile.scale.x = -1

			spawned_projectile.global_position = parent.attack_point.position + spawned_projectile.parent_offset # Sets the position of the projectile
			parent.add_child(spawned_projectile)
			print("added into player")

		if spawned_projectile.stick_to_parent == false:
			get_tree().root.add_child(spawned_projectile) # If the projectile is moving. (like a bullet, or energy blast)
			print("added into world")

func attack_finished():
	
	finished_attack = true
