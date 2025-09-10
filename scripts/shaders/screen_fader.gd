extends CanvasLayer

@onready var rand_pixels : ColorRect = $rand_pixels
@onready var mat : ShaderMaterial = rand_pixels.material

func fade_in(duration: float = 1.0) -> void:
	# Transparent -> Black
	mat.set_shader_parameter("progress", 0.0)
	var tween := create_tween()
	tween.tween_property(mat, "shader_parameter/progress", 1.0, duration)
	await tween.finished


func fade_out(duration: float = 1.0) -> void:
	#Black -> Transparent
	mat.set_shader_parameter("progress", 1.0)
	var tween := create_tween()
	tween.tween_property(mat, "shader_parameter/progress", .0, duration)
	await tween.finished
