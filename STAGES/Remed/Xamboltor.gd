extends Area2D

@onready var cooldown := $cooldown
@export var firerate := 0.6

@onready var firingPositions := $FiringPosition
var projectile1 := preload("res://Prefabs/Projectiles/xam_projectile.tscn")
var projectile2 := preload("res://Prefabs/Projectiles/xam_projectile.tscn")
var projectile3 := preload("res://Prefabs/Projectiles/xam_projectile.tscn")
var projectile4 := preload("res://Prefabs/Projectiles/xam_projectile.tscn")
var projectile5 := preload("res://Prefabs/Projectiles/xam_projectile2.tscn")

var health = 3

func fire():
	for child in firingPositions.get_children():
		var bullet = projectile1.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
		
		var bullet2 = projectile2.instantiate()
		bullet2.global_position = child.global_position
		get_tree().current_scene.add_child(bullet2)
		
		var bullet3 = projectile3.instantiate()
		bullet3.global_position = child.global_position
		get_tree().current_scene.add_child(bullet3)
		
		var bullet4 = projectile4.instantiate()
		bullet4.global_position = child.global_position
		get_tree().current_scene.add_child(bullet4)
		
		var bullet5 = projectile5.instantiate()
		bullet5.global_position = child.global_position
		get_tree().current_scene.add_child(bullet5)
			
func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)

func _on_body_entered(body):
	if body.name == "Xam-Projectile2":
		health -= 1
		damage()
		$hit.play()
		
		if health == 0:
			queue_free()

func damage():
	$AnimatedSprite2D.modulate = Color(164,167,0)
	$Timer.start()

func _on_timer_timeout():
	$Timer.stop()
	$AnimatedSprite2D.modulate = Color(1,1,1)


func _on_area_entered(area):
	if area.name == "Xam-Projectile2":
		health -= 1
		$hit.play()
		damage()
