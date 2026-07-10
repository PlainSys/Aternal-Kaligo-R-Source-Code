extends Area2D

var horizentalDirection: int = -1

var speed := 600
var altspeed := 100
var dir = 1

func _ready():
	if randf() < 0.5:
		dir = 1
	elif randf() < 0.5:
		dir = 2
	elif randf() < 0.5:
		dir = 3
	elif randf() < 0.5:
		dir = 4
	else:
		dir = 5
	
	if get_node("/root/Hud").diff == 1:
		speed = 600
		self.scale.x = 3
		self.scale.y = 3
	if get_node("/root/Hud").diff == 2:
		speed = 600
		self.scale.x = 3
		self.scale.y = 3
	if get_node("/root/Hud").diff == 3:
		speed = 650
		self.scale.x = 4
		self.scale.y = 4
	if get_node("/root/Hud").diff == 4:
		speed = 700
		self.scale.x = 5
		self.scale.y = 5

func _physics_process(delta):
	if dir == 1:
		position.y += speed * delta
	elif dir == 2:
		position.y += speed * delta
		position.x += speed * delta
	elif dir == 3:
		position.y += speed * delta
		position.x -= speed * delta
	elif dir == 4:
		position.y += speed * delta
		position.x -= altspeed * delta
	elif dir == 5:
		position.y += speed * delta
		position.x += altspeed * delta

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_6_bossB.tscn")
