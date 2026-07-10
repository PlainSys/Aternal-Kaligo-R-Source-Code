extends Area2D

func _ready():
	$AnimationPlayer.play("explo")
	
func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
