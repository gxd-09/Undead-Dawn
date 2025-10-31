class_name Player extends CharacterBody2D

var enemy_in_attack_range = false
var enemy_attack_cooldown = true
var health = 6
var player_alive = true
@onready var attack_cooldown = $playerHitbox/attack_cooldown
var attack_in_progress = false


# Player Movement

@export var speed: int = 50
@export var animation_tree: AnimationTree
var input: Vector2
var playback: AnimationNodeStateMachinePlayback
var hearts_list : Array[TextureRect]

func _ready():
	playback = animation_tree["parameters/playback"]
	
	var hearts_parent = $hearts_bar/HBoxContainer
	for child in hearts_parent.get_children():
		hearts_list.append(child)
	print(hearts_list)
	


func _physics_process(_delta:float) -> void:
	enemy_attack()
	#take_damage()
	attack()
	
	
	if health <= 0:
		player_alive = false
		death()
		health = 0
		#print("Player has been killed")
	
	input = Input.get_vector("left","right","up","down")
	velocity = input * speed
	move_and_slide()
	select_animation()
	update_animation_parameters()
	
func select_animation():
	if velocity == Vector2.ZERO:
		if attack_in_progress == false:
			playback.travel("Idle")
			$walk.visible = false
			$idle.visible = true
			$attack.visible = false
		else:
			playback.travel("Attack")
			$walk.visible = false
			$idle.visible = false
			$attack.visible = true
	elif velocity != Vector2.ZERO:
		if attack_in_progress == false:
			playback.travel("Walk")
			$idle.visible = false
			$walk.visible = true
			$attack.visible = false
		#elif attack_in_progress == true:
			#playback.travel("Attack")
			#$idle.visible = false
			#$walk.visible = false
			#$attack.visible = true
	
func update_animation_parameters():
	if input == Vector2.ZERO:
		return
	animation_tree["parameters/Idle/blend_position"] = input
	animation_tree["parameters/Walk/blend_position"] = input
	animation_tree["parameters/Attack/blend_position"] = input

#attack 
func attack():
	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		attack_in_progress = true
		#print(attack_in_progress)
		print("attacking")
		await get_tree().create_timer(0.7).timeout #or just use the deal_attack_timer node (assign as var first)
		global.player_current_attack = false
		attack_in_progress = false


func _on_player_hitbox_body_entered(body: Node2D) -> void:
	if body is zombie:
		enemy_in_attack_range = true


func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body is zombie:
		enemy_in_attack_range = false
		
func enemy_attack():
	if enemy_in_attack_range and enemy_attack_cooldown:
		global.zombie_attacking = true
		#health -= 10
		health -= 1
		update_heart_display()
		enemy_attack_cooldown = false
		attack_cooldown.start()
		print("player health: ", health)


func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true
	
func death():
	get_tree().change_scene_to_file("res://Scenes/death_respawn.tscn")

### Player Heart Bar

		
func update_heart_display():
	for i in range(hearts_list.size()):
		print("heart")
		hearts_list[i].visible = i < health
	
	#heart beat animation
	if health == 1:
		hearts_list[0].get_child(0).play("beating")
	elif health > 1:
		hearts_list[0].get_child(0).play("idle")
		
# Pickups ######################################
	
func heal():
	health += 2
	if health > 6:
		health = 6
	update_heart_display()
	print(health)

func speed_boost():
	speed = 100
	global.can_pick_up_food = false
	await get_tree().create_timer(5.0).timeout
	speed = 50
	global.can_pick_up_food = true
