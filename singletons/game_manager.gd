extends Node

const GROUP_PLAYER: String = "player"

const SCROLL_SPEED: float = 120.0

var menu_scene: PackedScene = preload("res://menu.tscn")
var game_scene: PackedScene = preload("res://main.tscn")

func load_game_scene() -> void:
	get_tree().change_scene_to_packed(game_scene)

func load_menu_scene() -> void:
	get_tree().change_scene_to_packed(menu_scene)
