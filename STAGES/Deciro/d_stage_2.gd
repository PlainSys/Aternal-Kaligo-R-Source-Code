extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_open_door_timeout():
	$door1/ColorRect.hide()
	$door1/CollisionShape2D.set_deferred("disabled", true)

func _on_end_area_entered(area):
	if area.name == "phitbox":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_2_boss.tscn")
