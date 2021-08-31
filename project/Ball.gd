extends RigidBody2D

func _draw():
	draw_circle(Vector2.ZERO, $CollisionShape2D.shape.radius, Color.wheat)
