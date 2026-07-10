extends CharacterBody2D

var speed = 200
@onready var obj = get_parent().get_node("player")


func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)


func _on_timer_timeout():
	$Dibshitbox/Timer.stop()
	$death.start()
	$AnimatedSprite2D.play("death")
	$explo.play()

func _on_death_timeout():
	queue_free()

func _on_lboxlol_area_entered(area):
	if area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
