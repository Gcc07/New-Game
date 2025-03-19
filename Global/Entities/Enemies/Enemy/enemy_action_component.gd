class_name EnemyActionComponent
extends Node

@export var attack_box : Area2D

func _ready():

	attack_box.connect("body_entered", Callable(self, "_on_attack_box_body_entered"))
	attack_box.connect("body_exited", Callable(self, "_on_attack_box_body_entered"))
	
