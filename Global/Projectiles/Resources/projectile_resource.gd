class_name ProjectileResource
extends Resource

@export_group("Projectile Properties")
@export var ID := ""
## Is the projectile static.(Does it stay by the entity that created it)
@export var stick_to_parent := false
## Is the projectile player friendly.
@export var is_friendly := true
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
@export var sprite_texture := "uid://cca0o8n8lhrcp"
## Determines the number of animation frames in the projectile
@export var num_of_frames := 1
## Determines if the projectile animation will loop.
@export var animation_is_continous := false
## Determines if the projectile has an animation
@export var has_animation := false
## Determines the offset of the projectile in relation to the parent that is spawning it
@export var parent_offset = Vector2(0,0)
