extends Node2D


func _on_dialog_1_timeout():
	$dialog1.stop()
	$dialog2.start()
	$CanvasLayer/dialog/dia1.hide()
	$CanvasLayer/dialog/dia2.show()
	$CanvasLayer/dialog/Deciro1.hide()
	$CanvasLayer/dialog/Bum.show()

func _on_dialog_2_timeout():
	$dialog2.stop()
	$dialog3.start()
	$CanvasLayer/dialog/dia2.hide()
	$CanvasLayer/dialog/dia3.show()
	$CanvasLayer/dialog/Deciro2.show()
	$CanvasLayer/dialog/Bum.hide()

func _on_dialog_3_timeout():
	$dialog3.stop()
	$dialog4.start()
	$CanvasLayer/dialog/dia3.hide()
	$CanvasLayer/dialog/dia4.show()
	$CanvasLayer/dialog/Deciro2.hide()
	$CanvasLayer/dialog/Bum.show()

func _on_dialog_4_timeout():
	$dialog4.stop()
	$dialog5.start()
	$CanvasLayer/dialog/dia4.hide()
	$CanvasLayer/dialog/dia5.show()
	$CanvasLayer/dialog/Deciro1.show()
	$CanvasLayer/dialog/Bum.hide()

func _on_dialog_5_timeout():
	$dialog5.stop()
	$dialog6.start()
	$CanvasLayer/dialog/dia5.hide()
	$CanvasLayer/dialog/dia6.show()

func _on_dialog_6_timeout():
	$dialog6.stop()
	$dialog7.start()
	$CanvasLayer/dialog/dia6.hide()
	$CanvasLayer/dialog/dia7.show()
	$CanvasLayer/dialog/Deciro1.hide()
	$CanvasLayer/dialog/Bum.show()

func _on_dialog_7_timeout():
	$dialog7.stop()
	$dialog8.start()
	$CanvasLayer/dialog/dia7.hide()
	$CanvasLayer/dialog/dia8.show()
	$CanvasLayer/dialog/Deciro2.show()
	$CanvasLayer/dialog/Bum.hide()

func _on_dialog_8_timeout():
	$dialog8.stop()
	$dialog9.start()
	$CanvasLayer/dialog/dia8.hide()
	$CanvasLayer/dialog/dia9.show()
	$CanvasLayer/dialog/Deciro2.hide()
	$CanvasLayer/dialog/Bum.show()

func _on_dialog_9_timeout():
	$dialog9.stop()
	$dialog10.start()
	$CanvasLayer/dialog/dia9.hide()
	$CanvasLayer/dialog/dia10.show()
	$CanvasLayer/dialog/Deciro1.show()
	$CanvasLayer/dialog/Bum.hide()

func _on_dialog_10_timeout():
	MusicController.finalbossMusic()
	get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_6_boss.tscn")
