extends Node2D

var score = 0


func _on_Ball_body_entered(body):
	if body == $Coin:
		$Coin/CoinSound.play()
		score += 10
		$HUD/ScoreLabel.text = str(score)
		print("Coin get!")
