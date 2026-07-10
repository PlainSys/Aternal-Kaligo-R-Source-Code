extends CharacterBody2D

var speed = 250
@onready var obj = get_parent().get_node("player")

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
	
	if get_node("/root/Hud").diff == 1:
		speed = 230
	if get_node("/root/Hud").diff == 2:
		speed = 250
	if get_node("/root/Hud").diff == 3:
		speed = 270
	if get_node("/root/Hud").diff == 4:
		speed = 290
		
func _on_death_timeout():
	queue_free()
	
func _on_timer_timeout():
	$spihitbox/Timer.stop()
	$death.start()
	$AnimatedSprite2D.play("death")
