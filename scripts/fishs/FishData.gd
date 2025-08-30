extends Node
class_name FishData

var rarity : int
var fish_name : String
var health : int
var bullet_pattern : PackedScene
var secondary_shot : PackedScene
var star_shot : PackedScene = preload("res://scenes/bullet_patterns/star.tscn")
var bullet_speed : float
var value : int
var player = Global.player
