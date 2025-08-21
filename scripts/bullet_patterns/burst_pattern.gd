extends Area2D


var speed : float
var linear_velocity := Vector2.ZERO
var lifetime := 6.0

func _physics_process(delta: float) -> void:
	position += linear_velocity * delta
	
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
