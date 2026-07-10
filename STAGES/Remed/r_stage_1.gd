extends Node2D

var enemy = preload("res://Prefabs/Enemy/grunt_bike_1.tscn")
var enemy2 = preload("res://Prefabs/Enemy/grunt_bike_2.tscn")

var wall = preload("res://Prefabs/wall.tscn")
var surfer = preload("res://Prefabs/Enemy/boxysurfer.tscn")
#var surfer = preload("res://boxysurfer.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud/Display").visible = true
	get_node("/root/Hud").stageRnum = 1
	MusicController.stopSong()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_surfer_time_timeout():
	var box = surfer.instantiate()
	add_child(box)
	box.position = $Spawn3.position
	
	var nodes = get_tree().get_nodes_in_group("spawn3")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn3.position = Position


func _on_car_timer_timeout():
	if randf() < 0.3:
		var Enemyy = enemy.instantiate()
		add_child(Enemyy)
		Enemyy.position = $Spawn.position
	if randf() < 0.7:
		var Enemyy2 = enemy2.instantiate()
		add_child(Enemyy2)
		Enemyy2.position = $Spawn.position
		
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position


func _on_wall_timer_timeout():
	var walll = wall.instantiate()
	add_child(walll)
	walll.position = $Spawn.position
	
	var nodes = get_tree().get_nodes_in_group("spawn2")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position

func _on_timer_timeout():
	$wallTimer.start()
	$Timer.stop()

func _on_timer_2_timeout():
	$surferTime.start()
	$Timer2.stop()
