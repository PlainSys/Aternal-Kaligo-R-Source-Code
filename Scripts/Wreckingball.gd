extends Area2D

var horizentalDirection: int = -1

var speed := 200

func _ready():
	pass

func _physics_process(delta):
	position.x -= speed * delta
	position.y += speed * delta


func _on_area_entered(area):
	if area.name == "phitbox" or area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
