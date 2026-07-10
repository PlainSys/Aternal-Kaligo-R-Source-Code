extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").score += 700
		get_node("/root/Hud").orb += 1
		if get_tree().current_scene.name == "d_level_1":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_4.tscn")
		if get_tree().current_scene.name == "d_level_2":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5.tscn")
		if get_tree().current_scene.name == "d_level_3":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_6.tscn")
	if area.name == "rhitbox":
		get_node("/root/Hud").score += 700
		get_node("/root/Hud").orb += 1
		if get_tree().current_scene.name == "r_level_1":
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_3.tscn")
		if get_tree().current_scene.name == "r_level_2":
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_4.tscn")
		if get_tree().current_scene.name == "r_level_3":
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_5.tscn")
