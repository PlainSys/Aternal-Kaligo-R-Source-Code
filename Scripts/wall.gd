extends Area2D

@export var speed:float = 900

func _physics_process(delta):
	position.x -= speed * delta
	
	if get_node("/root/Hud").diff == 1:
		speed = 860
	if get_node("/root/Hud").diff == 2:
		speed = 900
	if get_node("/root/Hud").diff == 3:
		speed = 950
	if get_node("/root/Hud").diff == 4:
		speed = 1500

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.name == "RemedBike":
		get_node("/root/Hud").health -= 1
