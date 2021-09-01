extends RigidBody2D

var angle = -45
var strength = 250
var launchValue = 0

func _process(delta):
	$PowerBar.value = strength
	strength = clamp(strength, 50, 700)
	angle = clamp(angle, -90, 0)
	self.rotation_degrees = angle
	if Input.is_action_pressed("ui_up"):
		angle -= 1
	if Input.is_action_pressed("ui_down"):
		angle += 1
	if Input.is_action_pressed("ui_left"):
		strength -= 30
	if Input.is_action_pressed("ui_right"):
		strength += 30
	if Input.is_action_just_pressed("launch"):
		$Laser.visible = false
		$Crosshair.visible = false
		$PowerBar.visible = false
		if launchValue == 0:
			var impulse = Vector2.RIGHT.rotated(deg2rad(angle)) * strength
			apply_impulse(Vector2.ZERO, impulse)
			launchValue = 1
