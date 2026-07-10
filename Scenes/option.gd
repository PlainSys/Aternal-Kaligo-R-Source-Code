extends Control

var fsToggle = false
var livesNum = 2
var diffSelect = 2
var toggleAnnouncer = true
var code = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func get_input():
	if Input.is_action_pressed("Up"):
		if code == 0:
			code = 1
		if code == 1:
			code = 2

	if Input.is_action_pressed("Left"):
		if code == 2:
			code = 3
	if Input.is_action_pressed("Down"):
		if code == 3:
			code = 4
	if Input.is_action_pressed("Right"):
		if code == 4:
			code = 5
		if code == 5:
			code = 6
		if code == 6:
			code = 7
			get_node("/root/Hud").health += 30

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	
func _on_fullscreen_pressed():
	fsToggle = not fsToggle
	#OS.window_fullscreen = !OS.window_fullscreen
	#OS.window
	if fsToggle == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_lives_pressed():
	livesNum += 1
	
	if livesNum >= 5:
		livesNum = 0
		
	if livesNum == 0:
		$Lives.text = "Lives: 0"
		get_node("/root/Hud").health = 0
	if livesNum == 1:
		$Lives.text = "Lives: 1"
		get_node("/root/Hud").health = 1
	if livesNum == 2:
		$Lives.text = "Lives: 2"
		get_node("/root/Hud").health = 2
	if livesNum == 3:
		$Lives.text = "Lives: 3"
		get_node("/root/Hud").health = 3
	if livesNum == 4:
		$Lives.text = "Lives: 4"
		get_node("/root/Hud").health = 4


func _on_diff_pressed():
	diffSelect += 1
	
	if diffSelect >= 5:
		diffSelect = 1
		
	if diffSelect == 0:
		$diff.text = "Difficulty: Easy"
		get_node("/root/Hud").health = 0
	if diffSelect == 1:
		$diff.text = "Difficulty: Easy"
		get_node("/root/Hud").diff = 1
	if diffSelect == 2:
		$diff.text = "Difficulty: Normal"
		get_node("/root/Hud").diff = 2
	if diffSelect == 3:
		$diff.text = "Difficulty: Hard"
		get_node("/root/Hud").diff = 3
	if diffSelect == 4:
		$diff.text = "Difficulty: Berzerk"
		get_node("/root/Hud").diff = 4

func _on_annoucer_pressed():
	toggleAnnouncer = not toggleAnnouncer
	
	if toggleAnnouncer == true:
		$annoucer.text = "Toggle Annoucer (ON)"
	else:
		$annoucer.text = "Toggle Annoucer (OFF)"

func _on_master_control_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
