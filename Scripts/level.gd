extends Node

# --CONSTANTES--
const NORMAL_ROOMS_E: Array = [preload("res://Nodes/Rooms/room_calle_centro_3.tscn"), 
preload("res://Nodes/Rooms/boulevard_2.tscn")]
const NORMAL_ROOMS_W: Array = [preload("res://Nodes/Rooms/room_calle_centro_4.tscn")]
const NORMAL_ROOMS_S: Array = [preload("res://Nodes/Rooms/room_calle_centro_1.tscn"),
preload("res://Nodes/Rooms/room_calle_centro_2.tscn"), preload("res://Nodes/Rooms/boulevard_!.tscn")]
const SPECIAL_ROOMS_S: Array = [preload("res://Nodes/Rooms/room_plaza.tscn")]
const SPECIAL_ROOMS_W: Array = [preload("res://Nodes/Rooms/room_plaza2.tscn")]

# --VARIABLES EXPORTADAS--
@export var num_rooms: int = 6

# --FUNCIONES--

# Función de inicialización
func _ready():
	_make_level()

# Función para crear la sucesión de habitaciones de un nivel
func _make_level():
	var previous_room:Room
	
	for i in num_rooms:
		var packed_room
		
		if i == 0:
			packed_room = preload("res://Nodes/Rooms/prueba1.tscn")
		else:
			if i == num_rooms:
				match previous_room.exit_direction:
					"N":
						packed_room = preload("res://Nodes/Rooms/Calle_iglesia_S.tscn")
					"E":
						packed_room = preload("res://Nodes/Rooms/Calle_iglesia_W.tscn")
					"W":
						packed_room = preload("res://Nodes/Rooms/Calle_iglesia_E.tscn")
			else:
				if i == int(num_rooms/2):
					match previous_room.exit_direction:
						"N":
							packed_room = SPECIAL_ROOMS_S.pick_random()
						"E":
							packed_room = SPECIAL_ROOMS_W.pick_random()
						#TERMINAR CON LAS OTRAS ROOMS
				else:
					match previous_room.exit_direction:
						"N":
							packed_room = NORMAL_ROOMS_S.pick_random()
						"E":
							packed_room = NORMAL_ROOMS_W.pick_random()
						"W":
							packed_room = NORMAL_ROOMS_E.pick_random()
		
		if packed_room != null: #SOLO HASTA QUE TENGAMOS LAS HABITACIONES PREVIAS
			previous_room = packed_room.instantiate()
			Global.level_rooms.push_back(packed_room)
	
	#AÑADIR AL FINAL LA HABITACIÓN DEL BOSS
