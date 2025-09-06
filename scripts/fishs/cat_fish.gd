extends FishData

var bullet_forward_time := 1.2
var bullet_lifetime := 2.4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Cat Fish")
	value = 45
	bullet_pattern = preload("res://scenes/bullet_patterns/boomerang.tscn")
	secondary_shot = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 650.0
	health = 100
	


func _on_cooldown_timeout() -> void:
	var star_chance = randi() % 100
	
	if player and star_chance <= 69:
		var bullet = bullet_pattern.instantiate()
		bullet.forward_time = bullet_forward_time
		bullet.lifetime = bullet_lifetime
		bullet.forward_speed = bullet_speed
		bullet.return_speed = bullet_speed - 100
		
		get_parent().add_child(bullet)
		bullet.global_position = $fire_spawn.global_position
		bullet.shooter_position = self.global_position
		
		
		bullet.direction = (player.global_position - self.global_position).normalized()
	
	elif player and star_chance >= 70:
		var star = star_shot.instantiate()
		star.speed = bullet_speed - 100.0
		star.lifetime = bullet_lifetime - 1.65
		
		star.fish_ref = self
		
		get_parent().add_child(star)
		
		star.global_position = $fire_spawn.global_position
		
		var dir = (player.global_position - self.global_position).normalized()
		
		star.set_direction(dir)




func _on_start_timeout() -> void:
	$cooldown.start()
	$burst_cooldown.start()


func _on_burst_cooldown_timeout() -> void:
	var h_bullet = secondary_shot.instantiate()
	h_bullet.speed = bullet_speed - 300.0
	
	get_parent().add_child(h_bullet)
	
	h_bullet.global_position = TargetPositions.center + Vector2(842.0, 0.0)
	
	var dir = Vector2(-1.0, 0.0)
	
	h_bullet.set_direction(dir)
