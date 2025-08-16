class_name CharacterHorizontalMove
extends Node
@export var control: CharacterControl = null;
@export_range(50, 500) var speed: float = 100;
@export_range(0.2,3) var speedFactor: float = 1;

func init(body: CharacterControl) -> void:
	control = body;
	return
func move_left():
	control.velocity.x = -speed * speedFactor

func move_right():
	control.velocity.x = speed * speedFactor

func move_idle():
	control.velocity.x = 0
