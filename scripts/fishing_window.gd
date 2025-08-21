extends Node2D





# screen_spots = 
	#Vector2(0.25, 0.25), # top-left quadrant
	#Vector2(0.75, 0.25), # top-right quadrant
	#Vector2(0.5, 0.5),   # center
	#Vector2(0.25, 0.75), # bottom-left quadrant
	#Vector2(0.75, 0.75)  # bottom-right quadrant
#

@onready 
var bullet_time: Timer = $bullet_time

var fish_to_spawn : PackedScene

var enemy_instance : Node = null

var rarity = randf()

@export
var test_fish : PackedScene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	get_targets()
	
	spawn_fish()
	
	
	bullet_timer()
	
	# spawn pos for the player
	var spawn = TargetPositions.center
	
	Input.warp_mouse(spawn)
	
	

func _process(_delta: float) -> void:
	if Global.isDead:
		get_tree().change_scene_to_file("res://scenes/base/island.tscn")
		
		bullet_time.stop()
	








func spawn_fish():
	randomize()
	
	var common_key: Array = []
	var rare_key: Array = []
	
	for c in FishDatabase.common_fish:
		common_key.append(c)
	
	for r in FishDatabase.rare_fish:
		rare_key.append(r)
	
	
	var random_common_key = common_key.pick_random()
	var random_rare_key = rare_key.pick_random()
	
	var random_common: PackedScene = FishDatabase.common_fish[random_common_key]
	var random_rare: PackedScene = FishDatabase.rare_fish[random_rare_key]
	
	if rarity <= 0.80 and !test_fish:
		fish_to_spawn = random_common
	else:
		fish_to_spawn = random_rare
	
	if test_fish:
		fish_to_spawn = test_fish



	enemy_instance = fish_to_spawn.instantiate()
	add_child(enemy_instance)
	
	enemy_instance.global_position = $targets/enemy_spawn.global_position
	
	
	

func _on_bullet_time_timeout() -> void:
	Global.gain_coins(enemy_instance.value)
	print(enemy_instance.fish_name)
	
	get_tree().change_scene_to_file("res://scenes/base/island.tscn")

func bullet_timer():
	bullet_time.wait_time = enemy_instance.bullet_hell_duration
	
	bullet_time.start()
	


func get_targets():
	
	# Bottoms Left and Right
	TargetPositions.bottom_left = $targets/bottom_left.global_position
	TargetPositions.bottom_right = $targets/bottom_right.global_position
	
	# Cones
	TargetPositions.cone_left = $targets/cone_left.global_position
	TargetPositions.cone_right = $targets/cone_right.global_position
	
	# Centers
	TargetPositions.center = $targets/center.global_position
	TargetPositions.center_down = $targets/center_down.global_position
	TargetPositions.center_left = $targets/center_left.global_position
	TargetPositions.center_right = $targets/center_right.global_position
