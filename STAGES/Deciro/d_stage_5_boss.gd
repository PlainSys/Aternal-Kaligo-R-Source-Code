extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_death_timeout():
	if get_node("/root/Hud").diff == 1 || get_node("/root/Hud").continuesUsed > 0:
		get_tree().change_scene_to_file("res://STAGES/deciro_bad_ending.tscn")
	else:
		$Noobmaster69/death.stop()
		$CanvasLayer/dialog.show()
		$Timer.start()

func _on_timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$CanvasLayer/dialog/dialo1.hide()
	$CanvasLayer/dialog/dialo2.show()

func _on_timer_2_timeout():
	$Timer2.stop()
	$theme.stop()
	$CanvasLayer/dialog.hide()
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$CanvasLayer/StageEnd/music.play()
	$player.SPEED = 0
