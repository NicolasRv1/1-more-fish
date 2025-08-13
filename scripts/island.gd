extends Node2D



func _ready() -> void:
	Global.lock_player = false
	Global.isDead = false
	
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	$UIManager/coinsTxt.text = str(Global.fish_coin)
	
	if Global.game_1st_loading:
		$player.position.x = 404.0
		$player.position.y = 503.0
	else:
		$player.position.x = 179.0
		$player.position.y = 332.0
	
