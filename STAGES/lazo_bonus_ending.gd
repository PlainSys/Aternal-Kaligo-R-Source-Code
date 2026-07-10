extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://credits.tscn")


func _on_timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$Ending1.hide()
	$Ending2.show()
