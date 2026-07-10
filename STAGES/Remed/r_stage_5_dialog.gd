extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$CanvasLayer/dialog/dialo1.hide()
	$CanvasLayer/dialog/dialo2.show()
	$CanvasLayer/dialog/Deciro1.show()
	$CanvasLayer/dialog/NM.hide()	

func _on_timer_2_timeout():
	$Timer3.start()
	$Timer2.stop()
	$CanvasLayer/dialog/dialo2.hide()
	$CanvasLayer/dialog/dialo3.show()
	$CanvasLayer/dialog/Deciro1.hide()
	$CanvasLayer/dialog/NM.show()	


func _on_timer_3_timeout():
	$Timer4.start()
	$Timer3.stop()
	$CanvasLayer/dialog/dialo3.hide()
	$CanvasLayer/dialog/dialo4.show()
	$CanvasLayer/dialog/Deciro1.show()
	$CanvasLayer/dialog/NM.hide()	

func _on_timer_4_timeout():
	get_tree().change_scene_to_file("res://STAGES/Remed/r_stage_5_boss.tscn")
