extends Area2D


onready var anim = $AnimationPlayer
var damage = 10


func _physics_process(delta):
	look_at(get_global_mouse_position())
	

func attack():
	anim.play("Swing")

func attack2():
	anim.play("Roll")


func _on_Weapon_body_entered(body):
	if body.has_method("hit"):
		body.hit(damage)
		
