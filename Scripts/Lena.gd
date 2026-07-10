extends Area2D

var health = 10

func _ready():
	$Timer.start()

func damageSprite():
	$AnimatedSprite2D.modulate = Color(164,167,0)
	$i.start()

func _on_timer_timeout():
	$Timer.stop()
	$Timer2.start()
	$shield/Sprite2D.hide()
	$shield/CollisionShape2D.set_deferred("disabled", true)

func _on_timer_2_timeout():
	$Timer2.stop()
	$Timer.start()
	$shield/Sprite2D.show()
	$shield/CollisionShape2D.set_deferred("disabled", false)

func _on_shield_area_entered(area):
	pass

func _on_death_timeout():
	$death.stop()
	get_node("/root/Hud").score += 1000
	queue_free()

func _on_i_timeout():
	$i.stop()
	$AnimatedSprite2D.modulate = Color(1,1,1)


func _on_area_entered(area):
	if area.name == "Bullet":
		health -= 1
		get_node("/root/Hud").score += 500
		$hit.play()
		damageSprite()
	if health == 8:
		$AnimatedSprite2D.play("attack")
		$enemyTimer.start()
	if health <= 0:
		$death2.play()
		$AnimatedSprite2D.play("death")
		$death.start()
