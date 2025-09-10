extends Area2D





func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	$death_sound.play()
	Engine.time_scale = 0.5


func _on_death_sound_finished() -> void:
	State.win = "Fail"
	Global.isDead = true
