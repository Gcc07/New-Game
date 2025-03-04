class_name Hitbox 
extends Area2D

# Hitbox component - this gets hit by the Projectile's hurtbox.

@export var player_or_npc := false

signal damaged(attack: Attack)

func damage(attack: Attack):
	print("attacked: Hitbox")
	damaged.emit(attack)
