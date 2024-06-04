extends Control


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Nodes/Rooms/room_calle_centro_1.tscn")

func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Nodes/Rooms/room_calle_centro_2.tscn")

func _on_button_3_pressed():
	get_tree().change_scene_to_file("res://Nodes/Rooms/room_plaza.tscn")
