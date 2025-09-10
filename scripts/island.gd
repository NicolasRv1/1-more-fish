extends Node2D



func _ready() -> void:
	Global.lock_player = false
	Global.isDead = false
	
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	
	$UIManager/coinsTxt.text = str(Global.fish_coin)
	
	if State.win == "Fail":
		$bm.stop()
		$fail_sound.play()
		
		Engine.time_scale = 1
	
	elif State.win == "Victory":
		$bm.stop()
		$victory_sound.play()
	
	else:
		pass
	
	if Global.game_1st_loading:
		$player.position.x = 404.0
		$player.position.y = 503.0
	else:
		$player.position.x = 179.0
		$player.position.y = 332.0
	


func _on_victory_sound_finished() -> void:
	$bm.play()


func _on_fail_sound_finished() -> void:
	$bm.play()
