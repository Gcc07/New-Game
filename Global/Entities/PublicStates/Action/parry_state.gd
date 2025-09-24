class_name ParryState
extends ActionState

# The State for when an Entity is parrying an attack

@export var none_state : ActionState
@export var parry_time : float = .2 # Default

@onready var parry_timer = Timer.new() 

func enter() -> void:
	super()
	parry_timer.start()
	parent.can_move = false
	parent.parrying = true
	actionAnimations.active = true
	moveAnimations.active = false

func _ready(): 
	parry_timer.wait_time = parry_time
	parry_timer.one_shot = true 
	add_child(parry_timer)
	parry_timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	moveAnimations.active = true
	parent.parrying = false

func process_physics(delta: float) -> ActionState:
	if not parent.parrying:
		return none_state
	else: 
		return null
