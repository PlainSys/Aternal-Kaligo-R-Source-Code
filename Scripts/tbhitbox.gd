extends Area2D

@export var health: int = 5
@export var setscore: int = 50

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	if health <= 0:
		get_node("/root/Hud").score += setscore
		$Timer.start()

func _ready():
	if get_node("/root/Hud").diff == 1:
		health = 3
	if get_node("/root/Hud").diff == 2:
		health = 5
	if get_node("/root/Hud").diff == 3:
		health = 7
	if get_node("/root/Hud").diff == 4:
		health = 9


func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
