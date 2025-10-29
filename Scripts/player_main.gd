class_name Player extends CharacterBody2D

var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
@onready var attack_cooldown = $playerHitbox/attack_cooldown
var attack_in_progress = false


# Player Movement

@export var speed: int = 50
@export var animation_tree: AnimationTree
var input: Vector2
var playback: AnimationNodeStateMachinePlayback

func _ready():
	playback = animation_tree["parameters/playback"]


##player heart bar
	#var hearts_parent = $health_bar/HBoxContainer
	#for child in hearts_parent.getChildren():
		#hearts_list.append(child)
	#print(hearts_list)

func _physics_process(_delta:float) -> void:
	enemy_attack()
	
	if health <= 0:
		player_alive = false
		# add respawn screen get_tree().change_scene_file_toblablabla
		health = 0
		print("Player has been killed")
	
	input = Input.get_vector("left","right","up","down")
	velocity = input * speed
	move_and_slide()
	select_animation()
	update_animation_parameters()
	
func select_animation():
	if velocity == Vector2.ZERO:
		if attack_in_progress == false:
			playback.travel("Idle")
			$Sprite2D2.visible = false
			$Sprite2D.visible = true
	else:
		playback.travel("Walk")
		$Sprite2D.visible = false
		$Sprite2D2.visible = true
	
func update_animation_parameters():
	if input == Vector2.ZERO:
		return
	animation_tree["parameters/Idle/blend_position"] = input
	animation_tree["parameters/Walk/blend_position"] = input
	
	
	#
## Player Heart Bar
#
#var alive : bool = true
#
#var hearts_list : Array[TextureRect]
#var health = 6
#
#func take_damage():
	#if health > 0:
		#health -= 1
		#update_heart_display()
		#
#func update_heart_display():
	#for i in range(hearts_list.size()):
		#hearts_list[i].visible = i < health
	#
	##heart beat animation
	#if health == 1:
		#hearts_list[0].get_child(0).play("beating")
	#elif health > 1:
		#hearts_list[0].get_child(0).play("idle")
	#
	


func _on_player_hitbox_body_entered(body: Node2D) -> void:
	print("entered")
	if body is zombie:
		enemy_in_attack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	print("exit")
	if body is zombie:
		enemy_in_attack_range = false
		
func enemy_attack():
	if enemy_in_attack_range and enemy_attack_cooldown:
		health -= 10
		enemy_attack_cooldown = false
		attack_cooldown.start()
		print(health)


func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true
