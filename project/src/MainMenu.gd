extends Node2D

var score

func new_game():
	score = 0
	$HUD.update_score(score)
	$HUD/ScoreLabel.visible = true
	$HUD/Title.visible = false


