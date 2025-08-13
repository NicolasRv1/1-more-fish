extends Node

signal gained_coins(int)
var fish_coin : int

var current_scene = "island"
var game_1st_loading = true
var lock_player = false
var isDead = false
var player : Node2D = null

func gain_coins(coins_gained: int):
	fish_coin += coins_gained
	emit_signal("gained_coins", coins_gained)

func _save() -> void:
	var config = ConfigFile.new()
	config.set_value("Settings", "Coins", fish_coin)
	config.save("C:/Users/user/Desktop/trabaio/pessoal/godozinha/settings.cfg")

func _load() -> void:
	var config = ConfigFile.new()
	var result = config.load("C:/Users/user/Desktop/trabaio/pessoal/godozinha/settings.cfg")
	
	if result == OK:
		fish_coin = config.get_value("Settings", "Coins")
	else:
		printerr("load error")
