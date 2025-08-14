extends Area2D

var forward_speed := 300.0
var return_speed := 350.0
var forward_time := 0.65
var lifetime := 1.5

var returning := false
var direction: Vector2
var shooter_position: Vector2

func _ready():
	await get_tree().create_timer(forward_time).timeout
	returning = true

func _physics_process(delta: float) -> void:
	if not returning:
		position += direction * forward_speed * delta
	else:
		var dir_to_shooter = (shooter_position - position).normalized()
		position += dir_to_shooter * return_speed * delta
	
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
