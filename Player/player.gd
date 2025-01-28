class_name Player
extends CharacterBody2D

var aim_position : Vector2 = Vector2(1, 0)

@onready
var player_sprite : Sprite2D = $Sprite2D
@onready
var movement_animations: AnimationPlayer = $MoveAnimationPlayer
@onready
var attack_animations: AnimationPlayer = $AttackAnimationPlayer

@onready
var movement_state_machine: Node = $MoveStateMachine
@onready
var attack_state_machine: Node = $AttackStateMachine
@onready
var player_move_component = $PlayerMoveComponent
@onready
var player_attack_component = $PlayerAttackComponent

func _ready() -> void:
	movement_state_machine.init(self, player_sprite, movement_animations, player_move_component)
	attack_state_machine.init(self, player_sprite, attack_animations, player_attack_component)

func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseMotion:
		var half_viewport = get_viewport_rect().size / 2
		aim_position = (event.position - half_viewport)

	movement_state_machine.process_input(event)
	attack_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_state_machine.process_physics(delta)
	attack_state_machine.process_physics(delta)
	const_wobble()

func _process(delta: float) -> void:
	#print("The attack is: " + attack_state_machine.current_state.name)
	movement_state_machine.process_frame(delta)
	attack_state_machine.process_frame(delta)

## ----------------------------------- ##

func const_wobble():
	if self.velocity.x <= 80 and self.velocity.x >= -80:
		player_sprite.rotation = 0
	elif self.velocity.x >=  100 and player_sprite.rotation < .06:
		player_sprite.rotation += .01 
	elif self.velocity.x <= -100 and player_sprite.rotation > -.06:
		player_sprite.rotation -= .01
