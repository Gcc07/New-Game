class_name Hitbox 
extends Area2D

# Hitbox component - this gets hit by the Projectile's hurtbox.
@export var collision_shape := CollisionShape2D


signal damaged(attack: Attack)


func damage(attack: Attack):
	damaged.emit(attack)
