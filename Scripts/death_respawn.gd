extends CanvasLayer

	


func _on_respawn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
