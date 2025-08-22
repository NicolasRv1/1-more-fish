extends FishData

var bullet_forward_time := 0.8
var bullet_lifetime := 1.8


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Tetra")
	bullet_hell_duration = float(21.0)
	value = 4
	bullet_pattern = preload("res://scenes/bullet_patterns/boomerang.tscn")
	bullet_speed = 1000.0
	


func _on_cooldown_timeout() -> void:
	if player:
		var bullet = bullet_pattern.instantiate()
		bullet.forward_time = bullet_forward_time
		bullet.lifetime = bullet_lifetime
		bullet.forward_speed = bullet_speed
		bullet.return_speed = bullet_speed - 300
		
		get_parent().add_child(bullet)
		bullet.global_position = $fire_spawn.global_position
		bullet.shooter_position = self.global_position
		
		
		bullet.direction = (player.global_position - self.global_position).normalized()
		




func _on_start_timeout() -> void:
	$cooldown.start()
	$burst_cooldown.start()


func _on_burst_cooldown_timeout() -> void:
	if player:
		var top = bullet_pattern.instantiate()
		var down = bullet_pattern.instantiate()
		
		top.forward_time = bullet_forward_time + 1.4
		top.lifetime = bullet_lifetime + 1.8
		top.forward_speed = bullet_speed - 300
		top.return_speed = bullet_speed - 150
		
		down.forward_time = bullet_forward_time + 1.4
		down.lifetime = bullet_lifetime + 1.8
		down.forward_speed = bullet_speed - 300
		down.return_speed = bullet_speed - 150
		
		get_parent().add_child(top)
		get_parent().add_child(down)
		
		top.global_position = TargetPositions.center + Vector2(810.0, -124.0)
		down.global_position = TargetPositions.center + Vector2(-810.0, 124.0)
		
		top.shooter_position = top.global_position
		down.shooter_position = down.global_position
		
		top.direction = Vector2(-1.0, 0.0)
		down.direction = Vector2(1.0, 0.0)
