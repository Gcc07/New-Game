class_name Projectile
extends CharacterBody2D


@export_group("Reference Properties")

@export var hurtbox : Hurtbox
@export var timer : Timer
@export var sprite : Sprite2D
@export var collision_shape : CollisionShape2D
@export var hurtbox_shape : CollisionShape2D

## The resource containing all information about a projectile's data.
@export var projectile_resource : ProjectileResource

func _ready() -> void:
	set_collision_size_equals_sprite(projectile_resource.collision_size_equals_sprite)
	set_hurtbox_size_equals_sprite(projectile_resource.hurtbox_size_equals_sprite)
	set_attack_sprite(projectile_resource.sprite_texture)
	initialize_projectile_frames(projectile_resource.num_of_frames)
	initialize_is_friendly(projectile_resource.is_friendly)
	start_timer()

	if hurtbox:
		hurtbox.hit_target.connect(on_target_hit)

func _process(delta: float) -> void:
	control_projectile_animations(projectile_resource.has_animation, projectile_resource.animation_is_continous)

var current_pierce_count := 0

func initialize_is_friendly(friendly):
	if friendly:
		hurtbox.collision_mask = 2
	else:
		hurtbox.collision_max = 1

func initialize_projectile_frames(num_of_frames):
	sprite.vframes = num_of_frames

func set_collision_size_equals_sprite(on: bool) -> void:
	if on:
		collision_shape.shape.set_size( Vector2( load(projectile_resource.sprite_texture).get_width() , load(projectile_resource.sprite_texture).get_height() / projectile_resource.num_of_frames ) )

func set_hurtbox_size_equals_sprite(on: bool) -> void:
	if on:
		hurtbox_shape.shape.set_size( Vector2( load(projectile_resource.sprite_texture).get_width() , load(projectile_resource.sprite_texture).get_height() / projectile_resource.num_of_frames ) )

func set_attack_sprite(texture: String) -> void:
	sprite.texture = load(texture)

# This should probably get reworked. Its my current system for both initializing
# as well as controlling projectile animations without using an animation tree.
# it both uses the number of assigned frames that the projectile gives it, as
# well as the projectile time_to_live variable to create intervals where the sprite
# frame will index itself + 1. This system does not support complex animation,
# And it is also (probably) vulnerable to timing issues with different computers.

func control_projectile_animations(active: bool, continous: bool):

# The code below sets the intervals at which the projectile will change frames. (If applicable.)
	var interval_array : Array = []
	var interval : float = projectile_resource.time_to_live / projectile_resource.num_of_frames
	var last_appended_interval : float = -snapped(interval, .1)
	for i in range(0 , projectile_resource.num_of_frames):
		last_appended_interval += snapped(interval, .1)
		interval_array.append(last_appended_interval) 
	
	if active && continous:

		if snapped(timer.time_left, 0.0001) in interval_array:
			sprite.frame += 1
			if sprite.frame == projectile_resource.num_of_frames:
				sprite.frame = 0

	elif active && ! continous:
		if snapped(timer.time_left, 0.0001) in interval_array && sprite.frame != projectile_resource.num_of_frames:
			sprite.frame += 1
	else:
		pass


func _on_timer_timeout() -> void:
	queue_free()

func start_timer() -> void:
	timer.wait_time = projectile_resource.time_to_live
	timer.start()

func on_target_hit() -> void:
	pass
	
