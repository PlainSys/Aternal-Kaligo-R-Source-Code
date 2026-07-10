extends Control

func _on_timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$Ending1.hide()
	$Ending2.show()
	
func _on_timer_2_timeout():
	$Timer2.stop()
	get_tree().change_scene_to_file("res://credits.tscn")
