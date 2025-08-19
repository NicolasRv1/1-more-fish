extends FishData


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Blue Fish")
	bullet_hell_duration = float(10.0)
	value = 8
	bullet_pattern = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 600.0
	





func _on_cooldown_timeout() -> void:
	if player:
		# follow_bullet = bullet that follows the player pos
		var follow_bullet = bullet_pattern.instantiate()
		follow_bullet.speed = bullet_speed + 100.0
		
		get_parent().add_child(follow_bullet)
		follow_bullet.global_position = $fire_spawn.global_position
		
		var direction = (player.global_position - self.global_position).normalized()
		follow_bullet.set_direction(direction)
		





func _on_start_timeout() -> void:
	$cooldown.start()
	$burst_cooldown.start()


func get_screen_point(perc: Vector2) -> Vector2:
	return get_viewport().get_visible_rect().size * perc


func _on_burst_cooldown_timeout() -> void:
	var left_bullet = bullet_pattern.instantiate()
	left_bullet.speed = bullet_speed - 300.0
	
	var right_bullet = bullet_pattern.instantiate()
	right_bullet.speed = bullet_speed - 300.0
	
	get_parent().add_child(left_bullet)
	get_parent().add_child(right_bullet)
	
	left_bullet.global_position = $fire_spawn.global_position
	right_bullet.global_position = $fire_spawn.global_position
	
	var left_dir = (TargetPositions.bottom_left_target_pos - self.global_position).normalized()
	var right_dir = (TargetPositions.bottom_right_target_pos - self.global_position).normalized()
	
	left_bullet.set_direction(left_dir)
	right_bullet.set_direction(right_dir)
