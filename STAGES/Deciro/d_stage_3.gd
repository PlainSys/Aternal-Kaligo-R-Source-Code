extends Node2D

const explosion = preload("res://Prefabs/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Portal/CollisionShape2D.set_deferred("disabled", true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_1_timeout():
	$door1/CollisionShape2D.set_deferred("disabled", true)
	$door1/ColorRect.hide()

func _on_door_2_timeout():
	$door2/CollisionShape2D.set_deferred("disabled", true)
	$door2/ColorRect.hide()

func _on_door_3_timeout():
	$door3/CollisionShape2D.set_deferred("disabled", true)
	$door3/ColorRect.hide()

func _on_event_1_area_entered(area):
	if area.name == "phitbox":
		$event1.queue_free()
		#$doo4.queue_free()
		$door4/CollisionShape2D.set_deferred("disabled", true)
		$door4/ColorRect.hide()

func _on_event_2_area_entered(area):
	if area.name == "phitbox":
		$event2.queue_free()
		$door5/CollisionShape2D.set_deferred("disabled", true)
		$door5/ColorRect.hide()

func _on_event_3_area_entered(area):
	if area.name == "phitbox":
		$event3.queue_free()
		$door6/CollisionShape2D.set_deferred("disabled", true)
		$door6/ColorRect.hide()
		$door7/CollisionShape2D.set_deferred("disabled", true)
		$door7/ColorRect.hide()


func _on_event_4_area_entered(area):
	if area.name == "phitbox":
		$event4.queue_free()
		$door8/CollisionShape2D.set_deferred("disabled", true)
		$door8/ColorRect.hide()

func _on_event_5_area_entered(area):
	$event5/explotimer.start()
	#$event5.queue_free()

func _on_explotimer_timeout():
	$event5/explotimer.stop()
	explosionfunc()
	$door9/CollisionShape2D.set_deferred("disabled", true)
	$door9/ColorRect.hide()
	
func explosionfunc():
	var explo = explosion.instantiate()
	add_child(explo)
	explo.position = $explotrap/explopos1.position

func _on_event_6_area_entered(area):
	if area.name == "phitbox":
		$Portal.show()
		$Portal/CollisionShape2D.set_deferred("disabled", false)

func _on_end_area_entered(area):
	if area.name == "phitbox":
		get_tree().change_scene_to_file("res://STAGES/Deciro/d_stage_3_dialog.tscn")
