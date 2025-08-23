extends CharacterBody2D


@export
var fish_sense := 0.0


func _ready() -> void:
	Global.player = self
	
	
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.global_position = get_global_mouse_position()
