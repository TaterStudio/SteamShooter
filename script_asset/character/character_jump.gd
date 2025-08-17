@tool
class_name CharacterJump
extends Node

@export var initialSpeed = 500.0;
@export var fallAcclerate = -10.0;
@export var control: CharacterControl = null;
@export var currentYSpeed = 0;
@export var jump_count = 1;
var _jumped_count = 0;

#region func

func _init() -> void:
	_jumped_count = 0;
	return
	
func init(body: CharacterControl) -> void:
	control = body;
	return

func jump():
	if control.airborne_state == CharacterControl.AirborneState.Idle:
		jump_internal();
		return;
	if control.airborne_state == CharacterControl.AirborneState.Falling || control.airborne_state == CharacterControl.AirborneState.Jumping:
		if _jumped_count < jump_count:
			jump_internal();
			return;
		return;
func jump_internal():
		currentYSpeed = initialSpeed;
		control.velocity.y = currentYSpeed;
		control.airborne_state = CharacterControl.AirborneState.Jumping;
		_jumped_count += 1;

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint():
		return
	if !control:
		return
	if !control.locomotion_idle():
		if control.airborne_jumping():
			control.airbone_set_falling();
		return
	# 当结束跳跃的时候重置跳跃次数
	if control.airborne_state == CharacterControl.AirborneState.Idle:
		_jumped_count = 0;
		return
	if control.airborne_state != CharacterControl.AirborneState.Jumping:
		return
	if control.is_on_ceiling():
		control.airborne_state = CharacterControl.AirborneState.Falling;
		return
	if currentYSpeed >0:
		control.airborne_state = CharacterControl.AirborneState.Falling;
		return
	currentYSpeed -= self.fallAcclerate * delta;
	control.velocity.y = currentYSpeed;
	return

#region editor

func _get(property):
	if property == "跳跃高度":
		return -calculate_max_jump_height(initialSpeed,fallAcclerate)/10;
	if property == "跳跃时间":
		return initialSpeed / fallAcclerate;
func _get_property_list():
	return [
		{ "name": "跳跃高度", "type": TYPE_FLOAT },
		{ "name": "跳跃时间", "type": TYPE_FLOAT }
	]

func calculate_max_jump_height(initial_speed: float, gravity: float) -> float:
	return (initial_speed ** 2) / (2 * gravity)
