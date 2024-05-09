extends CharacterBody2D
class_name Entity

#--CONSTANTES--
const FRICTION:float =0.15

#--VARIABLES--
var direction:Vector2 = Vector2.ZERO

#--VARIABLES EXPORTADAS--
@export var accerelation:int = 40
@export var max_speed:int = 100

#--VARIABLES LEÍDAS DE NODOS--
@onready var state_machine = get_node("State Machine")
@onready var animated_sprite = get_node("AnimatedSprite2D")
@onready var animation = get_node("AnimationPlayer")

#--FUNCIONES--

#función que llama al movimiento
func _physics_process(delta):
	move_and_slide()
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

#función general para moverse
func move():
	direction = direction.normalized()
	velocity += direction * accerelation
	velocity = velocity.limit_length(max_speed)


func _on_hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
