extends CharacterBody2D
class_name Entity

#--CONSTANTES--
const FRICTION:float =0.15

#--VARIABLES--
var direction:Vector2 = Vector2.ZERO

#--VARIABLES LEÍDAS DE NODOS--
@onready var state_machine = get_node("State Machine")
@onready var animation = get_node("AnimationPlayer")
@onready var stats: Stats = get_node("Stats")

#--FUNCIONES--

# Función que llama al movimiento
func _physics_process(delta):
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

# Función general para moverse
func move():
	direction = direction.normalized()
	velocity += direction * stats.speed
	velocity = velocity.limit_length(stats.speed * 1.5)

func _on_hurtbox_area_entered(area):
	if area.name == "Hitbox":
		var body = area.get_parent()
		body.stats.take_damage(stats.damage)

func die():
	get_parent().num_enemies -= 1
	animation.play("die")
	await animation.animation_finished
	queue_free()
