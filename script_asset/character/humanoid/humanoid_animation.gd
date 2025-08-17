extends Node
class_name HumanoidAnimation

@export var locomotion: CharacterBody2D
@export var anim_comp: AnimatedSprite2D

func _process(_delta: float) -> void:
	if !locomotion:
		return
	if !anim_comp:
		return;
	if locomotion.velocity.x != 0:
		anim_comp.play("run")
	else:
		anim_comp.play("idle")
