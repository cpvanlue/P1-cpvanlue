extends Node2D

var score

func _on_Button_pressed():
	var _ignored = get_tree().change_scene("res://src/MainMenu.tscn")
