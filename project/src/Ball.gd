extends RigidBody2D

var angle = -45
var impulse = Vector2.RIGHT.rotated(deg2rad(angle)) * 250

func _process(delta):
	angle = clamp(angle, -90, 0)
	self.rotation_degrees = angle
	if Input.is_action_pressed("ui_up"):
		angle -= 5
	if Input.is_action_pressed("ui_down"):
		angle += 5
	if Input.is_action_just_pressed("launch"):
		impulse = Vector2.RIGHT.rotated(deg2rad(angle)) * 250
		apply_impulse(Vector2.ZERO, impulse)
