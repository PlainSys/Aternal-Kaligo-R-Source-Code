extends Area2D

@export var health: int = 15
@export var setscore: int = 1000
@export var horizentalspeed := 200
@export var horizentalDirection: int = 1
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
	$AnimatedSprite2D.modulate = Color(164,167,0)
	$Timer.start()

func _physics_process(delta):
	position.y += horizentalspeed * delta * horizentalDirection

func _on_body_entered(body):
	horizentalDirection *= -1

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1

func _on_timer_timeout():
	$Timer.stop()
	$AnimatedSprite2D.modulate = Color(1,1,1)
