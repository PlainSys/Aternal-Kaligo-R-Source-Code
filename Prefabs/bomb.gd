extends Area2D

var horizentalDirection: int = -1

var speed := 200

func _ready():
	pass

func _physics_process(delta):
	position.x -= speed * delta
	position.y += speed * delta

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		$AnimatedSprite2D.play("death")
		$Timer.start()

func _on_timer_timeout():
	$Timer.stop()
	queue_free()
