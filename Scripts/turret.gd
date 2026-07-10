extends Area2D

@onready var cooldown := $cooldown
@export var firerate := 0.6

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/Projectiles/ebullet.tscn")
var plBulletleft := preload("res://Prefabs/Projectiles/ebulletleft.tscn")
var plBulletup := preload("res://Prefabs/Projectiles/ebulletup.tscn")
var plBulletdown := preload("res://Prefabs/Projectiles/ebulletdown.tscn")

@export var shootDir = 1
# 1 = normal | 2 = left | 3 = up | 4 = down

@export var diffvis = false

func _ready():
	if diffvis == true:
		if get_node("/root/Hud").diff == 4:
			$Sprite2D.hide()
			$CollisionShape2D.set_deferred("disabled", true)
			$cooldown.one_shot = false
	
func fire():
	for child in firingPositions.get_children():
		var bullet
		if shootDir == 1:
			bullet = plBullet.instantiate()
		elif shootDir ==  2:
			bullet = plBulletleft.instantiate()
		elif shootDir ==  3:
			bullet = plBulletup.instantiate()
		elif shootDir ==  4:
			bullet = plBulletdown.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
			
func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)
