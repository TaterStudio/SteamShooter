extends CharacterBody2D
class_name CharacterControl

enum AirborneState{ Jumping, Falling, Idle }
enum LocomotionState {Idle, Dash}

signal move_left
signal move_right
signal move_idle
signal action_dash
signal action_attack
signal action_jump

@export_category("可选组件") 
@export var gravity_comp: CharacterGravity;
@export var jump_comp:  CharacterJump;
@export var airborne_state = CharacterControl.AirborneState.Idle;
@export var horizontal_move: CharacterHorizontalMove;
@export var locomotion_state = CharacterControl.LocomotionState.Idle

func _ready() -> void:
	if jump_comp:
		jump_comp.init(self);
		connect("action_jump",jump_comp.jump)
	if gravity_comp:
		gravity_comp.init(self);
	if horizontal_move:
		horizontal_move.init(self);
		connect("move_idle",horizontal_move.move_idle)
		connect("move_left",horizontal_move.move_left)
		connect("move_right",horizontal_move.move_right)
		pass
	velocity = Vector2.ZERO;
	

func _physics_process(_delta):
	move_and_slide()
	
func locomotion_idle()-> bool :
	return locomotion_state == LocomotionState.Idle;
func airborne_jumping()-> bool :
	return airborne_state == AirborneState.Jumping;
func airborne_set_falling():
	airborne_state = AirborneState.Falling;
	return
