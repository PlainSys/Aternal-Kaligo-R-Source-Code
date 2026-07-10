extends Area2D

@export var speed:float = 730
@export var health: int = 2
@export var setscore: int = 50
@onready var cooldown := $cooldown
@export var firerate := 0.5

@export var canShoot = true

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/Projectiles/car_bullet.tscn")

func _physics_process(delta):
	position.x -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func damage(amount: int):
	health -= amount
	$hit.play()
	get_node("/root/Hud").score += 2
	if health <= 0:
		$AnimatedSprite2D.play("death")
		$death.play()
		$Timer.start()
		get_node("/root/Hud").score += setscore

func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
			
func _process(delta):
	if cooldown.is_stopped():
		if canShoot == true:
			fire()
		cooldown.start(firerate)

func _on_timer_timeout():
	queue_free()
