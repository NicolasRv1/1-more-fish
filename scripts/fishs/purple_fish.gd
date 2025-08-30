extends FishData

var spread_angle := 45.0
var bullets_per_burst := 4

var spread_angle2 := 50.0
var bullets_per_burst2 := 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Purple Fish")
	value = 60
	bullet_pattern = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	secondary_shot = preload("res://scenes/bullet_patterns/burst_pattern.tscn")
	bullet_speed = 1000.0
	health = 100
	



func _on_cooldown_timeout() -> void:
	var star_chance = randi() % 100
	
	if player and star_chance <= 69:
		var bullet = bullet_pattern.instantiate()
		
		bullet.speed = bullet_speed
		
		get_parent().add_child(bullet)
		
		bullet.global_position = $fire_spawn.global_position
		
		var direction = Vector2(0.0, 1.0)
		bullet.set_direction(direction)
	
	elif player and star_chance >= 70:
		var star = star_shot.instantiate()
		star.speed = bullet_speed - 100.0
		
		star.fish_ref = self
		
		get_parent().add_child(star)
		
		star.global_position = $fire_spawn.global_position
		
		var dir = Vector2(0.0, 1.0)
		
		star.set_direction(dir)


func _on_start_timeout() -> void:
	$burst_cooldown.start()


func _on_burst_cooldown_timeout() -> void:
	$cooldown.start()
	
	if player:
		var base_direction1 = Vector2(-1.0, 0.0)
		var base_direction2 = Vector2(1.0, 0.0)
		
		var base_angle = base_direction1.angle()
		var base_angle2 = base_direction2.angle()
		
		var start_angle = base_angle - deg_to_rad(spread_angle) / 2.0
		var start_angle2 = base_angle2 - deg_to_rad(spread_angle2) / 2.0
		
		var angle_step = deg_to_rad(spread_angle) / (bullets_per_burst - 1)
		var angle_step2 = deg_to_rad(spread_angle2) / (bullets_per_burst2 - 1)
		
		for i in range(bullets_per_burst):
			var bullet = secondary_shot.instantiate()
			var burst_speed = bullet_speed - 600.0
			
			get_parent().add_child(bullet)
			
			bullet.global_position = TargetPositions.center + Vector2(810.0, 0.0)
			
			var angle = start_angle + i * angle_step
			
			var direction = Vector2.RIGHT.rotated(angle)
			
			bullet.linear_velocity = direction * burst_speed



		for i in range(bullets_per_burst2):
			var bullet2 = secondary_shot.instantiate()
			var burst_speed = bullet_speed - 600.0
			
			get_parent().add_child(bullet2)
			bullet2.global_position = TargetPositions.center + Vector2(-810.0, 0.0)
			
			var angle2 = start_angle2 + i * angle_step2
			
			var dir2 = Vector2.RIGHT.rotated(angle2)
			
			bullet2.linear_velocity = dir2 * burst_speed
