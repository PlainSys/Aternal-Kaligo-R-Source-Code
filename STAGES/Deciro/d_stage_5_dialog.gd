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
	$CanvasLayer/dialog/Bum.hide()
	$CanvasLayer/dialog/Deciro1.show()

func _on_timer_2_timeout():
	$Timer2.stop()
	$Timer3.start()
	$CanvasLayer/dialog/dialo2.hide()
	$CanvasLayer/dialog/dialo3.show()

func _on_timer_3_timeout():
	$Timer3.stop()
	$Timer4.start()
	$CanvasLayer/dialog/dialo3.hide()
	$CanvasLayer/dialog/dialo4.show()
	$CanvasLayer/dialog/Bum.show()
	$CanvasLayer/dialog/Deciro1.hide()

func _on_timer_4_timeout():
	$Timer4.stop()
	$Timer5.start()
	$CanvasLayer/dialog/dialo4.hide()
	$CanvasLayer/dialog/dialo5.show()
	$CanvasLayer/dialog/Bum.hide()
	$CanvasLayer/dialog/NM.show()

func _on_timer_5_timeout():
	$Timer5.stop()
	$Timer6.start()
	$CanvasLayer/dialog/dialo5.hide()
	$CanvasLayer/dialog/dialo6.show()
	$CanvasLayer/dialog/NM.hide()
	$CanvasLayer/dialog/Deciro2.show()

func _on_timer_6_timeout():
	$Timer6.stop()
	$Timer7.start()
	$CanvasLayer/dialog/dialo6.hide()
	$CanvasLayer/dialog/dialo7.show()
	$CanvasLayer/dialog/Bum.show()
	$CanvasLayer/dialog/Deciro2.hide()

func _on_timer_7_timeout():
	$Timer7.stop()
	$Timer8.start()
	$CanvasLayer/dialog/dialo7.hide()
	$CanvasLayer/dialog/dialo8.show()
	$CanvasLayer/dialog/Bum.hide()
	$CanvasLayer/dialog/NM.show()

func _on_timer_8_timeout():
	get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_5_boss.tscn")
