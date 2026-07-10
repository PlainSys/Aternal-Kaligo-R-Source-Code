extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dia_1_timeout():
	$dia1.stop()
	$dia2.start()
	$CanvasLayer/dialog/longjim.show()
	$CanvasLayer/dialog/deciro.hide()
	$CanvasLayer/dialog/dia1.hide()
	$CanvasLayer/dialog/dia2.show()

func _on_dia_2_timeout():
	$dia2.stop()
	$dia3.start()
	$CanvasLayer/dialog/longjim.hide()
	$CanvasLayer/dialog/deciro.show()
	$CanvasLayer/dialog/dia2.hide()
	$CanvasLayer/dialog/dia3.show()

func _on_dia_3_timeout():
	$dia3.stop()
	$dia4.start()
	$CanvasLayer/dialog/dia3.hide()
	$CanvasLayer/dialog/dia4.show()

func _on_dia_4_timeout():
	$dia4.stop()
	$dia5.start()
	$CanvasLayer/dialog/longjim.show()
	$CanvasLayer/dialog/deciro.hide()
	$CanvasLayer/dialog/dia4.hide()
	$CanvasLayer/dialog/dia5.show()

func _on_dia_5_timeout():
	$dia5.stop()
	$dia6.start()
	$CanvasLayer/dialog/longjim.hide()
	$CanvasLayer/dialog/deciro.show()
	$CanvasLayer/dialog/dia5.hide()
	$CanvasLayer/dialog/dia6.show()

func _on_dia_6_timeout():
	$dia6.stop()
	$dia7.start()
	$CanvasLayer/dialog/longjim.show()
	$CanvasLayer/dialog/deciro.hide()
	$CanvasLayer/dialog/dia6.hide()
	$CanvasLayer/dialog/dia7.show()

func _on_dia_7_timeout():
	$dia7.stop()
	$dia8.start()
	$CanvasLayer/dialog/longjim.hide()
	$CanvasLayer/dialog/deciro.show()
	$CanvasLayer/dialog/dia7.hide()
	$CanvasLayer/dialog/dia8.show()

func _on_dia_8_timeout():
	get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_3_boss.tscn")
