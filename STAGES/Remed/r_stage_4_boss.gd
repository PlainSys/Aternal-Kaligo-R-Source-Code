extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Ice1/CollisionShape2D.set_deferred("disabled", true)
	$Ice2/CollisionShape2D.set_deferred("disabled", true)
	$Ice3/CollisionShape2D.set_deferred("disabled", true)
	$Ice4/CollisionShape2D.set_deferred("disabled", true)
	$Ice5/CollisionShape2D.set_deferred("disabled", true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	if randf() < 0.5:
		$Ice1/CollisionShape2D.set_deferred("disabled", false)
		$Ice1.show()
	elif randf() < 0.5:
		$Ice2/CollisionShape2D.set_deferred("disabled", true)
		$Ice2.hide()
	elif randf() < 0.5:
		$Ice3/CollisionShape2D.set_deferred("disabled", true)
		$Ice3.hide()
	elif randf() < 0.5:
		$Ice4/CollisionShape2D.set_deferred("disabled", true)
		$Ice4.hide()
	else:
		$Ice5/CollisionShape2D.set_deferred("disabled", true)
		$Ice5.hide()

func _on_timer_2_timeout():
	$Ice1/CollisionShape2D.set_deferred("disabled", true)
	$Ice1.hide()
	$Ice2/CollisionShape2D.set_deferred("disabled", true)
	$Ice2.hide()
	$Ice3/CollisionShape2D.set_deferred("disabled", true)
	$Ice3.hide()
	$Ice4/CollisionShape2D.set_deferred("disabled", true)
	$Ice4.hide()
	$Ice5/CollisionShape2D.set_deferred("disabled", true)
	$Ice5.hide()


func _on_timer_death_timeout():
	$TryProjectile/TimerDeath.stop()
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	$CanvasLayer/Label.show()
	$theme.stop()
	$CanvasLayer/StageEnd/music.play()


func _on_death_timeout():
	pass
	#$TrypophobicIce/tpiHitbox/death.stop()
	#$CanvasLayer/StageEnd.show()
	#$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	#$theme.stop()
	#$CanvasLayer/StageEnd/music.play()


func _on_bro_timeout():
	$TrypophobicIce/tpiHitbox/death.stop()
	$CanvasLayer/StageEnd.show()
	$CanvasLayer/StageEnd/AnimationPlayer.play("end")
	#$theme.stop()
	$CanvasLayer/StageEnd/music.play()
