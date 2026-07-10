extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 0
	get_node("/root/Hud").stageRnum = 0
	get_node("/root/Hud").continuesUsed = 0
	get_node("/root/Hud").db1 = false
	get_node("/root/Hud").db2 = false
	get_node("/root/Hud").db3 = false
	get_node("/root/Hud").db4 = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_deciro_pressed():
	get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_1.tscn")

func _on_remed_pressed():
	get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_1.tscn")
