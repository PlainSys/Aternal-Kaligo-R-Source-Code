extends Area2D

@export var speed:float = 600
@export var dir = 1
# 1 = right | 2 = left | 3 = down | 4 = up

func _physics_process(delta):
	if dir == 1:
		position.x -= speed * delta
	elif dir == 2:
		position.x += speed * delta

func _process(delta):
	if get_node("/root/Hud").diff == 1:
		speed = 550
	if get_node("/root/Hud").diff == 2:
		speed = 600
	if get_node("/root/Hud").diff == 3:
		speed = 650
	if get_node("/root/Hud").diff == 4:
		speed = 700

func _on_area_entered(area):
	if area.name == "sword1":
		dir = 2

func _on_body_entered(body):
	if body.name == "player":
		get_node("/root/Hud").health -= 1
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
