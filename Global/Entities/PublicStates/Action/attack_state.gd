class_name AttackState
extends ActionState

@export var attack_projectile_resource : ProjectileResource
@onready var finished_attack : bool = false

var projectile : PackedScene = preload("uid://be3mpsirj8rwt")

func spawn_corresponding_projectile():
	## The instantiated projectile being spawned in the function.
	var spawned_projectile := projectile.instantiate() # Instantiates the projectile created by player light attack.
	spawned_projectile.projectile_resource = attack_projectile_resource
	if spawned_projectile.projectile_resource.stick_to_parent == true: # If the projectile is a slash or similarly behaving
		if sprite.flip_h == false: # IF THE ENTITY IS FACING RIGHT
				# spawned_projectile.sprite.flip_h = true # Flip projectile.
				spawned_projectile.scale.x = 1
		else: #                      IF THE ENTITY IS FACING LEFT
				# spawned_projectile.sprite.flip_h = false # Don't flip projectile.
				spawned_projectile.scale.x = -1
		spawned_projectile.global_position = parent.attack_point.position + Vector2(spawned_projectile.projectile_resource.parent_offset.x * spawned_projectile.scale.x, spawned_projectile.projectile_resource.parent_offset.y)# Sets the position of the projectile
		parent.add_child(spawned_projectile)

	elif spawned_projectile.projectile_resource.stick_to_parent == false:
		get_tree().root.add_child(spawned_projectile) # If the projectile is moving. (like a bullet, or energy blast)
