extends Node2D

var code = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$play.grab_focus()
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

func get_input():
	if Input.is_action_pressed("Up"):
		pass
	
func _on_quit_pressed():
	get_tree().quit()


func _on_ex_pressed():
	if get_node("/root/Hud").extraStageUnlocked == 1:
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_extrastage.tscn")


func _on_play_pressed():
	$Transition.play("anim")

func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://Scenes/character_select.tscn")

func _on_op_pressed():
	get_tree().change_scene_to_file("res://Scenes/option.tscn")
