extends Node2D

var enemy = preload("res://Prefabs/fireball.tscn")
var enemy2 = preload("res://Prefabs/iceball.tscn")

var greko = preload("res://Prefabs/Enemy/greko.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawntimer_timeout():
	if randf() < 0.5:
		var Enemyy = enemy.instantiate()
		add_child(Enemyy)
		Enemyy.position = $Spawn.position
	if randf() < 0.5:
		var Enemyy2 = enemy2.instantiate()
		add_child(Enemyy2)
		Enemyy2.position = $Spawn.position
		
	$Lena/spell.play()
		
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position


func _on_enemy_timer_timeout():
	var Enemyy6 = greko.instantiate()
	add_child(Enemyy6)
	Enemyy6.position = $Spawn2.position
		
	var nodes = get_tree().get_nodes_in_group("spawn2")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn2.position = Position


func _on_death_timeout():
	$spawntimer.stop()
	$player.SPEED = 0
	$player.invis = true
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$theme.stop()
	$CanvasLayer/StageEnd/music.play()
