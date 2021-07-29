extends KinematicBody2D

var motion = Vector2.ZERO
var speed = 200
var health = 20

onready var anim = $AnimationPlayer
onready var weapon = $Weapon
onready var bulletscene = preload("res://Bullet.tscn")


# GOGOGOGOGOGOGOGOGO Movement
func _physics_process(delta):
	
	anim.play("move")
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 1
	elif Input.is_action_pressed("ui_left"):
		motion.x = -1
	elif Input.is_action_pressed("ui_up"):
		motion.y = -1
	elif Input.is_action_pressed("ui_down"):
		motion.y = 1
	else:
		anim.stop()
		motion.x = 0
		motion.y = 0
	
	if health < 0:
		get_tree().reload_current_scene()
	
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	

	
	
	#thing I totaly didn't steal from stack exchange
	if get_global_mouse_position().x > position.x && $Sprite.flip_h == true:
		$Sprite.flip_h = false
		
	elif get_global_mouse_position().x < position.x && $Sprite.flip_h == false:
		$Sprite.flip_h = true 
	
	#if Input.is_action_just_pressed("attack"):
		#shoot()
	
#func shoot():
	#var bullet = bulletscene.instance()
	
	#get_parent().add_child(bullet)
	#bullet.position = $"Weapon 2/Position2D".global_position
	
	#bullet.motion = get_global_mouse_position() - bullet.position 
	
	
	motion = motion.normalized()
	move_and_slide(motion * speed)




	#Attack Input
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		weapon.attack()
	if event.is_action_pressed("attack2"):
		weapon.attack2()




#func hurt(damage: int):
	#anim.play("flash")
	#health -= damage
