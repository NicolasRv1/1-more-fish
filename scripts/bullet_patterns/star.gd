extends Area2D

var speed : float
var velocity : Vector2 = Vector2.ZERO
var lifetime := 10.0

@onready
var fish_player := get_parent().get_node("fish_player")

var fish_ref : StaticBody2D = null



func _physics_process(delta: float) -> void:
	position += velocity * delta
	
	lifetime -= delta
	if lifetime <= 0:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	
	if !fish_player.parry and fish_ref != null:
		queue_free()
		fish_ref.health -= 50
	elif fish_player.parry and fish_ref != null:
		pass
	

func set_direction(direction: Vector2):
	velocity = direction.normalized() * speed
