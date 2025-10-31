class_name zombie extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null

var health = 100
var player_in_attack_zone = false
var can_take_damage = true
var dead = false
@export var take_damage_cooldown: float = 1.0

@onready var healthbar = $Healthbar

func _ready():
	healthbar.init_health(health)

func _process(_delta):
	if $ZombieSounds.playing != true:
		$ZombieSounds.play()
	
	
##########################################
func _physics_process(delta):
	deal_with_damage() # always checks whether player is in zombie attack zone AND currently attacking is true
	#print(player_in_attack_zone)
	# Follow player
	if player_chase:
		if position.distance_to(player.position) > 10:
			#position+=(player.position-position)/speed
			position += (player.position - position).normalized() * speed * delta
			 
			if (player.position.x-position.x)<0:
				$ZombieSprite.flip_h=true
				$ZombieSprite.play("zwalk_left")
			else:
				$ZombieSprite.flip_h=false
				$ZombieSprite.play("zwalk_right")
	elif !player_chase and !dead:
		$ZombieSprite.play("idle")
	elif !player_chase and dead:
		$ZombieSprite.play("zdead")
	#move_and_slide()
	move_and_collide(Vector2(0,0))




func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body: Node2D)-> void:
	player = null
	player_chase = false

	
func _on_enemy_hitbox_body_entered(body: Node2D) -> void:
	print("body entered: ",body)
	if body is Player:
		player_in_attack_zone = true
		print("entered")
		print(player_in_attack_zone) ##!
	
func _on_enemy_hitbox_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_attack_zone = false
		

func deal_with_damage():
	if player_in_attack_zone:
		if global.player_current_attack:
			if can_take_damage:
				health -= 25
				$KnifeSlash.play()
				set_health_bar()
				can_take_damage = false
				await get_tree().create_timer(take_damage_cooldown).timeout
				can_take_damage = true
				print("zombie health = ",health)
				if health <= 0:
					zombie_death()

func zombie_death():
	dead = true
	health = 0
	can_take_damage = false
	player_chase = false
	player_in_attack_zone = false
	global.kill_count += 1
	await get_tree().create_timer(1.4).timeout
	self.queue_free()
	
	

	
################################################
# health bar functionality

func set_health_bar():
	healthbar.health = health
	
	
	
	
	

#
#func _on_enemy_hitbox_area_entered(area: Area2D) -> void:
	#print("entered")
	#if area.parent() is Player:
		#player_in_attack_zone = true
		#print("entered")
		#print(player_in_attack_zone) ##!
#
#
#func _on_enemy_hitbox_area_exited(area: Area2D) -> void:
	#print("exit")
	#if area.parent() is Player:
		#player_in_attack_zone = false
