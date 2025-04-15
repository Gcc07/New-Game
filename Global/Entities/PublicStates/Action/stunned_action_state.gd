class_name StunnedState
extends ActionState

# The State for when an Entity is stunned from an attack.

@export
var none_state : ActionState

@onready var stun_timer = Timer.new() 

func enter() -> void:
	stun_timer.start()
	parent.can_move = false
	parent.can_be_damaged = false
	actionAnimations.active = true
	moveAnimations.active = false

func _ready(): 
	
	stun_timer.wait_time = .5 
	stun_timer.one_shot = true 
	add_child(stun_timer)
	stun_timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	
	print("Timer triggered via code!")
