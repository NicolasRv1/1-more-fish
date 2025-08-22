extends FishData




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Old Fish")
	bullet_hell_duration = float(30.0)
	value = 7
	bullet_pattern = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 100.0
	


func _on_cooldown_timeout() -> void:
	if player:
		var bullet = bullet_pattern.instantiate()
		
		bullet.speed = bullet_speed + 60.0
		bullet.lifetime = 16.0
		
		get_parent().add_child(bullet)
		bullet.global_position = TargetPositions.center + Vector2(766.0, 0.0)
		
		var direction = (player.global_position - bullet.global_position).normalized()
		bullet.set_direction(direction)
		
		var bullet2 = bullet_pattern.instantiate()
		
		bullet2.speed = bullet_speed + 120.0
		
		get_parent().add_child(bullet2)
		bullet2.global_position = $fire_spawn.global_position
		
		var dir2 = (player.global_position - self.global_position).normalized()
		bullet2.set_direction(dir2)



func _on_start_timeout() -> void:
	$cooldown.start()
	$burst_cooldown.start()


func _on_burst_cooldown_timeout() -> void:
	
	var up_right = bullet_pattern.instantiate()
	var up_left = bullet_pattern.instantiate()
	
	
	up_right.speed = bullet_speed
	up_left.speed = bullet_speed
	
	
	get_parent().add_child(up_right)
	get_parent().add_child(up_left)

	
	up_right.global_position = TargetPositions.center_right + Vector2(0.0, -300.0)
	up_left.global_position = TargetPositions.center_left + Vector2(0.0, -300.0)

	
	var up_dir = Vector2(0.0, 1.0)
	
	up_right.set_direction(up_dir)
	up_left.set_direction(up_dir)
	
