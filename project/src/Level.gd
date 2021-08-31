extends Node2D


func _on_Coin_body_entered(body):
	$Coin.visible = false
	var score = int($HUD/ScoreLabel.text) + 10
	$HUD.update_score(score)
