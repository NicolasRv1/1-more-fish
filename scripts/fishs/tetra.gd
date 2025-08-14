extends FishData

var bullet_forward_time := 0.8
var bullet_lifetime := 2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fish_name = str("Tetra")
	bullet_hell_duration = float(10.0)
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
