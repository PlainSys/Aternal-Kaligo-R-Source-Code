extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$crash.play()

func _on_timer_timeout():
	$Timer.stop()
	$dia1.start()
	$CanvasLayer/ColorRect.hide()

func _on_dia_1_timeout():
	$dia1.stop()
	$dia2.start()
	$CanvasLayer/dialog/dialog1.hide()
	$CanvasLayer/dialog/dialog2.show()
	$CanvasLayer/dialog/deciro1.hide()
	$CanvasLayer/dialog/pen.show()
	
func _on_dia_2_timeout():
	$dia2.stop()
	$dia3.start()
	$CanvasLayer/dialog/dialog2.hide()
	$CanvasLayer/dialog/dialog4.show()
	$CanvasLayer/dialog/deciro2.show()
	$CanvasLayer/dialog/pen.hide()

func _on_dia_3_timeout():
	$dia3.stop()
	$dia4.start()
	$CanvasLayer/dialog/dialog4.hide()
	$CanvasLayer/dialog/dialog5.show()
	$CanvasLayer/dialog/deciro2.hide()
	$CanvasLayer/dialog/pen.show()

func _on_dia_4_timeout():
	$dia4.stop()
	$dia5.start()
	$CanvasLayer/dialog/dialog5.hide()
	$CanvasLayer/dialog/dialog6.show()

func _on_dia_5_timeout():
	$dia5.stop()
	$dia6.start()
	$CanvasLayer/dialog/dialog6.hide()
	$CanvasLayer/dialog/dialog7.show()
	$CanvasLayer/dialog/deciro2.show()
	$CanvasLayer/dialog/pen.hide()

func _on_dia_6_timeout():
	$dia6.stop()
	$dia7.start()
	$CanvasLayer/dialog/dialog7.hide()
	$CanvasLayer/dialog/dialog8.show()
	$CanvasLayer/dialog/deciro2.hide()
	$CanvasLayer/dialog/pen.show()

func _on_dia_7_timeout():
	$dia7.stop()
	$dia8.start()
	$CanvasLayer/dialog/dialog8.hide()
	$CanvasLayer/dialog/dialog9.show()
	$CanvasLayer/dialog/deciro2.show()
	$CanvasLayer/dialog/pen.hide()

func _on_dia_8_timeout():
	$dia8.stop()
	get_tree().change_scene_to_file("res://STAGES/Deciro/r_stage1_boss.tscn")

