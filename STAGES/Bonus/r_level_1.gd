extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_2_timeout():
	$BTN/Timer2.stop()
	$door1/ColorRect.hide()
	$door1/CollisionShape2D.set_deferred("disabled", true)
	$btnsound.play()
