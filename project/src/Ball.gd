extends RigidBody2D

var projectileName = "Ball"
var angle = -45
var strength = 250
var launchValue = 0
export var degrees_per_second = 50
export var strength_increment = 30

func _process(delta):
	$PowerBar.value = strength
	strength = clamp(strength, 50, 700)
	angle = clamp(angle, -90, 0)
	self.rotation_degrees = angle
	if Input.is_action_pressed("increase_angle"):
		angle -= degrees_per_second * delta
	if Input.is_action_pressed("decrease_angle"):
		angle += degrees_per_second * delta
	if Input.is_action_pressed("decrease_strength"):
		strength -= strength_increment
	if Input.is_action_pressed("increase_strength"):
		strength += strength_increment
	if Input.is_action_just_pressed("launch"):
		mode = RigidBody2D.MODE_RIGID
		$Laser.visible = false
		$Crosshair.visible = false
		$PowerBar.visible = false
		if launchValue == 0:
			var impulse = Vector2.RIGHT.rotated(deg2rad(angle)) * strength
			apply_impulse(Vector2.ZERO, impulse)
			$LaunchSound.play()
			launchValue = 1
			return
