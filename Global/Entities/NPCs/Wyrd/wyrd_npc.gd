class_name NPC
extends Entity

@export
var entity_sprite : Sprite2D # = $Sprite2D
@export
var move_animations: AnimationPlayer # = $MoveAnimationPlayer
@export
var action_animations: AnimationPlayer # = $ActionAnimationPlayer

@export
var movement_state_machine: Node # = $MoveStateMachine
@export
var action_state_machine: Node # = $ActionStateMachine
@export
var move_component : Node # = $EnemyMoveComponent
@export
var action_component : Node # = $EnemyActionComponent

@export_group("NPC AI Properties")
@export
var AI_notice_radius := 60.0
@export 
var AI_pursue_radius := 100.0


func _ready() -> void:
	if movement_state_machine:		movement_state_machine.init(self, entity_sprite, move_animations, action_animations, move_component)
	if action_state_machine:		action_state_machine.init(self, entity_sprite, move_animations, action_animations, action_component)



func _unhandled_input(event: InputEvent) -> void:
	if movement_state_machine:		movement_state_machine.process_input(event)
	if action_state_machine:		action_state_machine.process_input(event)


func _physics_process(delta: float) -> void:

	if movement_state_machine:		movement_state_machine.process_physics(delta)
	if action_state_machine:		action_state_machine.process_physics(delta)
	#const_wobble()


func _process(delta: float) -> void:

	# print("Movement: " + move_animations.current_animation, "       Action: " + action_animations.current_animation)
	# print("The attack is: " + attack_state_machine.current_state.name)

	if movement_state_machine:		movement_state_machine.process_frame(delta)
	if action_state_machine:		action_state_machine.process_frame(delta)
