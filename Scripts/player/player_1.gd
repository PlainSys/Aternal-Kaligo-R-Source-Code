extends CharacterBody2D

@onready var animationPlayer = $Anim

@export var SPEED = 450
@export var invis = false

const BULLET = preload("res://Prefabs/Projectiles/bullet.tscn")

func _ready():
	animationPlayer.play("Idle")

func _process(delta):
	if invis == true:
		$phitbox/CollisionShape2D.set_deferred("disabled", true)

func _physics_process(delta):
	get_input3()
	
	move_and_slide()

	if SPEED == 0:
		animationPlayer.play("Idle")
	elif Input.is_action_just_pressed("Attack"):
		animationPlayer.play("Shoot")

func get_input3():
	var running = false
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
	
	if Input.is_action_pressed("Right"):
		running = true
		$Sprite2D.flip_h = false
		$Sprite2D.position.x = 0
		$Muzzle.position.x = 10
		animationPlayer.play("Run")
		
		if sign($Muzzle.position.x) == -1:
			$Muzzle.position.x *= -1
			
	elif Input.is_action_pressed("Left"):
		running = true
		$Sprite2D.position.x = -63
		$Sprite2D.flip_h = true
		$Muzzle.position.x = -54
		animationPlayer.play("Run")
		
		if sign($Muzzle.position.x) == 1:
			$Muzzle.position.x *= -1
	
	if Input.is_action_pressed("Down"):
		running = true
		animationPlayer.play("Run")
	elif Input.is_action_pressed("Up"):
		running = true
		animationPlayer.play("Run")
	
	if Input.is_action_just_pressed("Attack"):
		animationPlayer.play("Shoot")
		shooting()
		
	if !running:
		animationPlayer.play("Idle")
		#animationPlayer.stop("Run")

func shooting():
	var bullet = BULLET.instantiate()
	if sign($Muzzle.position.x) == 1:
		bullet.set_bullet_direction(1)
	else:
		bullet.set_bullet_direction(-1)
	get_parent().add_child(bullet)
	bullet.position = $Muzzle.global_position
	$shootSound.play()

func _on_phitbox_area_entered(area):
	if area.is_in_group("damage"):
		iframes()
		get_node("/root/Hud").health -= 1
		
	
func iframes():
	$CollisionShape2D.set_deferred("disabled", true)
	$phitbox/CollisionShape2D.set_deferred("disabled", true)
	$iframe.start()
	$Sprite2D.modulate = Color(164,167,0)

func _on_iframe_timeout():
	$CollisionShape2D.set_deferred("disabled", false)
	$phitbox/CollisionShape2D.set_deferred("disabled", false)
	$Sprite2D.modulate = Color(1,1,1)
	$iframe.stop()

func fullinvis():
	$phitbox/CollisionShape2D.set_deferred("disabled", false)

