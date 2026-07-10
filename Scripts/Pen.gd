extends Area2D

@export var health: int = 10
@export var setscore: int = 1000
@onready var cooldown := $cooldown
@export var firerate := 0.6

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/bomb.tscn")

@export var horizentalspeed := 200
@export var horizentalDirection: int = 1

func _ready():
	if get_node("/root/Hud").diff == 1:
		horizentalspeed = 480
	if get_node("/root/Hud").diff == 2:
		horizentalspeed = 500
	if get_node("/root/Hud").diff == 3:
		horizentalspeed = 510
	if get_node("/root/Hud").diff == 4:
		horizentalspeed = 850
		
func fire():
	for child in firingPositions.get_children():
		var bullet := plBullet.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
			
func _process(delta):
	if cooldown.is_stopped():
		fire()
		cooldown.start(firerate)

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	invis()
	if health <= 0:
		get_node("/root/Hud").score += setscore
		$Timer.start()
		$Timer2.start()

func invis():
	$AnimatedSprite2D.modulate = Color(164,167,0)
	$inviscd.start()

func _physics_process(delta):
	position.x -= horizentalspeed * delta * horizentalDirection

func _on_body_entered(body):
	horizentalDirection *= -1

func _on_area_entered(area):
	if area.name == "phitbox":
		get_node("/root/Hud").health -= 1

func _on_timer_timeout():
	$Timer.stop()
	$AnimatedSprite2D.play("death")
	$death.start()

func _on_death_timeout():
	$death.stop()
	queue_free()

func _on_inviscd_timeout():
	$inviscd.stop()
	$AnimatedSprite2D.modulate = Color(1,1,1)
