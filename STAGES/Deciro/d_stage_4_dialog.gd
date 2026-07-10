extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dialog_1_timeout():
	$dialog1.stop()
	$dialog2.start()
	$CanvasLayer/dialog/dia1.hide()
	$CanvasLayer/dialog/dia2.show()
	$CanvasLayer/dialog/Deciro1.hide()
	$CanvasLayer/dialog/Lena.show()

func _on_dialog_2_timeout():
	$dialog2.stop()
	$dialog3.start()
	$CanvasLayer/dialog/dia2.hide()
	$CanvasLayer/dialog/dia3.show()
	$CanvasLayer/dialog/Lena.hide()
	$CanvasLayer/dialog/Deciro2.show()

func _on_dialog_3_timeout():
	$dialog3.stop()
	$dialog4.start()
	$CanvasLayer/dialog/dia3.hide()
	$CanvasLayer/dialog/dia4.show()
	$CanvasLayer/dialog/Deciro2.hide()
	$CanvasLayer/dialog/Lena.show()

func _on_dialog_4_timeout():
	$dialog4.stop()
	$dialog5.start()
	$CanvasLayer/dialog/dia4.hide()
	$CanvasLayer/dialog/dia5.show()
	$CanvasLayer/dialog/Deciro3.show()
	$CanvasLayer/dialog/Lena.hide()

func _on_dialog_5_timeout():
	$dialog5.stop()
	$dialog6.start()
	$CanvasLayer/dialog/dia5.hide()
	$CanvasLayer/dialog/dia6.show()
	$CanvasLayer/dialog/Deciro3.hide()
	$CanvasLayer/dialog/Lena.show()

func _on_dialog_6_timeout():
	$dialog6.stop()
	$dialog7.start()
	$CanvasLayer/dialog/dia6.hide()
	$CanvasLayer/dialog/dia7.show()
	$CanvasLayer/dialog/Deciro2.show()
	$CanvasLayer/dialog/Lena.hide()

func _on_dialog_7_timeout():
	get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_4_boss.tscn")
