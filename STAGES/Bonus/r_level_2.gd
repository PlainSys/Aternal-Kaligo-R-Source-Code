extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_area_entered(area):
	if area.name == "sword1":
		$FakeDoor/Sprite2D.hide()
		$FakeDoor/CollisionShape2D.set_deferred("disabled", true)
		$breaksound.play()


func _on_btn_2_area_entered(area):
	if area.name == "sword1":
		$btnsound.play()
		$door2/CollisionShape2D.set_deferred("disabled", true)
		$door2/ColorRect.hide()


func _on_timer_2_timeout():
	$btnsound.play()
	$door3/CollisionShape2D.set_deferred("disabled", true)
	$door3/ColorRect.hide()

func _on_btn_3_area_entered(area):
	if area.name == "sword1":
		$door1/ColorRect.hide()
		$door1/CollisionShape2D.set_deferred("disabled", true)
		$breaksound.play()
