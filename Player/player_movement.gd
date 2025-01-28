extends Node

@onready var player : CharacterBody2D = get_owner()
@export_group("Speed Values")
@export var JUMP_VELOCITY := 500
@export var SPEED := 100

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if  not player.is_on_floor():
		player.velocity += player.get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		player.velocity.x = direction * SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, SPEED)

	player.move_and_slide()
