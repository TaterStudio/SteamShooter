extends Sprite2D
class_name TrailEffectItem

@export var disappear_time = 0.6;

func _enter_tree() -> void:
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",0.0,disappear_time);
	tween.tween_callback(queue_free)
	pass
