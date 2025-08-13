extends Area2D

var canEnter = false


func _on_action_point_entered(_area: Area2D) -> void:
	canEnter = true
	


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action") and canEnter:

		if Global.current_scene == "island":
			get_tree().change_scene_to_file("res://scenes/base/insideHut.tscn")
			Global.current_scene = "hut"

		elif Global.current_scene == "hut":
			get_tree().change_scene_to_file("res://scenes/base/island.tscn")
			Global.current_scene = "island"
	




func _on_area_exited(_area: Area2D) -> void:
	canEnter = false
