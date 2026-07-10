extends Label

@export var CD = 15

func _ready():
	if get_node("/root/Hud").diff == 1:
		CD = CD - 5
	if get_node("/root/Hud").diff == 2:
		CD = CD
	if get_node("/root/Hud").diff == 3:
		CD = CD + 5
	if get_node("/root/Hud").diff == 4:
		CD = CD + 10
		
	if get_tree().current_scene.name == "r_stage_1":
		$LineEdit.text = "res://STAGES/Remed/r_stage_1_dialog.tscn"
		
func _physics_process(delta):
	$CD.set_text(str(CD))

func _on_countdown_timeout():
	CD -= 1
	if CD <= 0:
		get_tree().change_scene_to_file($LineEdit.text)
