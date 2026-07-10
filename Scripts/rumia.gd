extends CharacterBody2D

var speed = 350
@onready var obj = get_parent().get_node("player")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
	
func _ready():
	if get_node("/root/Hud").diff == 1:
		speed = 300
	if get_node("/root/Hud").diff == 2:
		speed = 350
	if get_node("/root/Hud").diff == 3:
		speed = 355
	if get_node("/root/Hud").diff == 4:
		speed = 360

func _on_timer_timeout():
	$death.start()
	$AnimatedSprite2D.play("death")

func _on_death_timeout():
	queue_free()
