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
	var up_bullet = bullet_pattern.instantiate()
	var bot_bullet = bullet_pattern.instantiate()
	
	up_bullet.speed = bullet_speed - 200.0
	bot_bullet.speed = bullet_speed - 200.0
	
	get_parent().add_child(up_bullet)
	get_parent().add_child(bot_bullet)
	
	up_bullet.global_position = TargetPositions.center_up + Vector2(842.0, -20.0)
	bot_bullet.global_position = TargetPositions.center_down + Vector2(-842.0, 20.0)
	
	var up_dir = Vector2(bot_bullet.position.x - up_bullet.position.x, 0.0)
	var bot_dir = Vector2(up_bullet.position.x - bot_bullet.position.x, 0.0)
	
	up_bullet.set_direction(up_dir)
	bot_bullet.set_direction(bot_dir)
	
	
