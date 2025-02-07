extends MovementState

# 

#@export
#var dash_state: State
@export
var fall_state: MovementState
@export
var idle_state: MovementState
@export
var jump_state: MovementState

func process_input(event: InputEvent) -> MovementState:
	#if Input.is_action_just_pressed('dash'):
		#return dash_state
	
	return null

func process_physics(delta: float) -> MovementState:
	if get_jump() and parent.is_on_floor():
		return jump_state

	parent.velocity.y += gravity * delta

	var movement = get_movement_input() * move_speed
	
	if movement == 0:
		return idle_state
	
	sprite.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
