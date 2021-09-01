extends Node2D

var score = 0

func _on_Coin_body_entered(body):
	$Coin.visible = false
	score += 10
	$HUD/ScoreLabel.text = str(score)
	print("Coin get!")
