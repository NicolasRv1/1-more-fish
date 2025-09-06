extends Node

var fishing_pole : String = ""

var key_to_hut : bool = false

var talking : bool = false


func on_dialogue_finished(_dialogue_resource):
	talking = false
	DialogueManager.dialogue_ended.disconnect(on_dialogue_finished)
	Global.lock_player = false
