extends State
class_name CharacterIdle

# --VARIABLES LEÍDAS DE NODOS--
@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var character: Character = get_parent().get_parent()

# --FUNCIONES--

# Función que permite cambiar del estado Idle a los estados de ataque o movimiento si se pulsa la tecla destinada a ello
func update(_delta:float):
	if(Input.is_action_just_pressed("ui_attack")):
		Transitioned.emit(self, "CharacterAttack")
	
	if Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up"):
		Transitioned.emit(self, "CharacterMove")

# Función que cambia la dirección en la que se mantiene la animación de idle
func physicis_Update(_delta:float):
	var current_animation = "idle_" + character.get_mouse_dir()
	animated_sprite.animation = current_animation
	animated_sprite.play()
