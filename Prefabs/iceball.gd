extends Area2D

@export var horizentalspeed := 390
var horizentalDirection: int = 1

@export var easySpeed = 380
@export var hardSpeed = 410
@export var berzerkSpeed = 580

var left = false

func _ready():
	if randf() < 0.5:
		left = false
	if randf() < 0.5:
		left = true

func _physics_process(delta):
	if left == true:
		position.x += horizentalspeed * delta * horizentalDirection
	elif left == false:
		position.x -= horizentalspeed * delta * horizentalDirection
	
	if get_node("/root/Hud").diff == 1:
		horizentalspeed = easySpeed
	if get_node("/root/Hud").diff == 2:
		horizentalspeed = horizentalspeed
	if get_node("/root/Hud").diff == 3:
		horizentalspeed = hardSpeed
	if get_node("/root/Hud").diff == 4:
		horizentalspeed = berzerkSpeed

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1

func _on_body_entered(body):
	queue_free()
