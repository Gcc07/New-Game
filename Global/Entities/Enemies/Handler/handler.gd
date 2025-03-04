class_name Handler
extends Enemy

signal damaged(attack: Attack)

func on_damaged(attack: Attack) -> void:
	print("Going through: Enemy")
	damaged.emit(attack)
