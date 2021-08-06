extends KinematicBody2D

const MOVE_SPEED = 300

var flip = false

func _physics_process(delta):
	var move_dir = Vector2()
	var rotation_amount = 0
	if Input.is_action_pressed("ui_down"):
		move_dir.y += 1
		rotation_amount = 15
	if Input.is_action_pressed("ui_up"):
		move_dir.y -= 1
		rotation_amount = -15
	if Input.is_action_pressed("ui_right"):
		move_dir.x += 1
		flip = false
	if Input.is_action_pressed("ui_left"):
		move_dir.x -= 1
		flip = true
	move_and_slide(move_dir * MOVE_SPEED, Vector2.UP)
	if flip:
		rotation_amount *= -1
	rotation_degrees = rotation_amount
	$AnimatedSprite.flip_h = flip
