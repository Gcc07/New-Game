extends Control
@export var entity: Entity

var spawned_entity = entity.instantiate()
@onready var button = $TextureButton

func _on_texture_button_pressed() -> void:
	pass
