extends Node2D


@onready 
var bullet_time: Timer = $bullet_time

var fish_to_spawn : PackedScene

var enemy_instance : Node = null

var rarity = randf()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_fish()
	
	
	bullet_timer()
	
	Input.warp_mouse(Vector2(931.0, 710.0))
	
	
	

func _process(_delta: float) -> void:
	if Global.isDead:
		get_tree().change_scene_to_file("res://scenes/base/island.tscn")
		
		bullet_time.stop()
	







func spawn_fish():
	if rarity <= 0.6:
		fish_to_spawn = FishDatabase.fish["Blue Fish"]
	else:
		fish_to_spawn = FishDatabase.fish["Purple Fish"]


	enemy_instance = fish_to_spawn.instantiate()
	add_child(enemy_instance)
	
	enemy_instance.global_position = Vector2(920.0, 186.0)
	
	
	

func _on_bullet_time_timeout() -> void:
	Global.gain_coins(enemy_instance.value)
	print(enemy_instance.fish_name)
	
	get_tree().change_scene_to_file("res://scenes/base/island.tscn")

func bullet_timer():
	bullet_time.wait_time = enemy_instance.bullet_hell_duration
	
	bullet_time.start()
	
