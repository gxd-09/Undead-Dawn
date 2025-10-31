extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
	
func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/controls_page.tscn")
	
	
func _process(_delta):
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
