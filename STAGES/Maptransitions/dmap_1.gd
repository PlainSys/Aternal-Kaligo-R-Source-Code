extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	if get_node("/root/Hud").stageDnum == 2:
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_3.tscn")
	if get_node("/root/Hud").stageDnum == 3:
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_4.tscn")
	if get_node("/root/Hud").stageDnum == 4:
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5.tscn")
	if get_node("/root/Hud").stageDnum == 5:
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_6.tscn")
	
	if get_node("/root/Hud").stageRnum == 1:
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_2.tscn")
	if get_node("/root/Hud").stageRnum == 2:
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_3.tscn")
	if get_node("/root/Hud").stageRnum == 3:
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_4.tscn")
	if get_node("/root/Hud").stageRnum == 4:
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_5.tscn")
	if get_node("/root/Hud").stageRnum == 5:
		get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_6.tscn")
