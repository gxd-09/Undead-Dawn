extends CharacterBody2D


func _on_detection_area_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

























#@export var SPEED: int = 300
#@export var ACCELERATION: int = 500
#@export var FRICTION: int = 400
#
#@onready var nav_agent: NavigationAgent2D = $NavigationAgent2D
#@onready var body: CharacterBody2D = $"../MyPlayer"
#@onready var player: CharacterBody2D = $"."
#
#func _ready() -> void:
	#nav_agent.path_desired_distance = 200.0
	#nav_agent.target_desired_distance = 50.0
	#nav_agent.path_max_distance = 200.0
	#
	#
#func _physics_process(delta: float) -> void:
	#var direction: Vector2 = (nav_agent.get_next_path_position() - global_position).normalized()
	##change_direction(direction.x)
	#set_movement_target()
	#
	#if not nav_agent.is_target_reachable():
		#if direction != Vector2.ZERO:
			#velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#else:
		#velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#move_and_slide()
	#
#func set_movement_target() -> void:
	#await get_tree().physics_frame
	#nav_agent.target_position = player.position - Vector2(0,40)
	
#func change_direction(direction: float) -> void:
	#if sign(direction) == -1:
		#body.flip_h = false
	#elif sign(direction) == 1:
		#body.flip_h = true

#@onready var target = $"../MyPlayer"
#var speed = 1
#
#func _physics_process(_delta):
	#var direction = (target.position-position).normalized()
	#velocity = direction * speed
	#look_at(target.position)
	#move_and_slide()

#var speed = 20
#var playerChase = false
#var player = null
#
#func _physics_process(_delta):
	#if playerChase and player:
		#$".".position += (player.position-position)/speed
#
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.name == "MyPlayer":
		#player = body
		#playerChase = true
#
#
#func _on_area_2d_body_exited(_body: Node2D) -> void:
	#player = null
	#playerChase = false

#var speed = 20
#var player_pos
#var target_pos
#@onready var player: CharacterBody2D = $"../MyPlayer"
#
#func _physics_process(delta: float) -> void:
	#player_pos = player.position
	#target_pos = (player_pos - position).normalized()
	#
	#if position.distance_to(player_pos) > 3:
		#position += target_pos * speed * delta
	
#@onready var healthbar = $Healthbar
	#
#func _ready():
	#var health = 6
	#var on_dead = "die"
	#healthbar.init_health(health)
	#
##func _on_hurtbox_area_entered(area):
	##health -= 1
	##hit_flash_anim_player.play("hit flash")
	##
	##
##@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
##@export var target_to_chase: CharacterBody2D
##const SPEED = 180.00
##
##func _physics_procesS(_delta):
	##navigation_agent.target_position = target_to_chase.global_position
	##velocity = global_position.direction_to(navigation_agent.get_next_path_position()) * SPEED
#
##@onready var parent: CharacterBody2D = self
##const speed = 10
##var target: CharacterBody2D = null
##
##func update_velocity():
	##if !target: 
		##return
	##var direction = target.global_position - parent.global_position
	##
	##var new_velocity = direction * speed
	##parent.velocity = new_velocity
##
##func _physics_process(_delta):
	##update_velocity()
	##parent.move_and_slide()
##
#
#
#@onready var target: CharacterBody2D = $"."
#var speed: int = 50
#const ACCELERATION: int = 5
#
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body is Player:
		#target = body
		#print("Player entered the enemy's detection range")
#
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#if body is Player:
		#target = null
		#print("Player left the enemy's detection range")
		#
#
#func _physics_process(delta):
	#var target_velocity: Vector2 = Vector2.ZERO
	#if target != null and is_instance_valid(target):	
		#var target_position: Vector2 = target.global_position
		#var direction = global_position.direction_to(target_position)
		#target_velocity = direction*speed
		##velocity = velocity.move_toward(direction * speed, ACCELERATION * delta)
	#elif target == null:
		#target_velocity = Vector2.ZERO
	#velocity = velocity.move_toward(target_velocity, ACCELERATION * delta)
	#move_and_slide()
	
