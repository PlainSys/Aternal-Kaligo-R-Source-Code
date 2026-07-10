extends Node2D

const Grunt = preload("res://Prefabs/Enemy/grunt.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 6
	MusicController.play_lastsong()
	if get_node("/root/Hud").diff == 1:
		$Enemytime.wait_time = 5
	if get_node("/root/Hud").diff == 2:
		$Enemytime.wait_time = 2.5
	if get_node("/root/Hud").diff == 3:
		$Enemytime.wait_time = 2
	if get_node("/root/Hud").diff == 4:
		$Enemytime.wait_time = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemytime_timeout():
	var Enemyy = Grunt.instantiate()
	add_child(Enemyy)
	Enemyy.position = $Spawn.position
	
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position
