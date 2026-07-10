extends Area2D

@export var health: int = 6
@export var setscore: int = 250
@export var haskey := false

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 10
	if health <= 0:
		get_node("/root/Hud").score += setscore
		$Timer.start()

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
