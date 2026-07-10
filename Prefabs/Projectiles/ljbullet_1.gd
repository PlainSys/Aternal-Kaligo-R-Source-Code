extends Area2D

@export var speed:float = 700
@export var direction = 1

func _physics_process(delta):
	if direction == 1:
		position.x += speed * delta
		position.y += speed * delta
	if direction == 2:
		position.x += speed * delta
	if direction == 3:
		position.x += speed * delta
		position.y -= speed * delta
	if direction == 4:
		position.x -= speed * delta
		position.y += speed * delta
	if direction == 5:
		position.x -= speed * delta
	if direction == 6:
		position.x -= speed * delta
		position.y -= speed * delta

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
