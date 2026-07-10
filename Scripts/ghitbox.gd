extends Area2D

@export var health: int = 2
@export var setscore: int = 100

func _ready():
	if get_node("/root/Hud").diff == 1:
		health = 2
		setscore = 50
	if get_node("/root/Hud").diff == 2:
		health = 2
		setscore = 100
	if get_node("/root/Hud").diff == 3:
		health = 3
		setscore = 105
	if get_node("/root/Hud").diff == 4:
		health = 5
		setscore = 150

func damage(amount: int):
	health -= amount
	$hitSound.play()
	get_node("/root/Hud").score += 5
	if health <= 0:
		$deathSound.play()
		get_node("/root/Hud").score += setscore
		$Timer.start()


func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		
		$punchSound.play()
		$punctimer.start()
