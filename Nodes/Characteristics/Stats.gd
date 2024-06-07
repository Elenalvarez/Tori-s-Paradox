extends Node
class_name Stats

#--SEÑALES--
signal hp_changed(new_hp)
signal hp_depleted()

#--VARIABLES--
var modifiers = {}
var hp : int
var max_hp : int : set = set_max_hp
var strength : int
var defense : int
var speed : int

#--FUNCIONES--

# Función de inicialización
func initialize(stats : StartingStats):
	max_hp = stats.max_hp
	strength = stats.strength
	defense = stats.defense
	speed = stats.speed

# Función que fija el máximo de vida del personaje
func set_max_hp(value : int):
	max_hp = max(0, value)

# Función que aplica el daño recibido
func take_damage(damage : int):
	hp -= damage
	emit_signal("hp_changed", hp)
	if hp <= 0:
		emit_signal("hp_depleted")

# Función que restaura la vida
func heal(cure : int):
	hp += cure
	hp = max(max_hp, hp)
	emit_signal("hp_changed", hp)

# Función que añade modificadores
func add_modifier(id, mod):
	modifiers[id] = mod

# Función que elimina un modificador
func delete_modifier(id):
	modifiers.erase(id)



