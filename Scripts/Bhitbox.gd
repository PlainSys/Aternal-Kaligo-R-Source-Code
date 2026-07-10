extends Area2D

@export var health: int = 5
@export var setscore: int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("/root/Hud").diff == 1:
		health = health - 3
	if get_node("/root/Hud").diff == 2:
		health = health
	if get_node("/root/Hud").diff == 3:
		health = health + 5
	if get_node("/root/Hud").diff == 4:
		health = health + 8

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	if health <= 0:
		get_node("/root/Hud").score += setscore
		$Timer.start()

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
