extends Area2D

var health = 3

func _ready():
	if get_node("/root/Hud").diff == 1:
		health = 3
	if get_node("/root/Hud").diff == 2:
		health = 5
	if get_node("/root/Hud").diff == 3:
		health = 8
	if get_node("/root/Hud").diff == 4:
		health = 10


func _on_area_entered(area):
	if area.name == "light":
		get_node("/root/Hud").score += 500
		health -= 1
		$damage.start()
	if health == 0:
		get_node("/root/Hud").score += 1000
		$death.start()
		$CollisionShape2D.set_deferred("disabled", true)
