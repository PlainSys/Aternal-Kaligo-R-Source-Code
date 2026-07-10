extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/Hud").doorkills == 1:
		$door2/CollisionShape2D.set_deferred("disabled", true)
		$door2/ColorRect.hide()

func _on_timer_2_timeout():
	$BTN/Timer2.stop()
	$door3/CollisionShape2D.set_deferred("disabled", true);
	$door3/ColorRect.hide()
	$button.play()

func _on_timer_3_timeout():
	$BTN/Timer3.stop()
	$door1/CollisionShape2D.set_deferred("disabled", true);
	$door1/ColorRect.hide()
	$button.play()
