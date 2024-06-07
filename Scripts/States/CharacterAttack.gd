extends State
class_name CharacterAttack

# --VARIABLES LEÍDAS DE NODOS--
@onready var animation = $"../../AnimationPlayer"
@onready var character: CharacterBody2D = get_parent().get_parent()

# --FUNCIONES--

# Función que establece la animación de ataque del personaje
func enter():
	var current_animation = "attack_" + character.get_mouse_dir()
	animation.play(current_animation)
	await  animation.animation_finished
	Transitioned.emit(self, "CharacterIdle")

