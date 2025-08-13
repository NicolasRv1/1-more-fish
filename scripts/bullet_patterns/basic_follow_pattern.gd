extends Area2D

var speed : float
var velocity : Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
	position += velocity * delta


func set_direction(direction: Vector2):
	velocity = direction.normalized() * speed
