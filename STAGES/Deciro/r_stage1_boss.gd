extends Node2D


func _on_timer_lol_timeout():
	$CanvasLayer/StageEnd.show()
	$Theme.stop()
	$CanvasLayer/StageEnd/music.play()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$player.SPEED = 0
	$player.invis = true
