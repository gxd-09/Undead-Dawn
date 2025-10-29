class_name Player extends CharacterBody2D

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
	input = Input.get_vector("left","right","up","down")
	velocity = input * speed
	move_and_slide()
	select_animation()
	update_animation_parameters()
	
func select_animation():
	if velocity == Vector2.ZERO:
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
