extends Area2D

@onready var cooldown := $cooldown
@export var firerate := 0.9

@export var health: int = 5
@export var setscore: int = 200
@export var diffvis = true

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/Projectiles/sniperbullet.tscn")

func _ready():
	if diffvis == true:
		$Sprite2D.hide()
		$CollisionShape2D.set_deferred("disabled", true)
		$cooldown.one_shot = false
	if diffvis == false:
		$Sprite2D.show()
		$CollisionShape2D.set_deferred("disabled", false)
		$cooldown.one_shot = true
		
	if get_node("/root/Hud").diff == 4:
		$Sprite2D.show()
		$CollisionShape2D.set_deferred("disabled", false)
		$cooldown.one_shot = true
	else:
		$Sprite2D.hide()
		$CollisionShape2D.set_deferred("disabled", true)
		$cooldown.one_shot = false
		
func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
			
func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 20
	if health <= 0:
		get_node("/root/Hud").score += setscore
		queue_free()
