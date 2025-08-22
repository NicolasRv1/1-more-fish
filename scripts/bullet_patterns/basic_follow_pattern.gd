extends Area2D

var speed : float
var velocity : Vector2 = Vector2.ZERO
var lifetime := 8.0


func _physics_process(delta: float) -> void:
	position += velocity * delta
	
	lifetime -= delta
	if lifetime <= 0:
		queue_free()


func set_direction(direction: Vector2):
	velocity = direction.normalized() * speed
