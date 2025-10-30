extends Node2D

#func _process(_delta):
	#if $MainAudio.playing == false:
		#$MainAudio.play()


var player_current_attack = false
var player_health = 100
var can_pick_up_food = true
var zombie_attacking = false

@onready var kill_count = 0
