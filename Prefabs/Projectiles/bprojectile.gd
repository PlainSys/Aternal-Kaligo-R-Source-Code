extends Area2D

@export var speed:float = 700
@export var dir = 1
# 1 = right | 2 = left | 3 = down | 4 = up

func _physics_process(delta):
	position.x -= speed * delta

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		queue_free()

func _on_body_entered(body):
	queue_free()
