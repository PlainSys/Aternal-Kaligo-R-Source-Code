extends CharacterBody2D

var speed = 250
@onready var obj = get_parent().get_node("player")
@onready var cooldown := $cooldown
@export var firerate := 0.7

@export var doorKills = false

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/Projectiles/ebullet.tscn")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)

func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
			
func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)
		
func _on_death_timeout():
	$death.stop()
	queue_free()


func _on_timer_timeout():
	$tbhitbox/Timer.stop()
	$AnimatedSprite2D.play("death")
	$death.start()
	if doorKills == true:
		get_node("/root/Hud").doorkills += 1
