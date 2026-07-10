extends Node2D

@export var speed = 20

var direction = Vector2.ZERO

func _physics_process(delta):
	position += direction * speed

func _on_projectile_hitbox_area_entered(area):
	queue_free()
	if area.name == "phitbox" || area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
