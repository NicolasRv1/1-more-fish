extends Node2D


func _ready() -> void:
	$player.position.x = 410.0
	$player.position.y = 377.0
	$player.animations.animation = "idleUp"
	$UIManager/coinsTxt.text = str(Engine.get_frames_per_second())
	$UIManager/coinsTxt.text = str(Global.fish_coin)
	$player.action_point.position = Vector2(0.0, -57.0)
	State.win = ""
