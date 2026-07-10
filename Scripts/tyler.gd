extends Area2D

@export var rotatespeed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotatespeed * delta
	
	if get_node("/root/Hud").diff == 1:
		rotatespeed = 3
	if get_node("/root/Hud").diff == 2:
		rotatespeed = 5
	if get_node("/root/Hud").diff == 3:
		rotatespeed = 7
	if get_node("/root/Hud").diff == 4:
		rotatespeed = 8


func _on_area_entered(area):
	if area.name == "phitbox" || area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
