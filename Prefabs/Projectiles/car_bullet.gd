extends Area2D

@export var speed:float = 1800
@export var dir = 1
# 1 = right | 2 = left | 3 = down | 4 = up

func _physics_process(delta):
	position.x -= speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
