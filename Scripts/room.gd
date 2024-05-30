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

func _ready():
	var player = tori.instantiate()
	get_node("Player").add_child(player)
	player.global_position = entrance.global_position
	
	num_enemies = enemy_position.get_child_count()
	


func _on_area_2d_body_entered(body):
	if body is Character:
		get_tree().change_scene_to_file("res://Nodes/Rooms/room_calle_centro_1.tscn")
