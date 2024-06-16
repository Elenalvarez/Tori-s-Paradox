extends Entity
class_name Enemy

@onready var animation_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var margin = 0.25
	var dir = "N"
	
	move_and_slide()
	
	if velocity.x > margin:
		if velocity.y > margin:
			dir = "SE"
		elif velocity.y < -margin:
			dir = "NE"
		elif velocity.y <margin and velocity.y > -margin:
			dir = "E"
	elif velocity.x < -margin:
		if velocity.y > margin:
			dir = "SW"
		elif velocity.y < -margin:
			dir = "NW"
		elif velocity.y <margin and velocity.y > -margin:
			dir = "W"
	else:
		if velocity.y > 0:
			dir= "S"
	
	animation_sprite.animation = "move_" + dir
	animation_sprite.play()


