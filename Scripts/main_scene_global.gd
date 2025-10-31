extends Node2D

#func _process(_delta):
	#if $MainAudio.playing == false:
		#$MainAudio.play()

@export var zombie_scene: PackedScene

############################
#wave transitions
var starting_nodes: int 
var current_nodes: int
# current nodes = starting nodes means no enemies on map, so next wave
var current_wave: int
var moving_to_next_wave: int
#########################

var player_current_attack = false
var player_health = 100
var can_pick_up_food = true
var zombie_attacking = false

@onready var kill_count = 0
var hud : HUD


func _ready():
	current_wave = 0
