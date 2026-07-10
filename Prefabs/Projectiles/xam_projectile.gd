extends Area2D

@export var speed:float = 700
@export var deflected = false
@export var canDeflect = false
@export var dir = 1
# 1 = right | 2 = left | 3 = down | 4 = up

func _ready():
	if randf() < 0.5:
		dir = 1
	elif randf() < 0.5:
		dir = 2
	elif randf() < 0.5:
		dir = 3
	elif randf() < 0.5:
		dir = 4
	elif randf() < 0.5:
		dir = 5
	elif randf() < 0.5:
		dir = 6
	else:
		dir = 7
		
func _physics_process(delta):
	if dir == 1:
		position.x += speed * delta
	elif dir == 2:
		position.x += speed * delta
		position.y += speed * delta
	elif dir == 3:
		position.x += speed * delta
		position.y -= speed * delta
	elif dir == 4:
		position.x += 650 * delta
	elif dir == 5:
		position.x += 650 * delta
		position.y -= speed * delta
	elif dir == 6:
		position.x += 650 * delta
		position.y -= 650 * delta
	elif dir == 6:
		position.x += 650 * delta
		position.y += 650 * delta
		
	if dir == 7:
		position.x -= 650 * delta

func _process(delta):
	if get_node("/root/Hud").diff == 1:
		speed = 500
	if get_node("/root/Hud").diff == 2:
		speed = 700
	if get_node("/root/Hud").diff == 3:
		speed = 750
	if get_node("/root/Hud").diff == 4:
		speed = 800

func _on_body_entered(body):
	if body.name == "player":
		get_node("/root/Hud").health -= 1
		queue_free()

func _on_area_entered(area):
	if area.name == "sword1":
		dir = 7
