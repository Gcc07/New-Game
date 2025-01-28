extends ActionState

@export
var none : State
@onready var finished_attack : bool = false

func enter() -> void:
	super()
	print("in light")

func process_physics(delta: float) -> State:
	return null

func process(delta: float) -> State:
	if finished_attack == true:
		return none
	else:
		return null

func attack_finished():
	finished_attack = true
