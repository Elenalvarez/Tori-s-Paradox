extends State
class_name CharacterMove

# --VARIABLES LEÍDAS DE NODOS--
@onready var animated_sprite = $"../../AnimatedSprite2D"
@onready var character: CharacterBody2D = get_parent().get_parent()

# --Funciones--

# Función que actualiza el estado de movimineto a ataque o a quieto
func update(_delta:float):
	if(Input.is_action_just_pressed("ui_attack")):
		Transitioned.emit(self, "CharacterAttack")
	
	if !Input.is_action_pressed("ui_down") and !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_up"):
		Transitioned.emit(self, "CharacterIdle")
	

# Función que actualiza la dirección en la que se mueve el sprite
func physicis_Update(_delta:float):
	var current_animation = "move_" + character.get_mouse_dir()
	animated_sprite.animation = current_animation
	animated_sprite.play()
	
	character.move()
