extends RigidBody2D

var impulse = Vector2(100, -300)

func _process(delta):
	if Input.is_action_just_pressed("launch"):
		apply_impulse(Vector2.ZERO, impulse)
