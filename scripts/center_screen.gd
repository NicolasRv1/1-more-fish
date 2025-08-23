extends Control


func _ready():
	var viewport_size = get_viewport_rect().size
	
	
	
	self.scale = viewport_size / Vector2(1920, 1080)
	
