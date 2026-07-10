extends Area2D

@export var horizentalspeed := 200
@export var horizentalDirection: int = 1
var speed := 200
@export var health: int = 55
@export var up = false
@export var setscore: int = 5000

@onready var cooldown := $cooldown
@export var firerate := 0.5

@onready var firingPositions := $FiringPos
var plBulletleft := preload("res://Prefabs/Projectiles/ebulletleft.tscn")

func _ready():
	if get_node("/root/Hud").diff == 4:
		setscore = 10000
		
func damage(amount: int):
	health -= amount
	$hit.play()
	get_node("/root/Hud").score += 13
	damageSprite()
	if health <= 0:
		#$Sprite.play("death")
		get_node("/root/Hud").score += setscore
		$Timer.start()
		$Timer2.start()
		
func damageSprite():
	$Sprite2D.modulate = Color(164,167,0)
	$iframes.start()
	
func _physics_process(delta):
	if up == false:
		position.y -= horizentalspeed * delta * horizentalDirection
	else:
		position.y += horizentalspeed * delta * horizentalDirection


func _on_loop_timeout():
	if randf() < 0.5:
		up = true
	else:
		up = false

func _on_body_entered(body):
	horizentalDirection *= -1

func _on_timer_timeout():
	queue_free()

func fire():
	for child in firingPositions.get_children():
		var bullet = plBulletleft.instantiate()
		bullet.global_position = child.global_position
		get_tree().current_scene.add_child(bullet)
			
func _process(delta):
	if cooldown.is_stopped():
		$shoot.play()
		fire()
		cooldown.start(firerate)

func _on_iframes_timeout():
	$iframes.stop()
	$Sprite2D.modulate = Color(1,1,1)
