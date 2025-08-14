extends CharacterBody2D

@export_range(50, 500) var speed: float = 1.0

func _physics_process(delta):
	move_and_slide()

func move_left():
	velocity.x = -speed

func move_right():
	velocity.x = speed

func move_idle():
	velocity.x = 0

func jump():
	pass
