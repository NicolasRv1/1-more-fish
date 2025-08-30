extends FishData

var spread_angle := 30.0
var bullets_per_burst := 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Bass")
	value = 10
	bullet_pattern = preload("res://scenes/bullet_patterns/burst_pattern.tscn")
	secondary_shot = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 200.0
	health = 100
	



func _on_cooldown_timeout() -> void:
	var star_chance = randi() % 100
	
	if player and star_chance <= 69:
		var base_direction = (player.global_position - self.global_position).normalized()
		var base_angle = base_direction.angle()
		
		var start_angle = base_angle - deg_to_rad(spread_angle) / 2.0
		var angle_step = deg_to_rad(spread_angle) / (bullets_per_burst - 1)
		
		for i in range(bullets_per_burst):
			var bullet = bullet_pattern.instantiate()
			get_parent().add_child(bullet)
			bullet.global_position = $fire_spawn.global_position
			
			var angle = start_angle + i * angle_step
			var direction = Vector2.RIGHT.rotated(angle)
			bullet.linear_velocity = direction * bullet_speed
	
	elif player and star_chance >= 70:
		var star = star_shot.instantiate()
		star.speed = bullet_speed + 300.0
		
		star.fish_ref = self
		
		get_parent().add_child(star)
		
		star.global_position = $fire_spawn.global_position
		
		var dir = (player.global_position - self.global_position).normalized()
		
		star.set_direction(dir)



func _on_start_timeout() -> void:
	$cooldown.start()
	$burst_cooldown.start()


func _on_burst_cooldown_timeout() -> void:
	var burst = secondary_shot.instantiate()
	burst.speed = bullet_speed
	
	get_parent().add_child(burst)
	burst.global_position = TargetPositions.center + Vector2(-842.0, 0.0)
	
	var second_dir = Vector2(842.0, 0.0)
	burst.set_direction(second_dir)
