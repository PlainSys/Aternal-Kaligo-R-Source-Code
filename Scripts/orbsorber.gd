extends CharacterBody2D

var speed = 250
@onready var obj = get_parent().get_node("player")
@export var haskey := false

@export var doorkills := false

func _physics_process(delta):
	var dir = (obj.global_position - global_position).normalized()
	move_and_collide(dir * speed * delta)
	
	if get_node("/root/Hud").diff == 1:
		speed = 200
	if get_node("/root/Hud").diff == 2:
		speed = 250
	if get_node("/root/Hud").diff == 3:
		speed = 265
	if get_node("/root/Hud").diff == 4:
		speed = 300

func _on_timer_timeout():
	$Sprite2D.play("die")
	$death.start()
	$orbhitbox/Timer.stop()
	
	if doorkills == true:
		get_node("/root/Hud").doorkills += 1

func _on_death_timeout():
	queue_free()
