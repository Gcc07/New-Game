class_name DeathState
extends ActionState

func enter() -> void:
	
	parent.can_move = false
	moveAnimations.active = false
	actionAnimations.active = true
	actionAnimations.play(str(parent.name)+"Action/" + animation_name)

func kill():
	parent.queue_free()
