extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timedoor_1_timeout():
	$BTN/timedoor1.stop()
	$door1/CollisionShape2D.set_deferred("disabled", true)
	$door1/ColorRect.hide()


func _on_timedoor_2_timeout():
	$BTN2/timedoor2.stop()
	$door2/CollisionShape2D.set_deferred("disabled", true)
	$door2/ColorRect.hide()


func _on_timedoor_3_timeout():
	$BTN3/timedoor3.stop()
	$door3/CollisionShape2D.set_deferred("disabled", true)
	$door3/ColorRect.hide()
