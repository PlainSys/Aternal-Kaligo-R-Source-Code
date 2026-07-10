extends CharacterBody2D

@export var speed = 400
const BULLET = preload("res://Prefabs/Projectiles/bullet.tscn")

#var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("Right"):
		velocity.x += 1
	elif Input.is_action_pressed("Left"):
		velocity.x -= 1
	if Input.is_action_pressed("Up"):
		velocity.y -= 1
	if Input.is_action_pressed("Down"):
		velocity.y += 1
	if Input.is_action_just_pressed("Attack"):
		$shoot.play()
		var bullet = BULLET.instantiate()
		bullet.set_bullet_direction(1)
		get_parent().add_child(bullet)
		bullet.position = $Muzzle.global_position
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
