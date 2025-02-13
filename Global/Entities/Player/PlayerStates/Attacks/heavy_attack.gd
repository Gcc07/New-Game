extends ActionState

@export
var none_state : ActionState

@onready var finished_attack : bool = false

var projectile : PackedScene = preload("res://Global/Projectiles/projectile.tscn")

func enter() -> void:
	finished_attack = false
	moveAnimations.active = false
	actionAnimations.active = true
	actionAnimations.play("PlayerAction/" + animation_name)
	print("in heavy")

func exit() -> void:
	actionAnimations.active = false

func process_physics(delta: float) -> ActionState:
	if finished_attack:
		return none_state
	else:
		return null

func spawn_corresponding_projectile():
		var spawned_projectile := projectile.instantiate() # Instantiates the projectile created by player light attack.
		
		spawned_projectile.stick_to_parent = true # Sets the projectile as static, staying on the player.
		spawned_projectile.parent_offset = Vector2(10,0)
		spawned_projectile.projectile_sprite_texture = "uid://ci5ekwenhgfwy"
		if spawned_projectile.stick_to_parent == true: # If the projectile is a slash or similarly behaving
			##parent.attack_point.global_position = Vector2(0,0)

			if sprite.flip_h == false: # IF FACING RIGHT
				# spawned_projectile.sprite.flip_h = true # Flip projectile.
				spawned_projectile.parent_offset = Vector2(-15,-8)
				spawned_projectile.scale.x = 1
			else: #                      IF FACING LEFT
				# spawned_projectile.sprite.flip_h = false # Don't flip projectile.
				spawned_projectile.parent_offset = Vector2(+15,-8)
				spawned_projectile.scale.x = -1

			spawned_projectile.global_position = parent.attack_point.position + spawned_projectile.parent_offset # Sets the position of the projectile
			parent.add_child(spawned_projectile)
			print("added into player")


func process(delta: float) -> ActionState:
	return null

func attack_finished():
	finished_attack = true
