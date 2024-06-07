extends Node2D
class_name Room

#--CONSTANTES--
const ENEMY_SCENES: Dictionary = {
	#RELLENAR CON LOS ENEMIGOS
}

#--VARIABLES--
var num_enemies: int
var tori = preload("res://Entities/Characters/tori.tscn")

#--VARIABLES EXPORTADAS--
@export var exit_direction: String
@export var entrance_direction: String

#--VARIABLES LEÍDAS DE NODOS--
@onready var tilemap: TileMap = $TileMap
@onready var entrance: Node2D = $Entrance
@onready var enemy_position: Node2D = $EnemyPosition
@onready var exit: Area2D = $Exit

#--FUNCIONES--

# Función de inicialización
func _ready():
	var player = tori.instantiate()
	get_node("Player").add_child(player)
	player.global_position = entrance.global_position
	
	num_enemies = enemy_position.get_child_count()

# Función de cambio de habitación
func _on_area_2d_body_entered(body):
	if body is Character:
		get_tree().change_scene_to_packed(Global.level_rooms[Global.actual_room])
		Global.actual_room += 1
