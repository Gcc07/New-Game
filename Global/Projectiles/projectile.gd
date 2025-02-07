class_name Projectile
extends CharacterBody2D

@export var hurtbox : Hurtbox
@export var timer : Timer
@export var sprite : Sprite2D

@export_group("Projectile Properties")
## Is the projectile static. ()
@export var stick_to_parent := false
## The speed of the Projectile (Does it stay by the entity that created it)
@export var speed := 150.0
## The amount of damage the Projectile deals.
@export var damage := 5.0
## The maximum amount of Entities the projectile can pierce
@export var max_pierce := 1
## Amount of time a projectile has before it dissapears.
@export var time_to_live := .1 

func _ready() -> void:
	if hurtbox:
		hurtbox.hit_target.connect(on_target_hit)

	timer.wait_time = time_to_live
	timer.start()

var current_pierce_count := 0

func _on_timer_timeout() -> void:
	queue_free()

func on_target_hit():
	pass
