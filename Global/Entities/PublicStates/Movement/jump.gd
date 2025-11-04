class_name JumpState
extends MovementState

@export
var fall_state: MovementState
@export
var idle_state: MovementState
@export
var move_state: MovementState

@export
var jump_force: float = 300

func enter() -> void:
	super()
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> MovementState:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = get_movement_input() * move_speed
	
	if movement != 0:
		sprite.flip_h = movement > 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	# After landing, if still moving return move state. If not moving, return idle.
	if parent.is_on_floor():
		if movement != 0:
			AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.STEP4)
			return move_state
		return idle_state
	
	return null
