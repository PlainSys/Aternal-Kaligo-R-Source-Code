extends Node2D

const projectile = preload("res://Prefabs/Projectiles/bum_balls.tscn")
const projectile2 = preload("res://Prefabs/Projectiles/bum_balls.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 6
	#MusicController.finalbossMusic()
	if get_node("/root/Hud").diff == 1:
		$Timer.wait_time = 1
	if get_node("/root/Hud").diff == 2:
		$Timer.wait_time = 1
	if get_node("/root/Hud").diff == 3:
		$Timer.wait_time = 0.7
	if get_node("/root/Hud").diff == 4:
		$Timer.wait_time = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var Enemyy = projectile.instantiate()
	add_child(Enemyy)
	Enemyy.position = $spawn.position
	
	var Enemyy2 = projectile2.instantiate()
	add_child(Enemyy2)
	Enemyy2.position = $spawn.position
	
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$spawn.position = Position


func _on_frikyou_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1

func _on_ting_timeout():
	
	$Bumathule/ting.stop()
	$CanvasLayer/AnimationPlayer.play("anim")
	
	$player.invis = true
	
	if get_node("/root/Hud").lockGoodending == false:
		get_node("/root/Hud").extraStageUnlocked = 1
		get_node("/root/Hud").save()
	
	if get_node("/root/Hud").lockGoodending == false && get_node("/root/Hud").diff == 4:
		get_node("/root/Hud").extraStageUnlocked = 1
		get_node("/root/Hud").berzerk1cc = 1
		get_node("/root/Hud").save()

func _on_ctn_pressed():
	pass
	#get_tree().change_scene_to_file()
