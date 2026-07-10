extends Area2D

@onready var cooldown := $cooldown
@export var firerate := 0.7

var health = 10

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/Projectiles/ebulletleft.tscn")
var eBullet := preload("res://Prefabs/Projectiles/ebullet.tscn")

func _ready():
	if get_node("/root/Hud").diff == 1:
		$Timer.wait_time = 1
		$Timer2.wait_time = 1
		health = 9
	if get_node("/root/Hud").diff == 2:
		$Timer.wait_time = 0.5
		$Timer2.wait_time = 0.5
		health = 10
	if get_node("/root/Hud").diff == 3:
		$Timer.wait_time = 0.3
		$Timer2.wait_time = 0.3
		health = 15
	if get_node("/root/Hud").diff == 4:
		$Timer.wait_time = 0.06
		$Timer2.wait_time = 0.06
		health = 20

var right = false

func _on_area_entered(area):
	if area.name == "phitbox" || area.name == "rhitbox":
		$AnimatedSprite2D.play("slash")
		get_node("/root/Hud").health -= 1
	if area.name == "Bullet" || area.name == "sword1":
		health -= 1
		#$hit.play()
	if health <= 0:
		$death.start()
		$CollisionShape2D.set_deferred("disabled", true)
		$AnimatedSprite2D.play("default")
		$Timer2.stop()
		$Timer.stop()


func _on_timer_timeout():
	if right == false:
		$Timer.stop()
		$Timer2.start()
		$AnimatedSprite2D.flip_h = true
		fire()
		$AnimatedSprite2D.play("shoot")
		$AnimatedSprite2D.position.x -= 150
		$FiringPosition.position.x -= 150
		$FiringPosition2.position.x -= 150
		$CollisionShape2D.position.x -= 150
	if right == true:
		$Timer.stop()
		$Timer2.start()
		$AnimatedSprite2D.flip_h = false
		fire2()
		$AnimatedSprite2D.play("shoot")
		$AnimatedSprite2D.position.x += 150
		$FiringPosition.position.x += 150
		$FiringPosition2.position.x += 150
		$CollisionShape2D.position.x += 150
		
func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
		
func fire2():
	for child in $FiringPosition2.get_children():
		var bullet2 := eBullet.instantiate()
		bullet2.global_position = child.global_position
		get_tree().current_scene.add_child(bullet2)


func _on_timer_2_timeout():
	$Timer.start()
	$AnimatedSprite2D.play("default")
	$Timer2.stop()

func _on_body_entered(body):
	if body.name == "door1":
		right = true
	if body.name == "door2":
		right = false
