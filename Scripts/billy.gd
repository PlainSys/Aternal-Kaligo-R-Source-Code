extends CharacterBody2D

@export var billybutcool = false
var speed = 170
@onready var obj = get_parent().get_node("player")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
	
	if billybutcool == true:
		if get_node("/root/Hud").diff == 1:
			speed = 190
		if get_node("/root/Hud").diff == 2:
			speed = 210
		if get_node("/root/Hud").diff == 3:
			speed = 220
		if get_node("/root/Hud").diff == 4:
			speed = 230
	
func _on_death_timeout():
	queue_free()

func _on_timer_timeout():
	$death.start()
	$Bhitbox/Timer.stop()
	$AnimatedSprite2D.play("death")
