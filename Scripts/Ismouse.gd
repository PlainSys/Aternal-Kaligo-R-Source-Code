extends Area2D

@export var health: int = 10
@export var setscore: int = 550
@export var horizentalspeed: int = 70
@export var horizentalDirection: int = 1

@onready var cooldown := $cooldown
@export var firerate := 0.6

@onready var firingPositions := $FiringPosition
var plBullet := preload("res://Prefabs/Projectiles/wreckingball.tscn")

func _ready():
	if get_node("/root/Hud").diff == 1:
		horizentalspeed = 480
	if get_node("/root/Hud").diff == 2:
		horizentalspeed = 600
	if get_node("/root/Hud").diff == 3:
		horizentalspeed = 610
	if get_node("/root/Hud").diff == 4:
		horizentalspeed = 950
		
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
	$hurt.play()
	invis()
	if health <= 0:
		$death.start()
		$TimerLol.start()
		$AnimatedSprite2D.play("death")
		get_node("/root/Hud").score += setscore

func _physics_process(delta):
	position.x -= horizentalspeed * delta * horizentalDirection
	
func invis():
	$AnimatedSprite2D.modulate = Color(164,167,0)
	$invisCd.start()

func _on_invis_cd_timeout():
	$invisCd.stop()
	$AnimatedSprite2D.modulate = Color(1,1,1)
	
func _on_death_timeout():
	$death.stop()
	queue_free()

func _on_body_entered(body):
	horizentalDirection *= -1
