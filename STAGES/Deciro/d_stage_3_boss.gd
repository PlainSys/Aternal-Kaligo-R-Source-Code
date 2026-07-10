extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_1_area_entered(area):
	if area.name == "Bullet":
		$button1/light/CollisionShape2D.set_deferred("disabled", false)
		$button1/light/ColorRect.show()
		$button1/Timer.start()

func _on_button_2_area_entered(area):
	if area.name == "Bullet":
		$button2/light/CollisionShape2D.set_deferred("disabled", false)
		$button2/light/ColorRect.show()
		$button2/Timer2.start()
		
func _on_timer_timeout():
	$button1/light/CollisionShape2D.set_deferred("disabled", true)
	$button1/light/ColorRect.hide()
	$button1/Timer.stop()

func _on_timer_2_timeout():
	$button2/light/CollisionShape2D.set_deferred("disabled", true)
	$button2/light/ColorRect.hide()
	$button2/Timer2.stop()

func _on_death_timeout():
	$CanvasLayer/dialog.show()
	$CanvasLayer/dialog/dialogtimer.start()

func _on_dialogtimer_timeout():
	$CanvasLayer/dialog.hide()
	$CanvasLayer/dialog/dialogtimer.stop()
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$CanvasLayer/StageEnd/music.play()
