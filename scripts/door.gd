extends Area2D

@export
var dialogue_resource : DialogueResource

@export
var dialogue_start : String = "door"

var canEnter = false

const Balloon = preload("res://dialogue/balloon.tscn")



func _on_action_point_entered(_area: Area2D) -> void:
	canEnter = true
	


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action") and canEnter and State.key_to_hut:

		if Global.current_scene == "island":
			Global.lock_player = true
			await ScreenFader.fade_in(0.5)
			get_tree().change_scene_to_file("res://scenes/base/insideHut.tscn")
			Global.current_scene = "hut"
			Global.lock_player = false
			await ScreenFader.fade_out(0.5)

		elif Global.current_scene == "hut":
			Global.lock_player = true
			await ScreenFader.fade_in(0.5)
			get_tree().change_scene_to_file("res://scenes/base/island.tscn")
			Global.current_scene = "island"
			Global.lock_player = false
			await ScreenFader.fade_out(0.5)

	elif Input.is_action_just_pressed("action") and canEnter and !State.key_to_hut and !State.talking:
		State.talking = true
		Global.lock_player = true
		var balloon : Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		DialogueManager.dialogue_ended.connect(State.on_dialogue_finished)




func _on_area_exited(_area: Area2D) -> void:
	canEnter = false
