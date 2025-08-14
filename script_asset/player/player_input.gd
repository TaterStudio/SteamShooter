extends Node
class_name PlayerInput

signal move_left
signal move_right
signal move_idle

var direction: float = 0.0

func _process(delta):
	direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		emit_signal("move_right")
	elif is_zero_approx(direction):
		emit_signal("move_idle")
	elif direction < 0:
		emit_signal("move_left")
