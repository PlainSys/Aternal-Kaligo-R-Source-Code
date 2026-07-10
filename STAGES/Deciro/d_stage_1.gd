extends Node2D

const Grunt = preload("res://Prefabs/Enemy/grunt.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 1
	MusicController.stopSong()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_enemy_timeout():
	var Enemyy = Grunt.instantiate()
	add_child(Enemyy)
	Enemyy.position = $Spawn.position
	
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position
