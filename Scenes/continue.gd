extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("/root/Hud").stageDnum == 7 or get_node("/root/Hud").stageRnum == 7:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_yes_pressed():
	get_node("/root/Hud").lockGoodending = true
	get_node("/root/Hud").continuesUsed += 1
	get_node("/root/Hud").health += 5
	get_node("/root/Hud").score = 0
	
	if get_node("/root/Hud").continuesUsed  < 3:
		if get_node("/root/Hud").stageDnum == 1:
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_1.tscn")
		if get_node("/root/Hud").stageDnum == 2:
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_2.tscn")
		if get_node("/root/Hud").stageDnum == 3:
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_3.tscn")
		if get_node("/root/Hud").stageDnum == 4:
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_4.tscn")
		if get_node("/root/Hud").stageDnum == 5:
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5.tscn")
		if get_node("/root/Hud").stageDnum == 6:
			get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_6.tscn")
		if get_node("/root/Hud").stageRnum == 1:
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_1.tscn")
		if get_node("/root/Hud").stageRnum == 2:
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_2.tscn")
		if get_node("/root/Hud").stageRnum == 3:
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_3.tscn")
		if get_node("/root/Hud").stageRnum == 4:
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_4.tscn")
		if get_node("/root/Hud").stageRnum == 5:
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_5.tscn")
		if get_node("/root/Hud").stageRnum == 6:
			get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_6.tscn")

func _on_no_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
