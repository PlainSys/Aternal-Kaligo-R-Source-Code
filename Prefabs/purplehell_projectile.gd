extends Area2D

@onready var obj = get_parent().get_node("player")
@export var speed = 10

var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	position += direction * speed

func _on_area_entered(area):
	queue_free()
	if area.name == "phitbox" || area.name == "rhitbox":
		get_node("/root/Hud").health -= 1
