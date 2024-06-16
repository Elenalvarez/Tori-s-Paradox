extends State
class_name EnemyMove

@onready var enemy:Enemy = get_parent().get_parent()

var move_direction: Vector2
var wander_timer: float
var player

func randomizer():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_timer = randf_range(1,3)

func enter():
	randomizer()

func update(_delta:float):
	if wander_timer > 0:
		wander_timer -= _delta
	else:
		randomizer()

func physicis_Update(_delta:float):
	if enemy:
		enemy.velocity = move_direction * enemy.stats.speed
	
	player = get_tree().get_first_node_in_group("Player")
	var direction = player.global_position - enemy.global_position
	
	if direction.length() < 80:
		Transitioned.emit(self, "EnemyFollow")
