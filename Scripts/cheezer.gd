extends Area2D

@export var horizentalspeed := 200
@export var horizentalDirection: int = 1
var speed := 200
@export var health: int = 3
@export var up = false
@export var setscore: int = 50

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	if health <= 0:
		#$Sprite.play("death")
		get_node("/root/Hud").score += setscore
		$Timer.start()

func _physics_process(delta):
	if up == false:
		position.x += horizentalspeed * delta * horizentalDirection
	else:
		position.y += horizentalspeed * delta * horizentalDirection

func _on_body_entered(body):
	horizentalDirection *= -1

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1
		
func _on_timer_timeout():
	queue_free()
