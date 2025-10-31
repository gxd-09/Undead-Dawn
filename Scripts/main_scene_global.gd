extends Node2D

func _process(_delta):
	#if $MainAudio.playing == false:
		#$MainAudio.play()
	if kill_count >= 7:
		#await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/winscreen.tscn")

@export var zombie_scene: PackedScene

############################
#wave transitions
var starting_nodes: int 
var current_nodes: int
var wave_spawn_ended: bool
# current nodes = starting nodes means no enemies on map, so next wave
var current_wave: int
var moving_to_next_wave: int
#@onready var anim_player = $WaveTransition/AnimationPlayer
#########################

var player_current_attack = false
var player_health = 100
var can_pick_up_food = true
var zombie_attacking = false

@onready var kill_count = 0
var hud : HUD

	


	

#func _ready():
	#current_wave = 0
	#starting_nodes = get_child_count()
	#current_nodes = get_child_count()
	#position_to_next_wave()
	#
#func position_to_next_wave():
	#if current_nodes == starting_nodes:
		#if current_wave != 0:
			#moving_to_next_wave = true
		#wave_spawn_ended = false
		##anim_player.play("between_wave")
		#print("between wave")
		#current_wave += 1
		#print(current_wave)
		#await get_tree().create_timer(0.5).timeout
		#prepare_spawn(4.0, 4.0) # multiplier, spawns
#
#func prepare_spawn(multiplier, mob_spawns):
	#var mob_amount = float(current_wave) * multiplier
	#var mob_wait_time: float = 2.0
	#print("mob amount: ", mob_amount)
	#var mob_spawn_rounds = mob_amount/mob_spawns
	#
	#var spawn1 = $SpawnsZombieSpawn1
	#var spawn2 = $Spawns/ZombieSpawn2
	#var spawn3 = $Spawns/ZombieSpawn3
	#var spawn4 = $Spawns/ZombieSpawn4
	#var spawn5 = $Spawns/ZombieSpawn5
	#var spawn6 = $Spawns/ZombieSpawn6
	#var spawn7 = $Spawns/ZombieSpawn7
	#var spawn8 = $Spawns/ZombieSpawn8
	#var spawn9 = $Spawns/ZombieSpawn9
	#var spawn10 = $Spawns/ZombieSpawn10
	#if mob_spawn_rounds >= 1:
		#for i in mob_spawn_rounds:
			#print("yes")
			#var zombie1 = zombie_scene.instantiate()
			#zombie1.position = spawn1.position
			#var zombie2 = zombie_scene.instantiate()
			#zombie2.position = spawn2.position
			#var zombie3 = zombie_scene.instantiate()
			#zombie3.position = spawn3.position
			#var zombie4 = zombie_scene.instantiate()
			#zombie4.position = spawn4.position
			#var zombie5 = zombie_scene.instantiate()
			#zombie5.position = spawn5.position
			#var zombie6 = zombie_scene.instantiate()
			#zombie6.position = spawn6.position
			#var zombie7 = zombie_scene.instantiate()
			#zombie7.position = spawn7.position
			#var zombie8 = zombie_scene.instantiate()
			#zombie8.position = spawn8.position
			#var zombie9 = zombie_scene.instantiate()
			#zombie9.position = spawn9.position
			#var zombie10 = zombie_scene.instantiate()
			#zombie10.position = spawn10.position
			#add_child(zombie1)
			#add_child(zombie2)
			#add_child(zombie3)
			#add_child(zombie4)
			#add_child(zombie5)
			#add_child(zombie6)
			#add_child(zombie7)
			#add_child(zombie8)
			#add_child(zombie9)
			#add_child(zombie10)
			#mob_spawn_rounds -=1
			#await get_tree().create_timer(mob_wait_time).timeout
	#
#
#func _process(_delta):
	#current_nodes = get_child_count()
	#if wave_spawn_ended:
		#position_to_next_wave()
		#
		#
