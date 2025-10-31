extends Control
class_name HUD

@export var killCount : Label

#func update_kill_count(num : int):
	#kill_count.text = str(num)

func _process(_delta):
	$KillCount.text = str(global.kill_count)
