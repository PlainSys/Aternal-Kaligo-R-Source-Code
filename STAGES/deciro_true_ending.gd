extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$Ending1.hide()
	$Ending2.show()

func _on_timer_2_timeout():
	$Timer2.stop()
	$Timer3.start()
	$Ending2.hide()
	$Ending3.show()

func _on_timer_3_timeout():
	$Timer3.stop()
	$Timer4.start()
	$Ending3.hide()
	$Ending4.show()

func _on_timer_4_timeout():
	$Timer4.stop()
	$Timer5.start()
	$Ending4.hide()
	$Ending5.show()

func _on_timer_5_timeout():
	get_tree().change_scene_to_file("res://credits.tscn")
