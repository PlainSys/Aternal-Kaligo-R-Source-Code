extends Area2D

@export var health: int = 7
@export var setscore: int = 130

var speed = 160
var velocity = Vector2()
@onready var obj = get_parent().get_node("player")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	velocity = speed * delta * dir
	translate(velocity)
	
	if get_node("/root/Hud").diff == 1:
		speed = 140
	if get_node("/root/Hud").diff == 2:
		speed = 160
	if get_node("/root/Hud").diff == 3:
		speed = 170
	if get_node("/root/Hud").diff == 4:
		speed = 225

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	if health <= 0:
		get_node("/root/Hud").score += setscore
		$AnimatedSprite2D.play("death")
		$death.start()

func _on_death_timeout():
	$death.stop()
	queue_free()
