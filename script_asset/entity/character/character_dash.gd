extends Node
class_name CharacterDash

signal dash_start
signal dash_end

@export var locomotion: CharacterControl
@export var character_facing: CharacterFacing
@export var dash_length = 5.0
@export var dash_time = 1.0
@export var _is_dashing = false;
@export var _dash_timer: Timer;

func _enter_tree() -> void:
	locomotion.action_dash.connect(dash)
	pass;

func _process(_delta: float) -> void:
	if _is_dashing:
		_dash_internal()
		pass
	pass
	
func dash():
	if _is_dashing:
		return;
	locomotion.locomotion_state = CharacterControl.LocomotionState.Dash
	dash_start.emit()
	_dash_timer.start(dash_time);
	_is_dashing = true;
	locomotion.velocity.y = 0;
	pass

func end_dash():
	if !_is_dashing:
		return;
	dash_end.emit()
	_is_dashing = false;
	locomotion.locomotion_state = CharacterControl.LocomotionState.Idle
	pass

func _dash_internal():
	var dir = character_facing.get_direction();
	locomotion.velocity.x = dir * get_speed();

func get_speed():
	return dash_length * Constants.PPU / dash_time;


func _on_timer_timeout() -> void:
	pass # Replace with function body.
