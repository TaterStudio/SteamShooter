extends Node
class_name PlayerInput


@export var control: CharacterControl
var direction: float = 0.0

func _ready() -> void:
	if !control:
		print("你弄了玩家输入组件但是没有给它挂玩家")
		return;

func _process(_delta):
	direction = Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		control.emit_signal("move_right")
	elif is_zero_approx(direction):
		control.emit_signal("move_idle")
	elif direction < 0:
		control.emit_signal("move_left")
		pass;
	if Input.is_action_just_pressed("dash"):
		control.emit_signal("action_dash")
		pass;
	if Input.is_action_just_pressed("attack"):
		control.emit_signal("action_attack")
		pass;
	if Input.is_action_just_pressed("jump"):
		control.emit_signal("action_jump")
		pass
