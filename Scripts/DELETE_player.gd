#extends CharacterBody2D
##@onready var animated_sprite_2d = $Player
#
#var direction: Vector2 = Vector2(1,1)
#var speed: float = 20
#
#func walk_forward():
	#$Player.play("walk_forward")
	#direction = Vector2.UP
	#velocity = speed * direction
	#move_and_slide()
	#
#func walk_back():
	#$Player.play("walk_back")
	#direction = Vector2.DOWN
	#velocity = speed * direction
	#move_and_slide()
#
#func walk_left():
	#$Player.play("walk_left")
	#direction = Vector2.LEFT
	#velocity = speed * direction
	#move_and_slide()
	#
#func walk_right():
	#$Player.play("walk_right")
	#direction = Vector2.RIGHT
	#velocity = speed * direction
	#move_and_slide()
	#
#
#func _process(_delta):
	#if Input.is_action_pressed("Left"):
		#walk_left()
	#if Input.is_action_pressed("Right"):
		#walk_right()
	#if Input.is_action_pressed("Forward"):
		#walk_forward()
	#if Input.is_action_pressed("Back"):
		#walk_back()
		#
#var direction: Vector2 = Vector2(1,1)
#var speed: int = 50
##
#func _physics_process(_delta: float) -> void:
	#direction = Input.get_vector("Left","Right","Forward","Back")
	#velocity = direction * speed
	#move_and_slide()

#var speed: int = 50
#func _process(_delta):
	#var horizontal_direction = Input.get_axis("Left","Right")
	#var vertical_direction = Input.get_axis("Forward","Back")
	#
	#velocity = Vector2(horizontal_direction, vertical_direction).normalized() * speed
	#move_and_slide()
	#
	#
#@export var speed: int = 50
#func _physics_process(_delta):
	#var velocity = Vector2.ZERO
	#if Input.is_action_pressed("Right"):
		#velocity.x += 1.0
	#if Input.is_action_pressed("Left"):
		#velocity.x += -1.0
	#if Input.is_action_pressed("Forward"):
		#velocity.y += 1.0
	#if Input.is_action_pressed("Back"):
		#velocity.y += -1.0
	#velocity = velocity.normalized() * speed
	#move_and_slide()
	#
	#
