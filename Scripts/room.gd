extends Node2D
class_name Room

#--CONSTANTES--
const NORMAL_ENEMIES: Array = [
	preload("res://Entities/Enemies/pacient.tscn"),
	preload("res://Entities/Enemies/nurse.tscn")
]

#--VARIABLES--
var num_enemies: int = -1
var tori = preload("res://Entities/Characters/tori.tscn")

#--VARIABLES EXPORTADAS--
@export var exit_direction: String
@export var entrance_direction: String
@export var boss_room: bool = false

#--VARIABLES LEÍDAS DE NODOS--
@onready var tilemap: TileMap = $TileMap
@onready var entrance: Node2D = $Entrance
@onready var enemy_positions: Node2D = $EnemyPosition

#--FUNCIONES--

# Función de inicialización
func _ready():
	var player = tori.instantiate()
	get_node("Player").add_child(player)
	player.global_position = entrance.global_position
	
	num_enemies = enemy_positions.get_child_count()
	spawn_enemies()

func _process(delta):
	if num_enemies == 0:
		tilemap.clear_layer(13)

# Función de cambio de habitación
func _on_area_2d_body_entered(body):
	if body is Character:
		if Global.actual_room < Global.level_rooms.size(): 
			get_tree().change_scene_to_packed(Global.level_rooms[Global.actual_room])
			Global.actual_room += 1

func spawn_enemies():
	for enemy_position in enemy_positions.get_children():
		var enemy: Enemy
		
		if boss_room:
			#añadir boss
			pass
		else:
			if randf_range(0, 1) > Global.difficulty:
				enemy = NORMAL_ENEMIES.pick_random().instantiate()
			else:
				#CAMBIAR A ENEMIGOS DIFICILES
				enemy = NORMAL_ENEMIES.pick_random().instantiate()
		
		enemy.position = enemy_position.position
		call_deferred("add_child", enemy)








