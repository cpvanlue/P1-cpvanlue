extends Node2D



func _on_Button_pressed():
	var _ignored = get_tree().change_scene("res://src/Level.tscn")
	queue_free()
