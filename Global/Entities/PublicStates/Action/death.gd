class_name DeathState
extends ActionState

func enter() -> void:
	parent.velocity = Vector2(0,0)
	moveAnimations.active = false
	actionAnimations.active = true
	actionAnimations.play(str(parent.name)+"Action/" + animation_name)

func kill():
	parent.queue_free()
