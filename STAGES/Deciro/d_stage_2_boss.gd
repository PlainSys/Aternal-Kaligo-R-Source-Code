extends Node2D

const projectile = preload("res://Prefabs/Projectiles/bprojectile.tscn")

func _on_timer_timeout():
	var Enemyy = projectile.instantiate()
	add_child(Enemyy)
	Enemyy.position = $spawn.position
	
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var Position = node.position
	$spawn.position = Position


func _on_animation_player_animation_finished(anim_name):
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")


func _on_ting_timeout():
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$CanvasLayer/StageEnd/music.play()
	$Vesper.queue_free()
	$player.SPEED = 0
	$player.invis = true
	$CanvasLayer/Label.show()

