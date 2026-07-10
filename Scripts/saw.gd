extends Area2D

@export var horizentalspeed := 200
@export var direct = false

var horizentalDirection: int = 1
var speed := 200

func _physics_process(delta):
	if direct == true:
		position.y += horizentalspeed * delta * horizentalDirection
	else:
		position.x += horizentalspeed * delta * horizentalDirection
	
	if get_node("/root/Hud").diff == 1:
		horizentalspeed = 196
	if get_node("/root/Hud").diff == 2:
		horizentalspeed = 200
	if get_node("/root/Hud").diff == 3:
		horizentalspeed = 210
	if get_node("/root/Hud").diff == 4:
		horizentalspeed = 220

func _on_body_entered(body):
	horizentalDirection *= -1

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		if get_tree().current_scene.name == "d_stage_5":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5.tscn")
		if get_tree().current_scene.name == "d_level_1":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_1.tscn")
		if get_tree().current_scene.name == "d_level_3":
			get_tree().change_scene_to_file("res://STAGES/Bonus/d_level_3.tscn")
		if get_tree().current_scene.name == "d_extrastage":
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_extrastage.tscn")
	if area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
		if get_tree().current_scene.name == "r_stage_4":
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_4.tscn")
		if get_tree().current_scene.name == "r_level_1":
			get_tree().change_scene_to_file("res://STAGES/Bonus/r_level_1.tscn")
		if get_tree().current_scene.name == "r_level_2":
			get_tree().change_scene_to_file("res://STAGES/Bonus/r_level_2.tscn")
