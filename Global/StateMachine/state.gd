class_name State
extends Node


@export var animation_name: String
@export var move_speed: float = 150
@export var priority: int = 0
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


var sprite: Sprite2D
var animations: AnimationPlayer
# var move_component - IN MOVEMENT STATE
# var attack_component - IN ACTION STATE
var parent: CharacterBody2D ## So things that aren't just the player can use the state machine.


func enter() -> void:
	animations.play(animation_name)
	
func exit() -> void:
	pass

func process(_delta: float) -> State:
	return null

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
