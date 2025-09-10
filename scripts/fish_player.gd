extends CharacterBody2D


@export
var fish_sense := 0.0

var parry : bool = true



func _ready() -> void:
	Global.player = self
	
	
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		self.global_position = get_global_mouse_position()
	

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("parry") and parry:
		$parry_cooldown.start()
		parry = false
	




func _on_parry_cooldown_timeout() -> void:
	parry = true
