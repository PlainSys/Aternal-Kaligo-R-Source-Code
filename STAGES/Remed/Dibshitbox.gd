extends Area2D

@export var health: int = 10
@export var setscore: int = 5000

func _ready():
	if get_node("/root/Hud").diff == 1:
		health = 5
		setscore = 100
	if get_node("/root/Hud").diff == 2:
		health = 10
		setscore = 5000
	if get_node("/root/Hud").diff == 3:
		health = 15
		setscore = 5005
	if get_node("/root/Hud").diff == 4:
		health = 20
		setscore = 5500

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	$hitsound.play()
	if health <= 0:
		get_node("/root/Hud").score += setscore
		$Timer.start()

func _on_area_entered(area):
	if area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
