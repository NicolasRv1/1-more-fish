extends FishData

var bursts := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Cat Fish")
	value = 45
	bullet_pattern = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 250.0
	health = 100
	


func _on_cooldown_timeout() -> void:
	if bursts > 2 and bursts < 5 or bursts > 7:
		await $burst_cooldown.wait_time
		var star = star_shot.instantiate()
		star.speed = bullet_speed
		star.fish_ref = self
		
		get_parent().add_child(star)
		
		star.global_position = TargetPositions.center_up + Vector2(0.0, -210.0)
		
		var direction = Vector2(0.0, 1.0)
		
		star.set_direction(direction)
	





func _on_burst_cooldown_timeout() -> void:
	if $cooldown.is_stopped():
		$cooldown.start()
	
	bursts += 1
	
	if bursts <= 2 or bursts > 5 and bursts < 7:
		var first_right_bullet = bullet_pattern.instantiate()
		var second_right_bullet = bullet_pattern.instantiate()
		var third_right_bullet = bullet_pattern.instantiate()
		
		var first_left_bullet = bullet_pattern.instantiate()
		var second_left_bullet = bullet_pattern.instantiate()
		
		first_right_bullet.speed = bullet_speed
		second_right_bullet.speed = bullet_speed
		third_right_bullet.speed = bullet_speed
		
		first_left_bullet.speed = bullet_speed
		second_left_bullet.speed = bullet_speed
		
		get_parent().add_child(first_right_bullet)
		get_parent().add_child(second_right_bullet)
		get_parent().add_child(third_right_bullet)
		
		get_parent().add_child(first_left_bullet)
		get_parent().add_child(second_left_bullet)
		
		first_right_bullet.global_position = TargetPositions.center_up + Vector2(842.0, -20.0)
		second_right_bullet.global_position = TargetPositions.center + Vector2(842.0, 10.0)
		third_right_bullet.global_position = TargetPositions.center_down + Vector2(842.0, 10.0)
		
		first_left_bullet.global_position = TargetPositions.center_up + Vector2(-842.0, 40.0)
		second_left_bullet.global_position = TargetPositions.center_down + Vector2(-842.0, -50.0)
		
		var right_dir = Vector2(-1.0, 0.0)
		var left_dir = Vector2(1.0, 0.0)
		
		first_right_bullet.set_direction(right_dir)
		second_right_bullet.set_direction(right_dir)
		third_right_bullet.set_direction(right_dir)
		
		first_left_bullet.set_direction(left_dir)
		second_left_bullet.set_direction(left_dir)
	
	else:
		$burst_cooldown.stop()
		$burst_cooldown.start()
		return
