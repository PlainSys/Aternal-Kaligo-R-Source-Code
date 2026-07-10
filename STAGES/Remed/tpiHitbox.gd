extends Area2D

var health = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name == "TryProjectile":
		health -= 1
		get_node("/root/Hud").score += 500
	if health == 0:
		$death.start()
		$bro.start()
