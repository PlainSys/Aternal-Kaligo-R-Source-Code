extends Node2D

const SAVE_GAME_PATH := "user://saveData.save"

var health = 2 :  set = set_health
var score = 0 : set = set_score
var flash = 3
var ratatat = 100 : set = set_ratatat

@export var stageDnum = 0
@export var stageRnum = 0

var diff = 2
# 1 = easy | 2 = normal | 3 = hard | 4 = berzerk | 5 = extra
var orb = 0
var doorkills = 0

var announcerThing = true

var extraStageUnlocked = 0
var berzerk1cc = 0

var lockGoodending = false
@export var continuesUsed = 0

@export var db1 = false
@export var db2 = false
@export var db3 = false
@export var db4 = false
@export var db5 = false



func save():
	var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.WRITE)
	file.store_var(extraStageUnlocked)
	file.store_var(berzerk1cc)

func load_data():
	if FileAccess.file_exists(SAVE_GAME_PATH):
		var file = FileAccess.open(SAVE_GAME_PATH, FileAccess.READ)
		extraStageUnlocked = file.get_var(extraStageUnlocked)
		berzerk1cc = file.get_var(berzerk1cc)
	else:
		extraStageUnlocked = 0
		berzerk1cc = 0
		
# Called when the node enters the scene tree for the first time.
func _ready():
	load_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().current_scene.name == "Intro":
		get_node("/root/Hud/Display").visible = false
	if get_tree().current_scene.name == "MainMenu":
		get_node("/root/Hud/Display").visible = false
	if get_tree().current_scene.name == "Credits":
		get_node("/root/Hud/Display").visible = false
	
	if get_tree().current_scene.name == "D_Stage1":
		stageDnum = 1
		get_node("/root/Hud/Display").visible = true
	if get_tree().current_scene.name == "d_stage_2":
		stageDnum = 2
	if get_tree().current_scene.name == "d_stage_3":
		stageDnum = 3
	if get_tree().current_scene.name == "r_Stage_1":
		get_node("/root/Hud/Display").visible = true

	
	if score > 10000 && db1 == false:
		db1 = true
		health += 1
	elif score > 50000 && db2 == false:
		db2 = true
		health += 1
	elif score >= 100000 && db3 == false:
		db3 = true
		health += 1
	elif score >= 150000 && db4 == false:
		db4 = true
		health += 1
	elif score >= 200000 && db5 == false:
		db5 = true
		health += 1

func set_score(value):
	score = value
	get_node("/root/Hud/Display/SCORE").set_text("Score: "+str(score).pad_zeros(7))

func set_health(value):
	health = value
	get_node("/root/Hud/Display/LIVES").set_text("Lives: "+str(health))
	
	if health <= -1:
		get_node("/root/Hud/Display/Timer").start()
		#get_tree().change_scene_to_file("res://Scenes/continue.tscn")

func set_ratatat(value):
	ratatat = value
	get_node("/root/Hud/Display/rat").set_text("Ratatat: "+str(ratatat))
	
	if ratatat <= -1:
		health -= 1
		ratatat = 100


func _on_timer_timeout():
	get_node("/root/Hud/Display/Timer").stop()
	get_tree().change_scene_to_file("res://Scenes/continue.tscn")
