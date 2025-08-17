extends Node
class_name TrailEffect
@export var dash: CharacterDash
@export var model: AnimatedSprite2D
@export var item: PackedScene
@export var interval = 0.2

@onready var timer = $Timer
func _enter_tree() -> void:
	dash.dash_start.connect(play_effect);
	dash.dash_end.connect(stop_effect);
func _ready():
	timer.wait_time = interval;
func play_effect():
	timer.start();
	pass
func stop_effect():
	timer.stop();
	pass

func spawn_effect():
	var instance = item.instantiate()
	add_child(instance)
	var instance_item = instance as TrailEffectItem
	instance_item.top_level = true;
	instance_item.global_position = model.global_position;
	instance_item.flip_h = model.flip_h;
	var sprite_frames = model.sprite_frames;
	var tex = sprite_frames.get_frame_texture(model.animation,model.frame)
	instance_item.texture = tex;
	pass
