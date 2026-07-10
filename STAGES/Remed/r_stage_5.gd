extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageRnum = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_area_entered(area):
	if area.name == "rhitbox":
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_5_dialog.tscn")
