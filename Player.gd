extends RigidBody2D
class_name Player
signal died
var FLAP_FORCE = -340

var started = false
var MAX_ROTATION_DEGREES = -30

onready var animation = $AnimationPlayer
onready var hit = $Hit
onready var wing = $Wing
var alive = true
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("flap") and alive:
		if started == false:
			start()
		flap()
		
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
		
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 5
		else:
			angular_velocity = 0
		
func start():
	started = true
	gravity_scale = 10
	animation.play("flap")
	
func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -15
	wing.play()
	
func die():
	if !alive: return	
	alive = false
	animation.stop()
	hit.play()
	emit_signal("died")
	
	
	
	
	
