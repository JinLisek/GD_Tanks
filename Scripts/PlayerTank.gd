extends "res://Scripts/Tank.gd"

func control(delta):
	$Turret.look_at(get_global_mouse_position())
	
	var rotation_dir = 0
	
	if Input.is_action_pressed("turn_right"):
		rotation_dir += 1
	if Input.is_action_pressed("turn_left"):
		rotation_dir -= 1

	rotation += rotation_dir * rotation_speed * delta
	
	velocity = Vector2()
	if Input.is_action_pressed("forward"):
		velocity = Vector2(movement_speed, 0).rotated(rotation)
	if Input.is_action_pressed("backward"):
		velocity = Vector2(-movement_speed / 2, 0).rotated(rotation)
		
	if Input.is_action_just_pressed("shoot"):
		shoot()