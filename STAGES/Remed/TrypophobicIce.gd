extends CharacterBody2D

@onready var cooldown := $cooldown
@export var firerate := 3

@onready var firingPositions := $FiringPosition
var projectile1 := preload("res://Prefabs/Projectiles/try_projectile.tscn")

var health = 3

func _ready():
	if get_node("/root/Hud").diff == 1:
		health = 3
	if get_node("/root/Hud").diff == 2:
		health = 3
	if get_node("/root/Hud").diff == 3:
		health = 5
	if get_node("/root/Hud").diff == 4:
		health = 7
func fire():
	for child in firingPositions.get_children():
		var bullet = projectile1.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)

func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)	

func _on_tpi_hitbox_area_entered(area):
	if area.name == "rhitbox":
		$AnimatedSprite2D.play("attack")
		get_node("/root/Hud").health -= 1
		$punch.start()
	
	if area.name == "TryProjectile":
		health -= 1
		$hit.play()
		if health == 0:
			$tpiHitbox/bro.start()
			$tpiHitbox/death.start()

func _on_punch_timeout():
	$punch.stop()
	$AnimatedSprite2D.play("default")


func _on_death_timeout():
	queue_free()
