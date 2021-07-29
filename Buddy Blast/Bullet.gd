extends KinematicBody2D


var motion = Vector2(1,0)
var speed = 300


func _physics_process(delta):
	
	var shoot_motion = move_and_collide(motion.normalized() * delta * speed)

