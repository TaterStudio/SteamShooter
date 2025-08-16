extends CharacterBody2D
class_name CharacterControl

enum AirborneState{ Jumping, Falling, Idle }

signal move_left
signal move_right
signal move_idle
signal action_dash
signal action_attack
signal action_jump

@export_category("可选组件") 
@export var gravityComp: CharacterGravity;
@export var jumpComp:  CharacterJump;
@export var airborneState = CharacterControl.AirborneState.Idle;
@export var horizontalMove: CharacterHorizontalMove;

func _ready() -> void:
	if jumpComp:
		jumpComp.init(self);
		connect("action_jump",jumpComp.jump)
	if gravityComp:
		gravityComp.init(self);
	if horizontalMove:
		horizontalMove.init(self);
		connect("move_idle",horizontalMove.move_idle)
		connect("move_left",horizontalMove.move_left)
		connect("move_right",horizontalMove.move_right)
		pass
	velocity = Vector2.ZERO;
	

func _physics_process(_delta):
	move_and_slide()
