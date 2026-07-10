extends Control

func _process(delta):
	$curScore.set_text("Current Score: "+str(get_node("/root/Hud").score).pad_zeros(7))
	
# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimationPlayer.play("end")
	get_node("/root/Hud").score += 1
	$Timer.start()
	$curScore.set_text("Current Score: "+str(get_node("/root/Hud").score).pad_zeros(7))

func _on_timer_timeout():
	get_node("/root/Hud").score += 1
	$Timer.stop()

func _on_next_pressed():
	if get_tree().current_scene.name == "D_Stage1_boss":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_2.tscn")
	if get_tree().current_scene.name == "d_stage_2_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_1.tscn")
	if get_tree().current_scene.name == "d_stage_3_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_2.tscn")
	if get_tree().current_scene.name == "d_stage4_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_3.tscn")
	if get_tree().current_scene.name == "d_stage_5_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_4.tscn")
	
	if get_tree().current_scene.name == "r_stage_1_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_1.tscn")
	if get_tree().current_scene.name == "r_stage_2_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_2.tscn")
	if get_tree().current_scene.name == "r_stage_3_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_3.tscn")
	if get_tree().current_scene.name == "r_stage_4_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_4.tscn")
	if get_tree().current_scene.name == "r_stage_5_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_5.tscn")

func _on_extend_pressed():
	get_node("/root/Hud").health += 1
	if get_tree().current_scene.name == "D_Stage1_boss":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_2.tscn")
	if get_tree().current_scene.name == "d_stage_2_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_1.tscn")
	if get_tree().current_scene.name == "d_stage_3_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_2.tscn")
	if get_tree().current_scene.name == "d_stage4_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_3.tscn")
	if get_tree().current_scene.name == "d_stage_5_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/dmap_4.tscn")
	
	if get_tree().current_scene.name == "r_stage_1_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_1.tscn")
	if get_tree().current_scene.name == "r_stage_2_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_2.tscn")
	if get_tree().current_scene.name == "r_stage_3_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_3.tscn")
	if get_tree().current_scene.name == "r_stage_4_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_4.tscn")
	if get_tree().current_scene.name == "r_stage_5_boss":
		get_tree().change_scene_to_file("res://STAGES/Maptransitions/rmap_5.tscn")

func _on_scoreadd_pressed():
	get_node("/root/Hud").score += 5000
