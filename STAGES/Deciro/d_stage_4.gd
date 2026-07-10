extends Node2D

var enemy = preload("res://Prefabs/fireball.tscn")
var enemy3 = preload("res://Prefabs/iceball.tscn")
var enemy5 = preload("res://Prefabs/Enemy/grunt.tscn")
var enemy6 = preload("res://Prefabs/Enemy/orbsorber.tscn")
#I prob shouldve used arrays but wtf im an idiot

var door1 = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 4
	$Portal/CollisionShape2D.set_deferred("disabled", true)
	if randf() < 0.5:
		$rngbook/CollisionShape2D.set_deferred("disabled", false)
	elif randf() < 0.7:
		$rngbook2/CollisionShape2D.set_deferred("disabled", false)
	elif randf() < 0.3:
		$rngbook3/CollisionShape2D.set_deferred("disabled", false)
	elif randf() < 0.1:
		$rngbook4/CollisionShape2D.set_deferred("disabled", false)
	else:
		$rngbook4/CollisionShape2D.set_deferred("disabled", false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/Hud").doorkills == 6:
		$door5/CollisionShape2D.set_deferred("disabled", true)
		$door5.hide()
	if get_node("/root/Hud").doorkills == 9:
		$door7/CollisionShape2D.set_deferred("disabled", true)
		$door7.hide()
		$door6/CollisionShape2D.set_deferred("disabled", true)
		$door6.hide()

func _on_spawn_timer_timeout():
	if randf() < 0.5:
		var Enemyy = enemy.instantiate()
		add_child(Enemyy)
		Enemyy.position = $Spawn.position
	if randf() < 0.5:
		var Enemyy3 = enemy3.instantiate()
		add_child(Enemyy3)
		Enemyy3.position = $Spawn.position
		
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position

func _on_event_1_area_entered(area):
	$SpawnTimer.start()
	$event1/CollisionShape2D.set_deferred("disabled", true)


func _on_spawn_timer_2_timeout():
	if randf() < 0.5:
		var Enemyy = enemy.instantiate()
		add_child(Enemyy)
		Enemyy.position = $Spawn.position
	if randf() < 0.5:
		var Enemyy3 = enemy3.instantiate()
		add_child(Enemyy3)
		Enemyy3.position = $Spawn.position
		
	var nodes = get_tree().get_nodes_in_group("spawn2")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn.position = Position


func _on_spawn_timer_3_timeout():
	if get_node("/root/Hud").diff == 4:
		var Orbser = enemy6.instantiate()
		add_child(Orbser)
		Orbser.position = $Spawn2.position
	else:
		var Grunt = enemy5.instantiate()
		add_child(Grunt)
		Grunt.position = $Spawn2.position
	
	var nodes = get_tree().get_nodes_in_group("spawn3")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$Spawn2.position = Position


func _on_bookhit_1_area_entered(area):
	if area.name == "phitbox":
		$door1/CollisionShape2D.set_deferred("disabled", true)
		$door1.hide()

func _on_bookhit_2_area_entered(area):
	if area.name == "phitbox":
		$door2/CollisionShape2D.set_deferred("disabled", true)
		$door2.hide()

func _on_bookhit_3_area_entered(area):
	if area.name == "phitbox":
		$door3/CollisionShape2D.set_deferred("disabled", true)
		$door3.hide()

func _on_bookhit_4_area_entered(area):
	if area.name == "phitbox":
		$door4/CollisionShape2D.set_deferred("disabled", true)
		$door4.hide()
		$SpawnTimer3.start()


func _on_rngbook_area_entered(area):
	if area.name == "phitbox":
		$door8/CollisionShape2D.set_deferred("disabled", true)
		$door8.hide()


func _on_rngbook_2_area_entered(area):
	if area.name == "phitbox":
		$door8/CollisionShape2D.set_deferred("disabled", true)
		$door8.hide()

func _on_rngbook_3_area_entered(area):
	if area.name == "phitbox":
		$door8/CollisionShape2D.set_deferred("disabled", true)
		$door8.hide()

func _on_rngbook_4_area_entered(area):
	if area.name == "phitbox":
		$door8/CollisionShape2D.set_deferred("disabled", true)
		$door8.hide()

func _on_secret_area_entered(area):
	if area.name == "Bullet":
		$Portal.show()
		$Portal/CollisionShape2D.set_deferred("disabled", false)

func _on_end_area_entered(area):
	if area.name == "phitbox":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_4_dialog.tscn")
