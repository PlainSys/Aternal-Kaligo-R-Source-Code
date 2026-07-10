extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Hud").stageDnum = 7
	get_node("/root/Hud").diff = 4
	
	$Sniper/Sprite2D.show()
	$Sniper/CollisionShape2D.set_deferred("disabled", false)
	$Sniper/cooldown.one_shot = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/Hud").doorkills == 3:
		$door2/ColorRect.hide()
		$door2/CollisionShape2D.set_deferred("disabled", true)


func _on_timer_2_timeout():
	$BTN/Timer2.stop()
	$door1/ColorRect.hide()
	$door1/CollisionShape2D.set_deferred("disabled", true)
	$btnSound.play()

func _on_timer_3_timeout():
	$BTN2/Timer3.stop()
	$door3/ColorRect.hide()
	$door3/CollisionShape2D.set_deferred("disabled", true)
	$btnSound.play()

func _on_timer_4_timeout():
	$BTN3/Timer4.stop()
	$door4/ColorRect.hide()
	$door4/CollisionShape2D.set_deferred("disabled", true)
	$btnSound.play()

func _on_timer_5_timeout():
	$BTN4/Timer5.stop()
	$door5/ColorRect.hide()
	$door5/CollisionShape2D.set_deferred("disabled", true)
	$btnSound.play()


func _on_exit_area_entered(area):
	if area.name == "dhitbox":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_extraboss.tscn")
