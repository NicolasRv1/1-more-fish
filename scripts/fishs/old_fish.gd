extends FishData

var start := 4.0
var num_bullets := 20
var h_range := 50.0
var burst_cooldown := 2.0
var canShoot := true
var fire_chance := 0.85
var left_bound_start := -1.0
var left_bound_end := 500.0
var right_bound_start := 1350.0
var right_bound_end := 1920.0
var stars_spawned := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Old Fish")
	value = 120
	bullet_pattern = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 200.0
	health = 150


func _process(_delta: float) -> void:
	await get_tree().create_timer(start).timeout
	
	if canShoot:
		shoot_wave()
		canShoot = false
		await get_tree().create_timer(burst_cooldown).timeout
		canShoot = true


func shoot_wave():
	var screen_width = get_viewport().size.x
	
	
	for i in range(num_bullets):
		var x_pos = (screen_width / (num_bullets + 1) * (i + 1))
		
		if x_pos >= left_bound_start and x_pos <= left_bound_end:
			continue
		if x_pos >= right_bound_start and x_pos <= right_bound_end:
			continue
		
		var bullet
		
		if randf() < fire_chance:
			randomize()
			
			if stars_spawned < 2 and randf() >= 0.075:
				bullet = bullet_pattern.instantiate()
				
				bullet.global_position = Vector2(x_pos, 420.0)
				bullet.velocity = Vector2.DOWN * bullet_speed

			else:
				bullet = star_shot.instantiate()
				stars_spawned += 1
				
				bullet.fish_ref = self
				
				bullet.global_position = Vector2(x_pos, 420.0)
				bullet.velocity = Vector2.DOWN * bullet_speed
		
		
			get_parent().add_child(bullet)
			stars_spawned = 0
		
		
		
