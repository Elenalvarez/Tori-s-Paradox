extends Node2D
class_name Room

#--CONSTANTES--
const ENEMY_SCENES: Dictionary = {
	#RELLENAR CON LOS ENEMIGOS
}

#--VARIABLES--
var num_enemies: int

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
	num_enemies = enemy_position.get_child_count()
