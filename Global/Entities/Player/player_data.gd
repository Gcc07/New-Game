extends TextureRect

func _ready():
	on_health_changed(20)

func on_health_changed(new_health: float) -> void:
	$Health.value = new_health
