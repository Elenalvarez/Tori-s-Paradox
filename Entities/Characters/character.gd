extends Entity
class_name Character


func _process(delta):
	pass

func get_mouse_dir():
	var mouse_direction = (get_global_mouse_position() - global_position).normalized()
	var dir = "N"
	
	if mouse_direction.x > 0.25:
		if mouse_direction.y > 0.25:
			dir = "SE"
		elif mouse_direction.y < -0.25:
			dir = "NE"
		elif mouse_direction.y <0.25 and mouse_direction.y > -0.25:
			dir = "E"
	elif mouse_direction.x < -0.25:
		if mouse_direction.y > 0.25:
			dir = "SW"
		elif mouse_direction.y < -0.25:
			dir = "NW"
		elif mouse_direction.y <0.25 and mouse_direction.y > -0.25:
			dir = "W"
	else:
		if mouse_direction.y > 0:
			dir= "S"
	
	return dir

func move():
	direction = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("ui_left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		direction += Vector2.UP
	
	direction = direction.normalized()
	velocity += direction * accerelation
	velocity = velocity.limit_length(max_speed)




