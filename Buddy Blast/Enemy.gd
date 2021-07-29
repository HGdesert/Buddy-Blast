extends KinematicBody2D


const speed = 100

var health = 30
var motion = Vector2()
var damage = 10
onready var anim = $AnimationPlayer
onready var funanim = $FunctionAnimations

onready var player = get_parent().get_parent().get_node("Player")

func hit(damage: int):
	funanim.play("flash")
	health -= damage
	$ProgressBar.value -= damage
	if health < 0:
		queue_free()


func _physics_process(delta):
	var move = (player.position - position).normalized()
	motion = move * speed
	move_and_collide(motion * delta)
	
	
	if motion < Vector2(0, 0):
		$Sprite.flip_h = false
		$Collision.scale.x = -1
		anim.play("move")
	else:
		$Sprite.flip_h = true
		$Collision.scale.x = 1
		anim.play("move")


func _on_Collision_body_entered(body):
	if body.has_method("hurt"):
		body.hurt(damage)
