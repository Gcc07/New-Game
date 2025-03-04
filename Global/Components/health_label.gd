extends Label

func _ready():
	on_health_changed(20)

func on_health_changed(new_health: float):
	#text = "Health: " + str(new_health)
	$TextureProgressBar.value = new_health
