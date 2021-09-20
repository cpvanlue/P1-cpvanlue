## The main gameplay scene
##
## Handles creation and deletion of the projectiles,
## as well as collisions with the targets. Gameplay score
## and inventory is also controlled here. 

extends Node2D

var score = 0
var ball
var remaining_projectiles = 3

func _ready():
	create_ball()
	$HUD/ProjectilesRemaining.text = "Projectiles Remaining: %d" % remaining_projectiles
	
func create_ball():
	ball = load("res://src/Ball.tscn").instance()
	ball.position = Vector2(100, 470)
	ball.contact_monitor = true
	ball.contacts_reported = 1
	ball.connect("body_entered", self, "_on_Ball_body_entered")
	ball.connect("sleeping_state_changed", self, "_on_Ball_sleeping_state_changed")
	ball.connect("launch", self, "_on_Ball_launched")
	call_deferred("add_child", ball)
	
func _on_Ball_launched():
	$LaunchSound.play()

func _on_Ball_body_entered(body):
	if body == $Coin or body == $Coin2 or body == $Coin3:
		$Coin/CoinSound.play()
		score += 10
		$HUD/ScoreLabel.text = str(score)

func destroy_ball():
	ball.call_deferred("free")
	remaining_projectiles -= 1
	$HUD/ProjectilesRemaining.text = "Projectiles Remaining: %d" % remaining_projectiles
	if remaining_projectiles > 0:
		create_ball()
	else:
		game_over()

func _on_KillZone_body_entered(_body: RigidBody2D):
	destroy_ball()

func _on_Ball_sleeping_state_changed():
	destroy_ball()
	
func game_over():
	var gameOver = load("res://src/GameOver.tscn").instance()
	gameOver.get_node("ScoreLabel").text = "Score: %d" % score
	call_deferred("add_child", gameOver)
