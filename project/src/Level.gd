extends Node2D

var score = 0
var ball
var remaining_projectiles = 3

func _ready():
	create_ball()
	
func create_ball():
	ball = load("res://src/Ball.tscn").instance()
	ball.position = Vector2(100, 470)
	call_deferred("add_child", ball)

func _on_Ball_body_entered(body):
	if body == $Coin:
		$Coin/CoinSound.play()
		score += 10
		$HUD/ScoreLabel.text = str(score)
		print("Coin get!")

func _on_KillZone_body_entered(body: RigidBody2D):
	if body.projectileName == "Ball":
		body.queue_free()
		remaining_projectiles -= 1
		print(remaining_projectiles)
		if remaining_projectiles > 0:
			create_ball()

func _on_Ball_sleeping_state_changed():
	$Ball.queue_free()
	if remaining_projectiles > 0:
		create_ball()
	
