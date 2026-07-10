extends CharacterBody2D

var speed = 200
@onready var obj = get_parent().get_node("player")

@export var doorKills = false

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)

func _process(delta):
	if get_node("/root/Hud").diff == 1:
		speed = 150
	if get_node("/root/Hud").diff == 2:
		speed = 200
	if get_node("/root/Hud").diff == 3:
		speed = 250
	if get_node("/root/Hud").diff == 4:
		speed = 300

func _on_timer_timeout():
	$ghitbox/Timer.stop()
	$death.start()
	if doorKills == true:
		get_node("/root/Hud").doorkills += 1

func _on_death_timeout():
	$death.stop()
	queue_free()


func _on_punctimer_timeout():
	$AnimatedSprite2D.play("punch")
	
