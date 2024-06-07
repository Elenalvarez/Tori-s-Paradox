extends Control



func _on_button_pressed():
	get_tree().change_scene_to_packed(Global.level_rooms[Global.actual_room])
	Global.actual_room += 1
