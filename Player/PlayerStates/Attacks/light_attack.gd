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
	print("in light")

func exit() -> void:
	actionAnimations.active = false

func process_physics(delta: float) -> ActionState:
	if finished_attack:
		return none_state
	else:
		return null

func process(delta: float) -> ActionState:
	return null

func spawn_corresponding_projectile():
		var spawned_projectile := projectile.instantiate() # Instantiates the projectile created by player light attack.
		spawned_projectile.stick_to_parent = true # Sets the projectile as static, staying on the player.

		if spawned_projectile.stick_to_parent == true: # If the projectile is a slash or similarly behaving
			parent.attack_point.global_position = Vector2(0,-16)

			if sprite.flip_h == true: # FACING RIGHT
				#spawned_projectile.sprite.flip_h = true # Flip projectile.
				spawned_projectile.scale.x = 1
			else: # FACING LEFT
				#spawned_projectile.sprite.flip_h = false # Don't flip projectile.
				spawned_projectile.scale.x = -1
				# parent.attack_point.global_position = Vector2(-33,-16) # Change Spawn point of projectile

			spawned_projectile.global_position = parent.attack_point.global_position # Sets the position of the projectile
			parent.add_child(spawned_projectile)
			print("added into player")

		if spawned_projectile.stick_to_parent == false:
			get_tree().root.add_child(spawned_projectile) # If the projectile is moving. (like a bullet, or energy blast)
			print("added into world")

func attack_finished():
	
	finished_attack = true
