extends CharacterBody2D

var speed = 170
@onready var obj = get_parent().get_node("player")

@onready var cooldown := $cooldown
@export var firerate := 0.7
@onready var firingPositions := $FiringPosition
var gbullet := preload("res://Prefabs/Projectiles/ljbullet_1.tscn")
var gbullet3 := preload("res://Prefabs/Projectiles/ljbullet_3.tscn")
var gbullet4 := preload("res://Prefabs/Projectiles/ljbullet_4.tscn")
var gbullet6 := preload("res://Prefabs/Projectiles/ljbullet_6.tscn")

var gbullet2 := preload("res://Prefabs/Projectiles/ljbullet_2.tscn")
var gbullet5 := preload("res://Prefabs/Projectiles/ljbullet_5.tscn")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)

func fire():
	for child in firingPositions.get_children():
		var bullet := gbullet.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
		
		var bullet2 := gbullet6.instantiate()
		bullet2.global_position = child.global_position
		get_tree().current_scene.add_child(bullet2)
		
		var bullet3 := gbullet3.instantiate()
		bullet3.global_position = child.global_position
		get_tree().current_scene.add_child(bullet3)
		
		var bullet4 := gbullet4.instantiate()
		bullet4.global_position = child.global_position
		get_tree().current_scene.add_child(bullet4)
		
		if get_node("/root/Hud").diff == 3:
			var bullet5 := gbullet5.instantiate()
			bullet5.global_position = child.global_position
			get_tree().current_scene.add_child(bullet5)
			
			var bullet6 := gbullet6.instantiate()
			bullet6.global_position = child.global_position
			get_tree().current_scene.add_child(bullet6)
			
		if get_node("/root/Hud").diff == 4:
			var bullet5 := gbullet5.instantiate()
			bullet5.global_position = child.global_position
			get_tree().current_scene.add_child(bullet5)
			
			var bullet6 := gbullet2.instantiate()
			bullet6.global_position = child.global_position
			get_tree().current_scene.add_child(bullet6)

func _on_damage_timeout():
	$ljhitbox/damage.stop()
	$ljhitbox/damage2.start()
	$AnimatedSprite2D.play("death")

func _on_damage_2_timeout():
	$ljhitbox/damage2.stop()
	$AnimatedSprite2D.play("default")

func _on_death_timeout():
	$ljhitbox/death.stop()
	$attack.stop()
	$attack2.stop()
	speed = 0
	$AnimationPlayer.play("vanish")

func _on_attack_timeout():
	$attack.stop()
	$attack2.start()
	$AnimatedSprite2D.play("attack")
	fire()
	$ljhitbox/CollisionShape2D.set_deferred("disabled", true)

func _on_attack_2_timeout():
	$attack.start()
	$attack2.stop()
	$AnimatedSprite2D.play("default")
	$ljhitbox/CollisionShape2D.set_deferred("disabled", false)
