extends CharacterBody2D


func _on_hitbox_area_entered(area):
	if area.name == "Bullet":
		$hitbox/CollisionShape2D.set_deferred("disabled", true)
		$die/CollisionShape2D.set_deferred("disabled", false)
		
func _on_die_area_entered(area):
	if area.is_in_group("damage"):
		area.damage(100000)
		get_node("/root/Hud").score += 10000
		queue_free()
