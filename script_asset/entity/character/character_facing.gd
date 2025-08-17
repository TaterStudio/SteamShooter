extends Node
class_name CharacterFacing

@export var locomotion: CharacterControl;
@export var sprite: AnimatedSprite2D;
@export var flip_h: bool = false;

func get_direction() -> int:
	if flip_h:
		return -1;
	else:
		return 1;
		
func _process(_delta: float) -> void:
	if !sprite:
		return
	if !locomotion:
		return
	if !locomotion.locomotion_idle():
		return;
	if !flip_h && locomotion.velocity.x < 0:
		flip_h = true;
		sprite.flip_h = flip_h;
		pass
	if flip_h && locomotion.velocity.x > 0:
		flip_h = false;
		sprite.flip_h = flip_h;
	return
