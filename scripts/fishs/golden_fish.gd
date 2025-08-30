extends FishData


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Golden Fish")
	value = 120
	bullet_pattern = preload("res://scenes/bullet_patterns/basic_follow_pattern.tscn")
	bullet_speed = 800.0
	


func _on_cooldown_timeout() -> void:
	if player:
		var bullet = bullet_pattern.instantiate()
		bullet.speed = bullet_speed
		
		get_parent().add_child(bullet)
		bullet.global_position = $fire_spawn.global_position
		
		var direction = (player.global_position - self.global_position).normalized()
		bullet.set_direction(direction)
		



func _on_start_timeout() -> void:
	$cooldown.start()
