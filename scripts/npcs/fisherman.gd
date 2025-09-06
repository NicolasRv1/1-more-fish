extends StaticBody2D

@export
var dialogue_resource : DialogueResource

@export
var dialogue_start : String = "fishing_pole"

var canTalk := false

const Balloon = preload("res://dialogue/balloon.tscn")





func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("action") and canTalk and !State.talking:
		State.talking = true
		Global.lock_player = true
		var balloon : Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		DialogueManager.dialogue_ended.connect(State.on_dialogue_finished)


	elif Input.is_action_just_pressed("action") and canTalk and State.talking:
		return







func _on_action_point_area_entered(_area: Area2D) -> void:
	canTalk = true


func _on_action_point_area_exited(_area: Area2D) -> void:
	canTalk = false
