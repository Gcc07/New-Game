class_name StunnedState
extends ActionState

# The State for when an Entity is stunned from an attack.

@export var none_state : ActionState
@export var stun_time : float = .2

@onready var stun_timer = Timer.new() 

func enter() -> void:
	super()
	stun_timer.start()
	parent.can_move = false
	parent.can_be_damaged = false
	actionAnimations.active = true
	moveAnimations.active = false
	parent.entity_sprite.material.shader.set_shader_parameter("shader_parameter/shade_color", Color("ffffff"))

func _ready(): 
	stun_timer.wait_time = stun_time
	stun_timer.one_shot = true 
	add_child(stun_timer)
	stun_timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	print("STUN TIMER FINSIED")
	parent.stunned = false

func process_physics(delta: float) -> ActionState:
	if not parent.stunned:
		parent.entity_sprite.material.set_shader_parameter("shader_parameter/shade_color", Color("ffffff00"))
		parent.can_be_damaged = true
		return none_state
	else: 
		return null
