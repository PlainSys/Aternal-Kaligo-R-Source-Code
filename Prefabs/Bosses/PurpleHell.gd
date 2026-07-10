extends Area2D

@export var health: int = 500
@export var setscore: int = 500
@export var horizentalspeed: int = 700
@export var horizentalDirection: int = 1
@onready var obj = get_parent().get_node("player")

@onready var firingPositions := $firingPosition
var plBullet := preload("res://Prefabs/Projectiles/ph_projectile_ex.tscn")

func fire():
	for child in firingPositions.get_children():
		var bullet = plBullet.instantiate()
		add_child(bullet)
		bullet.direction = child.global_position.direction_to(obj.global_position)
		bullet.global_position = child.global_position
		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $cooldown.is_stopped():
		fire()
		$cooldown.start(0.5)

func _physics_process(delta):
	position.x -= horizentalspeed * delta * horizentalDirection
	#position.y -= horizentalspeed * delta * horizentalDirection

func damage(amount: int):
	health -= amount
	get_node("/root/Hud").score += 5
	$hit.play()
	if health <= 0:
		$death.start()
		get_node("/root/Hud").score += setscore

func _on_body_entered(body):
	horizentalDirection *= -1
