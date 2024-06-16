extends State
class_name EnemyFollow

@onready var enemy: Enemy = get_parent().get_parent()

var player: Character

func enter():
	player = get_tree().get_first_node_in_group("Player")

func physicis_Update(_delta:float):
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 80:
		enemy.velocity = direction.normalized() * enemy.stats.speed
	else:
		Transitioned.emit(self, "EnemyMove")
