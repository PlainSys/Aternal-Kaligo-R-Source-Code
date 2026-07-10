extends Area2D

@export var speed:float = 500

func _physics_process(delta):
	position.x += speed * delta


func _on_area_entered(area):
	queue_free()
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		if get_tree().current_scene.name == "d_stage_4":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_4.tscn")
		if get_tree().current_scene.name == "d_extrastage":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_extrastage.tscn")
	if area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
		if get_tree().current_scene.name == "r_extrastage":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_extrastage.tscn")
