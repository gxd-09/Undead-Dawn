extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Player and global.can_pick_up_food:
		# pick up bandage
		body.speed_boost()
		print("speed boost")
		queue_free()
