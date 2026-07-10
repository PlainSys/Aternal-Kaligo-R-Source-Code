extends CharacterBody2D

@onready var animationPlayer = $AnimationPlayer

@export var SPEED = 800
@export var invis = false

const BULLET = preload("res://Prefabs/Projectiles/bullet.tscn")

func _ready():
	animationPlayer.play("idle")

func _process(delta):
	if invis == true:
		$rhitbox/CollisionShape2D.set_deferred("disabled", true)

func _physics_process(delta):
	get_input3()
	
	move_and_slide()

	if SPEED == 0:
		animationPlayer.play("idle")
	elif Input.is_action_just_pressed("Attack"):
		animationPlayer.play("attack")

func get_input3():
	var running = false
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = input_direction * SPEED
	
	if Input.is_action_pressed("Right"):
		running = true
		$Sprite2D.flip_h = false
		#$Sprite2D.position.x = 0
		#$Muzzle.position.x = 10
		animationPlayer.play("run")
			
	elif Input.is_action_pressed("Left"):
		running = true
		#$Sprite2D.position.x = -63
		$Sprite2D.flip_h = true
		#$Muzzle.position.x = -54
		animationPlayer.play("run")
	
	if Input.is_action_pressed("Down"):
		running = true
		animationPlayer.play("run")
	elif Input.is_action_pressed("Up"):
		running = true
		animationPlayer.play("run")
	
	if Input.is_action_just_pressed("Attack"):
		animationPlayer.play("attack")
		$sword1/CollisionShape2D.set_deferred("disabled", false)
		$cooldown.start()
		
	if !running:
		animationPlayer.play("idle")
		#animationPlayer.stop("Run")

func _on_cooldown_timeout():
	$cooldown.stop()
	$sword1/CollisionShape2D.set_deferred("disabled", true)

func _on_rhitbox_area_entered(area):
	if area.is_in_group("damage"):
		iframes()
		get_node("/root/Hud").health -= 1

func iframes():
	$CollisionShape2D.set_deferred("disabled", true)
	$rhitbox/CollisionShape2D.set_deferred("disabled", true)
	$iframe.start()
	$Sprite2D.modulate = Color(164,167,0)

func _on_iframe_timeout():
	$CollisionShape2D.set_deferred("disabled", false)
	$rhitbox/CollisionShape2D.set_deferred("disabled", false)
	$Sprite2D.modulate = Color(1,1,1)
	$iframe.stop()

func _on_sword_1_area_entered(area):
	if area.is_in_group("damage"):
		area.damage(2)
