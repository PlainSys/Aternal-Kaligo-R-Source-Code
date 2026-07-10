extends Area2D

const SPEED = 800
var velocity = Vector2()
var direction = 1

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)

func set_bullet_direction(dir):
	direction = dir
	if dir == -1:
		$Sprite2D.flip_h = true

func _on_area_entered(area):
	if area.is_in_group("damage"):
		area.damage(1)
	queue_free()

func _on_body_entered(body):
	queue_free()
