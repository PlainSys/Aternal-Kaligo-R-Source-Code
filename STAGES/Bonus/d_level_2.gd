extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_2_timeout():
	$BTN2/Timer2.stop()
	$door2/CollisionShape2D.set_deferred("disabled", true)
	$door2/ColorRect.hide()
	$btn1.play()

func _on_btn_7_body_entered(body):
	if body.name == "player":
		$door3/CollisionShape2D.set_deferred("disabled", true)
		$door3/ColorRect.hide()
		$btn2.play()

func _on_btn_6_body_entered(body):
	if body.name == "player":
		$door1/CollisionShape2D.set_deferred("disabled", true)
		$door1/ColorRect.hide()
		$btn2.play()


func _on_time_1_timeout():
	$BTN/time1.stop()
	$door6/CollisionShape2D.set_deferred("disabled", true)
	$door6/ColorRect.hide()
	$btn1.play()

func _on_time_2_timeout():
	$BTN3/time2.stop()
	$door4/CollisionShape2D.set_deferred("disabled", true)
	$door4/ColorRect.hide()
	$btn1.play()

func _on_time_3_timeout():
	$BTN4/time3.stop()
	$door7/CollisionShape2D.set_deferred("disabled", true)
	$door7/ColorRect.hide()
	$btn1.play()
	
func _on_btn_5_body_entered(body):
	if body.name == "player":
		$door5/CollisionShape2D.set_deferred("disabled", true)
		$door5/ColorRect.hide()
		$btn2.play()
