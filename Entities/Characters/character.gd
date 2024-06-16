extends Entity
class_name Character

# Función para obtener la dirección en la que se encuentra el ratón con respecto al personaje
func get_mouse_dir():
	var mouse_direction = (get_global_mouse_position() - global_position).normalized()
	var dir = "N"
	var margin = 0.25
	
	if mouse_direction.x > margin:
		if mouse_direction.y > margin:
			dir = "SE"
		elif mouse_direction.y < -margin:
			dir = "NE"
		elif mouse_direction.y <margin and mouse_direction.y > -margin:
			dir = "E"
	elif mouse_direction.x < -margin:
		if mouse_direction.y > margin:
			dir = "SW"
		elif mouse_direction.y < -margin:
			dir = "NW"
		elif mouse_direction.y <margin and mouse_direction.y > -margin:
			dir = "W"
	else:
		if mouse_direction.y > 0:
			dir= "S"
	
	return dir

# Función para que el personaje se mueva 
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
	velocity += direction * stats.speed
	velocity = velocity.limit_length(stats.speed * 1.5)




