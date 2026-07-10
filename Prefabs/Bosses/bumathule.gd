extends Area2D

@export var health: int = 60
@export var setscore: int = 50000
@export var dead = false

func damage(amount: int):
	health -= amount
	damageSprite()
	get_node("/root/Hud").score += 10
	if health <= 0:
		get_node("/root/Hud").score += setscore
		#queue_free()
		dead = true
		$ting.start()

func damageSprite():
	$Sprite2D.modulate = Color(164,167,0)
	$Timer.start()

func _on_timer_timeout():
	$Timer.stop()
	$Sprite2D.modulate = Color(1,1,1)


func _on_shield_1_timeout():
	$shield1.stop()
	$shield2.start()
	$Shield.show()
	$Shield/CollisionShape2D.set_deferred("disabled", false)
	$CollisionShape2D.set_deferred("disabled", true)

func _on_shield_2_timeout():
	$shield2.stop()
	$shield1.start()
	$Shield.hide()
	$Shield/CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D.set_deferred("disabled", false)
	
