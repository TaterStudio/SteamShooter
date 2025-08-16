class_name CharacterGravity
extends Node

@export var control: CharacterControl = null;
@export var fallAcclerate = -250.0;
@export var currentYSpeed = 0;

func init(body: CharacterControl) -> void:
	control = body;
	return

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if !control:
		return
	if control.airborneState != CharacterControl.AirborneState.Falling:
		currentYSpeed = 0;
		return
	if control.is_on_floor():
		control.airborneState = CharacterControl.AirborneState.Idle;
		control.velocity.y = 0;
		return
	currentYSpeed -= self.fallAcclerate * delta;
	control.velocity.y = currentYSpeed;
	return
