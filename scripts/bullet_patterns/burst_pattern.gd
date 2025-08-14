extends Area2D


var speed : float
var linear_velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += linear_velocity * delta
