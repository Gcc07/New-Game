class_name DeathState
extends ActionState

func enter() -> void:
	
	moveAnimations.active = false
	actionAnimations.active = true
	actionAnimations.play(str(parent.name)+"Action/" + animation_name)

func kill():
	parent.queue_free()
