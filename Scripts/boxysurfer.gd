extends Area2D

@export var speed:float = 900

func _physics_process(delta):
	position.x += speed * delta
	
	if get_node("/root/Hud").diff == 1:
		speed = 997
	if get_node("/root/Hud").diff == 2:
		speed = 1000
	if get_node("/root/Hud").diff == 3:
		speed = 1010
	if get_node("/root/Hud").diff == 4:
		speed = 1070

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
