extends Node
class_name Stats

#--SEÑALES--
signal hp_changed(new_hp)

#--VARIABLES EXPORTADAS--
@export var starting_stats: Resource

#--VARIABLES--
var modifiers: Array = []
var hp : int
var max_hp : int 
var damage : int
var defense : int
var speed : int

#--FUNCIONES--

# Función de inicialización
func _ready():
	max_hp = starting_stats.max_hp
	damage = starting_stats.damage
	defense = starting_stats.defense
	speed = starting_stats.speed
	hp = max_hp

# Función que fija el máximo de vida del personaje
func set_max_hp(value : int):
	max_hp = max(0, value)

# Función que aplica el daño recibido
func take_damage(hit : int):
	var dam = max(hit - defense, 0)
	hp = max(0, hp - dam)
	emit_signal("hp_changed", hp)
	if hp <= 0:
		get_parent().die()

# Función que restaura la vida
func heal(cure : int):
	hp += cure
	hp = max(max_hp, hp)
	emit_signal("hp_changed", hp)

# Función que añade modificadores
func add_modifier(mod):
	modifiers.push_back(mod)

# Función que elimina un modificador
func delete_modifier(mod):
	modifiers.erase(mod)



