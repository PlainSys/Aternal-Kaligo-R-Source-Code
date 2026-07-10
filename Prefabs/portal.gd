extends Area2D



func _on_area_entered(area):
	if area.name == "phitbox":
		if get_tree().current_scene.name == "d_stage_3":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_1.tscn")
		if get_tree().current_scene.name == "d_stage_4":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_2.tscn")
		if get_tree().current_scene.name == "d_stage_5":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_3.tscn")
	if area.name == "rhitbox":
		if get_tree().current_scene.name == "r_stage_2":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_1.tscn")
		if get_tree().current_scene.name == "r_stage_3":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_1.tscn")
