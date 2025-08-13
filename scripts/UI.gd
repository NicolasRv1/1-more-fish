extends CanvasLayer

func _ready() -> void:
	Global.gained_coins.connect(update_coin_display)

func update_coin_display(_gained_coins):
	$coinsTxt.text = str(Global.fish_coin)
