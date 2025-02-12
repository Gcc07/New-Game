class_name Projectile
extends CharacterBody2D

@export var hurtbox : Hurtbox
@export var timer : Timer
@export var sprite : Sprite2D
@export var collision_shape : CollisionShape2D
@export var hurtbox_shape : CollisionShape2D

@export_group("Projectile Properties")
## Is the projectile static.(Does it stay by the entity that created it)
@export var stick_to_parent := false
## The speed of the Projectile 
@export var speed := 150.0
## The amount of damage the Projectile deals.
@export var damage := 5.0
## The maximum amount of Entities the projectile can pierce
@export var max_pierce := 1
## Amount of time a projectile has before it dissapears.
@export var time_to_live := .1 
## Determines if the collision size will be the size of the sprite or not
@export var collision_size_equals_sprite := true 
## Determines if the hurtbox size will be the size of the sprite or not
@export var hurtbox_size_equals_sprite := false 
## Determines the sprite texture of the projectilea
@export var projectile_sprite_texture := "uid://cca0o8n8lhrcp"
## Determines the number of animation frames in the projectile
@export var projectile_num_of_frames := 1
## Determines if the projectile animation will loop.
@export var projectile_animation_is_continous := false
## Determines if the projectile has an animation
@export var projectile_has_animation := false


var parent_offset = Vector2(0,0)

func _ready() -> void:
	set_collision_size_equals_sprite(collision_size_equals_sprite)
	set_hurtbox_size_equals_sprite(hurtbox_size_equals_sprite)
	set_attack_sprite(projectile_sprite_texture)
	initialize_projectile_frames(projectile_num_of_frames)
	start_timer()

	if hurtbox:
		print()
		hurtbox.hit_target.connect(on_target_hit)

func _process(delta: float) -> void:
	control_projectile_animations(projectile_has_animation, projectile_animation_is_continous)

var current_pierce_count := 0



func initialize_projectile_frames(num_of_frames):
	sprite.vframes = num_of_frames

func set_collision_size_equals_sprite(on: bool) -> void:
	if on:
		collision_shape.shape.set_size( Vector2( load(projectile_sprite_texture).get_width() , load(projectile_sprite_texture).get_height() / projectile_num_of_frames ) )

func set_hurtbox_size_equals_sprite(on: bool) -> void:
	if on:
		hurtbox_shape.shape.set_size( Vector2( load(projectile_sprite_texture).get_width() , load(projectile_sprite_texture).get_height() / projectile_num_of_frames ) )

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
	var interval : float = time_to_live / projectile_num_of_frames
	var last_appended_interval : float = -snapped(interval, .1)
	for i in range(0 , projectile_num_of_frames):
		last_appended_interval += snapped(interval, .1)
		interval_array.append(last_appended_interval) 
	
	if active && continous:

		if snapped(timer.time_left, 0.0001) in interval_array:
			sprite.frame += 1
			if sprite.frame == projectile_num_of_frames:
				sprite.frame = 0

	elif active && ! continous:
		if snapped(timer.time_left, 0.0001) in interval_array && sprite.frame != projectile_num_of_frames:
			print("frame updated")
			sprite.frame += 1
	else:
		pass


func _on_timer_timeout() -> void:
	queue_free()

func start_timer() -> void:
	timer.wait_time = time_to_live
	timer.start()

func on_target_hit() -> void:
	pass
	
func coopers_function(deez_nuts):
	print
