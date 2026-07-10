extends Area2D

var isin = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isin == true:
		get_node("/root/Hud").ratatat -= 1

func _on_area_entered(area):
	if area.name == "phitbox":
		isin = true

func _on_area_exited(area):
	if area.name == "phitbox":
		isin = false
